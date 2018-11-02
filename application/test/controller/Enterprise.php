<?php
namespace app\test\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use \think\Config;
use Qiniu\json_decode;

class Enterprise extends User{

	
public function _initialize()
{
	parent::_initialize();
	
}	

//企业账户
public function account()
{
	return  $this->fetch();
}

public function test()
{
	return  $this->fetch();
}

//返回子账户的首页信息
public function getInformation(){
	
	$user_auth = session('user_auth');
	$uid = $user_auth["uid"];
	$super = $user_auth["super"];
	
	$result = Db::name('admin')
			  ->field("username,realname,money,logo,expiry_date,create_time,robot_cnt")
			  ->where('id', $uid)->find();
	
	if($result['logo'] && is_numeric($result['logo'])){
		$result['headImg'] = get_image($result['logo']);
	}else{
		$result['headImg'] = $result['logo'];
	}
 
	$result['expiry_date'] = date('Y-m-d H:i:s', $result['expiry_date']);
	$result['create_time'] = date('Y-m-d H:i:s', $result['create_time']);
	
	$where = array();
	$where['member_id'] = $uid;
	$where['bridge'] = array('EXP','IS NOT NULL');
	
	$cflist = Db::name('tel_config')->where($where)->count("id");

	$sum = array();
	$sum['member_id'] = $uid;
	$sum['status'] = ['>',0];
    $rnum = Db::name('tel_config')->where($sum)->sum('robot_cnt');
    $rnum = $result['robot_cnt'] - $rnum;
    if($rnum < 0){
		$rnum = 0;
    }
    $result['rnum'] = $rnum;

		
	$backdata = array();
	$backdata['mresult'] = $result;
	$backdata['count'] = $cflist;
	
	if($result){
		return returnAjax(0,"成功",$backdata);	
	}else{	
		return returnAjax(1,"失败");	
	}
	
}


//传入页码，返回订购充值的列表数据，分页的。
public function getorderRecharge(){
	
	$pageSize = 10;
	$page = input('page','1','trim,strip_tags');
	
	
	$startTime = input('startTime','','trim,strip_tags');
	$endDate = input('endDate','','trim,strip_tags');
	$ownerps = input('ownerps','','trim,strip_tags');
	
	$user_auth = session('user_auth');
	$uid = $user_auth["uid"];
	$super = $user_auth["super"];
	
	$where = array();
	$where["o.owner"] = $uid;
	
	if($startTime && $endDate){
		$where["o.create_time"] = ["between time",[$startTime,$endDate]];
	}
	
	
	if($ownerps){
		
	 $result = Db::name('admin')->field("id")
				->where('username', $ownerps)->find();
				
				$where["o.owner"] = $result['id'];

	}
	
		$list = Db::name('tel_order')
					->alias('o')
					->field('o.id,o.owner,o.member_id,o.mobile,o.money,o.duration,o.create_time,
					o.month_price,o.asr_price,o.asr_cnt,o.time_price,o.end_time,
					a.username as ausername,m.username as musername')
					->join('admin a','o.owner = a.id','LEFT')
					->join('member m','o.member_id = m.uid','LEFT')
					->where($where)
					->page($page,$pageSize)
					->order('o.create_time desc')
					->select();
					
		
	foreach ($list as $keys => &$item) {
	
	  if ($item['create_time'] > 0){
			$item['create_time'] = date('Y-m-d H:i:s', $item['create_time']);
		}
		else{
			$item['create_time'] = "";
		}
	
		
		if ($item['end_time'] > 0){
			$item['end_time'] = date('Y-m-d H:i:s', $item['end_time']);
		}
		else{
			$item['end_time'] = "";
		}
	}
	
	$where = array();
	$where["owner"] = $uid;
	
		
		$count = Db::name('tel_order')->where($where)->sum('money');
		
		$pagecount = Db::name('tel_order')->where($where)->count('id');
	
	
	//$count = Db::name('tel_order')->where($where)->count('id');
	$pageCount = ceil($pagecount/$pageSize);
	
	$back = array();
	$back['total'] = $count;
	$back['Nowpage'] = $page;
	$back['list'] = $list;
	$back['page'] = $pageCount;
	
	if($list){
		return returnAjax(0,"获取数据成功",$back);
	}else{
		return returnAjax(1,"失败");
	}
	

}


//传入页码，返回消耗流水的列表数据
public function getConsume(){

	$pageSize = 10;
	$page = input('page','1','trim,strip_tags');
	
	$endTime = input('endTime','','trim,strip_tags');
	$startDate = input('startDate','','trim,strip_tags');
	$personal = input('personal','','trim,strip_tags');
	$status = input('status','','trim,strip_tags');

	$user_auth = session('user_auth');
	$uid = $user_auth["uid"];
	$super = $user_auth["super"];

	$where = array();
	$where["t.owner"] = $uid;
	
	if($startDate && $endTime){
		$where["t.create_time"] = ["between time",[$startDate,$endTime]];
	}
	
	if($status){
		$where["t.status"] = $status;
	}
	
	if($personal){
		
	 $result = Db::name('admin')->field("id")
				->where('username', $personal)->find();
				
				$where["t.owner"] = $result['id'];

	}
	


	$list = Db::name('tel_deposit')
				->alias('t')
				->field('t.id,t.owner,t.menoy,t.type,t.status,t.create_time,t.deposit_type,a.username')
				->join('admin a','t.owner = a.id','LEFT')
				->where($where)
				->page($page,$pageSize)
				->order('t.create_time desc')
				->select();
				
	$where = array();
	$where["owner"] = $uid;
	
	$count = Db::name('tel_deposit')->where($where)->sum('menoy');
	
	$pagecount = Db::name('tel_deposit')->where($where)->count('id');

	$pageCount = ceil($pagecount/$pageSize);

	$back = array();
	$back['total'] = $count;
	$back['Nowpage'] = $page;
	$back['list'] = $list;
	$back['page'] = $pageCount;

	if($list){
		return returnAjax(0,"获取数据成功",$back);
	}else{
		return returnAjax(1,"失败");
	}


}



}













