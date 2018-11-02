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
use app\common\controller\Log;
//消费统计
use app\common\controller\ConsumptionStatistics;
//用户数据
use app\common\controller\AdminData;

class Smartivr  extends Base{
	
	
	private $break = 0;   //是否支持打断   0 支持 1不支持

	private $rootDir = '/var/smartivr';
	
	
	private $flowTable = 'tel_flow';
	
	private $requestP;
	private $clientIp;
	
	private $calleeId;
	private $callerId;
	private $gCallId;
	private $gTaskId;
	
	private $scenariosId;   //场景id
	private $scenariosNodeId;    //场景节点id
	private $flowNodeId;         //流程节点
	private $flowBranchNodeId;   //流程分支节点
	private $callPrefix = "";
	
	private $duration = 0;
	private $flowLabels;
	private $gNoAnswer = 0;
	
	
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
		
		//录音根路径
		if (config('audio_root_path')){
			$this->rootDir = config('audio_root_path');
		}
	}

  public function batchUpdateKeywordPy(){
		$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
		$tableName = input('t');
		
		$knowledges = Db::name($tableName)->field('id,keyword,keyword_py')->select();
		foreach($knowledges as $item){
			$item['keyword'] = str_replace("，",",",$item['keyword']);
			if ($item['keyword']){
				$messagePy = $pinyin->sentence($item['keyword']);
				if (substr_count($item['keyword'],',') != substr_count($messagePy,',')){
					echo substr_count($item['keyword'],',').'###'.$item['keyword'];
					echo "<br/>";
					echo  substr_count($messagePy,',').'###'.$messagePy;
					echo "<br/>";
				}
				$data['keyword'] = $item['keyword'];
				$data['keyword_py'] = $messagePy;
			
				$ret = Db::name($tableName)->where('id', $item['id'])->update($data);
			}
		}
	}
	
	
	
	
	public function getIntentionLevelTest(){
		header('Content-Type: text/html; charset=utf-8');
		$this->scenariosId = 92;
		$message = '2.什么事情啊。;';
		$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
					$messagePy = $pinyin->sentence($message);
					$messagePy = str_replace(' ', '', $messagePy);
					dump($messagePy);
		//关键字命中检查
		$where = array();
		$where['scenarios_id'] = $this->scenariosId;
		$knowledgeList = Db::name('tel_knowledge')->where($where)->select();
		$knowledges = $this->array_val_chunk($knowledgeList);
		//dump($knowledges);exit;
		//匹配顺序0 普通 1业务问题 2肯定3 否定 4拒绝 5中性  6 未识别 7重复 8用户未说话 9无法回答 10 无法回答次数
		$knowledgeType = array(0,1,7); 
		$knowledgeHitMore = $this->knowledgeMatch($knowledges, $message, $knowledgeType);
			
		$knowledgeHit = $this->getHitKnowledge($knowledgeHitMore, 7);
			//var_dump($knowledgeHitMore);
		// exit;	
			
		//流程命中检查
		$where = array();
		$where['flow_id'] = 49;
		$where['is_select'] = 1;
		$flowBranchs = Db::name('tel_flow_branch')->where($where)->order('type desc')->select();
		$keylist = '你好, 哪位, 哪里，你谁, 干嘛, 干什么, 你是谁,   做什么, 怎么了, 说什么, 哪边，找谁，没听懂, 没有, 你说啥，啥,你说什么,shenmeshi';
		$keyListArr = explode(',', $keylist);
		foreach($keyListArr as $item){
			$item = trim($item);
			// echo $item;
			// echo '<br/>';
			if (strstr($messagePy, $item)){
			echo $item;
			echo '<br/>';
			}
		}
		
		//有分支流程
		$flowBranchHit = array();
		if ($flowBranchs){
			$flowBranchHit = $this->flowBranchMatch($flowBranchs, $knowledges, $message);
		}
		
		
		dump($flowBranchs);
		exit;
			$intentionData = array();
			$src = array('微信','qq','手机');
			$dst = array('微信');
			//$ret = $this->getIntentionRule(1);
		
			var_dump($ret);exit;
			$intentionData['invite_succ']=false;
			$intentionData['final_refusal'] = false;
			$intentionData['hit_problem_times'] = 0;
			$intentionData['affirm_times'] = 0;
			$intentionData['reject_times'] = 0;
			$intentionData['speak_count'] = -1;
			$intentionData['call_duration'] = 0;
			$intentionData['say_keyword'] =  array();
			$intentionData['call_status'] = 6;
			if (1){
				$intentionData['call_status'] = 999;
				
			}
			var_dump($intentionData);
		return $this->getIntentionLevel($intentionData);
	}
	
	//获取意向规则
	private function getIntentionRule($cond = 0){
		
		$intentionRules = Db::name('tel_intention_rule')->field('type,level,rule')->where('scenarios_id', $this->scenariosId)->order('level desc')->select();
		if (!$intentionRules){
			
			\think\Log::record('tel_intention_rule is null!');
			return -1;
		}
		
		if ($cond){
			foreach($intentionRules as $item){
				//取出默认意向等级
				if ($item['type'] == 1){
					$defaultLevel = $item['level'];
					continue;
				}
				
				$item['rule'] = unserialize($item['rule']);
				if ($item['rule']){
					foreach($item['rule'] as $subItem){
						if ($subItem['key'] == 'say_keyword'){
							$say_keyword = explode(",", $subItem['value']);
							return $say_keyword;
						}
					}
				}
			}
			return null;
		}
		else{
			return $intentionRules;
		}
	}
	
	/*根据以下输入参数，获取用户意向等级
		invite_succ 是否邀约成功
		final_refusal 客户最后是否拒绝
		hit_problem_times  命中问题
		affirm_times 肯定次数
		reject_times 拒绝次数
		speak_count 客户讲话次数
		call_duration 通话时长
		say_keyword 客户通话内容
		call_status  通话状态
		return  level;
	*/
	private function getIntentionLevel($intentionData){
		$level = 0;
		$defaultLevel = -1;
		
		if (!$this->scenariosId){
			\think\Log::record('scenariosId is null!');
			return -1;
		}
		
		$intentionRules = $this->getIntentionRule();
		if (!$intentionRules){
			
			\think\Log::record('tel_intention_rule is null!');
			return -1;
		}
	
		foreach($intentionRules as $item){
			//取出默认意向等级
			if ($item['type'] == 1){
				$defaultLevel = $item['level'];
				continue;
			}
			
			$item['rule'] = unserialize($item['rule']);
			
			if ($item['rule']){
				$flag = true;
				foreach($item['rule'] as $subItem){
					if ($subItem['key'] == 'call_status'){
						$subItem['op'] = 'in_array';
					}
					
					if ($subItem['type'] == 'int'){
						$subItem['value'] = (int)$subItem['value'];
					}
					
					if ($subItem['key'] == 'say_keyword'){
						if ($intentionData[$subItem['key']]){
							$subItem['value'] = explode(",", $subItem['value']);
						}
						else{
							$flag = false;
							break;
						}
					}
					//var_dump($subItem['key'],$intentionData[$subItem['key']],$subItem['op'],$subItem['value']);
					$ret = $this->compare($intentionData[$subItem['key']], $subItem['value'], $subItem['op']);					
					if (!$ret){
						$flag = false;
						break;
					}
				}
				
				if ($flag){
					$level = $item['level'];
					break;
				}
			}
		}
		
		if (!$level){
			
			$level = $defaultLevel;
		}
	
		return $level;
	}
	
	
	
	private function compare($a, $b, $symbol) {
		$compare = [
			'>=' => function ($a, $b) { return $a >= $b; },
			'<=' => function ($a, $b) { 
				if ($a <0){
					return false;
				}
				return $a <= $b; 
			},
			'=' => function ($a, $b) { return $a == $b; },
			'in_array' => function ($a, $b) { 
					if (is_array($a)){
						if (array_diff($a,$b)){
							return false;
						}
						else{
							return true;
						}
					}
					else{
						
						return in_array($a,$b); 
					}
				},
			'all' => function ($a, $b) {
					if (array_diff($b,$a)){
						return false;
					}
					else{
						return true;
					}
				}
		];
		return $compare[$symbol]($a, $b);
	}
	
	/*获取呼叫状态
	0           未分配
	1           已分配
	2           已接通   
	3           无人接听（not answer） 无法接听 （is not reachable）
	4           停机(out of service)  欠费(defaulting)  呼入限制(barring of incoming)  暂停服务(not in service) 拨号方式不正确(not a local number)  改号(number change)
	5           空号（does not exist）
	6           正在通话中(hold on) 用户正忙（busy now）
	7           关机（power off）
	8           用户拒接  （not convenient）
	9           网络忙（line is busy） 线路故障（line fault）   无法接通（is not reachable）
	10        来电提醒 （call reminder） 稍后再拨（redial later）
	11        呼叫转移失败（forwarded）
    */         
	private function getCallStatus($statusStr){
		$callStatus = 0;
		switch(strtolower($statusStr)){
			case "not answer":
			case "is not reachable":
				$callStatus = 3;
				break;
			case "out of service":
			case "defaulting":
			case "barring of incoming":
			case "not in service":
			case "not a local number":
			case "number change":
				$callStatus = 4;
				break;
			case "does not exist":			
				$callStatus = 5;
				break;
			case "hold on":
			case "busy now" :
				$callStatus = 6;
				break;
			case "power off":
				$callStatus = 7;
				break;
			case "not convenient":
				$callStatus = 8;
				break;
			case "line is busy":
			case "line fault":
			case "is not reachable":
				$callStatus = 9;
				break;
			case "call reminder":
			case "redial later":
				$callStatus = 10;
				break;
			case "forwarded":
				$callStatus = 11;
				break;
			default :
				$callStatus = 3;
		}
		
		return $callStatus;
		
	}
	//获取场景表数据
	private function getScenarios($scenariosId){
		cache('scenarios_'.$scenariosId, null);
		$scenarios = cache('scenarios_'.$scenariosId);
		if (!$scenarios){
			$scenarios = Db::name('tel_scenarios')->field('id, break,status')->where(array('id'=>$scenariosId, 'status'=>1))->find();
			if (!$scenarios || !$scenarios["status"]){
				return null;
			}
			cache('scenarios_'.$scenariosId, $scenarios);
		}
		return $scenarios;
	}
	
	//获取tel_config表数据
	private function getTelCfgByParamName($taskId, $pName = ''){
		cache('task_'.$taskId, null);
		$telConfig = cache('task_'.$taskId);
		if (!$telConfig){
			$telConfig = Db::name('tel_config')->where(array('task_id'=>$taskId, 'status'=>1))->find();
			if (!$telConfig ){
				return null;
			}
			cache('task_'.$taskId, $telConfig);
		}
		
		if ($pName){
			return $telConfig[$pName];
		}
		else{
			return $telConfig;
		}
	}
	
	//获取话术语料
	private function getCorpus($flowId,$srcType, $returnAll = 0){
		
		$corpus = Db::name("tel_corpus")->where(array('src_id'=>$flowId,'src_type'=>$srcType))->select();
		if (!$corpus){
			return null;			
		}
		if ($returnAll){
			return $corpus;
		}
		
		$prompt = "";
		if (count($corpus) ==1){
			$prompt = $corpus[0];
		}
		else{
			$randIndex = 0;
			$randIndex = rand(0, count($corpus)-1);
			$prompt = $corpus[$randIndex];
		}
		
		if ($prompt['audio']){
			return  array('prompt'=>$this->rootDir.$prompt['audio'],'content'=>$prompt['content']);
		}
		else{
			return array('prompt'=>$prompt['content'],'content'=>$prompt['content']);
		}
	}
	
	//获取会员信息
	private function getMember($memberId){
		cache('admin_'.$memberId, null);
		$memberInfo = cache('admin_'.$memberId);
		if (!$memberInfo){
			$memberInfo = Db::name('admin')->where(array('id'=>$memberId, 'status'=>1))->find();
			if (!$memberInfo ){
				return null;
			}
			cache('admin_'.$memberId, $memberInfo);
		}
		return $memberInfo;
	}
	
	//
	private function searchArray($message, $srcArr, $dstArr){
		$keywordArr = array();
		$newDstArr = $dstArr;
		
		foreach($srcArr as $item){
			if (strstr($message,$item)){
				array_push($keywordArr, $item);
			}
		}
		
		foreach($keywordArr as $key){
			foreach($newDstArr as $newKey){
				if ($key == $newKey){				
					break;
				}
			}
			array_push($newDstArr, $key);
		}
		
		
		return $newDstArr;
	}
	
	private function setFlowData($flowData,$callId){
		cache('flow_data_'.$callId, $flowData);
	}
	
	private function getFlowData($callId){
		$flowData = cache('flow_data_'.$callId);
		return json_decode($flowData, true);
	}
	
	private function removeFlowData($callId){
		cache('flow_data_'.$callId, null);
	}
	
	//非接通入口
	public function unusualNotify(){
		$da = input('post.da','','trim,strip_tags');
		$number = input('post.number','','trim,strip_tags');
		
		$bill = input('post.bill', 0,'trim,strip_tags');
		$shichang = $bill;
		$this->gCallId = input('post.callid','','trim,strip_tags');
		
		$this->gTaskId = input('post.taskuuid','','trim,strip_tags');
		// Log::info($this->gTaskId);
		$flowData = $this->getFlowData($this->gCallId);
		if (!$flowData){
			$flowData = array();
			$flowData['call_times'] = 0;  //用户说话次数 以调用识别接口次数为准
			$flowData['affirm_times'] = 0;  //肯定次数
			$flowData['negative_times'] = 0; //否定次数
			$flowData['neutral_times'] = 0;  //中性次数
			$flowData['effective_times'] = 0;  //有效次数
			$flowData['hit_times'] = 0;       //命中问题数
			$flowData['reject_times'] = 0;       //拒绝次数
			$flowData['flow_label'] = array();
			$flowData['knowledge_label'] = array();
			$flowData['semantic_label'] = array();
		
			$flowData['intention'] = 0;   //意向等级
			$flowData['invite_succ'] = false;
			$flowData['final_refusal'] = false;
			$flowData['say_keyword'] = array();
			
			$flowData['calleeId'] = $this->calleeId;
			$flowData['callerId'] =$number;
			$flowData['last_dial_time'] = time(); 
		}
		
		$this->calleeId = $flowData['calleeId'];
		$this->callerId = $flowData['callerId'];
		
		$duration = 0;
		//根据任务id获取呼叫任务数据
		$telConfig = $this->getTelCfgByParamName($this->gTaskId);
		if (!$telConfig){
			\think\Log::record('unusualNotify->呼叫任务未启用!');
			$this->removeFlowData($this->gCallId);
			$this->hangupProc();
		}
		$this->scenariosId = $telConfig['scenarios_id'];
		$this->memberId = $telConfig["member_id"];
		$this->callPrefix = $telConfig['call_prefix'];
		
		//客户信息
		$memberInfo = $this->getMember($this->memberId);
		Log::info($number);
		if ($number){
			
			
			if ($bill >0){
				//增加损耗公摊
				if (isset($memberInfo['loss_rate']) && $memberInfo['loss_rate'] > 0){
					$bill = ($bill*($memberInfo['loss_rate']/100)) + $bill;
				}
			
				$bill = round($bill/1000);
				$duration = $bill;
				if ($bill < 60){
					$bill = 60;
				}
				$status = 2; //已接通
			}
			else{
				//获取未接通状态
				$status = $this->getCallStatus($da);
			}
			
			//($current_member_id, $duration, $line_id, $mobile, $call_id, $asr_price, $asr_cnt)
			//计费
			$ret = $this->duration_deductions($telConfig['member_id'], $shichang, $telConfig['call_phone_id'], $number, $this->gCallId, $memberInfo['asr_price'], $flowData['call_times'], $this->gTaskId);
			
			// $number
			//更新当前号码的拨打次数
			$update_call_rotation = Db::name('member')
															->where([
																'owner'	=>$telConfig['member_id'],
																'mobile'	=>	$number,
																'task'	=>	$this->gTaskId
															])
															->setInc('call_rotation', 1);
			\think\Log::record('拨打次数更新结果');
			/*
			//计费
			$time_money = 0;
			$asr_money = 0;
			
			//按时长计费
			if ($memberInfo['time_price']){
				$time_money = $memberInfo['time_price'] * round($bill/60,2);
			}
			
			//按月计费 通过数据库定时器
			
			//按识别接口次数计费
			if ($memberInfo['asr_price']){
				$asr_money = $memberInfo['asr_price'] * $flowData['call_times'];
			}
			
			//扣除费用
			$money = $time_money + $asr_money;
			if ($money > 0){
				$ret = Db::name('admin')->where('id', $this->memberId)->setDec('money',$money);
				if (!$ret){
					\think\Log::record('unusualNotify admin setDec failure!');
				}
			}
			
			//扣费明细
			$order = array('owner'=>$this->memberId, 'mobile'=>$number,'call_id'=>$this->gCallId, 'money'=>$money,'duration'=>$duration, 'time_price'=>$memberInfo['time_price'], 'asr_price'=>$memberInfo['asr_price'], 'asr_cnt'=>$flowData['call_times'],'create_time'=>time());
			$ret = Db::name('tel_order')->insert($order);
			*/
			if (!$ret){
				// Log::info('计费失败');
				\think\Log::record('unusualNotify tel_order insert failure!');
			}
			//////////////////////////////////////////////////
			
			//意向等级
			if ($flowData['intention'] > 0){
				$level = $flowData['intention'];
			}
			else{
				$intentionData = array();
				
				$intentionData['invite_succ'] =  $flowData['invite_succ'];
				$intentionData['final_refusal'] = $flowData['final_refusal'];
				$intentionData['hit_problem_times'] = $flowData['hit_times'];
				$intentionData['affirm_times'] = $flowData['affirm_times'];
				$intentionData['reject_times'] = $flowData['reject_times'];
				$intentionData['speak_count'] = $flowData['call_times'];
				$intentionData['call_duration'] = $duration;
				$intentionData['say_keyword'] = $flowData['say_keyword'];
				
				$intentionData['call_status'] = $status;
				$level = $this->getIntentionLevel($intentionData);
			}
			
			//更新拨打结果和呼叫历史表
			$telConfig = $this->getTelCfgByParamName($this->gTaskId);
			
			$where = array();
			$where['mobile'] = $this->callerId;
			$where['owner'] = $this->memberId;
			$where['task'] = $this->gTaskId;
			
			$path = "";
			if ($duration > 0){
				$basePath = date('Y-m-d',time()).'/';
				$path = $basePath.$this->callPrefix.$this->callerId.'.'.$this->calleeId.'.'.$this->gCallId.'.wav';
			}
			$data = array();
			$data['status'] = $status;
			$data['record_path'] = $path;
			$data['level'] = $level;
			$data['call_id'] = $this->gCallId;
			$data['originating_call'] = $this->getTelCfgByParamName($this->gTaskId, 'phone');
			
			$data['call_times'] = $flowData['call_times'];
			$data['affirm_times'] = $flowData['affirm_times'];
			$data['negative_times'] = $flowData['negative_times'];
			$data['neutral_times'] = $flowData['neutral_times'];
			$data['effective_times'] = $flowData['affirm_times'] + $flowData['hit_times'];
			$data['hit_times'] = $flowData['hit_times'];
			if ($flowData['flow_label']){
				$data['flow_label'] = implode(',',$flowData['flow_label']);
			}
			
			if ($flowData['knowledge_label']){
				$data['knowledge_label'] = implode(',',$flowData['knowledge_label']);
			}
			
			if ($flowData['semantic_label']){
				$data['semantic_label'] = implode(',',$flowData['semantic_label']);
			}
			$data['duration'] = $duration;
			$data['scenarios_id'] = $this->scenariosId;
			$ret = Db::name('member')->where($where)->update($data);
			if (!$ret){
				\think\Log::record('unusualNotify member update failure!');
				exit;
			}
			
			$data['owner'] = $this->memberId;
			$data['mobile'] = $this->callerId;
			$data['task_id'] = $this->gTaskId;
			$data['last_dial_time'] = $flowData['last_dial_time'];
			$ret = Db::name('tel_call_record')->insert($data);
			if (!$ret){
				\think\Log::record('unusualNotify tel_call_record insert failure!');
			}
		}
		
		//获取当前任务的类型 如果是1(使用加入呼叫的方式) 将任务停止(释放机器人)
		$task_type = Db::name('tel_config')
									->where('task_id', $this->gTaskId)
									->value('type');
		Log::info($task_type);
		if($task_type == 1){
			//停止任务
			$update_result = Db::name('tel_config')
												->where('task_id', $this->gTaskId)
												->update([
													'status'	=> 3
												]);
			Log::info('暂停任务结果：' . $update_result);
		}
		
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
							$url = config('res_url').'wap/member/callresult/id/'.$this->gCallId;
							$data=array(
								            'first'=>array('value'=>"智能语音机器人又筛出意向客户啦",'color'=>"#173177"),
								            'keyword1'=>array('value'=>'','color'=>'#173177'),
								            'keyword2'=>array('value'=>$memberInfo['real_name'],'color'=>'#173177'),
								          	'keyword3'=>array('value'=>$this->callerId,'color'=>'#173177'),
								          	'keyword4'=>array('value'=> date('m-d H:i',time()),'color'=>'#173177'),
								            'remark'=>array('value'=>'千万不要错过，戳我查看详情','color'=>'#173177'),
								     	);
							//sendTemplateMsg($item['open_id'], 'q1Cu9dmvjXl8W6YxV__7s8O9otK33tomeoSqxj8MJHI', $url, $data, $topcolor = '#173177');
						}
					}					
				}

			}
		}
		
		$this->removeFlowData($this->gCallId);
	}
	
	
	
	//接通入口
	public function IVREntery(){
		$notify = input('post.notify','','trim,strip_tags');
		$this->calleeId = input('post.calleeid','','trim,strip_tags');  //主叫号码
		$this->callerId = input('post.callerid','','trim,strip_tags'); //被叫号码
		
		$this->gCallId = input('post.callid','','trim,strip_tags');
		
		$this->gTaskId = input('post.flowid','','trim,strip_tags');
		
		if (!$notify || !$this->calleeId || !$this->callerId || !$this->gCallId){
			\think\Log::record('IVREntery->参数不完整');
			$this->hangupProc();
		}
		
		//根据任务id获取呼叫任务数据
		$telConfig = $this->getTelCfgByParamName($this->gTaskId);
		if (!$telConfig){
			\think\Log::record('IVREntery->呼叫任务未启用');
			$this->hangupProc();
		}
		
		//去掉号码前缀
		if (isset($telConfig['call_prefix']) && $telConfig['call_prefix']){
			$this->callPrefix = $telConfig['call_prefix'];
			$this->callerId = substr($this->callerId,strlen($telConfig['call_prefix']));
		}
		
		
		$this->memberId = $telConfig["member_id"];
		$this->scenariosId = $telConfig["scenarios_id"];
		
		//检查费用是否超出
		// $memberInfo = Db::name('admin')->field('money,credit_line')->where(array('id'=>$this->memberId, 'status'=>1))->find();
		// if ($memberInfo){
		// 	$balance = $memberInfo['money'] + $memberInfo['credit_line'];
		// 	if ($memberInfo['money'] <= 0 && $balance <= 0){
		// 		$data=array();
		// 		$data['start'] = 4;
		// 		$data["alter_datetime"] = date("Y-m-d H:i:s",time());
		// 		$ret = Db::connect('db_config1')->table('autodialer_task')->where('uuid',$this->gTaskId)->update($data);
		// 		$ret = Db::name('tel_config')->where('task_id',$this->gTaskId)->update(array('status'=>4));
		// 		//发送欠费通知消息
		// 		$data = array();
		// 		$data['title'] = '欠费通知';
		// 		$data['content'] = '你的账号余额不足，请联系客服充值！';
		// 		$data['member_id'] = $this->memberId;
		// 		$data['create_time'] = time();
		// 		$data['status'] = 0;
		// 		$ret = Db::name('message')->insertAll($data);
		// 	}
		// }
		$AdminData = new AdminData();
		//验证余额是否充足
		if($AdminData->verify_member_open_task_condition($this->memberId) === false){
			$data = array();
			$data['start'] = 4;
			$data["alter_datetime"] = date("Y-m-d H:i:s",time());
			$ret = Db::connect('db_config1')->table('autodialer_task')->where('uuid',$this->gTaskId)->update($data);
			$ret = Db::name('tel_config')->where('task_id',$this->gTaskId)->update(array('status'=>4));
			//发送欠费通知消息
			$data = array();
			$data['title'] = '欠费通知';
			$data['content'] = '你的账号余额不足，请联系客服充值！';
			$data['member_id'] = $this->memberId;
			$data['create_time'] = time();
			$data['status'] = 0;
			$ret = Db::name('message')->insertAll($data);
		}
		
		
		//获取场景信息
		$scenarios = $this->getScenarios($this->scenariosId);
		if (!$scenarios){
			\think\Log::record('tel_scenarios is null!');
			$this->hangupProc();
		}
		
		switch($notify){
			case "enter" :
				$this->playBackgroundAsr($this->callerId);
				break;
			case "asrprogress_notify" :
				$this->playASRProgress();
				break;
			case "asrmessage_notify" :			
				$this->playBackProc();
				break;
			case "playback_result" :
				$this->playBackResult($this->calleeId, $this->callerId, $this->gCallId);
				break;
			case "stop_asr_result" :
				$this->stopAsrResult();
				break;
			case "bridge_result" :
				$this->bridgeResult();
				break;
			case "getdtmf_result" :
				$this->noop();
			case "leave" :
				$this->leaveProc();
				break;
			default :
				\think\Log::record("IVREntery未知notify【".$notify."】!");
				$this->hangupProc();
		}		
	}
	
	//开始语音识别
	private function playBackgroundAsr($callerId){	
		
		//更新客户状态 已接通
		$where['mobile'] = $this->callerId;
		$where['owner'] = $this->memberId;
		if ($this->gTaskId){
			$where['task'] = $this->gTaskId;
		}
		
		$ret = Db::name('member')->where($where)->update(array('status'=>2,'last_dial_time'=>time()));
		if (!$ret){
			\think\Log::record('playBackgroundAsr member update failure!');
			$this->hangupProc();
		}

		//全局话术是否需要自动打断
		$pause_play_ms = 0;   //是否设置自动打断 0，关闭自动打断，其他值（建议 300-1000，或者关闭），检测多少毫秒的声音就打断。
		$scenarios = $this->getScenarios($this->gTaskId);
		if ($scenarios && $scenarios['break'] == 0){
			$pause_play_ms = 1500;
		}
		
		//获取开场白节点
		$where = array();
		$where['scenarios_id'] = $this->scenariosId;
		$scenariosNode = Db::name("tel_scenarios_node")->where($where)->order('id asc ,sort desc')->find();
		
		$prompt = "";
		$content = array();
		$where['scen_node_id'] = $scenariosNode['id'];
		$where['pid'] = 0;
		$flowNode = Db::name("tel_flow_node")->where($where)->find();
		if ($flowNode){
			$corpus = $this->getCorpus($flowNode['id'], 0);
			if ($corpus){
				$prompt =  $corpus['prompt'];
				array_push($content, $corpus['content']);
			}
		}
		
		//每句话术是否打断
		if ($flowNode['break'] == 0){ 
			$block_asr = 0;    //0 由话术场景打断决定，本次不做处理。
		}
		else{
			$block_asr = -1;  //停止识别，不打断
		}
		
		$wait = 3000;  //单位毫秒，放音结束后等待时间。用于等待用户说话。		
		if (isset($flowNode['pause_time']) && $flowNode['pause_time'] > 0){
			$wait = (int)$flowNode['pause_time'];
		}
		$flowData = array();
		$flowData['call_times'] = 0;  //用户说话次数 以调用识别接口次数为准
		$flowData['affirm_times'] = 0;  //肯定次数
		$flowData['negative_times'] = 0; //否定次数
		$flowData['neutral_times'] = 0;  //中性次数
		$flowData['effective_times'] = 0;  //有效次数
		$flowData['hit_times'] = 0;       //命中问题数
		$flowData['reject_times'] = 0;       //拒绝次数
		$flowData['flow_label'] = array();
		$flowData['knowledge_label'] = array();
		$flowData['semantic_label'] = array();
		$flowData['currScenariosNodeId'] = $scenariosNode['id'];  //当前场景节点id
		$flowData['currFlowId'] = $flowNode['id'];           //当前流程id
		$flowData['currKnowledgeId'] = 0;
		$flowData['currType'] = 0;   //0 流程话术  1知识库
 		
		$flowData['duration'] = 0;   //通话时长
		$flowData['intention'] = 0;   //意向等级
		$flowData['hangup'] = 0;   //挂机
		
		$flowData['invite_succ'] = false;
		$flowData['final_refusal'] = false;
		$flowData['say_keyword'] = array();
		
		$flowData['calleeId'] = $this->calleeId;
		$flowData['callerId'] =$this->callerId;
		$flowData['last_dial_time'] = time(); 
		//语义标签
		$where = array();
		$where['member_id'] = $this->memberId;
		$where['type'] = 0;
		$flowData['src_semantic_label'] = Db::name('tel_label')->field('keyword,label')->where($where)->select();
		
		//用户说话包含的关键字
		$flowData['src_say_keyword'] = $this->getIntentionRule(1);
		
		
		$flowData['break'] = $scenarios['break'];
		
		$flowData['unanswerable_cnt'] = 0;  //连续无法回答次数
		$flowData['repeat_cnt'] = 0;   //连续重播次数
		$flowData['no_speek'] = 0;  //连续未说话次数
		$flowData['no_answer'] = 0;  //回答不上来话术索引
		
		$result = array(
			"action"=>"start_asr",
			"flowdata"=> json_encode($flowData),
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
				"retry"=>0,
				"block_asr"=>$block_asr
			)
		);
		
		$this->returnJson($result, $content);
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
		
		//记录通话记录
		$hangup_disposition = input('post.hangup_disposition','','trim,strip_tags');
		
		if ($hangup_disposition == 'recv_bye'){
			$bill = array('phone'=>$this->callerId, 'message'=>'客户挂机', 'path'=>'', 'role'=>1,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
		}
		else{
			$bill = array('phone'=>$this->calleeId, 'message'=>'机器挂机', 'path'=>'', 'role'=>0,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
		}
		$ret = Db::name('tel_bills')->insert($bill);
		if (!$ret){
			\think\Log::record('leaveProc tel_bills insert failure!');
		}
	}
	
	
	//停止识别且判断是否需要转人工座席
	private function stopAsrResult(){
		$flowdata = input('post.flowdata','','trim,strip_tags');
		$flowdata = json_decode($flowdata,true);
		
		$this->hangupProc();
		//{"calleeid":"996","callerid":"linphone","callid":"d0a3e9a8-2ce2-42e3-8fa7-55c5eb15326d","errorcode":480,"flowdata":"","hangupcause":"Temporarily Unavailable","message":"NO_USER_RESPONSE","notify":"bridge_result"}
	}
	
	//跳转节点 获取下一动作 0 挂机 1 下一场景节点 2 指定场景节点 3返回当前场景节点中的流程节点 4 等待用户响应
	private function getNextFlowNode($actionData,$flowData){
		$flowNode = "";
		
		if ($actionData['action'] == 1 || $actionData['action'] == 2){
			if ($actionData['action'] == 1){
				$scenariosNodeId = 0;
				$scenariosNodes = Db::name('tel_scenarios_node')->where('scenarios_id', $this->scenariosId)->order('id asc')->select();
				for ($i = 0; $i < count($scenariosNodes); $i ++) {
					$scenariosNode = $scenariosNodes[$i];
					if ($scenariosNode['id'] == $flowData['currScenariosNodeId'] ){
					
						$nextIndex = $i+1;
						if ($nextIndex < count($scenariosNodes)){
							$scenariosNodeId = $scenariosNodes[$nextIndex]['id'];
							\think\Log::record('#####getNextFlow =###scenariosNodeId='.$scenariosNodeId);
						}
						break;
					}
				}
			}
			else{
				$scenariosNodeId = $actionData['action_id'];
			}
			
			$where = array();
			$where['scenarios_id'] = $this->scenariosId;
			$where['scen_node_id'] = $scenariosNodeId;
			$where['pid'] = 0;
			$flowNode = Db::name("tel_flow_node")->where($where)->find();
		}
		else if ($actionData['action'] == 3){
			$flowNode = Db::name("tel_flow_node")->where('id', $flowData['currFlowId'])->find();
		}
		else{
			//返回空
		}
		
	
		return $flowNode;
		
	}
	
	//去除识别返回的数字
	private function delAsrNumber($message){
		$newMessage = "";
		if (!$message){
			return $newMessage;
		}
		
		$messageArr = explode(";",$message);
		foreach($messageArr as $val){
			
			$arr = explode(".",$val);
			if (count($arr) > 1){
				$newMessage .= $arr[1].';';
			}
		}
		return $newMessage;
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
		$flowData = input('post.flowdata','','trim,strip_tags');
		$flowData = json_decode($flowData,true);
		$message = input('post.message','','trim,strip_tags');
		
		$command = "noop";  //不做任何处理
		if ($flowData["break"]){ //不支持打断，继续播放录音
			$command = "noop";
		}
		else{
			$message = $this->delAsrNumber($message);
			//0 普通 1业务问题 2肯定3 否定 4拒绝 5中性  6 未识别 7重复 8用户未说话 9无法回答 10 无法回答次数
			if ($message){
				$where = array();
				$where['scenarios_id'] = $this->scenariosId;
				$knowledgeList = Db::name('tel_knowledge')->where($where)->select();
				$knowledges = $this->array_val_chunk($knowledgeList);
				//拒绝
				$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
				$messagePy = $pinyin->sentence($message);
				$messagePy = str_replace(' ', '', $messagePy);
				$knowledgeType = array(4,3,2,5,7,1,0);
				$hit = $this->knowledgeMatch($knowledges, $message, $messagePy, $knowledgeType);
				if($hit){
					$command = "pause";
				}
			}
			else{
				$command = "resume";
			}
		}
		
		$result = array(
			"action"=> "console_playback",
			"flowdata"=> json_encode($flowData),
			"params"=>array(
				"command"=>$command
			)
		);
		
		$this->returnJson($result);
	}
	
	//保存话单
	private function saveBills($playDataList){
		$message = input('post.message','','trim,strip_tags');
		$messageArr = explode(";",$message);
		$callTimes = 0;
		$bills = array();
		foreach($messageArr as $val){
			
			$arr = explode(".",$val);
			if (count($arr) > 1){
				$callTimes = $callTimes+1;
				$path = $this->callPrefix.$this->callerId."_".$this->gCallId."_".$arr[0].'.wav';
				$bills[] = array('phone'=>$this->callerId, 'message'=>$arr[1], 'path'=>$path, 'role'=>1,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
			}
		}
		
		//写入话单
		if ($bills){
			foreach($bills as &$bill){
				foreach($playDataList as $item){
					$bill['hit_keyword'] = "";
					if(isset($item['keyword']) && $item['keyword'] && strstr($bill['message'],$item['keyword'])){
						$bill['status'] = 1;
						$bill['hit_keyword'] = $item['src_type']== 0?'命中流程关键字:'.$item['keyword']:'命中问答关键字:'.$item['keyword'];
						break;
					}
					
				}
			}
			Db::name('tel_bills')->insertAll($bills);	
		}
		
		return $callTimes;
	}
	
	//是否匹配到语义标签
	private function matchSemanticLabel($message, $src, $dst){
		$semanticLabel = array();
		$semanticLabel = $dst;
		
		foreach($src as $item){
			if ( $item['keyword']){
				$keywordArr = explode(",", $item['keyword']);
				foreach($keywordArr as $subItem){
					if(strstr($message,$subItem)){
						if (!in_array($item['label'], $dst)){
							array_push($semanticLabel, $item['label']);
							break;
						}
					}
				}
			}
		}
		
		return $semanticLabel;
	}
	
	
	private function playBackProc(){
		$flowData = input('post.flowdata','','trim,strip_tags');
		$flowData = json_decode($flowData,true);
		$message = input('post.message','','trim,strip_tags');
		
		$playDataList = array();
		
		$randIndex = 0;
		//如果message为空
		if (!$message || $flowData['hangup'] == 1){
			$result = array(
				"action"=> "console_playback",
				"flowdata"=> json_encode($flowData),
				"params"=>array(
					"command"=>'resume'
				)
			);
			$this->returnJson($result);
		}
		
		$message = $this->delAsrNumber($message);
		
		//是否包含意向设定的关键字
		$flowData['say_keyword'] = $this->searchArray($message, $flowData['src_say_keyword'], $flowData['say_keyword']);
		
		//语义标签		
		$flowData['semantic_label'] = $this->matchSemanticLabel($message, $flowData['src_semantic_label'], $flowData['semantic_label']);
		
		//关键字命中检查
		$where = array();
		$where['scenarios_id'] = $this->scenariosId;
		$knowledgeList = Db::name('tel_knowledge')->where($where)->select();
		$knowledges = $this->array_val_chunk($knowledgeList);
		
		$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
		$messagePy = $pinyin->sentence($message);
		$messagePy = str_replace(' ', '', $messagePy);
				
		
		//匹配顺序0 普通 1业务问题 2肯定3 否定 4拒绝 5中性  6 未识别 7重复 8用户未说话 9无法回答 10 无法回答次数
		$knowledgeType = array(0,1,7); 
		$knowledgeHitMore = $this->knowledgeMatch($knowledges, $message, $messagePy, $knowledgeType);
		if($knowledgeHitMore){
			$flowData['unanswerable_cnt'] = 0;  //复位非连续回答不上来次数
			//重复上一句
			$knowledgeHit = $this->getHitKnowledge($knowledgeHitMore, 7);
			if ($knowledgeHit){
				\think\Log::record('1212####hit keyword='.$knowledgeHit['keyword']);
				//重复播放>=3次回复挂机
				if ($flowData['repeat_cnt'] >=3){
					$type = 10; //超出无法回答次数
					if (isset($knowledges[$type])){
						$unanswerable = $knowledges[$type];	
						$randIndex = rand(0, count($unanswerable)-1);
						$knowledge = $knowledges[$type][$randIndex];						
						$knowledge['src_type'] = 1;  // 语料来至哪个表0 flow_node 1 knowledge
						$knowledge['hit_type'] =  1; //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
						$knowledge['keyword'] =  $knowledgeHit['keyword'];
						$playDataList[] = $this->getPlayHitEntity($knowledge);
						\think\Log::record('repeat >=3#####repeat-kewword='.$knowledge['keyword']);	
					}
					else{
						//直接挂机
						$this->hangupProc();
					}
				}
				else{
					$knowledge = array();
					if ($flowData['currType'] == 0){
						$knowledge['id'] = $flowData['currFlowId'];
						$knowledge['src_type'] = 0; // 语料来至哪个表0 flow_node 1 knowledge
					}
					else{
						$knowledge['id'] = $flowData['currKnowledgeId'];
						$knowledge['src_type'] = 1; // 语料来至哪个表0 flow_node 1 knowledge
					}
					
					$knowledge['hit_type'] =  1; //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
					$knowledge['keyword'] =  $knowledgeHit['keyword'];
					$knowledge['action'] =  0;
					$knowledge['action_id'] =  0;
					$playDataList[] = $this->getPlayHitEntity($knowledge);
					$flowData['repeat_cnt'] = $flowData['repeat_cnt']+1;
					\think\Log::record('repeat#####repeat-kewword='.$knowledge['keyword']);	
				}
				
				//完成处理
				return $this->playAudio($flowData, $playDataList);
			}
		}
		
		//流程命中检查
		$where = array();
		$where['flow_id'] = $flowData['currFlowId'];
		$where['is_select'] = 1;
		$flowBranchs = Db::name('tel_flow_branch')->where($where)->order('type desc')->select();
		
		//有分支流程
		$flowBranchHit = array();
		if ($flowBranchs){
			$flowBranchHit = $this->flowBranchMatch($flowBranchs, $knowledges, $message, $messagePy);
		}
		
		if ($knowledgeHitMore || $flowBranchHit){
			
			//混合：知识库+流程
			if ($knowledgeHitMore && $flowBranchHit){
				
				$knowledge = $knowledgeHitMore[0];
				$knowledge['src_type'] = 1;  // 语料来至哪个表0 flow_node 1 knowledge
				$knowledge['hit_type'] =  1; //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 				
				$playDataList[] = $this->getPlayHitEntity($knowledge);
				\think\Log::record('knowledge&&flownode#####hit-knowledge-keyword ='.$knowledge['keyword']);
				
				$flowNode = Db::name("tel_flow_node")->where('id', $flowBranchHit['next_flow_id'])->find();
				$flowNode['src_type'] = 0;  // 语料来至哪个表0 flow_node 1 knowledge
				$flowNode['hit_type'] =  $flowBranchHit['type']; //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
				$flowNode['keyword'] = $flowBranchHit['keyword']; 
				$playDataList[] = $this->getPlayHitEntity($flowNode);
				\think\Log::record('knowledge&&flownode#####hit-flownode-keyword='.$flowBranchHit['keyword']);
				
				if ($flowNode['type'] == 1){ //跳转节点
					$nextFlowNode = $this->getNextFlowNode($flowNode, $flowData);
					if ($nextFlowNode){
						$nextFlowNode['src_type'] = 0;  // 语料来至哪个表0 flow_node 1 knowledge
						$playDataList[] = $this->getPlayHitEntity($nextFlowNode);
						\think\Log::record('knowledge&&flownode#####flow->next_flow='.$nextFlowNode['id']);
					}
				}	
				//完成处理
				return $this->playAudio($flowData, $playDataList);
			}
			
			//播放知识库最多2个录音
			if ($knowledgeHitMore){
				
				$knowledge = $knowledgeHitMore[0];
				$knowledge['src_type'] = 1;  // 语料来至哪个表0 flow_node 1 knowledge
				$playDataList[] = $this->getPlayHitEntity($knowledge);
				\think\Log::record('knowledge&01#####hit-knowledge-keyword ='.$knowledge['keyword']);
				if (count($knowledgeHitMore) > 1){
					$knowledge = $knowledgeHitMore[1];
					$knowledge['src_type'] = 1;  // 语料来至哪个表0 flow_node 1 knowledge
					$knowledge['hit_type'] =  1; //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
					$playDataList[] = $this->getPlayHitEntity($knowledge);
					
					\think\Log::record('knowledge&02#####hit-knowledge-keyword ='.$knowledge['keyword']);
				}
				
				//知识库跳转到主流利
				if ($knowledge['action'] > 0){
					$nextFlowNode = $this->getNextFlowNode($knowledge, $flowData);
					if ($nextFlowNode){
						$nextFlowNode['src_type'] = 0;  // 语料来至哪个表0 flow_node 1 knowledge
						$playDataList[] = $this->getPlayHitEntity($nextFlowNode);
						\think\Log::record('knowledge&#####knowledge->next_flow='.$nextFlowNode['id']);
					}
				}
				//完成处理
				return $this->playAudio($flowData, $playDataList);
			}
			
			//播放流程下一分支流利录音
			if ($flowBranchHit){
				
				$flowNode = Db::name("tel_flow_node")->where('id', $flowBranchHit['next_flow_id'])->find();
				$flowNode['src_type'] = 0;  // 语料来至哪个表0 flow_node 1 knowledge
				$flowNode['hit_type'] = $flowBranchHit['type'];  //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
				$flowNode['keyword'] = $flowBranchHit['keyword']; 
				$playDataList[] = $this->getPlayHitEntity($flowNode);
				\think\Log::record('flownode#####hit-flownode-keyword='.$flowBranchHit['keyword'].'###flow-id='.$flowNode['id']);	
				if ($flowNode['type'] == 1){ //跳转节点
					$nextFlowNode = $this->getNextFlowNode($flowNode, $flowData);
					if ($nextFlowNode){
						$nextFlowNode['src_type'] = 0;  // 语料来至哪个表0 flow_node 1 knowledge
						$playDataList[] = $this->getPlayHitEntity($nextFlowNode);
						\think\Log::record('flownode#####flow->next_flow='.$nextFlowNode['id']);
					}
				}
				
				//完成处理
				return $this->playAudio($flowData, $playDataList);
			}
		}
		else{
			//未匹配到任何
			//超出回答不上来次数
			if ($flowData['unanswerable_cnt'] >=3){
				$type = 10; //超出无法回答次数
				$flowData['unanswerable_cnt'] = 0;  //复位非连续回答不上来次数
			}
			else{
				$type = 9;  //无法回答
				$flowData['unanswerable_cnt'] = $flowData['unanswerable_cnt']+1;
			}
			
			if (!isset($knowledges[$type]) || !isset($knowledges[$type][0])){
				\think\Log::record('回答不上来话术不完整');	
				$this->hangupProc();
			}
			
			$this->noAnswer = $flowData['no_answer'];
			$knowledge = $knowledges[$type][0];
			$knowledge['src_type'] = 1;  // 语料来至哪个表0 flow_node 1 knowledge			
			$playDataList[] = $this->getPlayHitEntity($knowledge);
			$flowData['no_answer'] = $this->noAnswer;
			
			\think\Log::record('unanswerable#####unanswerable-keyword='.$message);	
			
			
			//知识库跳转到主流利
			if ($knowledge['action'] > 0){
				$nextFlowNode = $this->getNextFlowNode($knowledge, $flowData);
				if ($nextFlowNode){
					$nextFlowNode['src_type'] = 0;  // 语料来至哪个表0 flow_node 1 knowledge
					$playDataList[] = $this->getPlayHitEntity($nextFlowNode);
					\think\Log::record('unanswerable#####unanswerable-next-flow='.$nextFlowNode['id']);	
				}
			}
			
			//问题学习
			$getMemberUid = Db::name('member')->field('uid')->where(array('task'=>$this->gTaskId,'mobile'=>$this->callerId))->find();
			$data['scenarios_id'] = $this->scenariosId;
			$data['phone'] = $this->callerId;
			$data['call_id'] = $this->gCallId;
			$data['content'] = $message;//substr(rtrim($message,';'),2);
			$data['status'] = 0;
			$data['member_id'] = $getMemberUid['uid'];
			$data['owner'] = $this->memberId;
			$data['create_time'] = time();
			
			       
			Db::name('tel_learning')->insert($data);	
			
			
			//完成处理
			return $this->playAudio($flowData, $playDataList);
		}
	}
	
	private function getHitKnowledge($hitList, $type){
		$hit = array();
		foreach($hitList as $item){
			
			if ($item['type'] == $type){
				$hit = $item;
				break;
			}
		}
		return $hit;
	}
	
	private function getPlayHitEntity($data){
			$playData = array();
			$playData['hit_type'] = 0;
			$playData['src_id'] = $data['id'];
			$playData['src_type'] = $data['src_type'];  // 语料来至哪个表0 flow_node 1 knowledge
			$playData['keyword'] = "";
			$playData['intention'] = 0;
			$playData['flow_label'] = "";
			$playData['knowledge_label'] = "";
			$playData['scen_node_id'] = 0;
			$playData['node_type'] = 0;  //0 普通节点 1 跳转节点
			$playData['break'] = 1;  //当前话术是否打断 默认不允许
			
			if (isset($data['hit_type'])){
				$playData['hit_type'] = $data['hit_type'];  //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
			}
			
			if (isset($data['keyword'])){
				$playData['keyword'] = $data['keyword'];  //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
			}
			
			if (isset($data['intention'])){
				$playData['intention'] = $data['intention']; 
			}
			
			if (isset($data['flow_label'])){
				$playData['flow_label'] = $data['flow_label'];  
			}
			
			if (isset($data['label']) && $data['label']){
				$playData['knowledge_label'] = $data['label'];  
			}
			if (isset($data['scen_node_id'])){
				$playData['scen_node_id'] = $data['scen_node_id'];  
			}
			
			$wait = 3000;  //单位毫秒，放音结束后等待时间。用于等待用户说话。		
			if (isset($data['pause_time']) && $data['pause_time'] > 0){
				$wait = (int)$data['pause_time'];
			}
			$playData['wait'] = $wait;
			
			//允许打断
			if (isset($data['break']) && $data['break'] == 0 &&  isset($data['type']) && $data['type'] == 0){
				$playData['break'] = 0;  //
			}
			
			
			$playData['action'] = $data['action'];
			$playData['action_id'] = $data['action_id'];
			
			//回答不上来多条话术按顺序播放
			if (isset($data['type']) && $data['type'] == 9){
				
				$corpus = $this->getCorpus($playData['src_id'], $playData['src_type'], 1);
				
				
				if ($this->noAnswer >= count($corpus)){
					$this->noAnswer = 0;
				}
				
				$audio = $corpus[$this->noAnswer]['audio'];	
				if ($audio){
					$playData['prompt'] = $this->rootDir.$audio;
					$playData['content'] = $corpus[$this->noAnswer]['content'];
				}
				else{
					$playData['prompt'] = $corpus[$this->noAnswer]['content'];
					$playData['content'] = $corpus[$this->noAnswer]['content'];
				}
				$this->noAnswer = $this->noAnswer+1;
				
				
			}
			else{
			
				$corpus = $this->getCorpus($playData['src_id'], $playData['src_type']);
				if ($corpus){
					$playData['prompt'] = $corpus['prompt'];
					$playData['content'] = $corpus['content'];
				}
			}
			
			return $playData;
	}
	
	private function playAudio($flowData, $playDataList){
		$wait = 5000;
		$prompt = array();
		
		
		//保存话单
		$callTimes = $this->saveBills($playDataList);
		$flowData['call_times'] = $flowData['call_times']+$callTimes;  //用户说话次数
		//根据最后一个播放后的动判断是否需要
		$lastPlayAction = $playDataList[count($playDataList)-1];
		if ($lastPlayAction['action'] == 4){
			$flowData['hangup'] = 1; 
		}
		
		if ($lastPlayAction['src_type'] == 0){
			$flowData['currFlowId'] = $lastPlayAction['src_id'];           //当前流程id
			$flowData['currType'] = 0;   //0 流程话术  1知识库
		}
		else{
			$flowData['currKnowledgeId'] = $lastPlayAction['src_id'];           //当前流程id
			$flowData['currType'] = 1;   //0 流程话术  1知识库
		}
		
		if (isset($lastPlayAction['wait'])  && $lastPlayAction['wait'] > 0){
			$wait = (int)$lastPlayAction['wait'];
		}
		
		//每句话术是否打断
		if ($lastPlayAction['break'] == 0){ 
			$block_asr = 0;    //0 由话术场景打断决定，本次不做处理。
		}
		else{
			$block_asr = -1;  //放音时停止识别，不打断
		}
		
		//当前场景节点id
		if (isset($lastPlayAction['scen_node_id']) && $lastPlayAction['scen_node_id']){
			//判断是普通场景节点还是公共场景节点
			$currScenariosNode = Db::name('tel_scenarios_node')->where('id', $lastPlayAction['scen_node_id'])->find();
			if ($currScenariosNode['type'] == 0){
				$flowData['currScenariosNodeId'] = $lastPlayAction['scen_node_id']; 
			}			
		}
		
		foreach($playDataList as $k=>$item){
			//流程，检查是否有命中流程标签
			if ($item['src_type'] == 0){
				//流程标签
				if ($item['flow_label']){
					if (!in_array($item['flow_label'], $flowData['flow_label'])){
						array_push($flowData['flow_label'], $item['flow_label']);
					}
				}
			}
			
			if ($item['src_type'] == 1){
				//问答标签
				if ($item['knowledge_label']){
					if (!in_array($item['knowledge_label'], $flowData['knowledge_label'])){
						array_push($flowData['knowledge_label'], $item['knowledge_label']);
					}
				}
			}
			
			
			switch($item['hit_type']){  //命中类型，用于统计以下类型命中数： 1问答 2肯定3 否定 4中性 5 未识别  6拒绝 
				case 1:
					$flowData['hit_times'] = $flowData['hit_times'] +1; //命中问题数
					//命中知识库是否设为意向等级
					if ($item['intention'] > 0){
						$flowData['intention'] = $item['intention'];
					}
					break;
				case 2:
					$flowData['affirm_times'] = $flowData['affirm_times'] +1;  //肯定次数
					break;
				case 3:
					$flowData['negative_times'] = $flowData['negative_times'] +1; //否定次数
					break;
				case 4:
					$flowData['neutral_times'] = $flowData['neutral_times'] +1; //中性次数
					break;
				case 6:
					$flowData['reject_times'] = $flowData['reject_times'] +1;  //拒绝次数
					break;
				default :
					$callStatus = 3;
			}
			
			if (isset($item['prompt']) && $item['prompt'] ){
				array_push($prompt, $item['prompt']);
			}
			$content = array();
			if (isset($item['content']) && $item['content']){
				array_push($content, $item['content']);
			}
		}
		
		//最后是否拒绝
		if ($lastPlayAction['action'] == 4 && $lastPlayAction['hit_type'] == 4){
			$flowData['final_refusal'] = true;
		}
		
		//最后是否预约成功
		if ($lastPlayAction['action'] == 4 && ($lastPlayAction['hit_type'] == 2 || $lastPlayAction['hit_type'] == 4)){
			$flowData['invite_succ'] = true;
		}
		
		
		$playData = array(
			"action"=> "playback",
			"flowdata"=> json_encode($flowData),
			"params"=>array(
				"prompt"=>$prompt,
				"wait"=>$wait,
				"retry"=>0,
				"block_asr"=>$block_asr
			)
		);
		
		//播放完挂机
		if ($lastPlayAction['action'] == 4){
			$playData["after_action"] = "hangup";
			$playData["after_ignore_error"] = true;
			$playData["after_params"] = array("cause"=>0,"usermsg"=>"");
		}
		$this->returnJson($playData, $content);
		
	}

	//放音结果
	private function playBackResult($calleeId, $callerId, $callId){
		$asrstate = input('post.asrstate','','trim,strip_tags');
		$flowData = input('post.flowdata','','trim,strip_tags');
		$flowData = json_decode($flowData, true);
		
		$wait = 5000;  //单位毫秒，放音结束后等待时间。用于等待用户说话。
		$retry = 0;   //重播次数。就是wait时间内用户不说话，就重新播放声音。
		
		if ($flowData['hangup'] == 1){
			//直接挂机
			$this->hangupProc();
		}
		
		if ($asrstate){//用户还在说话，不做任何处理
			$this->noop(json_encode($flowData));
		}
		else{
			
			$prompt = "";
			$content = array();
			
			//获取用户未说话
			$where = array();
			$where['scenarios_id'] = $this->scenariosId;
			$where['type'] = 8;//用户未说话
			$knowledgeList = Db::name('tel_knowledge')->where($where)->select();
			if (!$knowledgeList){
				\think\Log::record('用户未说话话术未配置');	
				$this->hangupProc();
			}
			
			$knowledges = $knowledgeList[0];
			if (count($knowledgeList) > 1){
				//自定义用户未说话话术
				$flowNode = Db::name("tel_flow_node")->where('id', $flowData['currFlowId'])->find();
				if ($flowNode['no_speak_knowledge_id']){
					foreach($knowledgeList as $item){
						if ($item['id'] == $flowNode['no_speak_knowledge_id']){
							$knowledges = $item;
							break;
						}
					}
				}
			}
			
			
			$hangup = 0;
			if ($knowledges){
				$corpus = $this->getCorpus($knowledges['id'], 1, 1);	
				if ($corpus && $flowData['no_speek'] < count($corpus)){
					$prompt = $corpus[$flowData['no_speek']]['audio'];	
					if ($prompt){
						$prompt	= $this->rootDir.$prompt;
					}
					else{
						$prompt	= $corpus[$flowData['no_speek']]['content'];
					}
					array_push($content,  $corpus[$flowData['no_speek']]['content']);
					
					$flowData['no_speek'] = $flowData['no_speek'] + 1;
					//用户连续未说话非最后一次，只播放录音等待用户响应，
					if ($flowData['no_speek'] < count($corpus)){
						$hangup = 0;
					}
					else{
						$hangup = 1;
					}				
				}
				else {
					//直接挂机
					$this->hangupProc();
				}
			}
			else{
				//直接挂机
				$this->hangupProc();
			}
			
		
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
			if ($hangup){
				
				$result["after_action"] = "hangup";
				$result["after_ignore_error"] = true;
				$result["after_params"] = array("cause"=>0,"usermsg"=>"");
			}
			$this->returnJson($result, $content);
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
	
	
     //比如用户回答，好的，你是哪里啊。其中好的是肯定回答，你是哪里啊是疑问关键词。这个时候可以匹配到2个回答内容。 
	 //可以把2个回答内容组合，疑问关键词冠词回答内容先播放，然后进入肯定回答流程，播放相关流程内容。
	private function flowBranchMatch($flowBranchs, $knowledges,$message, $messagePy){
		$hit = array();
		$defaultHit = array();
		
		$sortRule = array(4,3,5,2,0,6); //匹配顺序
		$flowBranchSort = array();
		foreach($sortRule as $rule){
			foreach($flowBranchs as $item){
				if ($item['type'] == $rule){
					$flowBranchSort[] = $item;
				}
			}
		}
		
		foreach($flowBranchSort as $item){
			$keyword = $item['keyword'];
			$keywordPy = $item['keyword_py'];
			//未识别的流程
			if ($item['type'] == 6){
				$defaultHit = $item;
				continue;
			}
			
			//大于1是默认的分支，需要将全局的关键字合并一起
			if ($item['type'] > 1){
				$type = $item['type'];
				
				$defaultKeyword = $knowledges[$type][0];
				if ($keyword){
					$keyword = $keyword.','.$defaultKeyword['keyword'];
				}
				else{
					$keyword = $defaultKeyword['keyword'];
				}
				
				$keyword = trim( $keyword,',' );
				
				$defaultKeyword = $knowledges[$type][0];
				if ($keywordPy){
					$keywordPy = $keywordPy.','.$defaultKeyword['keyword_py'];;
				}
				else{
					$keywordPy = $defaultKeyword['keyword_py'];
				}
				$keywordPy = trim($keywordPy,',');
			}
			
			
			$keywordArr = explode(",",$keyword);
			$keywordPyArr = explode(",",$keywordPy);
			\think\Log::record('####flowBranchMatch###keywordArr='.count($keywordArr));
			foreach ($keywordArr as $k=>$subItem) {
				if (!$subItem){
					continue;
				}
				
				$subItem = trim($subItem);
				if (strstr($message,$subItem)){
					$hit = $item;
					$hit['keyword'] = $subItem;
					\think\Log::record('####flowBranchMatch####hit keyword_py='.$hit['keyword'].'##type:'.$hit['name']);
					break;
				}
				
				if (isset($keywordPyArr) && isset($keywordPyArr[$k]) && $keywordPyArr[$k]){
					if (strstr($messagePy,$keywordPyArr[$k])){
						$nextPos = substr($messagePy,stripos($messagePy,$keywordPyArr[$k])+strlen($keywordPyArr[$k]),1);
						//拼音匹配
						if ($nextPos && stripos('abcdefghijklmnopqrstuvwxyz',$nextPos)){
							
							continue;
						}
								
						$hit = $item;
						$hit['keyword'] = $subItem;
						\think\Log::record('####flowBranchMatch####hit keyword_py='.$hit['keyword'].'##type:'.$hit['name']);
						break;
					}
				}
			}
			if ($hit){
				break;
			}
		}
		//未识别分支流程
		if (!$hit && $defaultHit){
			$hit = $defaultHit;
		}		
		
		return $hit;
	}
	
	//知识库匹配
	private function knowledgeMatch($knowledges, $message, $messagePy, $knowledgeType){
		$hits = array();
		if (!is_array($knowledgeType)){
			$typeArr = array($knowledgeType);
		}
		else{
			$typeArr = $knowledgeType;
		}
		
		foreach($typeArr as $type){
			if (isset($knowledges[$type])){
				$knowledge = $knowledges[$type];
				foreach($knowledge as $item){
					$keywordArr = explode(",",$item["keyword"]);
					$keywordPyArr = explode(",",$item["keyword_py"]);
					$hit = array();
					foreach ($keywordArr as $k=>$subItem) {
						if (!$subItem){
							continue;
						}
						if(strstr($message,$subItem)){
							$hit = $item;
							$hit['keyword'] = $subItem;
							\think\Log::record('####knowledgeMatch####hit keyword='.$hit['keyword']);
							break;
						}
						if(isset($keywordPyArr) && isset($keywordPyArr[$k]) && $keywordPyArr[$k]){
							if ($messagePy && strstr($messagePy,$keywordPyArr[$k])){
							
								$nextPos = substr($messagePy,stripos($messagePy,$keywordPyArr[$k])+strlen($keywordPyArr[$k]),1);
								//拼音匹配
								if ($nextPos && stripos('abcdefghijklmnopqrstuvwxyz',$nextPos)){
									// echo stripos($messagePy,$keywordPyArr[$k]);
									// echo "<br/>";
									// echo '##'.substr($messagePy,stripos($messagePy,$keywordPyArr[$k])+strlen($keywordPyArr[$k]),1);
									// echo "<br/>";
									// echo $keywordPyArr[$k];
									continue;
								}
								
								$hit = $item;
								$hit['keyword'] = $subItem;
								\think\Log::record('####knowledgeMatch####hit keyword_py='.$hit['keyword']);
								break;
							}
						}
					}
					if ($hit){
						$hits[] = $hit;
					}
				}
			}
		}
		
		return $hits;
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
		  $result[$value['type']][] = $value;
		}
		return $result;
	}
	
	
	private function returnJson($msg, $prompt = array(), $debug = true){
		//记录机器人话术
		if (is_array($prompt) && count($prompt) > 0){
			$bills = array();
			foreach($prompt as $item){
				$bill = array('phone'=>$this->callerId, 'message'=>$item, 'path'=>'', 'role'=>0,'status'=>0,'create_time'=>time(),'call_id'=>$this->gCallId);
				array_push($bills, $bill);
			}
			Db::name('tel_bills')->insertAll($bills);	
		}
		
		if (isset($msg['flowdata']) && $msg['flowdata']){
			//会话数据保存到缓存中
			$this->setFlowData($msg['flowdata'], $this->gCallId);
		}
		
		if ($debug){
			\think\Log::record('#####response msg ='.json_encode($msg));
		}
		
		echo(json_encode($msg));
		exit;
	}
	
	
	/**
	 * 按机器人日租扣费接口
	 * 
	*/
	public function robot_aily_rent_deductions()
	{
		
	}
	
	/**
	 * 获取用户列表
	*/
	// protected function get_users()
	// {
		
	// }
	
	/**
	 * 按通话时长和匹配次数扣费
	 * 
	 * @param int $current_member_id 当前用户ID
	 * @param int $duration 通话时长(毫秒)
	 * @param int $line_id 线路ID
	 * @param int $mobile 被呼叫的号码
	 * @param int	$call_id 
	 * @param int $task_id
	 * 
	 * @return bool
	*/
	protected function duration_deductions($current_member_id, $duration, $line_id, $mobile, $call_id, $asr_price, $asr_cnt, $task_id)
	{
		if(empty($line_id) || empty($current_member_id) || empty($mobile) || empty($call_id)){
			Log::info('参数错误');
			return false;
		}
		//获取线路数据
		$line_data = $this->get_member_line($line_id);
		//获取用户名
		$username = $this->get_member_name($current_member_id);
		if(empty($line_data) === false && is_array($line_data) === true && !empty($line_data['member_id'])){
			//向上级用户追溯 如果等于0说明当前线路属于但前用户的 
			$role_name = $this->get_admin_role($line_data['member_id']);
			$duration = round($duration/1000);
			Log::info($role_name);
			$AdminData = new AdminData();
			//使用上级用户的线路  扣除通话时长和识别次数的费用
			while($line_data['pid'] != 0 && $role_name != '管理员'){
				// Log::info('进来了');
				//根据线路的销售价格 计算时长消费金额
				$duration_money = $line_data['sales_price'] * ceil($duration/60);
				//获取当前用户的语音识别单价
				$asr_price = $AdminData->get_asr_price($line_data['member_id']);
				Log::info('语音识别费用');
				Log::info($asr_price);
				Log::info(json_encode($line_data));
				//计算识别次数的消费金额
				$asr_money = $asr_price * $asr_cnt;
				//计算总消费
				$money = $duration_money + $asr_money;
				//写入数据
				$cdata = [
					'owner'	=>	$line_data['member_id'],
					'member_id'	=>	$current_member_id,
					'call_id'	=>	$call_id,
					'mobile'	=>	$mobile,
					'money'		=>	$money,
					'duration'	=>	$duration,
					'create_time'	=>	time(),
					'asr_price'	=>	$asr_price,
					'asr_cnt'	=>	$asr_cnt,
					'time_price'	=>	$line_data['sales_price'],
					'note'	=>	'机器人' . $username . '通话,消费' . $money . '元',
					'call_phone_id'	=> $line_data['id']
				];
				$result = Db::name('tel_order')->insert($cdata);
				if(empty($result)){
					Log::info('写入数据失败');
				}else{
					Log::info('写入数据成功');
				}
				//扣除费用
				$deduction_result = $this->deduction_money($line_data['member_id'], $money);
				//获取线路数据
				$line_data = $this->get_member_line($line_data['pid']);
				if($deduction_result === false){
					Log::info('扣除费用失败');
				}
			}
			//使用自己的线路  只扣除识别次数
			if($line_data['pid'] == 0 && $role_name != '管理员'){
				//获取当前用户的语音识别单价
				$asr_price = $AdminData->get_asr_price($line_data['member_id']);
				//根据线路的销售价格 计算时长消费金额
				$duration_money = 0;
				//计算识别次数的消费金额
				$asr_money = $asr_price * $asr_cnt; 
				Log::info('语音识别费用');
				Log::info($asr_money);
				Log::info(json_encode($line_data));
				//计算总消费
				$money = $duration_money + $asr_money;
				//写入数据
				$cdata = [
					'owner'	=>	$line_data['member_id'],
					'member_id'	=>	$current_member_id,
					'call_id'	=>	$call_id,
					'mobile'	=>	$mobile,
					'money'		=>	$money,
					'duration'	=>	$duration,
					'create_time'	=>	time(),
					'asr_price'	=>	$asr_price,
					'asr_cnt'	=>	$asr_cnt,
					'time_price'	=>	0,
					'note'	=>	'机器人' . $username . '通话,消费' . $money . '元',
					'call_phone_id'	=> $line_data['id']
				];
				$result = Db::name('tel_order')->insert($cdata);
				//扣除费用
				$deduction_result = $this->deduction_money($line_data['member_id'], $money);
				if($deduction_result === false){
					Log::info('扣除费用失败');
				}
				if(empty($result)){
					Log::info('写入数据失败');
				}else{
					Log::info('写入数据成功');
				}
			}
		}else{
			Log::info('计费失败');
		}
		return true;
	}
	
	/**
	 * 扣除费用
	 * 
	 * @param int $member_id 用户ID
	 * @param int $money 扣除的金额
	 * @return bool
	*/
	protected function deduction_money($member_id, $money)
	{
		if(empty($money) || empty($member_id)){
			return false;
		}
		$ret = Db::name('admin')
						->where('id', $member_id)
						->setDec('money',$money);
		Log::info('用户：' . $member_id . ' 消费：' . $money);
		Log::info('扣除费用结果:' . $ret);
		if(!empty($ret)){
			return true;
		}
		return false;
	}
	
	/**
	 * 获取线路信息
	 * 
	 * @param int $line_id
	 * @return array
	*/
	protected function get_member_line($line_id)
	{
		if(empty($line_id)){
			return false;
		}
		$data = Db::name('tel_line')
						->field('id, member_id, pid, sales_price')
						->where([
							'id'	=>	$line_id
						])
						->find();
		return $data;
	}
	/**
	 * 验证用户是否属于管理员
	 * 
	 * @param int $member_id 
	 * @return bool|string
	*/
	protected function get_admin_role($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$role_name = Db::name('admin')
									->alias('a')
									->join('admin_role', 'a.role_id = admin_role.id', 'LEFT')
									->where('a.id', $member_id)
									->value('admin_role.name');
		return $role_name;
	}
	
	/**
	* 获取用户名 
	* 
	* @param int $member_id
	* @return string
	*/
	protected function get_member_name($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$member_name = Db::name('admin')
										->where('id', $member_id)
										->value('username');
		return $member_name;
	}
	
	/**
	 * 统计每日消费
	 * 
	 * 
	*/
	public function statistics_consumption()
	{
		$ConsumptionStatistics = new ConsumptionStatistics();
		$users = Db::name('admin')
							->field('id')
							->select();
		foreach($users as $key=>$value){
			//计算消费金额
			$money = $ConsumptionStatistics->get_yesterday_cost($value['id']);
			//计算语音识别次数
			$distinguish_count = $ConsumptionStatistics->get_yesterday_distinguish_count($value['id']);
			//计算呼叫次数
			$call_count =  $ConsumptionStatistics->get_yesterday_call_count($value['id']);
			//计算接通次数
			$connect_count = $ConsumptionStatistics->get_yesterday_connect_count($value['id']);
			//计算计费时长(分钟)
			$charging_duration = $ConsumptionStatistics->get_yesterday_charging_duration($value['id']);
			//计算通话时长
			$connect_duration = $ConsumptionStatistics->get_yesterday_connect_duration($value['id']);
			//写入
			$result = $ConsumptionStatistics->insert($value['id'], $call_count, $charging_duration, $connect_count, $connect_duration, $money, $distinguish_count);
			if($result === false){
				Log::info('用户ID为'. $value['id'] . ',统计数据失败');
			}
		}
		echo 'OK';
	}
	
	
	
	
}
