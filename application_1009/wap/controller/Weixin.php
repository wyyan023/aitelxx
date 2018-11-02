<?php
namespace app\wap\controller;
use app\common\controller\Base;
use think\Db;
class Weixin extends Base{
	protected  $clientIp = "";
	protected  $token = "";
	protected  $action = "";
	protected  $memberId;
	protected  $openId = "";
	protected  $fans = "";
	protected  $wxInfo = "";
	protected  $wechat;
	protected  $domain = "";
	protected  $memberInfo = "";

	//借权开关，0关闭 1开启
	protected	$leasehold = 0;		
	public function _initialize(){
		parent::_initialize();
		
		$request = request();
		
		$this->action = $request->action();
		$this->clientIp =  $request->ip();
		$this->domain = $request->domain();
		$this->token =  input('token','','trim,strip_tags');
		\think\Log::record('token:'.$this->token);
		//获取公众号信息
		$this->wxInfo = Db::name('wx_user')->where(array('token'=>$this->token))->find();
	
		if (!$this->wxInfo){			
			\think\Log::record('wx info is null!');
			exit;
		}
		
	}
	
	public function _empty(){
		echo 'blank';
		exit;
	}
	
	//获取用户信息
	public function api(){		
		\think\Log::record('wxInfo:'.json_encode($this->wxInfo));
		$wechat = & load_wechat('Receive', $this->wxInfo);
		if ($wechat->valid() === FALSE) {
		    // 接口验证错误，记录错误日志
		     // 退出程序		    
		     \think\Log::record($wechat->errMsg);
		      exit($wechat->errMsg);
		}
		
		$this->wechat = $wechat;
		
		/* 获取粉丝的openid */
		$this->openId = $wechat->getRev()->getRevFrom();
		
		\think\Log::record("openid:".$this->openId);
		

		$revMsgType = $wechat->getRev()->getRevType();
		\think\Log::record("revMsgType:".$revMsgType);
		switch ($revMsgType) {
		    // 文本类型处理
		     case $wechat::MSGTYPE_TEXT: 
		          $keys = $wechat->getRevContent();
		          return $this->_keys($keys);
		     // 事件类型处理
		     case $wechat::MSGTYPE_EVENT:
		           $event = $wechat->getRevEvent();
		           $keys = $wechat->getRevContent();
		          return $this->_event(strtolower($event['event']),$keys);
		     // 图片类型处理
		     case $wechat::MSGTYPE_IMAGE:
		          return $this->_image();
		     // 发送位置类的处理
		     case $wechat::MSGTYPE_LOCATION:
		          return $this->_location();
		     // 其它类型的处理，比如卡卷领取、卡卷转赠
		     default:
		          \think\Log::record($revMsgType);
		 }
	}
	
	private function _keys($key){
		  //获取关键词对应的模块id
		  $moduleList = Db::name('wx_keyword')->field('type, module_id,content')
		  ->where(array('key'=>$key))
		  ->order('sort DESC')
		  ->select();
		  \think\Log::record('fans:'.json_encode($moduleList));
	    if ($moduleList){
	    	$content = array();
	    	foreach($moduleList as $k=>$item){
	    		
	    		switch ($item['type']){
	    			case 'vote':	    				
	    					$voteInfo = Db::name('vote')->field('id, cover,title,desc')->where(array('id'=>$item['module_id']))->find();
	    					$cover = get_image($voteInfo['cover']);
	    				
	    					$url = $this->domain.'/wap/vote/index/token/'.$this->token.'/id/'.$voteInfo['id'].'/openId/'.$this->openId;
	    					$content[] = array($voteInfo['title'],$voteInfo['desc'],$cover,$url);
	    					break;
	    			case 'vote_item': //单条返回
	    					$voteItemReplyContent = $this->ticket($item['module_id']);	
	    					break;    					
	    			case 'content':
			    				$Info = Db::name('content')->field('id, cover_id,title,description')->where(array('id'=>$item['module_id']))->find();
			    				$cover = get_image($Info['cover_id']);
			    				
			    				$url = $this->domain.'/wap/content/index/token/'.$this->token.'/contentId/'.$Info['id'].'/openId/'.$this->openId;
			    				$content[] = array($Info['title'],$Info['description'],$cover,$url);
	    					break;
	    			case 'custom':
	    			      if ($key == '二维码'){
	    			      	Db::name('fans')->where('open_id',$this->openId)->update(array('status'=>2));
	    			      	//$this->uploadLoginQr();
	    			      }
	    			      
	    			      if ($key == '进度'){
	    			      	$tempFans =  Db::name('fans')->field('total_num, checked_num, zombie_num,status')->where(array('open_id'=>$this->openId))->find();
	    			     		$contentStr = '您的好友共'.$tempFans['total_num'].'个，已经检测'.$tempFans['checked_num'].'个，发现僵尸好友'.$tempFans['zombie_num'].'个';
	    			      	return $this->wechat->text($contentStr)->reply();
	    			      }
	    			      else{
	    			      	return $this->wechat->text($item['content'])->reply();
	    			      }
			    				
	    					break;
	    		}	    		
	    	}	
	    	
	    	return $this->wechat->news($content)->reply();   	
	    }
	    else{  //匹配不到关键词，获取回答不上来配置
	    	$this->notAnswer();	    	
	    }
	    
	   
	}
	
