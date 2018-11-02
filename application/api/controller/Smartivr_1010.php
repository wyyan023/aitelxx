<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use think\Db;
use app\common\controller\Base;
use Overtrue\Pinyin\Pinyin;

class Smartivr extends Base{
	
	private $requestP;
	private $clientIp;
	private $break = 0;   //是否支持打断   0 支持 1不支持
	private $scenariosId = "";  //场景id
	private $rootDir = '/var/smartivr';
	private $memberId;
	private $calleeId;
	private $callerId;
	private $gCallId;
	private $gTaskId;
	private $flowTable = 'tel_flow';
	
	public function _initialize(){
	
		$this->requestP = request();		
				 
		if (strtolower($this->requestP->method()) != 'post'){
			\think\Log::record('request method error!');			
			//exit;
		}
		
		$agent = strtolower($this->requestP->header('user-agent'));
		if(strpos($agent, 'iphone') || strpos($agent, 'ipad')){
			
		} 
		
		//客户端ip
		$this->clientIp =  $this->requestP->ip();		
		// $where = array();
		// $where['scenarios_id'] = 20;
		// $where['type'] = 1;
		// $flowList = Db::name('tel_flow_ok')->where($where)->order('classify asc')->select();
		// $flow = $this->array_val_chunk($flowList);
		// $this->getOneKeyword($flow, 8);
		// dump($flow);
		 // exit;
		 
		 //话单
		 //关键字命中
		 //人工座席
		 //播放完主流程
		 //搭建环境
		
		// $pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
		// $result = $pinyin->sentence('嗯');
		// dump(str_replace(' ', '', $result));
		// exit;
		$testP  = input('test','');
		if ($testP){
			
		}
		
		
	}
	
	public function unusualNotify(){
		$type = input('post.type','','trim,strip_tags');
		$number = input('post.number','','trim,strip_tags');
		$taskuuid = input('post.taskuuid','','trim,strip_tags');
		
		if ($number){
			$where['mobile'] = $number;
			if ($taskuuid){
				$where['task'] = $taskuuid;
			}
			Db::name('member')->where($where)->limit(1)->update(array('status'=>3,'last_dial_time'=>time(),'level'=>1));
		}
	}
	
	
	public function IVREntery(){
		$notify = input('post.notify','','trim,strip_tags');
		$this->calleeId = input('post.calleeid','','trim,strip_tags');  //被叫号码
		$callerId = input('post.callerid','','trim,strip_tags'); //主叫号码
		$callId = input('post.callid','','trim,strip_tags');
		$this->gCallId = $callId;
		$this->gTaskId = input('post.flowid','','trim,strip_tags');
		
		if (!$notify || !$this->calleeId || !$callerId || !$callId){
			$this->playAfterHangup("参数不完整!");
		}
		
		//根据主叫号码获取场景id
		$telConfig = $this->getTelCfgByParamName($this->gTaskId);
		if ($telConfig['call_prefix']){
			$this->callerId = substr($callerId,strlen($telConfig['call_prefix']));
		}
		else{
			$this->callerId = $callerId;
		}
		
		$this->memberId = $telConfig["member_id"];

		//$adminInfo['id'] = 46;
		//获取场景信息
		$scenariosInfo = Db::name('tel_scenarios')->field('id, break,status')->where(array('id'=>$telConfig['scenarios_id'], 'status'=>1))->find();
		if (!$scenariosInfo || !$scenariosInfo["status"]){
			$this->playAfterHangup("话术场景未启用!");
		}
		
		$this->scenariosId = $scenariosInfo["id"];
		
		$this->break = $scenariosInfo["break"];
		
		$memberInfo = Db::name('admin')->field('examine')->where('id',$this->memberId )->find();
		if ($memberInfo && $memberInfo['examine']){
			$this->flowTable = 'tel_flow_ok';
		}
		
		
		switch($notify){
		  //进入流程 比如来电应答后，外呼接通后进入流程
			case "enter" :
				$this->playBackgroundAsr($this->callerId);
				break;
			//ASR识别进度
			case "asrprogress_notify" :
				$this->playASRProgress();
				break;
			//ASR识别结果
			case "asrmessage_notify" :			
				$this->playBack($this->calleeId, $this->callerId, $callId);
				break;
			//放音结果
			case "playback_result" :
				$this->playBackResult($this->calleeId, $this->callerId, $callId);
				break;
			//后台ASR停止结果
			case "stop_asr_result" :
				$this->stopAsrResult();
				break;
			//转接结果
			case "bridge_result" :
				$this->bridgeResult();
				break;
			//获取按键（dtmf）结果
			case "getdtmf_result" :
				$this->noop();
			//离开流程 比如挂机，转移，直接转接等。
			case "leave" :
				$this->leaveProc();
				break;
			default :
				$this->playAfterHangup("未知notify【".$notify."】!");
		}		
	}
	
