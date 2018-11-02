<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;

class Tsr extends User{

	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();

	}
	
	
	//设备主界面
	public function index()
	{
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();
		if(!$super){
			$where['member_id'] = $uid;
		}

		$list = Db::name('tel_tsr')->where($where)->order('id desc')
		->paginate(10, false, array('query'  =>  $this->param));

		$page = $list->render();
		$list = $list->toArray();
		$this->assign('page', $page);
		$this->assign('list', $list['data']);
		return $this->fetch();
		
	}
	
	
	public function setStatus(){
		$id = input('id','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$data=array();
		$data['status'] = $status;
	
		$list = Db::name('tel_tsr')->where('id',$id)->update($data);
	
	   if($list){
			return returnAjax();
		}else{
			return returnAjax(1,'失败!');
		}
		
	}
	
	
	public function add(){
		
		$user_auth = session('user_auth');
		 $uid = $user_auth["uid"];

		$data = array();
		$data['phone'] = input('phone','','trim,strip_tags');
		$data['status'] = 1;
		$data['member_id'] = $uid;
		$data['create_time'] = time();
		$result = Db::name('tel_tsr')->insertGetId($data);
		
		return returnAjax();
	}
	
	//删除计划
	public function delete(){
		
	    $ids= input('id/a','','trim,strip_tags');
		$result = Db::name('tel_tsr')->where('id','in', $ids)->delete();
	
		if($result){
			return returnAjax();
		}
		return returnAjax(1,'失败!');
	}

}