	 /**
	   * 获取需要检测的微信用户
	   * @param string 检查服务器编号
	   * @return json
	   */
	public function getWechatCheckTask(){
			
	}
	
	//fans status 1正常 2 正在申请二维码 3开始检查 4检查中断 5检查完成
	public function uploadLoginQr(){
		
		//下载图片
		
		//上传素材
		$mediaObj = & load_wechat('Media', $this->wxInfo);
		$data = array("media"=>'@'.'uploads/picture/20170702/open_id.jpg');
		\think\Log::record('uploadQrImgdata:'.json_encode($data));
		$mediaRet = $mediaObj->uploadImg($data);
		\think\Log::record('uploadQrImg:'.json_encode($mediaRet));
		
		//发送客服消息
		$sendMsgObj = & load_wechat('Receive', $this->wxInfo);
		$data["touser"] = $this->openId;
    $data["msgtype"] ="image";
    $data["image"] = array(
     "media_id"=>$mediaRet['media_id']
    );   
		$ret = $sendMsgObj->sendCustomMessage($data);
		\think\Log::record('sendCustomMessage1:'.json_encode($ret));
		
		//发送客服消息
		$data["touser"] = $this->openId;
    $data["msgtype"] ="text";
    $data["text"] = array(
     "content"=>'请扫描二维码登陆检测僵尸粉'
    );
		$ret = $sendMsgObj->sendCustomMessage($data);
		\think\Log::record('sendCustomMessage2:'.json_encode($ret));
		
		//更新状态为3 开发始检查
		Db::name('fans')->where('open_id',$this->openId)->update(array('status'=>3));
		
		//返回消息给检测端开始检测
	}
	
	public function updateCheckProcess(){
		
	}
	
	public function addDevice(){
		
	}
	
	public function heartbeat(){
		
	}
	
	
	private function notAnswer(){
		$notAnswerContent =  Db::name('wx_reply')->field('content')->where(array('type'=>1))->find();
		if (!$notAnswerContent){
			$notAnswerContent['content'] = "亲,没有找到你要的答案！";
		}
		return $this->wechat->text($notAnswerContent['content'])->reply();
	}
	
	private function addMember(){
		$mallConfig = Db::name('mall_config')->find();
		$data = array();
		$data['nickname'] = $this->fans['nickname'];		
		$data['status'] = 1;
		$data['logo'] = $this->fans['head_pic'];
		$data['open_id'] = $this->fans['open_id'];
		
		$data['sex'] = $this->fans['sex'];
		$data['pos_province'] = $this->fans['province'];
		$data['pos_city'] = $this->fans['city'];
		$data['open_id'] = $this->fans['open_id'];
		//成为分销商条件，0不限制 1购买成功
		if ($mallConfig['distribution_cond'] == 0){
			$data['distributor'] = 1;
			$data['distributor_time'] = date('Y-m-d H:i:s',time());
		}
		
		$data['puid'] = 1;	
		$data['reg_ip'] = $this->clientIp;
		$data['reg_time'] = time();
		
		$this->memberId = Db::name('member')->insertGetId($data);
		if ($this->memberId ){
				$inviteCode = $this->memberId.rand_string(4);
				$ret = Db::name('member')->where('uid',  $this->memberId)->update(array('invite_code'=>$inviteCode));
		}
			

		$data['uid'] = $this->memberId;
		return $data;
	}
	