	private function getTelCfgByParamName($taskId, $pName = ''){
		
		$config = Db::name('tel_config')->where('task_id',$taskId )->find();
		if (!$config ){
			$this->playAfterHangup("主叫号码被停用或话术场景未配置!");
		}
		
		if ($pName){
			
			return $config[$pName];
		}
		else{
			
			return $config;
		}
	}
	
	//更新转接次数
	private function updateBridge($bridge, $field){
		
		$ret = Db::table('tel_tsr')->where('phone', $bridge)->setInc($field);
	}
	
	private function bridge($number,$callerid="",$gateway="",$prompt="",$background="/var/smartivr/sounddir/wating.wav"){
		$flowdata = input('post.flowdata','','trim,strip_tags');
		$result = array("action"=>"stop_asr","flowdata"=>$flowdata,
			"after_action"=>"bridge",
			"after_ignore_error"=>false,  	
			"after_params"=>array("number"=>"$number","callerid"=>"$callerid","gateway"=>"$gateway","prompt"=>"$prompt","background"=>"$background"));
		
		//更新转接次数
		$bridge = $this->getTelCfgByParamName($this->gTaskId, 'bridge');
		if ($bridge){
			$this->updateBridge($bridge, 'times');
		}
		
		echo(json_encode($result));
		exit;
	}
	
	//转人工座席结果消息
	private function bridgeResult(){
		
		$errorcode =  input('post.errorcode','','trim,strip_tags');
		$message =  input('post.message','','trim,strip_tags');
		\think\Log::record('bridge_result errorcode='.$errorcode.'###message='.$message);
		
		//更新转接次数
		$bridge = $this->getTelCfgByParamName($this->gTaskId, 'bridge');
		if ($message == 'SUCCESS' && $bridge){
			$this->updateBridge($bridge, 'succ_times');
		}
		
		
		$this->hangupProc();
	}
	
