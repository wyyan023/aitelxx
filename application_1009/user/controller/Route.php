<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use PHPExcel_IOFactory;
use PHPExcel;
use PHPExcel_Style_NumberFormat;
use Qiniu\Storage\UploadManager;
use Qiniu\Auth;

class Route extends User{

 
	public function index(){
	
	
		$order = htmlspecialchars_decode(input('order','','trim,strip_tags'));
		$sender = htmlspecialchars_decode(input('sender','','trim,strip_tags'));
		$receiver = htmlspecialchars_decode(input('receiver','','trim,strip_tags'));
		$taskStatus = (string)input('taskStatus','','trim,strip_tags');
		$startDate = input('startDate','','trim,strip_tags');
		$endTime = input('endTime','','trim,strip_tags');
		$expressName = htmlspecialchars_decode(input('expressName','','trim,strip_tags'));
		$distributiontype = input('distributiontype','','trim,strip_tags');
	
		$where = array();
		if($order){
			$where['id'] = $order;
		}
		if($sender){
			$where['from_mobile'] = $sender;
		}
		if($receiver){
			$where['to_mobile'] = $receiver;
		}
		if($taskStatus){
			$where['status'] = $taskStatus;
		}
		if($distributiontype == 1){
			$where['distribution_type'] = $distributiontype;
		}else if($distributiontype == '0'){
			$where['distribution_type'] = $distributiontype;
		}
	
		//	var_dump($where);exit;
	
		$str = '';
		if($expressName){
			$exps =  Db::name('member')->field('uid')->where('username', $expressName)->select();
	
			$records = "(";
			foreach ($exps as $kkk=>$val){
				$records .= $val['uid'].",";
			}
			$records = rtrim($records, ',');
			$records .= ")";
			if($exps){
				$str .= 'express_id IN '.$records.'';
			}
		}
	
		if($startDate && $endTime){
	
			$list = Db::name('express')->field('id,from_memer_id,from_mobile,to_mobile,create_time,express_id,
		    goods_type,express_type,status,distribution_type')->where($where)->where($str)->order('create_time desc')
			    ->where('express_type', 2)->whereTime('create_time', 'between', [$startDate, $endTime])->paginate(10, false, array('query'  =>  $this->param));
	
		}else {
	
			$list = Db::name('express')->field('id,from_memer_id,from_mobile,to_mobile,create_time,express_id,
		    goods_type,express_type,status,distribution_type')->where($where)->where($str)
			    ->where('express_type', 2)->order('create_time desc')->paginate(10, false, array('query'  =>  $this->param));
	
		}
	
		$page = $list->render();
		$list = $list->toArray();
	
		//var_dump($list['data']);
	
		foreach ($list['data'] as $k=>$v){
			$drvlist =  Db::name('member')->field('nickname,username,open_id')->where('uid', $v['from_memer_id'])->find();
	
			if($drvlist['nickname']){
	
				$list['data'][$k]['musername']=$drvlist['nickname'];
	
			}else{
	
				$fanslist =  Db::name('fans')->field('nickname')->where('open_id', $drvlist['open_id'])->find();
				if($fanslist['nickname']){
					$list['data'][$k]['musername'] = $fanslist['nickname'];
				}else{
					$list['data'][$k]['musername'] = $drvlist['username'];
				}
	
			}
	
	
			$explist =  Db::name('member')->field('nickname,username,real_name')->where('uid', $v['express_id'])->find();
	
			if($explist['nickname']){
				$list['data'][$k]['expusername']=$explist['nickname'];
			}else if($explist['username']){
				$list['data'][$k]['expusername']=$explist['username'];
			}else if($explist['real_name']){
				$list['data'][$k]['expusername']=$explist['real_name'];
			}else{
				$list['data'][$k]['expusername']="暂无派送人";
			}
	
	
		}
	
		// 模板变量赋值
	
		//var_dump($list['data']);exit;
	
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
	
		return $this->fetch();
	
	}
	
	//任务管理的查看详情
	public function expressDetails(){
	
		$id = input('id');
		$list = Db::name('express')->where('id',$id)->find();
	
		$explist =  Db::name('member')->field('username')->where('uid', $list['express_id'])->find();
		$list['expusername']=$explist['username'];
		$serlist =  Db::name('member')->field('username,nickname,real_name')->where('uid', $list['from_memer_id'])->find();
		$list['serusername']=$serlist['nickname'];
		$cancellist =  Db::name('member')->field('username')->where('uid', $list['cancel_member'])->find();
		$list['cancelname']=$cancellist['username'];
	
		$piclist = Db::name('picture')->where('id', $list['goods_pic'])->find();
		$list['goods_img'] = ltrim($piclist['path'],".");
	
		$picreceipt = Db::name('picture')->where('id', $list['goods_receipt_pic'])->find();
		$list['goods_receipt_img'] = ltrim($picreceipt['path'],".");
	
		$imglist = array();
		if($list['goods_send_pic']){
			$temp = explode(" ",$list['goods_send_pic']);
	
			foreach ($temp as $ak => $av){
				/* $picture = Db::name('Picture')->where(array('status' => 1, 'id' => $av))->find();
				 $imglist[$ak] = config('res_url').$picture["path"]; */
				$imglist[$ak] = ltrim(get_image($av),".");
			}
		}
		$list['imglist'] = $imglist;
	
		//var_dump($piclist,$list);exit;
	
		$this->assign('list', $list);
	
		return $this->fetch();
	}
	
	
	//路线管理
	public function route()
	{
	
	
		$keyword = input('keyword');
	
		if ($keyword) {
			$list = Db::name('route')->where('username like "%'.$keyword.'%" or mobile like "%'.$keyword.'%"')->paginate(10, false, array('query'  =>  $this->param));
	
		} else {
			$list = Db::name('route')->paginate(10, false, array('query'  =>  $this->param));
		}
	
		$page = $list->render();
		$list = $list->toArray();
	
		foreach ($list['data'] as $k=>$v){
			$drvlist =  Db::name('picture')->field('path')->where('id', $v['photos'])->find();
			$list['data'][$k]['photos'] = ltrim($drvlist['path'],".");
		}
	
		// var_dump($list['data']);exit;
	
		// 模板变量赋值
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
	
		return $this->fetch();
	}
	
	//添加路线
	public function addRoute(){
		if(IS_POST){
	
			$driver=array();
			$driver['nickname'] = input('nickname','','trim,strip_tags');
			$driver['mobile'] = input('phonenumber','','trim,strip_tags');
			$driver['sex'] = input('sex','','trim,strip_tags');
			$driver['photos'] = input('photos','','trim,strip_tags');
			$driver['length'] = input('length','','trim,strip_tags');
	
			$driver['models'] = input('models','','trim,strip_tags');
			$driver['tonnage'] = input('tonnage','','trim,strip_tags');
			$driver['start_off'] = input('startoff','','trim,strip_tags');
			$driver['objective'] = input('objective','','trim,strip_tags');
			$driver['status'] = 1;
			$driver['type'] = 0;
				
			$driver['user_id'] = $_SESSION["user"]["user_auth"]["uid"];
				
				
			//var_dump($driver,$driver);
			//	exit;
				
			$result = Db::name('route')->insertGetId($driver);
				
				
			if($result >=0 ){
				return returnAjax(0,"成功");
					
			}else{
				return returnAjax(1,"失败");
			}
	
				
		}else{
				
			$picdata=array();
			$this->assign('picdata', $picdata);
	
			$this->assign('current', '添加');
			return $this->fetch();
				
		}
	
	}
	
	//编辑路线
	public function editRoute(){
	
		if(IS_POST){
			$driver=array();
			$driver['nickname'] = input('nickname','','trim,strip_tags');
			$driver['mobile'] = input('phonenumber','','trim,strip_tags');
			$driver['sex'] = input('sex','','trim,strip_tags');
			$driver['photos'] = input('photos','','trim,strip_tags');
			$driver['length'] = input('length','','trim,strip_tags');
	
			$driver['models'] = input('models','','trim,strip_tags');
			$driver['tonnage'] = input('tonnage','','trim,strip_tags');
			$driver['start_off'] = input('startoff','','trim,strip_tags');
			$driver['objective'] = input('objective','','trim,strip_tags');
	
			$route = input('routeid','','trim,strip_tags');
	
			$result = Db::name('route')->where('id',$route)->update($driver);
	
			if($result >=0 ){
				return returnAjax(0,"成功");
			}else{
				return returnAjax(1,"失败");
			}
				
		}else{
				
				
			$id = input('id');
			$routelist =  Db::name('route')->where('id', $id)->find();
	
			$list = Db::name('picture')->field('path')->where('id', $routelist['photos'])->find();
	
			$picdata=array();
	
			if($list['path']){
				$picdata['photos']=$routelist['photos'];
			}
	
			$this->assign('picdata', $picdata);
			$this->assign('routelist', $routelist);
			$this->assign('current', '编辑');
				
			return $this->fetch('addroute');
				
		}
	
	}
	
	
	//修改专线状态
	public function setstatus(){
	
		$id = input('routeId','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
	
		if($status){
			$setval = 0;
		}else{
			$setval = 1;
		}
		$data = ['status' => $setval];
	
		$pageres = Db::name('route')->where('id',$id)->update($data);
	
		if($pageres){
			$return['msg'] = "修改成功。";
			$return['key'] = 0;
			echo json_encode($return);
		}else{
			$return['msg'] = "修改失败。";
			$return['key'] = 1;
			echo json_encode($return);
		}
	
	}
	
	//删除专线
	public function delRoute(){
	
		$item_id = input('routeId/a','','trim,strip_tags');
	
		$list = Db::name('route')->where('id','in', $item_id)->delete();
			
		if(!$list){
			echo "删除失败。";
		}
	}
	
	
	

}