	private function addDistributorRelation($memberId,$puid, $mallConfig){
  	$data  = array();			
		$data['sub_member_id'] = $memberId;			
		$data['nickname'] = $this->fans['nickname'];			
		$data['create_time'] = date('Y-m-d H:i:s',time());
		
		$pMember = Db::name('member')->where('uid', $puid)
					->field('uid,status,puid,nickname,open_id')
					->find();
					
		//添加分销商等级
		$level = $mallConfig['distribution']?$mallConfig['distribution']:0;
		for($i=1;$i <= $level;$i++){
			if ($pMember && $pMember['status']){
				$data['member_id'] = $pMember['uid'];
				$data['level'] = $i;
				$ret = Db::name('mall_distributor')->insertGetId($data);
				if ($ret <= 0){
					\think\Log::record('memberBinding insert mall_distributor failure,data='.json_encode($data));
					break;
				}
	
				//查找上一级级分销商
				if ($pMember['puid']){
					$pMember = Db::name('member')->where('uid', $pMember['puid'])
					->field('uid,status,puid,nickname,open_id')
					->find();
				}
				else{
					//已经没有上级
					break;
				}
				
			}
			else{
				//如果上级会员被禁用，继续找上上级
				if ($pMember['puid']){
					$pMember = Db::name('member')->where('uid', $pMember['puid'])
					->field('uid,status,puid,nickname,open_id')
					->find();
				}
			}
		}
  }
  
	private function subscribeReply(){
		// 实例微信粉丝接口
		$user = & load_wechat('User', $this->wxInfo);
		
		// 读取微信粉丝列表
		$getFansInfo = $user->getUserInfo($this->openId);
		\think\Log::record('fans:'.json_encode($getFansInfo));
		// 处理创建结果
		if($getFansInfo===FALSE){
			// 接口失败的处理
		   \think\Log::record($user->errMsg);
			exit($user->errMsg);
		}
			
		$fansInfo = Db::name('fans')->where(array('open_id'=>$this->openId,'is_focus'=>1))->find();		
		if (!$fansInfo){			
			
			
			$this->saveFans($getFansInfo);
			
			
			$fansInfo = Db::name('fans')->where(array('open_id'=>$this->openId))->find();	
		}
		
		if (isset($getFansInfo['qr_scene'])){
				
			$ret = Db::name('admin')->where('id', $getFansInfo['qr_scene'])->update(array('open_id'=>$getFansInfo['openid']));
		}
			
		$this->fans = $fansInfo;
	
		
		$subscribeReply =  Db::name('wx_reply')->field('content')->where(array('type'=>0))->find();
		if (!$subscribeReply['content']){
			// $ret = $this->_keys('关注应答');
			// if (!$ret){
				$this->wechat->text("欢迎关注公众号！")->reply();
			// }			
		}
		else{
			 $this->wechat->text($subscribeReply['content'])->reply();
		}		
	}
	
