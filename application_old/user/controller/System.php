<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use \think\Config;
use Qiniu\json_decode;

class System extends User{

	public function _initialize()
	{
		parent::_initialize();
	}

	//快递设置（接口设置）
	public function pay()
	{
		if(IS_POST){

			$udata = array();
			$udata['mch_id'] = input('mchId','','trim,strip_tags');
			$udata['appid'] = input('appId','','trim,strip_tags');
			$udata['partnerkey'] = input('partnerkey','','trim,strip_tags');
			
			$udata['ssl_cer'] = input('sslcer','','trim,strip_tags');
			$udata['ssl_key'] = input('sslkey','','trim,strip_tags');
			$udata['wx_pay'] = input('wxpay','','trim,strip_tags');
			$udata['balance_pay'] = input('balancepay','','trim,strip_tags');
			$udata['cash_pay'] = input('cashpay','','trim,strip_tags');
			
			$wxUId = input('wxUId','','trim,strip_tags');
			
			$result = Db::name('wx_user')->where('id',$wxUId)->update($udata);
		
			if($result){
				  return returnAjax(1,'设置成功',$result);
			}else{
			      return returnAjax(0,'设置失败',0);
			} 
		
		}else{
			
			$list = Db::name('wx_user')->field('id,wxname,mch_id,appid,partnerkey,ssl_cer,ssl_key,wx_pay,balance_pay,cash_pay')
			->where('is_default', 1)->find();
			
			if(!$list){
				return  "<div>请先设置好默认微信公众号</div>";
			}
			
			$this->assign('list', $list);
			
			$sslcer = array();
			$sslcer['sslcer'] = $list['ssl_cer'];
			$this->assign('sslcer',$sslcer);
			
			$sslkey = array();
			$sslkey['sslkey'] = $list['ssl_key'];
			$this->assign('sslkey',$sslkey);
			
			return  $this->fetch();
			
			
		}

	}

	

	//系统设置
	public function setting()
	{
	
		if(IS_POST){
	
			$data = array();
	
			$data['websitename'] = input('websitename','','trim,strip_tags');
			$data['websiteURL'] = input('websiteURL','','trim,strip_tags');
			$data['Contactaddress'] = input('Contactaddress','','trim,strip_tags');
			$data['desc'] = input('desc','','trim,strip_tags');
			$data['cover'] = input('cover','','trim,strip_tags');
			$data['Websiterecordnumber'] = input('Websiterecordnumber','','trim,strip_tags');
			$data['contactmode'] = input('contactmode','','trim,strip_tags');
// 			
// 	        $data['commission'] = input('commission','','trim,strip_tags');
// 	  	    $data['drawwater'] = input('drawwater','','trim,strip_tags');
	
	
			$configId = input('configId','','trim,strip_tags');
	
	
			$insertdata = array();
			$insertdata['title'] = '基础设置';
			$insertdata['value'] = serialize($data);
	

			if($configId){
	
				$result = Db::name('config')->where('group', 36)->update($insertdata);
	
			}else{
	
				$insertdata['group'] = 36;
				$result = Db::name('config')->insertGetId($insertdata);
			}
				
				
			if($result){
	
				
				// $auth = session('user_auth');
				// $list = Db::name('picture')->field('path')->where('id', $data['cover'])->find();
				
				// $auth['logo'] = $list['path'];
				
	   //          session('user_auth', $auth);
			 //    session('user_auth_sign', data_auth_sign($auth));

				//\think\Log::record('user_auth='.json_encode($auth));
					
				return returnAjax(0,"成功");
					
			}else{
					
				return returnAjax(1,"失败");
					
			}
	
				
		}else{
	
			$res = Db::name('config')->where('group', 36)->find();
				
			$res['val'] = unserialize($res['value']);
				
	  
			$cover = array();
			if($res['val']["cover"]){

					$list = Db::name('picture')->field('path')->where('id', $res['val']["cover"])->find();
					if($list['path']){
					   $cover['cover'] = $res['val']["cover"];
					}

			}
        
		
			$this->assign('res', $res);
				
			$this->assign('cover', $cover);
				
			return $this->fetch();
				
		}
	
	}
	
	
	public function notification(){
	
	
		$res = Db::name('config')->where('group', 37)->find();
			
		/*
		 $res['val'] = unserialize($res['value']);
		 $cover = array();
		 if($res['val']["cover"]){
		 $cover['cover'] = $res['val']["cover"];
		 }else{
		 $cover['cover'] = "";
		 }
		 $this->assign('cover', $cover);
		 	
		*/
			
		//	var_dump($res);
			
		$this->assign('res', $res);
			
		return  $this->fetch();
	
	}
	
