<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use Qiniu\time;

class Menu extends User{

	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();

	}
	
	
	//任务管理主界面
	public function index()
	{ 
	
		$list = Db::name("Menu")->order('sort asc,id asc')->select();

		int_to_string($list,array('hide'=>array(1=>'是',0=>'否'),'is_dev'=>array(1=>'是',0=>'否')));
		
	//	var_dump($list);exit;
		
		if (!empty($list)) {
			$tree = new \com\Tree();
			$list = $tree->toFormatTree($list);
		}
		
		// 记录当前列表页的cookie
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		
		$this->setMeta('菜单列表');
		$this->assign('list',$list);
		
		
		return $this->fetch();
	}
	
	//添加
	public function add(){
		
		if(IS_POST){
	
		//	$auth = input('auth/a','','trim,strip_tags');//接收数组
		
			$mdata = array();
		    $mdata['title'] = input('title','','trim,strip_tags');
	   		$mdata['type'] = input('type','','trim,strip_tags');
	   		$mdata['icon'] = input('icon','','trim,strip_tags');
	   		$mdata['pid'] = input('pid','','trim,strip_tags');
	   		$mdata['sort'] = input('sort','','trim,strip_tags');
	   		$mdata['url'] = input('url','','trim,strip_tags');
	   		$mdata['hide'] = input('hide','','trim,strip_tags');
	   		$mdata['tip'] = input('tip','','trim,strip_tags');
	   		$mdata['group'] = input('group','','trim,strip_tags');
	   		$mdata['is_dev'] = input('is_dev','','trim,strip_tags');
			
			$mdata['create_time'] = date("Y-m-d H:i:s",time());
			
	
			$result = Db::name('Menu')->insertGetId($mdata);
				
			if($result){
				return returnAjax(0,'新建成功',$result);
			}else{
				return returnAjax(1,'error!',"新建失败");
			}
				
				
		}else{
			
			$this->assign('info',array('pid'=>input('pid')));
			$menus = Db::name('Menu')->where('pid', 0)->select();
			$tree = new \com\Tree();
			$menus = $tree->toFormatTree($menus);
			if (!empty($menus)) {
				$menus = array_merge(array(0=>array('id'=>0,'title_show'=>'顶级菜单')), $menus);
			}else{
				$menus = array(0=>array('id'=>0,'title_show'=>'顶级菜单'));
			}
			 
			$this->assign('Menus', $menus);
			$this->setMeta('新增菜单');
			
			$this->assign('current', '添加');
			
			return $this->fetch();
		}
		
		
	}
	
   //编辑管理员
   public function edit(){


   	if(IS_POST){

   		$mdata = array();
   		$mdata['title'] = input('title','','trim,strip_tags');
   		$mdata['type'] = input('type','','trim,strip_tags');
   		$mdata['icon'] = input('icon','','trim,strip_tags');
   		$mdata['pid'] = input('pid','','trim,strip_tags');
   		$mdata['sort'] = input('sort','','trim,strip_tags');
   		$mdata['url'] = input('url','','trim,strip_tags');
   		$mdata['hide'] = input('hide','','trim,strip_tags');
   		$mdata['tip'] = input('tip','','trim,strip_tags');
   		$mdata['group'] = input('group','','trim,strip_tags');
   		$mdata['is_dev'] = input('is_dev','','trim,strip_tags');
   	
   			
   		$mdata['create_time'] = date("Y-m-d H:i:s",time());
   			
   		
   	  	$adminId = input('id','','trim,strip_tags');
   		
   			
   		$result = Db::name('Menu')->where('id', $adminId)->update($mdata);
   	
   		if($result){
   			return returnAjax(0,'编辑成功',$result);
   		}else{
   			return returnAjax(1,'error!',"编辑失败");
   		}
   	
   	
   	}else{
   	
   		$id = input('id','','trim,strip_tags');
   			
   		$info = array();
   		/* 获取数据 */
   		$info = Db::name('Menu')->field(true)->find($id);
   		$menus = Db::name('Menu')->where('pid', 0)->field(true)->select();
   		$tree = new \com\Tree();
   		$menus = $tree->toFormatTree($menus);
   		
   		$menus = array_merge(array(0=>array('id'=>0,'title_show'=>'顶级菜单')), $menus);
   		$this->assign('Menus', $menus);
   		if(false === $info){
   			return $this->error('获取后台菜单信息错误');
   		}
   		$this->assign('info', $info);
   		
   		$this->assign('current', '编辑');
   	
   		return $this->fetch('add');
   	}
   	
   	
   	
   }
	

   /**
    * 删除后台菜单
    * @author yangweijie <yangweijiester@gmail.com>
    */
   public function del(){
   	$id = $this->getArrayParam('id');
   
   	if (empty($id) ) {
   		return $this->error('请选择要操作的数据!');
   	}
   
   	$map = array('id' => array('in', $id) );
   	if(db('Menu')->where($map)->delete()){
   		session('admin_menu_list',null);
   		//记录行为
   		action_log('update_menu', 'Menu', $id, session('user_auth.uid'));
   		return $this->success('删除成功');
   	} else {
   		return $this->error('删除失败！');
   	}
   }
   
	
   /**
    * 修改状态
    */
   public function setstatus(){
   
   	$adminId = input('arrayIds/a','','trim,strip_tags');
   	$status = input('status','','trim,strip_tags');
   	 
   	$data=array();
   	$data['status'] = $status;
   
   //	var_dump();exit;
   	$list = Db::name('admin')->where('id','in', $adminId)->update($data);
   
   	if($list){
   		return returnAjax(0,'成功',$list);
   	}else{
   		return returnAjax(1,'error!',"失败");
   	}
   }
   
   
   /**
    * 删除，批量删除，接收数组
    */
   public function delAdmin(){
   
   	$adminId = input('admin_id/a','','trim,strip_tags');//接收数组
   
   	$list = Db::name('admin')->where('id','in', $adminId)->delete();
   
   	if($list){
   		return returnAjax(0,'成功',$list);
   	}else{
   		return returnAjax(1,'error!',"失败");
   	}
   }
   
 
   /* 单字段编辑 */
   public function editable($name=null,$value=null,$pk=null){
     	if ($name && ($value != null || $value != '') && $pk) {
   		  Db::name('Menu')->where(array('id'=>$pk))->setField($name,$value);
     	}
   }
    
   
   public function toogleHide($id,$value = 1){
	   	session('admin_menu_list',null);
	   	$result = Db::name('Menu')->where(array('id'=>$id))->setField(array('hide'=>$value));
	   	if($result !==false ) {
	   		return $this->success('操作成功！');
	   	}else{
	   		return $this->error('操作失败！');
	   	}
   }
   
   public function toogleDev($id,$value = 1){
	   	session('admin_menu_list',null);
	   	$result = Db::name('Menu')->where(array('id'=>$id))->setField(array('is_dev'=>$value));
	   	if($result !==false ) {
	   		return $this->success('操作成功！');
	   	}else{
	   		return $this->error('操作失败！');
	   	}
   }
    
   /**
    * 菜单排序
    * @author huajie <banhuajie@163.com>
    */
   public function sort(){
   	if(IS_GET){
   		$ids = input('ids');
   		$pid = input('pid');
   
   		//获取排序的数据
   		$map = array('status'=>array('gt',-1));
   		if(!empty($ids)){
   			$map['id'] = array('in',$ids);
   		}else{
   			if($pid !== ''){
   				$map['pid'] = $pid;
   			}
   		}
   		$list = db('Menu')->where($map)->field('id,title')->order('sort asc,id asc')->select();
   
   		$this->assign('list', $list);
   		$this->setMeta('菜单排序');
   		return $this->fetch();
   	}elseif (IS_POST){
   		$ids = input('post.ids');
   		$ids = explode(',', $ids);
   		foreach ($ids as $key=>$value){
   			$res = db('Menu')->where(array('id'=>$value))->setField('sort', $key+1);
   		}
   		if($res !== false){
   			session('admin_menu_list',null);
   			return $this->success('排序成功！');
   		}else{
   			return $this->error('排序失败！');
   		}
   	}else{
   		return $this->error('非法请求！');
   	}
   }

   public function importFile($tree = null, $pid=0){
   	if($tree == null){
   		$file = APP_PATH."Admin/Conf/Menu.php";
   		$tree = require_once $file;
   	}
   	$menuModel = D('Menu');
   	foreach ($tree as $value) {
   		$add_pid = $menuModel->add(
   				array(
   						'title'=>$value['title'],
   						'url'=>$value['url'],
   						'pid'=>$pid,
   						'hide'=>isset($value['hide'])? (int)$value['hide'] : 0,
   						'tip'=>isset($value['tip'])? $value['tip'] : '',
   						'group'=>$value['group'],
   				)
   		);
   		if($value['operator']){
   			$this->import($value['operator'], $add_pid);
   		}
   	}
   }
   
   public function import(){
   	if(IS_POST){
   		$tree = input('post.tree');
   		$lists = explode(PHP_EOL, $tree);
   		$menuModel = db('Menu');
   		if($lists == array()){
   			return $this->error('请按格式填写批量导入的菜单，至少一个菜单');
   		}else{
   			$pid = input('post.pid');
   			foreach ($lists as $key => $value) {
   				$record = explode('|', $value);
   				if(count($record) == 4){
   					$menuModel->add(array(
   							'title'=>$record[0],
   							'url'=>$record[1],
   							'pid'=>$record[2],
   							'sort'=>0,
   							'hide'=>0,
   							'tip'=>'',
   							'is_dev'=>0,
   							'group'=>$record[3],
   					));
   				}
   			}
   			session('admin_menu_list',null);
   			return $this->success('导入成功',url('index?pid='.$pid));
   		}
   	}else{
   		$this->setMeta('批量导入后台菜单');
   		$pid = (int)input('get.pid');
   		$this->assign('pid', $pid);
   		$data = db('Menu')->where("id={$pid}")->field(true)->find();
   		$this->assign('data', $data);
   		return $this->fetch();
   	}
   }
    
   
}