	private function _event($event,	$keys) {
		\think\Log::record('_event:'.$event);
	    switch ($event) {
	        // 粉丝关注事件
	        case 'subscribe':
	        			//扫码关注渠道统计
	        			//$this->qrSubscribe();
	        			
	        			//检查是否有自动投票,如果有直接返回消息
	        			//$this->checkAutoVote();
	        			
	        			//关注应答
	        			$this->subscribeReply();
	              break;
	        // 粉丝取消关注
	        case 'unsubscribe':
	        		//更新fans表，取消关注
					$fansInfo = Db::name('fans')->where(array('open_id'=>$this->openId,'is_focus'=>1))->find();		
					if ($fansInfo){
						Db::name('fans')->where('id',$fansInfo['id'])->update(array('is_focus'=> 0));
					}
					
	           	//扣除投票数
	           	//$this->cancelVote();
	           	
	           	//扫码关注数
	           	//$this->qrUnsubscribe();
	           	
	           	
				    break;
	        // 点击微信菜单的链接
	        case 'click': 
	        
		          return $this->_keys($keys);
	            //return $this->wechat->text('你点了菜单链接！')->reply();
	        // 微信扫码推事件
			  break;
	        case 'scancode_push':
			  break;
	        case 'scancode_waitmsg':
	                //$scanInfo = $this->wechat->getRev()->getRevScanInfo();
	               // return $this->wechat->text("你扫码的内容是:{$scanInfo['ScanResult']}")->reply();
	        // 扫码关注公众号事件（一般用来做分销）
			  break;
	        case 'scan':
				// 实例微信粉丝接口
				$user = & load_wechat('User', $this->wxInfo);
			
				// 读取微信粉丝列表
				$getFansInfo = $user->getUserInfo($this->openId);
				\think\Log::record('fans:'.json_encode($getFansInfo));
				// 处理创建结果
				if($getFansInfo===FALSE){
					// 接口失败的处理
				   \think\Log::record($user->errMsg);
					exit($user->errMsg);
				}
				
			
				if (isset($getFansInfo['qr_scene'])){
					
					$ret = Db::name('admin')->where('id', $getFansInfo['qr_scene'])->update(array('open_id'=>$getFansInfo['openid']));
				}
				$this->wechat->text("扫码成功！")->reply();
				break;
	    }
	    exit;
	}
	
	private function saveFans($fans){
			//保存到粉丝表中
			if ($this->leasehold){
				$fansInfo = Db::name('fans')->where(array('union_id'=>$fans['unionid'],'token'=>$this->token))->find();
			}
			else{
				$fansInfo = Db::name('fans')->where(array('open_id'=>$fans['openid'],'token'=>$this->token))->find();
				$fans['unionid'] = "";
			}	
				$data['open_id'] = $fans['openid'];
				$data['power_open_id'] = $fans['openid'];
				$data['union_id'] = $fans['unionid'];
				$data['nickname'] = $fans['nickname'];
				$data['head_pic'] = $fans['headimgurl'];
				$data['is_focus'] = 1;
				$data['sex'] = $fans['sex'];
				$data['city'] = $fans['city'];
				$data['province'] = $fans['province'];
				$data['country'] = $fans['country'];
				$data['token'] = $this->token;
			if (!$fansInfo){
				
				\think\Log::record('notifyInfo='.json_encode($data));
				Db::name('fans')->insertGetId($data);	
			}
			else{				
				Db::name('fans')->where('id',$fansInfo['id'])->update($data);
			}
	}
	
	public function checkAutoVote(){
		if ($this->leasehold){
			$voteRecord = Db::name('vote_record')->where(array('union_id'=>$this->fans['union_id'],'token'=>$this->token,'status'=>0))->find();
		}
		else{
			$voteRecord = Db::name('vote_record')->where(array('open_id'=>$this->fans['open_id'],'token'=>$this->token,'status'=>0))->find();
		}
		if ($voteRecord){			
			$this->ticket($voteRecord['item_id'], 0, $voteRecord['id']);
		}
		else{
			return false;
		}		
	}
	
