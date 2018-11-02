<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use \think\Config;
use Qiniu\json_decode;

class Label extends User{

	
public function _initialize()
{
	parent::_initialize();
	
}	

//标签列表
public function index()
{
	
		$keyword = input('keyword','','trim,strip_tags');
         
         $user_auth = session('user_auth');
		 $uid = $user_auth["uid"];
		 $super = $user_auth["super"];
		 $label = array();
         if(!$super){
			$label['t.member_id'] = $uid;
		 }	
		 $label['t.type'] = 0;	
		 if($keyword){
			$label['t.label'] = ["like",'%'.$keyword.'%'];
		 }			

		 $list = Db::name('tel_label')
			->alias('t')
			->field('t.id,t.member_id,t.label,t.keyword,m.username,m.realname')
			->join('admin m','t.member_id = m.id','LEFT')
			->where($label)->paginate(10, false, array('query'  =>  $this->param)); 

		// if ($keyword) {
		// 	$list = Db::name('tel_label')
		// 	->alias('t')
		// 	->field('t.id,t.member_id,t.label,t.keyword,m.username,m.realname')
		// 	->join('admin m','t.member_id = m.id','LEFT')
		// 	->where('t.label like "%'.$keyword.'%"')->paginate(10, false, array('query'  =>  $this->param));
		// } else {
		// 	$list = Db::name('tel_label')
		// 	->alias('t')
		// 	->field('t.id,t.member_id,t.label,t.keyword,m.username,m.realname')
		// 	->join('admin m','t.member_id = m.id','LEFT')
		// 	->paginate(10, false, array('query'  =>  $this->param));
		// }
		
		$page = $list->render();
		$list = $list->toArray();
		
		
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		
  	return $this->fetch();
}


public function getLabel(){
		
			$id = input('id','','trim,strip_tags');
			$mlist = Db::name('tel_label')->where('id', $id)->find();
			
			//$mlist['expiry_date'] = date("Y-m-d H:i:s",$mlist['expiry_date']);
			
			if($mlist){
				
				return returnAjax(0,'获取数据成功',$mlist);

			}else{
				return returnAjax(1,'获取数据失败');

			}
}


	public function addLabel(){
		
	 	 $labelName = input('labelName','','trim,strip_tags');
     $remark = input('remark','','trim,strip_tags');
	 
		 $user_auth = session('user_auth');
		 $uid = $user_auth["uid"];
		 $super = $user_auth["super"];
		 
		 $data = array();
		 $data['member_id'] = $uid;
		 $data['label'] = $labelName;
	   $data['keyword'] = $remark;
		
		 $result = Db::name('tel_label')->insertGetId($data);
		 
		 	if($result >= 0){
		 						
				$backdata = array();
				//$backdata['url'] = Url("User/Plan/index");
				return returnAjax(0,'添加成功',$backdata);

			}else{
				
				$backdata = array();
				//$backdata['url'] = Url("User/Plan/editPlan",['id'=>$taskId]);
				return returnAjax(1,'添加失败',$backdata);
			
			}
		 
		
	}
	
	public function editLabel(){
		
		     $labelName = input('labelName','','trim,strip_tags');
		     $remark = input('remark','','trim,strip_tags');
			   $labelId = input('labelId','','trim,strip_tags');

// 				 $user_auth = session('user_auth');
// 				 $uid = $user_auth["uid"];
// 				 $super = $user_auth["super"];
				 
				 $data = array();
				// $data['member_id'] = $uid;
				 $data['label'] = $labelName;
			   $data['keyword'] = $remark;
				
				 $result = Db::name('tel_label')->where('id', $labelId)->update($data);
				 
				 	if($result >= 0){
				 
						return returnAjax(0,'编辑成功');
		
					}else{
	
						return returnAjax(1,'编辑失败');
					
					}
					
					
	}

	/**
	 * 删除，批量删除，接收数组
	 */
	public function delLabel(){

		$roleId = input('label_id/a','','trim,strip_tags');//接收数组
  
		$list = Db::name('tel_label')->where('id','in', $roleId)->delete();
	
		if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}
	

}













