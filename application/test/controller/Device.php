<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;

//会员用户数据处理类
use app\common\controller\AdminData;
//线路数据处理类
use app\common\controller\LinesData;

class Device extends User{

	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();

	}
	
	
	//设备主界面
	public function index()
	{

		return $this->fetch();
		
	}
	
	//设备主界面
	public function voip()
	{

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();
		$list = Db::name('tel_device')->where($where)->order('id desc')
		->paginate(10, false, array('query'  =>  $this->param));

		$page = $list->render();
		$list = $list->toArray();

		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		
		return $this->fetch();
		
	}
	
	public function lines(){
		
				 
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		$where = array();
		if(!$super){
			$where['member_id'] = [['=',0],['=',$uid],'OR'];
		}
		if($super == 0){
		  //获取当前用户的上级、上上级等用户ID
  		$AdminData = new AdminData();
  		$pids = $AdminData->get_parents_user_id($uid);
  	  //获取线路
  		$list = Db::name('tel_line')
  		        ->where($where)
  		        ->whereOr('member_id', 'in', $pids)
  		        ->order('id desc')
  		        ->paginate(10, false, array('query'  =>  $this->param));
		}else{
  	  //获取线路
  		$list = Db::name('tel_line')
  		        ->where($where)
  		        ->order('id desc')
  		        ->paginate(10, false, array('query'  =>  $this->param));
		}
		

		$page = $list->render();
		$list = $list->toArray();

		foreach ($list['data'] as $k=>$v){
			
			$admin = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
			$list['data'][$k]["username"] = $admin["username"];
			
		
			
			$memberInfo = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
			$list['data'][$k]["username"] = $memberInfo["username"];
		
		}
		
		
	

		$this->assign('list', $list['data']);
		$this->assign('page', $page);
	  					
		$this->assign('super', $super);
		$result = Db::name('admin')->where(array('status'=>1,'super'=>0))->select();
		$this->assign('memberList', $result);
		$this->assign('uid', $uid);
	

		return $this->fetch();
		
	}
	
	//添加设备信息
	public function addLine(){

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		
		$data = array();
		$data['name'] = input('name','','trim,strip_tags');
		// $data['member_id'] = input('member_id','','trim,strip_tags');
		$data['member_id'] = $uid;
		$data['phone'] = input('phone','0','trim,strip_tags');
		$data['call_prefix'] = input('call_prefix','','trim,strip_tags');
		$data['inter_ip'] = input('inter_ip','','trim,strip_tags');
		
		
		$data['gateway'] = input('gateway','','trim,strip_tags');
		
		//'sofia/gateway/mygateway/%s',
		//sofia/external/15%s@119.23.133.180:2080
		$type = input('type/d','','trim,strip_tags');
		$data['type'] = $type;
		if ($type == 0){
			$dial_format  = 'sofia/external/';
			if ($data['call_prefix']){
				$dial_format  .= $data['call_prefix'];
			}
			$dial_format  .= '%s@'.$data['inter_ip'];
		}
		else{
			$dial_format  = 'sofia/gateway/';
			if ($data['gateway']){
				$dial_format  .= $data['gateway'];
			}
			$dial_format  .= '/%s';			
		}
		
		
		$data['dial_format'] = $dial_format;	
		
		$data['remark'] = input('remark','','trim,strip_tags');
	  $data['status'] = 1;
		$result = Db::name('tel_line')->insertGetId($data);
	
		if ($result){
			
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}
		
	}
	
	/**
	 * 编辑设备信息
	 * 
	 * @description 超级管理员可以编辑任何线路 其他角色用户只能编辑自己的线路
	*/
	public function editLine(){
    
		$data = array();
		$data['name'] = input('name','','trim,strip_tags');
		$data['member_id'] = input('member_id','','trim,strip_tags');
		$user_auth = session('user_auth');
		if($user_auth['super'] == 0){
  		if($data['member_id'] != $user_auth['uid']){
  		  return returnAjax(1,'failure!');
  		}
		}
		
		$data['phone'] = input('phone','0','trim,strip_tags');
		
		$data['call_prefix'] = input('call_prefix','','trim,strip_tags');
		$data['inter_ip'] = input('inter_ip','','trim,strip_tags');
		
		$data['gateway'] = input('gateway','','trim,strip_tags');
		
		//'sofia/gateway/mygateway/%s',
		//sofia/external/15%s@119.23.133.180:2080
		$type = input('type/d','','trim,strip_tags');
		$data['type'] = $type;
		if ($type == 0){
			$dial_format  = 'sofia/external/';
			if ($data['call_prefix']){
				$dial_format  .= $data['call_prefix'];
			}
			$dial_format  .= '%s@'.$data['inter_ip'];
		}
		else{
			$dial_format  = 'sofia/gateway/';
			if ($data['gateway']){
				$dial_format  .= $data['gateway'];
			}
			$dial_format  .= '/%s';			
		}
		
		$data['dial_format'] = $dial_format;				
		$data['remark'] = input('remark','','trim,strip_tags');
		$simId = input('simId','','trim,strip_tags');
	
		$result = Db::name('tel_line')->where('id', $simId)->update($data);
		
		if ($result){
		
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}

	
		
	}

	//获取设备信息
	public function getLineInfo(){
		$id = input('id','','trim,strip_tags');
		$slist = Db::name('tel_line')->where('id', $id)->find();		
		echo json_encode($slist,true);
	}
	
	/**
	 * 删除设备
	 * 
	 * @description 超级管理员可以删除所有的线路 其他用户角色智能删除自己的线路
	*/
	public function delLine(){
	  $user_auth = session('user_auth');
		$ids= input('id/a','','trim,strip_tags');
		if($user_auth['super'] == 0){
		  if(!empty($ids) && is_array($ids) === true){
		    $ids_count = count($ids);
  		  if($ids_count > 1){
  		    echo '最多只能删除一个。';
  		    exit;
  		  }
  		  //获取当前线路的所属人
    		$LinesData = new LinesData();
    		$member_id = $LinesData->get_line_member_id($ids[0]);
    		if($member_id != $user_auth['uid']){
    		  echo '删除失败。';
    		  exit;
    		}
		  }else{
		    echo '删除失败';
		    exit;
		  }
		}
		// $list = Db::name('tel_line')->where('id','in', $ids)->delete();
	  
		if(!$list){
			echo "删除失败。";
		}
	}
	public function setLineStatus(){

		$sId = input('sId','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$data=array();
		$data['status'] = $status;

		$list = Db::name('tel_line')->where('id',$sId)->update($data);

	   if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}
	
	//添加设备信息
	public function addDevice(){

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		
		$data = array();
		// $data['member_id'] = $uid;
		$data['name'] = htmlspecialchars_decode(input('name','','trim,strip_tags'));
		$data['number'] = input('number','','trim,strip_tags');
		$data['dial_format'] = input('dial_format','','trim,strip_tags');
		$data['type'] = input('type','','trim,strip_tags');
		$data['desc'] = input('desc','','trim,strip_tags');
		
		$result = Db::name('tel_device')->insertGetId($data);
	
		if ($result){
			
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}
		
	}
	
	//编辑设备信息
	public function editDevice(){

		$data = array();
		$data['name'] = htmlspecialchars_decode(input('name','','trim,strip_tags'));
		$data['dial_format'] = input('dial_format','','trim,strip_tags');
		$data['number'] = input('number','','trim,strip_tags');
		$data['type'] = input('type','','trim,strip_tags');
		$data['desc'] = input('desc','','trim,strip_tags');
		
		$deviceId = input('deviceId','','trim,strip_tags');
	
		$result = Db::name('tel_device')->where('id', $deviceId)->update($data);
		
		if ($result){
		
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}

	
		
	}

	//获取设备信息
	public function getDeviceInfo(){
		$id = input('id','','trim,strip_tags');
		$slist = Db::name('tel_device')->where('id', $id)->find();		
		echo json_encode($slist,true);
	}
	
	
	//删除设备
   public function delDevice(){
		$ids= input('id/a','','trim,strip_tags');
		$list = Db::name('tel_device')->where('id','in', $ids)->delete();
	
		if(!$list){
			echo "删除失败。";
		}
	}
	 public function robot(){
	  		 
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		$where = array();
		if(!$super){
			$where['member_id'] = $uid;
		}
	  

		$list = Db::name('tel_sim')->where($where)->order('id desc')
		->paginate(10, false, array('query'  =>  $this->param));

		$page = $list->render();
		$list = $list->toArray();

		
		
	

		$this->assign('list', $list['data']);
		$this->assign('page', $page);
	  					

	
		return $this->fetch();
  }
  
  public function simPage(){
	  		 
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		$where = array();
		if(!$super){
			$where['member_id'] = $uid;
		}
	  	$id = input('id','','trim,strip_tags');

		$where['device_id'] = $id;

		$list = Db::name('tel_sim')->where($where)->order('position asc')
		->paginate(10, false, array('query'  =>  $this->param));

		$page = $list->render();
		$list = $list->toArray();

		foreach ($list['data'] as $k=>$v){
			
			
			$device = Db::name('tel_device')->field("name")->where('id',$v["device_id"])->find();
			$list['data'][$k]["devicename"] = $device["name"];
			
			$memberInfo = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
			$list['data'][$k]["username"] = $memberInfo["username"];
		
		}
		
		
		$this->assign('thisId', $id);

		$this->assign('list', $list['data']);
		$this->assign('page', $page);
	  					

		$result = Db::name('admin')->where(array('status'=>1,'super'=>0,'user_type'=>0))->select();
		$this->assign('memberList', $result);
	

		return $this->fetch();
  }

	//添加设备信息
	public function addSim(){

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		
		$data = array();
		$data['member_id'] = input('member_id','','trim,strip_tags');
		$data['phone'] = htmlspecialchars_decode(input('phone','','trim,strip_tags'));
		$data['call_prefix'] = input('call_prefix','','trim,strip_tags');
		
		
		$sim = Db::name('tel_sim')->where('phone', $data['phone'])->find();		
		if ($sim){
			return returnAjax(1,'号码已存在!');	
		}		
		
		$data['device_id'] = input('deviceId','','trim,strip_tags');
		$data['position'] = input('position','0','trim,strip_tags');
		$data['remark'] = input('remark','','trim,strip_tags');
	    $data['status'] = 1;
		$result = Db::name('tel_sim')->insertGetId($data);
	
		if ($result){
			
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}
		
	}
	
	//编辑设备信息
	public function editSim(){

		$data = array();
		$data['phone'] = htmlspecialchars_decode(input('phone','','trim,strip_tags'));
		$data['position'] = input('position','0','trim,strip_tags');
		$data['member_id'] = input('member_id','','trim,strip_tags');
		$data['call_prefix'] = input('call_prefix','','trim,strip_tags');
		$data['remark'] = input('remark','','trim,strip_tags');
		$simId = input('simId','','trim,strip_tags');
	
		$result = Db::name('tel_sim')->where('id', $simId)->update($data);
		
		if ($result){
		
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}

	
		
	}

	//获取设备信息
	public function getSimInfo(){
		$id = input('id','','trim,strip_tags');
		$slist = Db::name('tel_sim')->where('id', $id)->find();		
		echo json_encode($slist,true);
	}
	
	//删除设备
	public function delSim(){
		$ids= input('id/a','','trim,strip_tags');
		$list = Db::name('tel_sim')->where('id','in', $ids)->delete();
	
		if(!$list){
			echo "删除失败。";
		}
	}
	
	// 修改状态
	public function setSimStatus(){

		$sId = input('sId','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$data=array();
		$data['status'] = $status;

		$list = Db::name('tel_sim')->where('id',$sId)->update($data);

	   if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}

	

}