	 public function ticket($voteItemId, $recordInsert = 1, $voteRecoreId=0){	 	   	
    		$voteItem = Db::name('vote_item')->where('id', $voteItemId)->find();
    		$voteId = $voteItem['vote_id'];
    		
    		$vote = Db::name('vote')->where('id', $voteId)->find();
    		
    		if(!$vote || !$vote['status']){
    			$this->wechat->text('此投票无法投票，可能出于审核中或已被屏蔽！')->reply();
    			exit;
    		}
    		
    		if(!$voteItem || !$voteItem['status']){
    			$this->wechat->text('此作品无法投票，审核中或已被屏蔽！')->reply();
    			exit;
    		}
    		
    		$vote_starttime = strtotime($vote['vote_starttime']);
    		$vote_endtime = strtotime($vote['vote_endtime']);
    		if($vote_starttime > time()){
    			$this->wechat->text('亲，投票还未开始！')->reply();
    			exit;
    		}
    		
    		if(time() > $vote_endtime){
    			$this->wechat->text('您来晚了，投票已经结束！')->reply();
    			exit;
    		}
    		
    		if ($this->leasehold){
	    		if($voteItem['union_id'] == $this->fans['union_id']){
	    			$this->wechat->text('参赛人员不可以给自己投票！')->reply();
	    			exit;
	    		}
	    	}
	    	else{
	    		if($voteItem['open_id'] == $this->fans['open_id']){
	    			$this->wechat->text('参赛人员不可以给自己投票！')->reply();
	    			exit;
	    		}
	    	}
	    	
    		
    		//验证地区的。
    		$voteConfig = Db::name('vote_config')->where('id', 1)->find();    	   
    		$clientIP = $this->clientIp;    	
    		if ($voteConfig['area_vote_limit']){
					$getarea = getAreaByIp($clientIP);
					$area = explode("，",$voteConfig["area"]);
					
					if(!in_array_case($getarea["area"], $area) && !in_array_case($getarea["province"], $area) && !in_array_case($getarea["city"], $area)){
						$jump_url = $voteConfig["jump_url"];				
						header("Location: {$jump_url}"); 
					}
				
	    	}
	    	
	    	$configVote = Db::name('vote_config')->where('id', 1)->find();
  	    if($configVote["vote_limit_rule"]){
  	    	$sixMUM = 0;
  	    	$sixMUM = Db::name('vote_record')->where('create_time','between time',[date('Y-m-d H:i:s',strtotime("-1 hour")),date("Y-m-d H:i:s", time())])
  	    	->where('item_id', $voteItem['id'])
  	    	->sum('vote_num');
  	    	//作品锁定
  	    	if($sixMUM > $configVote['vote_lock_rule']){    	    		
  	    		$voitemdata=array();
  	    		$voitemdata['status'] = 0;
  	    		Db::name('vote_item')->where('id', $voteItem['id'])->update($voitemdata);
						
						$this->wechat->text($configVote['vote_lock_notice'])->reply();
    				exit;
  	    	}
  	    	
  	    	//投票告警
  	    	if($sixMUM > $configVote['vote_alert_rule']){
  	    		$this->wechat->text($configVote['vote_alert_notice'])->reply();
    				exit;
  	    	}
  	    }
    		
				$voteNum = 0;
    		if($configVote["vote_mode"]){
    			$voteNum = Db::name('vote_record')->where(array('open_id'=>$this->fans['open_id'],'token'=>$this->token))->sum('vote_num');
    		}else{
    			$voteNum = Db::name('vote_record')
    			->where('create_time','between time',[date("Y-m-d 00:00:00", time()),date("Y-m-d H:i:s", time())])
    			->where(array('open_id'=>$this->fans['open_id'],'token'=>$this->token))
    			->sum('vote_num');
    		}    		
    		
    		if($vote['vote_user_limit']){
	    		if($voteNum >= $vote['vote_user_limit']){
	    			$msg = '亲，每人最多只能投【'.$vote['vote_user_limit'].'】票！';
	    			if($configVote["vote_gift"]){
	    				$msg .= '<br/>您还可以通过赠送礼物方式投票。';
	    			}    			
	    			$this->wechat->text($msg)->reply();
	    				exit;
	    		} 
    		} 
    		
    		$voteNum = 0;
    		if($configVote["vote_mode"]){
    			$voteNum = Db::name('vote_record')->where(array('client_ip'=>$this->clientIp,'token'=>$this->token))->sum('vote_num');
    		}else{
    			$voteNum = Db::name('vote_record')
    			->where('create_time','between time',[date("Y-m-d 00:00:00", time()),date("Y-m-d H:i:s", time())])
    			->where(array('client_ip'=>$this->clientIp,'token'=>$this->token))
    			->sum('vote_num');
    		}    		
    		if($vote['vote_ip_limit']){
	    		if($voteNum >= $vote['vote_ip_limit']){
	    			$msg = '亲，每人最多只能投【'.$vote['vote_user_limit'].'】票！';
	    			if($configVote["vote_gift"]){
	    				$msg .= '<br/>您还可以通过赠送礼物方式投票。';
	    			}    			
	    			$this->wechat->text($msg)->reply();
	    				exit;
	    		} 
    		} 

    	

    		$voteItemdata['vote_num'] = $voteItem['vote_num']+1;
    		Db::name('vote_item')->where('id', $voteItemId)->update($voteItemdata);
    		$rdata=array();
    		if ($recordInsert){	    		
	    		$rdata['vote_id'] = $voteId;
	    		$rdata['item_id'] = $voteItemId;
	    		$rdata['open_id'] = $this->fans["open_id"];
	    		$rdata['union_id'] = $this->fans["union_id"];
	    		$rdata['client_ip'] = $this->clientIp;
	    		$rdata['token'] = $this->token;
	    		$rdata['create_time'] = date("Y-m-d H:i:s", time());
	    		$rdata['vote_num'] = 1;
	    		$rdata['status'] = 1;
	    		
	    		$result = Db::name('vote_record')->insertGetId($rdata);
	    	}
	    	else{
	    		$rdata['vote_num'] = 1;
	    		$rdata['status'] = 1;
	    		$rdata['open_id'] = $this->fans["open_id"];
	    		$result = Db::name('vote_record')->where('id',$voteRecoreId)->update($rdata);	    		
	    	}
	    	
    		if($result){      		
    			$url = $this->domain.'/wap/vote/index/token/'.$this->token.'/id/'.$vote['id'];
    			//投票成功
    			$this->wechat->text("投票通知"
    				."\n恭喜您为".$voteItem['realname']."成功投了1票！"
    				."\n创建时间：".date('y-m-d H:i:s',time())
    				."\n您的姓名：".$this->fans['nickname']
    				."\n被投票ID：".$voteItemId
    				."\n被投票用户：".$voteItem['realname']
    				."\n投票时间：".date('y-m-d H:i:s',time())
    				."\n想要让更多的人认识你吗？那就赶快来报名吧！"
    				."\n".'<a href="'.$url.'">详情</a>')->reply(); 
    			exit;
    		}
    }	
    