	//离开流程
	private function leaveProc(){
		$duration = input('post.duration','','trim,strip_tags');
		$callid = input('post.callid','','trim,strip_tags');
		$flowdata = input('post.flowdata','','trim,strip_tags');
		$flowdata = json_decode($flowdata,true);
		$origcallerid = input('post.origcallerid','','trim,strip_tags');
	
		
		$hangup_disposition = input('post.hangup_disposition','','trim,strip_tags');
		if ($hangup_disposition == 'recv_bye'){
			$bill = array('phone'=>$this->callerId, 'message'=>'客户挂机', 'path'=>'', 'role'=>1,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
		}
		else{
			$bill = array('phone'=>$this->calleeId, 'message'=>'机器挂机', 'path'=>'', 'role'=>0,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
		}
	
		Db::name('tel_bills')->insert($bill);
		$basePath = 'uploads/record/'.date('Y-m-d',time()).'/';
		$path = $basePath.$this->callerId.'.'.$this->calleeId.'.'.$callid.'.wav';
		
		$level = "1";
		if ($flowdata['refuse'] == 0 && $flowdata['mainEnd'] == 1){
			$level = "5";
		}
		else if ($flowdata['ask_num'] >= 2 && $flowdata['refuse'] == 1){
			$level = "4";
		}
		else if ($flowdata['ask_num'] == 1 && $flowdata['refuse'] == 2){
			$level = "3";
		}
		else if ($flowdata['call_rotation'] > 2){
			$level = "2";
		}
		
		$where = array();
		$where['task'] = $this->gTaskId;
		$telConfig = Db::name('tel_config')->where('task_id',$this->gTaskId)->find();
		$originating_call = "";
		if ($telConfig && $telConfig['phone']){
			$originating_call = $telConfig['phone'];
		}
		
		//更新拨打结果 
		$where['mobile'] = $this->callerId;
		
		$data = array();
		$data['status'] = 2;
		$data['last_dial_time'] = time();
		$data['record_path'] = $path;
		$data['level'] = $level;
		$data['uuid'] = $callid;
		$data['duration'] = $duration;
		$data['originating_call'] = $originating_call;
		$data['originating_call'] = $flowdata['call_rotation'];
		
		$ret = Db::name('member')->where($where)->update($data);
		
		//微信通知拨打结果
		if ($telConfig['level'] && strpos($telConfig['level'],$level)){
			
			if ($telConfig['sale_ids']){
				
				$sales = Db::name('admin')->field('open_id,mobile')->where('id','in',$telConfig['sale_ids'])->select();
				if ($sales){
					foreach($sales as $item){
						if ($item['open_id']){

							// {{first.DATA}}
							// 公司名称：{{keyword1.DATA}}
							// 客户姓名：{{keyword2.DATA}}
							// 客户号码：{{keyword3.DATA}}
							// 提交时间：{{keyword4.DATA}}
							// {{remark.DATA}}
							$memberInfo = Db::name('member')->field('real_name')->where($where)->find();
							$url = config('res_url').'wap/member/callresult/id/'.$callid;
							$data=array(
								            'first'=>array('value'=>"商虫云智能语音机器人又筛出意向客户啦",'color'=>"#173177"),
								            'keyword1'=>array('value'=>'','color'=>'#173177'),
								            'keyword2'=>array('value'=>$memberInfo['real_name'],'color'=>'#173177'),
								          	'keyword3'=>array('value'=>$this->callerId,'color'=>'#173177'),
								          	'keyword4'=>array('value'=> date('m-d H:i',time()),'color'=>'#173177'),
								            'remark'=>array('value'=>'千万不要错过，戳我查看详情','color'=>'#173177'),
								     	);
							sendTemplateMsg($item['open_id'], 'q1Cu9dmvjXl8W6YxV__7s8O9otK33tomeoSqxj8MJHI', $url, $data, $topcolor = '#173177');
						}
					}					
				}

			}
		}
		
	}
	
	
	//停止识别且判断是否需要转人工座席
	private function stopAsrResult(){
		$flowdata = input('post.flowdata','','trim,strip_tags');
		$flowdata = json_decode($flowdata,true);
		
		$this->hangupProc();
		//{"calleeid":"996","callerid":"linphone","callid":"d0a3e9a8-2ce2-42e3-8fa7-55c5eb15326d","errorcode":480,"flowdata":"","hangupcause":"Temporarily Unavailable","message":"NO_USER_RESPONSE","notify":"bridge_result"}
	}
	
	//开始语音识别
	private function playBackgroundAsr($callerId){
		
		//更新客户状态 已接通
		$where['mobile'] = $this->callerId;
		if ($this->gTaskId){
			$where['task'] = $this->gTaskId;
		}
		Db::name('member')->where($where)->limit(1)->update(array('status'=>2,'last_dial_time'=>time()));

		//全局话术是否需要自动打断
		$pause_play_ms = 0;   //是否设置自动打断 0，关闭自动打断，其他值（建议 300-1000，或者关闭），检测多少毫秒的声音就打断。
		if ($this->break == 0){
			$pause_play_ms = 1500;
		}
		
		//获取开场白
		$where = array();
		$where['scenarios_id'] = $this->scenariosId;
		$where['type'] = 0;
		
		$flow = Db::name($this->flowTable)->where($where)->order('id asc ,priority desc')->find();
		if ($flow['path']){
			$prompt =  $this->rootDir.$flow['path'];
		}
		else{
			$prompt =  $flow['content'];
		}
		
		//每句话术是否打断
		$block_asr = -1;
		if ($flow['break']){
			$block_asr = 0;
		}
		
		$wait = 5000;  //单位毫秒，放音结束后等待时间。用于等待用户说话。
		$retry = 1;   //重播次数。就是wait时间内用户不说话，就重新播放声音。
		
		$flowdata['req_text'] = '';
		
		$flowdata['main_flow_id'] = $flow['id'];
		$flowdata['resp_text'] = $flow['content'];
		$flowdata['resp_audio'] = $flow['path'];
		
		$flowdata['default_flow'] = 0;
		$flowdata["retry"]= $retry;
		$flowdata['no_speek_tip'] = 0;
		$flowdata['bridge'] = 0;
		
		$flowdata['refuse'] = 0;
		$flowdata['ask_num'] = 0;
		$flowdata['mainEnd'] = 0;     
		$flowdata['call_rotation'] = 1;//对话轮次计数
		
		
		$result = array(
			"action"=>"start_asr",
			"flowdata"=> json_encode($flowdata),
			"params"=>array(
				"min_speak_ms"=>100,
				"max_speak_ms"=>10000,
				"min_pause_ms"=>500,
				"max_pause_ms"=>800,
				"pause_play_ms"=>$pause_play_ms,
				"threshold"=>0,
				"recordpath"=>"",
				"volume"=>80,
				"filter_level"=>0,
			  "asr_configure_filename"=>""//"/etc/ysz_smartivr.json"

			),
			"after_action"=>"playback",
			"after_ignore_error"=>false,  
			"after_params" =>array(
				"prompt"=>$prompt,
				"wait"=>$wait,
				"retry"=>$retry,
				"block_asr"=>$block_asr
			)
		);
		
		//"block_asr"=>-1  //停止识别，，意思不打断
		$this->returnJson($result, $flow['content']);
	}
	
	// "asrelapse": 391,				//asr识别服务器消耗的时间，单位毫秒。
	// "asrtextall": "1.识别结果;",		//包含之前停顿的识别结果的组合。 格式是 录音序号.识别结果;这样组合多个识别结果。
	// "asrtype": "aiui",				//本次使用那个asr识别
	// "calleeid": "8888abc",
	// "callerid": "abc",
	// "callid": "1aec14af-d6a8-49e4-96fc-fb5f7cfdb893",
	// "errorcode": 0,					//asr返回错误，0无错误。
	// "flowdata": "流程选择",
	// "flowid": "abc",
	// "message": "识别结果",
	// "notify": "asrprogress_notify",
	// "recordindex": "1",				//录音序号
	// "recordfile": "",				//录音文件
	// "recordms": 931,				//录音时间，单位毫秒。
	// "volumegain": 5.95330699999
	private function playASRProgress(){
		$flowdata = input('post.flowdata','','trim,strip_tags');
		$message = input('post.message','','trim,strip_tags');
		
		$command = "pause";
		if ($this->break){ //不支持打断，继续播放录音
			$command = "noop";
		}
		if ($message){
			//全局关键字匹配
			$result = $this->globalKeywordMatch($message,$this->scenariosId);
			$keywordType = $result['keywordType'];
			$hitKeyword = $result['hitKeyword'];
			if (!$hitKeyword){
				
				//自定义关键字匹配
				$where = array();
				$where['scenarios_id'] = $this->scenariosId;
				$where['type'] = 1;
				$flowList = Db::name($this->flowTable)->where($where)->order('classify asc')->select();
				$flow = $this->array_val_chunk($flowList);
				
				//用户提问是否匹配中
				$hitFlow = $this->keywordFlowMatch($flow, $message, 2);
				if(!$hitFlow){
					$command = "noop";
				}
				
				//用户拒绝是否匹配中
				$hitFlow = $this->keywordFlowMatch($flow, $message, 5);
				if(!$hitFlow){
					$command = "noop";
				}
				
				//用户说忙时是否匹配中
				$hitFlow = $this->keywordFlowMatch($flow, $message, 4);
				if(!$hitFlow){
					$command = "noop";
				}
			}
		}
		
		$result = array(
			"action"=> "console_playback",
			"flowdata"=> $flowdata,
			"params"=>array(
				"command"=>$command
			)
		);
		
		$this->returnJson($result);
	}
	
	// "calleeid": "8888abc",
	// "callerid": "abc",
	// "callid": "ea6d1235-aaab-4251-b03b-3b53ca32e00d",
	// "errorcode": 0,
	// "flowdata": "流程选择",
	// "flowid": "abc",
	// "message": "1.你好；2.什么事；",
	// "notify": "asrmessage_notify",
	// "speakms": "1162"				//整句话的说话时间，包含暂停时间
	private function playBack($calleeId, $callerId, $callId){
	
		$wait = 3000;  //单位毫秒，放音结束后等待时间。用于等待用户说话。
		$retry = 0;   //重播次数。就是wait时间内用户不说话，就重新播放声音。
		
		$flowdata = input('post.flowdata','','trim,strip_tags');
		
		$message = input('post.message','','trim,strip_tags');
		//如果message为空
		if (!$message){
			$result = array(
				"action"=> "console_playback",
				"flowdata"=> $flowdata,
				"params"=>array(
					"command"=>'resume'
				)
			);
			$this->returnJson($result);
		}
		
		
		$flowdata = json_decode($flowdata,true);
		
		//初始化关键字未命中
		$flowdata['hit'] = 0;
		
		$messageArr = explode(";",$message);
		$orig="";
		
		//保存话单
		$bills = array();
		foreach($messageArr as $val){
			$arr = explode(".",$val);
			if (count($arr) > 1){
				$orig .= $arr[1];
				$path = $callerId."_".$callId."_".$arr[0].'.wav';//callerid_callid_recordindex
				$bills[] = array('phone'=>$callerId, 'message'=>$arr[1], 'path'=>$path, 'role'=>1,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
			}
		}
		$flowdata['req_text'] = $orig;
		
		//匹配处理结果 
		$result = $this->keywordProc($message, $this->scenariosId, $flowdata,  $callerId);
		//写入话单
		if ($bills){
			foreach($bills as &$bill){
				$bill['hit_keyword'] = "";
				if (isset($result['hit'])){
					if($result['hitKeyword'] && strstr($bill['message'],$result['hitKeyword'])){
						$bill['status'] = 1;
						$bill['hit_keyword'] = $result['hit']== 1?'命中全局关键字:'.$result['hitKeyword']:'命中自定义关键字:'.$result['hitKeyword'];
					}
				}
			}
			\think\Log::record('#####insertAll ='.json_encode($bills));
			Db::name('tel_bills')->insertAll($bills);	
		}
		
		\think\Log::record('#####insertAll =finish');
		
		if ($result['path']){
			$prompt = $this->rootDir.$result['path'];
		}
		else{
			$prompt = $result['content'];
		}
		
		//是否挽回过
		if (isset($result["default_flow"]) ){
			$flowdata["default_flow"] = $result["default_flow"];
		}
		
		//决定挂机
		if (isset($result["hangup"])){
			$flowdata["hangup"] = $result["hangup"];
		}
		
		$flowdata['resp_text'] = $result['content'];
		$flowdata['resp_path'] = $result['path'];
		
		//记录本次回复主流程id
		if (isset($result["main_flow_id"]) ){
			$flowdata['main_flow_id'] = $result['main_flow_id'];
		}
		
		//记录本次回复是否需要转人工座席
		if (isset($result["bridge"]) ){
			$flowdata['bridge'] = $result['bridge'];
		}
		
		//记录意向等级
		if (isset($result['level'])){
			$flowdata['level'] = $result['level'];
		}
	
		
		//记录本次回复主流程已经走完
		if (isset($result['mainEnd'])){
			$flowdata['mainEnd'] = $result['mainEnd'];
		}
		
		//拒绝次数
		if (isset($result['refuse'])){
			$flowdata['refuse'] = $result['refuse'];
		}		
		
		//用户提问次数
		if (isset($result['ask_num'])){
			$flowdata['ask_num'] = $result['ask_num'];
		}
		
		//用户对话轮次
		if (isset($flowdata['call_rotation'])){
			$flowdata['call_rotation'] =  intval($flowdata['call_rotation'])+1;
		}
		
		
		//设置是否重复播放次数
		if (isset($result["retry"]) ){
			$flowdata["retry"] = $result["retry"];
			$retry = $result["retry"];
		}
		else{
			$flowdata["retry"] =  0;
			$retry = 0;
		}
		
		
		$returnData = array(
			"action"=> "playback",
			"flowdata"=> json_encode($flowdata),
			"params"=>array(
				"prompt"=>$prompt,
				"wait"=>$wait,
				"retry"=>$retry
			)
		);
		
		//播放完挂机
		if ($result["hangup"]){
			$returnData["after_action"] = "hangup";
			$returnData["after_ignore_error"] = true;
			$returnData["after_params"] = array("cause"=>0,"usermsg"=>"");
		}
		$this->returnJson($returnData, $result['content']);
	}
	
	
	//放音结果
	private function playBackResult($calleeId, $callerId, $callId){
		$asrstate = input('post.asrstate','','trim,strip_tags');
		$flowData = input('post.flowdata','','trim,strip_tags');
		$flowData = json_decode($flowData, true);
		
		$wait = 3000;  //单位毫秒，放音结束后等待时间。用于等待用户说话。
		$retry = 0;   //重播次数。就是wait时间内用户不说话，就重新播放声音。
		
		if ($asrstate){//用户还在说话，不做任何处理
			$this->noop(json_encode($flowData));
		}
		else{
			//获取所有自定义关键字
			$where = array();
			$where['scenarios_id'] = $this->scenariosId;
			$where['type'] = 1;
			$flowList = Db::name($this->flowTable)->where($where)->order('classify asc')->select();
			$flow = $this->array_val_chunk($flowList);
			
			// 之前没有提醒过
			if (!$flowData['no_speek_tip'] || $flowData['no_speek_tip'] <3){
				//用户未说话时的回复随机一条
				$hitFlow = $this->getOneKeyword($flow, 7);
				if ($hitFlow){
					$hitFlow['hangup'] = 0;	
					if ($flowData['no_speek_tip'] == 0){
						$flowData['no_speek_tip'] = 1;
					}
					else{
						$flowData['no_speek_tip'] = ((int)$flowData['no_speek_tip'])+1;
					}
				}
				else{ //尝试主流程播放下一条
					$hitFlow = $this->getOneMainFlow($flowData['main_flow_id']);
					if ($hitFlow){
						$hitFlow['hangup'] = 0;	
						$flowData['no_speek_tip'] = 1;
						$flowData['resp_text'] = $hitFlow['content'];
						$flowData['resp_path'] = $hitFlow['path'];
						$flowData['main_flow_id'] = $hitFlow['id'];
					}
					else{ 
						//主流程已经走完，直接挂机
						$this->hangupProc();
					}
				}
			}
			else{
				//仍然未说话并且已经提示过，直接挂机
				$hitFlow['hangup'] = 1;	
			}
			
			//获取挂机播放语音
			if ($hitFlow['hangup']){
				$hitFlow = $this->getOneKeyword($flow, 6);
				if ($hitFlow){
					$hitFlow['hangup'] = 1;	
				}
			}
			$flowData["hangup"] = $hitFlow["hangup"];
			
			//用户对话轮次计数
			if (isset($flowdata['call_rotation'])){
				$flowdata['call_rotation'] =  intval($flowdata['call_rotation'])+1;
			}
			else{
				$flowdata['call_rotation'] =  1;
			}
			
			$prompt = $this->rootDir.$hitFlow['path'];
			
			$result = array(
				"action"=> "playback",
				"flowdata"=> json_encode($flowData),
				"params"=>array(
					"prompt"=>$prompt,
					"wait"=>$wait,
					"retry"=>$retry
				)
			);
			
			//播放完挂机
			if ($hitFlow["hangup"]){
				
				$result["after_action"] = "hangup";
				$result["after_ignore_error"] = true;
				$result["after_params"] = array("cause"=>0,"usermsg"=>"");
			}
			$this->returnJson($result, $hitFlow['content']);
		}
	}
	
	//无操作，就是不需要执行任何动作。
	private function noop($flowData = ""){
		if (!$flowData ){
			$flowData = input('post.flowdata','','trim,strip_tags');
		}
		
		$result = array(
			"action"=>"noop",
			"flowdata"=>$flowData,
			"params" =>array(
				"usermsg"=>""
			)
		);
		$this->returnJson($result);
	}
	
	//播放后挂机处理
	private function playAfterHangup($prompt,$usermsg="",$cause= 0){
		if (!$usermsg){
			$usermsg = $prompt;
		}
		
		$result = array(
			"action"=>"playback",
			"suspend_asr"=>true,
			"flowdata"=>"",
			"params"=>array("prompt"=>$prompt),
			"after_action"=>"hangup",
			"after_ignore_error"=>true,  
			"after_params" =>array("cause"=>$cause,"usermsg"=>"$usermsg")
		);
		
		$this->returnJson($result);
		
	}
	
	//直接挂机处理
	private function hangupProc($usermsg = ""){
		$result = array(
			"action"=>"hangup",
			"params"=>array("usermsg"=>$usermsg)
		);
		
		$this->returnJson($result);
	}
	
	private function keywordProc($message,$scenariosId,$flowdata, $callerId){
		$playms = input('post.playms','','trim,strip_tags');
		$playstate = input('post.playstate','','trim,strip_tags');
  
		//获取自定义关键字
		$where = array();
		$where['scenarios_id'] = $scenariosId;
		$where['type'] = 1;
		$flowList = Db::name($this->flowTable)->where($where)->order('classify asc')->select();
		$flow = $this->array_val_chunk($flowList);
		
		//全局关键字匹配
		$result = $this->globalKeywordMatch($message,$scenariosId);
		$keywordType = $result['keywordType'];
		$hitKeyword = $result['hitKeyword'];
		
		//拒绝关键字流程，如果有配置默认流程 否则回复完挂机5 - 1
		$hitFlow = $this->keywordFlowMatch($flow, $message, 5);
		if ($hitFlow){
			\think\Log::record('#####flowKeywordProc =拒绝关键字流程');
			$hitFlow['hangup'] = 1;
			$hitFlow['refuse'] = intval($flowdata['refuse'])+1;
			if ($flowdata['default_flow'] == 0 && !isset($flowdata['mainEnd'])) { //默认流程未使用过
				\think\Log::record('#####flowKeywordProc =默认挽回流程');
				//默认挽回流程
				$defaulthitFlow = $this->getOneKeyword($flow, 1);
				if ($defaulthitFlow){
					$hitFlow = $defaulthitFlow;
					$hitFlow['hangup'] = 0;
					$hitFlow['default_flow'] = 1;
				}
			}
			else if ((isset($flowdata['hangup']) && $flowdata['hangup'] == 1) || (isset($flowdata['mainEnd']) && $flowdata['mainEnd'] == 1)){  //会话中已经标记为挂机时，如果用户还有在说话只有匹配到提问题关键字继续，否则直接挂机
			
				$this->hangupProc();  //直接挂机
			}
			
			$hitFlow['hit'] = 2;
			$hitFlow['hitKeyword'] = $hitFlow['keyword'];
			
			return $hitFlow;
		}
		
		//关键字命中
		if ($hitKeyword){
			//疑问词
			if ($keywordType == 1){
				//触发提问关键字流程
				\think\Log::record('#####flowKeywordProc =触发提问关键字流程');
			}
			else if($keywordType == 2 || $keywordType == 4){
				//继续主流程 
				$hitFlow = $this->getOneMainFlow($flowdata['main_flow_id']);
				
				
				//判断是否需要转人工座席
				if (isset($flowdata['bridge']) && $flowdata['bridge'] == 1){
					$tsr = Db::name('tel_config')
									->field('bridge')
									->where("task_id",$this->gTaskId)->find();
					if ($tsr){
						//$this->bridge('18126152681', '01', 'user/fwgoip');
						$this->bridge($tsr['bridge'], '01',  'user/fwgoip');
					}
				}
				
				if ($hitFlow){//主流程还没走完
					\think\Log::record('#####flowKeywordProc =主流程还没走完');
					$hitFlow['main_flow_id'] = $hitFlow['id'];
					$hitFlow['hangup'] = 0;	
					$hitFlow['hit'] = 1;
					$hitFlow['hitKeyword'] = $hitKeyword;					
					
					return $hitFlow;
				}
				else{
					//主流程走完，主动挂机
					$hitFlow = $this->getOneKeyword($flow, 6);
					if ($hitFlow){
						\think\Log::record('#####flowKeywordProc =主流程走完，主动挂机');
						$hitFlow['hangup'] = 1;	
						return $hitFlow;
					}
				}
			}
			else if($keywordType == 5){
				//重复上一句
				if ($flowdata['retry'] >0){
					//重复上一句
					\think\Log::record('#####flowKeywordProc =重复上一句');
					$hitFlow['content'] = $flowdata['resp_text'];
					$hitFlow['path'] = $flowdata['resp_audio'];
					$hitFlow['retry'] = $flowdata['retry']-1;
					$hitFlow['hangup'] = 0;	
					$hitFlow['hit'] = 1;
					$hitFlow['hitKeyword'] = $hitKeyword;
					return $hitFlow;
				}
				else{
					//不重复播放 触发主动挂机流利
					$hitFlow = $this->getOneKeyword($flow, 6);
					if ($hitFlow){
						\think\Log::record('#####flowKeywordProc =不重复播放 触发主动挂机流利');
						$hitFlow['hangup'] = 1;	
						
						return $hitFlow;
					}
				}
			}
		}
		else{
			if (isset($flowdata['mainEnd']) && $flowdata['mainEnd'] == 1){
				
				$this->hangupProc();  //直接挂机
			}
			
		}
		
		/*************触发关键字流程***************/
		
		
			// <option value="1"> 默认回复流程</option>
			// <option value="2"> 用户提问时的回复</option>
			// <option value="3"> 用户说话听不懂时的回复</option>
			// <option value="4"> 用户说忙时的回复 </option>
			// <option value="5"> 用户拒绝时的回复 </option>
			// <option value="6"> 主动结束时的回复 </option>
			// <option value="7"> 用户未说话时的回复 </option>
			// <option value="8"> 回答不了时的回复 </option>
		
		
		//提问关键字流程 2
		$hitFlow = $this->keywordFlowMatch($flow, $message, 2);
		if ($hitFlow){
			\think\Log::record('#####flowKeywordProc =提问关键字流程');
			
			$hitFlow['ask_num'] = intval($flowdata['ask_num'])+1;
			$hitFlow['hangup'] = 0;
			$hitFlow['hit'] = 2;
			$hitFlow['hitKeyword'] = $hitFlow['keyword'];
			return $hitFlow;
		}
		else if (isset($flowdata['hangup']) && $flowdata['hangup'] == 1){  //会话中已经标记为挂机时，如果用户还有在说话只有匹配到提问题关键字继续，否则直接挂机
			\think\Log::record('#####hangupProc =11111111111');
			$this->hangupProc();  //直接挂机
		}
		
		// 用户说忙时的回复 回复完挂机，后续记录是否有要加微信，回短信等  4
		$hitFlow = $this->keywordFlowMatch($flow, $message, 4);
		if ($hitFlow){
			\think\Log::record('#####flowKeywordProc =用户说忙时的回复 回复完挂机，后续记录是否有要加微信，回短信等');
			$hitFlow['hangup'] = 1;
			$hitFlow['hit'] = 2;			
			$hitFlow['hitKeyword'] = $hitFlow['keyword'];
			return $hitFlow;
		}
		
	
		if ($playms == 0 && $playstate == false){
			//继续主流程 
			$hitFlow = $this->getOneMainFlow($flowdata['main_flow_id']);
		
			if ($hitFlow){//主流程还没走完
				\think\Log::record('#####111flowKeywordProc =主流程还没走完');
				$hitFlow['main_flow_id'] = $hitFlow['id'];
				$hitFlow['hangup'] = 0;	
				
				return $hitFlow;
			}
		}
		
		// 回答不了时的回复  8
		$hitFlow = $this->getOneKeyword($flow, 8);
		if ($hitFlow){
			\think\Log::record('#####flowKeywordProc =回答不了时的回复');
			$hitFlow['hangup'] = 1;	
			
			//问题学习
			$getMemberUid = Db::name('member')->field('uid')->where('mobile',$this->callerId)->find();
			$data['scenarios_id'] = $this->scenariosId;
			$data['phone'] = $this->callerId;
			$data['call_id'] = $this->gCallId;
			$data['content'] = substr(rtrim($message,';'),2);
			$data['status'] = 0;
			$data['create_time'] = time();
			$data['member_id'] = $getMemberUid['uid'];
			Db::name('tel_learning')->insert($data);	
			
			
			return $hitFlow;
		}
		
		// 上面所有流程未触发 主动结束时的回复  6
		$hitFlow = $this->getOneKeyword($flow, 6);
		if ($hitFlow){
			\think\Log::record('#####flowKeywordProc =上面所有流程未触发 主动结束时的回复');
			$hitFlow['hangup'] = 1;	
			return $hitFlow;
		}
		
		// 用户说话听不懂时的回复
		$hitFlow['hangup'] = 1;	
		$hitFlow['path'] = '';
		$hitFlow['content'] = '话术设置不完善,需要配置流程关键字';
		return $hitFlow;
	}
	
	//全局关键字匹配
	private function globalKeywordMatch($message,$scenariosId){
		//匹配 疑问词  肯定词 中性词  重复词
		$keywords = Db::name('tel_keyword')->field('keyword,type,pinyin')->where('scenarios_id',$scenariosId)->order('type asc')->select();
		$keywordType = 0;
		$hitKeyword = "";
		foreach ($keywords as $item) {
			$keywordArr = explode(",",$item["keyword"]);
			$keywordPyArr = explode(",",$item["pinyin"]);
			// dump($keywordArr);
			// dump($keywordPyArr);
			//匹配文字
			foreach ($keywordArr as $k=>$subItem) {
				if(strstr($message,$subItem)){
				  //当前匹配到的关键词类型
					$keywordType = $item["type"];
					//当前匹配的关键词文字
					$hitKeyword = $subItem;
					break;
				}
				// echo $subItem;
				// echo $keywordPyArr[$k];
				//匹配拼音
				if(isset($keywordPyArr) && isset($keywordPyArr[$k]) && $keywordPyArr[$k] && strstr($message,$keywordPyArr[$k])){
				  //当前匹配到的关键词类型
					$keywordType = $item["type"];
					//当前匹配到的关键词拼音
					$hitKeyword = $subItem;
					break;
				}
			}
			
			if ($hitKeyword){
				break;
			}
		}
		
		$result["keywordType"] = $keywordType;
		$result["hitKeyword"] = $hitKeyword;
		
		return $result;
	}
	
	
	
	
	//获取主流程下一条语音
	private function getOneMainFlow($stepFlowId, $sId= 0){
		$where = array();
		if ($sId){
			$where['scenarios_id'] = $sId;
		}
		else{
			$where['scenarios_id'] = $this->scenariosId;
		}
		$where['type'] = 0;
		$where['classify'] = 0;
		$mainFlow = Db::name($this->flowTable)->where($where)->order('id asc ,priority desc')->select();
		$hitFlow = "";
		$first = 0;
		for ($i = 0; $i < count($mainFlow); $i ++) {
			$item = $mainFlow[$i];
			if ($item['id'] == $stepFlowId ){
				$first  = 1;
				$nextIndex = $i+1;
				if ($nextIndex < count($mainFlow)){
					$hitFlow = $mainFlow[$nextIndex];
					$lastNum = $i+2;
					if ($lastNum == count($mainFlow)){
						$hitFlow['mainEnd'] = 1;
					}
					\think\Log::record('#####getOneMainFlow ='.$nextIndex.'###count='.count($mainFlow));
				}
				
				break;
			}
		}
		
		//主流程第一条
		if (!$first && count($mainFlow) > 0){
			$hitFlow = $mainFlow[0];
		}
		
		
		return $hitFlow;
		
	}
	
	//关键字流程匹配
	private function keywordFlowMatch($flowList, $message, $classify){
		$hitFlow = "";
		if (isset($flowList[$classify])){
			$flow = $flowList[$classify];
			foreach($flow as $item){
				$keywordArr = explode(",",$item["keyword"]);
				$keywordPyArr = explode(",",$item["keyword_py"]);
				foreach ($keywordArr as $k=>$subItem) {
					if (!$subItem){
						continue;
					}
					if(strstr($message,$subItem)){
						$hitFlow = $item;
						$hitFlow['keyword'] = $subItem;
						break;
					}
					if(isset($keywordPyArr) && isset($keywordPyArr[$k]) && $keywordPyArr[$k] && strstr($message,$keywordPyArr[$k])){
						$hitFlow = $item;
						$hitFlow['keyword'] = $subItem;
						break;
					}
				}
				if ($hitFlow){
					break;
				}
			}
		}
		
		return $hitFlow;
	}
	
	//取一条回复消息
	private function getOneKeyword($flowList, $classify){
		\think\Log::record('#####classify ='.$classify);
		$hitFlow = "";
		$data = array();
		if (isset($flowList[$classify])){
			$flow = $flowList[$classify];
			foreach($flow as $item){
				$data[] = $item;
			}
		}
		
		if ($data){
			$priority = 0;
			$tempdata = array();
			foreach ($data as $one) {
				$priority += $one['priority'];
				for ($i = 0; $i < $one['priority']; $i ++) {
					$tempdata[] = $one;
				}
			}
			
			if ($priority > 0){
				$use = rand(0, $priority-1);
			}
			else{
				$tempdata = $data;
				$use = rand(0, count($data)-1);
			}

			$hitFlow = $tempdata[$use];
		}
		
		return $hitFlow;
	}
	
	//数组分组
	private function array_val_chunk($array){
		$result = array();
		foreach ($array as  $value) {
		  $result[$value['classify']][] = $value;
		}
		return $result;
	}
	
	
	private function returnJson($msg, $message = "", $debug = true){
		//记录机器人话术
		if ($message){
			$bill = array('phone'=>$this->callerId, 'message'=>$message, 'path'=>'', 'role'=>0,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
	
			Db::name('tel_bills')->insert($bill);	
		}
		
		if ($debug){
			\think\Log::record('#####response msg ='.json_encode($msg));
		}
		
		echo(json_encode($msg));
		exit;
	}
	
	
	
	
	
	
	
	
	
}
