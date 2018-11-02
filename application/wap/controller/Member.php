<?php
namespace app\wap\controller;
use think\Db;
use app\common\controller\Base;
use think\Session;

class Member extends Base{
	
	public function _initialize(){
		
		parent::_initialize();
		$request = request();
		$this->controller = $request->controller();
		$this->action = $request->action();
		$this->clientIp = $request->ip(0,true);
		$this->domain =  $request->domain();
		$this->accessUrl =  $request->url(true);
		
		$this->token =  input('token','','trim,strip_tags');
		$this->openId =  input('openId','','trim,strip_tags');
		
		$tmpScopeType =  input('scopeType','','trim,strip_tags');
		
	
	}
	
	//商业 企业
	public function callResult(){

			$uuid = input('id','','trim,strip_tags');
		
	
			$memberInfo = Db::name('member')
						 ->field('mobile,nickname,status,level,sex,duration,last_dial_time,record_path,call_rotation,originating_call')
						 ->where('uuid',$uuid)
						 ->find();
			
				
			$bills = Db::name('tel_bills')->where('call_id',$uuid)->order('id asc')->select();

			$num = Db::name('tel_bills')->where('status',1)->where('call_id',$uuid)->count("id");

			if($memberInfo){

				if ($memberInfo['sex'] >= 0){
					$memberInfo['sex'] = $memberInfo['sex']?'女':'男';
				}
				else{
					$memberInfo['sex'] = '未知';
				}
				$memberInfo['nickname'] = $memberInfo['nickname']? $memberInfo['nickname']:'--';
				
				$memberInfo['last_dial_time'] = date('Y-m-d H:i:s', $memberInfo['last_dial_time']);
				
				
				switch ($memberInfo['status']) {
					case 1:
						$memberInfo['status'] = '排除中';
						break;
			
					case 2:
						$memberInfo['status'] = '已接通';
						break;
			
					case 3:
						$memberInfo['status'] = '未接听挂断/关机/欠费';
						break;
			
					default:
						$memberInfo['status'] = '排除中';
				}
				
			
				$data = array();
				$data['memberInfo'] = $memberInfo;
				$data['bills'] = $bills;
                $data['num'] = $num;

				$this->assign('list',$data);

				 // var_dump($data);
				// exit;

			}else{

			  $this->assign('list', array());

			}
			
			
	       return $this->fetch();

	}



}
	
?>
	   