    private function cancelVote(){
    	
    	$voteRecord = Db::name('vote_record')->where(array('open_id'=>$this->fans['open_id'],'token'=>$this->token))->select();
    	foreach($voteRecord as $k=>$item){
    		$vote = Db::name('vote')->where(array('id'=>$item['vote_id'],'status'=>1))->find();
    		if ($vote){
	    		$currTime = time();
	    		$voteEndTime = $vote?strtotime($vote['vote_endtime']):0;
	    		if ($currTime < $voteEndTime && $item['status'] == 1){    			
	    			Db::name('vote_record')->where('id',$item['id'])->update(array('vote_num'=>0,'status'=>-1));
	    			Db::name('vote_item')->where('id',$item['item_id'])->where('status',1)->setDec('vote_dnum', 1);
	    		}
	    	}		
    	}    	
    }
    
    private function qrSubscribe(){    	
    	$qrRecord = Db::name('qr_record')->where(array('union_id'=>$this->fans['union_id'],'token'=>$this->token, 'status'=>0))->find();
    	if ($qrRecord){
	    	$data['status'] = 1;
	    	$data['is_focus'] = 1;
	    	
	    	$conf['qr_id'] = $qrRecord['qr_id'];
	      $conf['create_time'] = array('EGT' ,date("Y-m-d",time()));
	      $qrRecordCnt = Db::name('qr_record')->where($conf)->count('id');
	      if (!($qrRecordCnt%20)){
	      	$data['status'] = 0;
	      }
	      
	    	Db::name('qr_record')->where('id',$qrRecord['id'])->update($data);
	    }
    }
    
    private function qrUnsubscribe(){    	
    	$qrRecord = Db::name('qr_record')->where(array('open_id'=>$this->fans['open_id'],'token'=>$this->token))->find();
    	if ($qrRecord){
	    	$data['status'] = 0;
	    	$data['is_focus'] = 0;
	    	Db::name('qr_record')->where('id',$qrRecord['id'])->update($data);
	    }
    	
    }
}