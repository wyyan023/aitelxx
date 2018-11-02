<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;

class Report extends User{

	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();

	}
	
	
	//话术场景主界面
	public function index()
	{
  
	    $where = array();
		$startDate = input('startDate','','trim,strip_tags');
		$endTime = input('endTime','','trim,strip_tags');

		
		if($startDate && $endTime){
	
		    $where['last_dial_time'] = ["between time",[$startDate,$endTime]];
				
		}
	
	
//	   	Db::execute("SELECT FROM_UNIXTIME( S.REG_TIME,  '%Y-%m-%d' ) , 
//STATUS , COUNT( uid ) AS NUM
//FROM rk_member S
//WHERE STATUS =2
//GROUP BY FROM_UNIXTIME( S.REG_TIME,  '%Y-%m-%d' ) , 
//STATUS ");
//					
	
	
	
		$list = Db::name('member')
		        ->field('uid,FROM_UNIXTIME(last_dial_time, "%Y-%m-%d") AS last_dial_time,duration,task,sum(duration) AS duration,count(uid) AS dialing,COUNT(status=2) as connection')
				->where($where)
				->order('uid desc')
                ->group('last_dial_time')
                
			    ->paginate(10, false, array('query'  =>  $this->param));
				
		$page = $list->render();
		$list = $list->toArray();
		
	   //var_dump($list['data']);
		//exit;
//		
//		foreach ($list['data'] as $k=>$v){
//	
//		   $list['data'][$k]["duration"] = $v["sum(duration)"];
//         $list['data'][$k]["dialing"] = $v["count(uid)"];
//	           
//      }
//     
//      var_dump($list['data']);
//		exit;
//		
		
		$this->assign('list', $list['data']);
		$this->assign('page', $page);

		return $this->fetch();
		
	}
	

}