	public function smsConfigure(){
	
		if(IS_POST){
	
			$data = array();
				
			$data['status'] = input('status','','trim,strip_tags');
			$data['accessKeyId'] = input('accessKeyId','','trim,strip_tags');
			$data['accessKeySecret'] = input('accessKeySecret','','trim,strip_tags');
			$data['signName'] = input('signName','','trim,strip_tags');
			$data['templateCode'] = input('templateCode','','trim,strip_tags');
	
			$configId = input('configId','','trim,strip_tags');
				
				
			$insertdata = array();
			$insertdata['name'] = 'ALIYUN_SMS';	
			$insertdata['value'] = serialize($data);
			
			if($configId){
					
				$result = Db::name('config')->where('group', 37)->update($insertdata);
					
			}
			else{
					
				$insertdata['group'] = 37;
				$result = Db::name('config')->insertGetId($insertdata);
			}
	
	
			if($result){
					
				return returnAjax(0,"成功");
					
			}else{
					
				return returnAjax(1,"失败");
					
			}
	
	
		}else{
	
			$res = Db::name('config')->where('group', 37)->find();
				
			$extra = unserialize($res['value']);
				
			$this->assign('extra', $extra);
	
			$this->assign('res', $res);
	
				
			return  $this->fetch();
	
		}
	
	
	}
	
	public function businessNotice(){
	
	
		if(IS_POST){
				
			$data = array();
				
			$data['sign'] = input('sign','','trim,strip_tags');
			$data['phoneNumber'] = input('phoneNumber','','trim,strip_tags');
			$data['content'] = input('content','','trim,strip_tags');
				
			$configId = input('configId','','trim,strip_tags');
				
				
			$insertdata = array();
			//$insertdata['title'] = '基础设置';
			$insertdata['value'] = serialize($data);
				
			//var_dump($configId, $insertdata);exit;
				
			if($configId){
	
				$result = Db::name('config')->where('group', 37)->update($insertdata);
	
			}else{
	
				$insertdata['group'] = 37;
				$result = Db::name('config')->insertGetId($insertdata);
			}
				
				
			if($result){
	
				return returnAjax(0,"成功");
	
			}else{
	
				return returnAjax(1,"失败");
	
			}
				
				
		}else{
				
			$res = Db::name('config')->where('group', 37)->find();
				
			$value = unserialize($res['value']);
				
			$this->assign('value', $value);
				
			$this->assign('res', $res);
				
				
			return  $this->fetch();
				
		}
	
	
	
	}
	
	public function setstatus(){
	
	
		$arrayIds = input('arrayIds/a','','trim,strip_tags');
	
		$status = input('status','','trim,strip_tags');
	
		//	var_dump($arrayIds,$status);exit;
	
		$data=array();
		$data['status'] = $status;
		$list =Db::name('config')->where('group','in',$arrayIds)->update($data);
	
		if($list){
			return returnAjax(0,'修改成功',$list);
		}else{
			return returnAjax(1,'error!',"修改失败");
		}
	
		//	var_dump($_POST);exit;
	
	}
	
	
	
		//话术场景主界面
	public function interfacePage(){

			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];
			$super = $user_auth["super"];
			
			$where = array();
			if(!$super){
				$where['member_id'] = $uid;
			}
			
			$list = Db::name('tel_interface')->where($where)->order('id desc')
			->paginate(10, false, array('query'  =>  $this->param));
	
			$page = $list->render();
			$list = $list->toArray();
			
			foreach ($list['data'] as $k=>$v){
				
				$admin = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
				
				$list['data'][$k]["username"] = $admin["username"];
		
			
			}
			
			$this->assign('list', $list['data']);
			$this->assign('page', $page);
			
// 			$simwhere = array();
// 			$simwhere['status'] = ['=',1];
// 			$simlist = Db::name('tel_sim')->where($simwhere)->order('id desc')->select();
// 			$this->assign('simlist', $simlist);
			
			return $this->fetch();
			
		}
		
	//添加计划 
	public function addInterface(){

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		
		$data = array();
		$data['member_id'] = $uid;
		$data['app_key'] = htmlspecialchars_decode(input('app_key','','trim,strip_tags'));
		$data['app_secret'] = htmlspecialchars_decode(input('app_secret','','trim,strip_tags'));
		$data['type'] = input('type','','trim,strip_tags');
		$data['status'] = 0;
		
		$result = Db::name('tel_interface')->insertGetId($data);
	
		if ($result){
			 $back = array();
			 return returnAjax(0,'success!',$back);		
		}
		else{
			 return returnAjax(1,'failure!');
		}
		
	}
	
	//编辑计划
	public function editInterface(){

		$data = array();
		$data['app_key'] = htmlspecialchars_decode(input('app_key','','trim,strip_tags'));
		$data['app_secret'] = htmlspecialchars_decode(input('app_secret','','trim,strip_tags'));
		$data['type'] = input('type','','trim,strip_tags');
		
		$interfaceId = input('interfaceId','','trim,strip_tags');
	
		$result = Db::name('tel_interface')->where('id', $interfaceId)->update($data);
		
		if ($result){
		
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}

	
		
	}

	//获取计划信息
	public function getInterfaceInfo(){
		$id = input('id','','trim,strip_tags');
		$slist = Db::name('tel_interface')->where('id', $id)->find();
		
		echo json_encode($slist,true);
	}

		// 修改状态
	public function setInterfaceStatus(){

		$sId = input('ifId','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$data=array();
		$data['status'] = $status;
	
		$list = Db::name('tel_interface')->where('id',$sId)->update($data);
	
		 if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}	
	
	//删除计划
	public function delInterface(){
		
			$ids= input('id/a','','trim,strip_tags');
		$list = Db::name('tel_interface')->where('id','in', $ids)->delete();
	
		if(!$list){
			echo "删除失败。";
		}
	}
	


	
}













