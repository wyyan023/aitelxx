<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;

class Role extends User{

	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();

	}
	
	
	//角色管理主界面
	public function index()
	{

		$keyword = input('keyword');
		if ($keyword) {
			$list = Db::name('admin_role')->where('name like "%'.$keyword.'%"')->paginate(10, false, array('query'  =>  $this->param));
		} else {
			$list = Db::name('admin_role')->paginate(10, false, array('query'  =>  $this->param));
		}
		$page = $list->render();
		$list = $list->toArray();
		
		foreach ($list['data'] as $k=>$v){
			$list['data'][$k]['create_time'] = date("Y-m-d H:i:s", $v['create_time']);
		}
	
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		
		return $this->fetch();
	}
	
	public function addRole(){
		if(IS_POST){
			
		
			$auth = input('auth/a','','trim,strip_tags');//接收数组
			
			$rdata = array();
			$rdata['name'] = input('roleName','','trim,strip_tags');
			$rdata['intro'] = input('roleIntro','','trim,strip_tags');
			if($auth){
				$rdata['rule_items'] = implode(",",$auth);
			}else{
				$rdata['rule_items'] = '';
			}

			$rdata['create_time'] = time();
			$rdata['status'] = input('status','','trim,strip_tags');
				
			
			$result = Db::name('admin_role')->insertGetId($rdata);
			
			if($result){
				return returnAjax(0,'新建成功',$result);
			}else{
				return returnAjax(1,'error!',"新建失败");
			}
			
			
		}else{

			$menu = array();
			
			$where['hide']  =   0;
			$where['type']  =   'user';
			
			$mlist = Db::name('menu')->field('id,title,pid,url')->where($where)->order('id asc')->select();
			
			
			$flag = 0;
			
			foreach ($mlist as $key => $value) {
				if ($value['pid'] == 0){
					$menu[$value['id']]['title'] = $value['title'];
					$menu[$value['id']]['expand'] = 0;
					$menu[$value['id']]['pid'] = $value['pid'];
					$menu[$value['id']]['id'] = $value['id'];
				}
	
			//	$expand = 0;//默认不展开子菜单
				foreach ($mlist as $sKey => $sValue) {
					//此处用来做权限判断
					/* if (!IS_ROOT && !$this->checkRule($sValue['url'],2,null) ) {
						continue;
					} */
						
					if ($sValue['pid'] > 0 && $value['id'] == $sValue['pid']){
						$menu[$value['id']]['child'][] = $sValue;
						 
					}
				}
				
			}
			
			
			$this->assign('menulist', $menu);
			$this->assign('current', '添加');
		//	var_dump($menu,$mlist);exit;
			$this->assign('mlist', array());
			return $this->fetch();
		}
	
	}
  
	public function editRole(){
		if(IS_POST){
		
			$auth = input('auth/a','','trim,strip_tags');//接收数组
				
			$rdata = array();
			$rdata['name'] = input('roleName','','trim,strip_tags');
			$rdata['intro'] = input('roleIntro','','trim,strip_tags');
			if($auth){
				$rdata['rule_items'] = implode(",",$auth);
			}else{
				$rdata['rule_items'] = '';
			}
		
			$rdata['update_time'] = time();
			$rdata['status'] = input('status','','trim,strip_tags');
		
			$roleId = input('roleId','','trim,strip_tags');
			
			$result = Db::name('admin_role')->where('id', $roleId)->update($rdata);
			
			if($result){
				return returnAjax(0,'编辑成功',$result);
			}else{
				return returnAjax(1,'error!',"编辑失败");
			}
				
				
		}else{
		
			$menu = array();
				
			$where['hide']  =   0;
			$where['type']  =   'user';
				
			$mlist = Db::name('menu')->field('id,title,pid,url')->where($where)->order('id asc')->select();
				

			$flag = 0;	
			foreach ($mlist as $key => $value) {
				if ($value['pid'] == 0){
					$menu[$value['id']]['title'] = $value['title'];
					$menu[$value['id']]['expand'] = 0;
					$menu[$value['id']]['pid'] = $value['pid'];
					$menu[$value['id']]['id'] = $value['id'];
					
				}
		
				//	$expand = 0;//默认不展开子菜单
				foreach ($mlist as $sKey => $sValue) {
					//此处用来做权限判断
					/* if (!IS_ROOT && !$this->checkRule($sValue['url'],2,null) ) {
					 continue;
					 } */
		
					if ($sValue['pid'] > 0 && $value['id'] == $sValue['pid']){
						$menu[$value['id']]['child'][] = $sValue;
							
					}
				}
		
			}
				
			// var_dump($menu);exit;
			$this->assign('menulist', $menu);
			
			$id = input('id');
			$rolelist = Db::name('admin_role')->where('id', $id)->find();
			$this->assign('rolelist', $rolelist);
			
			$temp = explode(",",$rolelist["rule_items"]);
			$this->assign('mlist', $temp);
			$this->assign('current', '编辑');
			
			return $this->fetch('addrole');
			
		}
	}
	

	/**
	 * 修改状态
	 */
	public function setstatus(){
	
	    $roleId = input('roleId','','trim,strip_tags');
	    $status = input('status','','trim,strip_tags');
	    
		$data=array();
		$data['status'] = $status;
	
		$list = Db::name('admin_role')->where('id',$roleId)->update($data);
	
        if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}
	
	
	/**
	 * 删除，批量删除，接收数组
	 */
	public function delRole(){

		$roleId = input('role_id/a','','trim,strip_tags');//接收数组
  
		$list = Db::name('admin_role')->where('id','in', $roleId)->delete();
	
		if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}
	
	
	
	
}