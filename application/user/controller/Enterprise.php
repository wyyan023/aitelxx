<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use \think\Config;
use Qiniu\json_decode;
//后台用户
use app\common\controller\AdminData;
//消费统计
use app\common\controller\ConsumptionStatistics;
//充值记录
use app\common\controller\RechargeRecord;

class Enterprise extends User{

	
	public function _initialize()
	{
		parent::_initialize();
		
	}	
	
	//企业账户
	public function account()
	{
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$AdminData = new AdminData();
		$user_list = $AdminData->get_find_users($uid);
		array_unshift($user_list, ['username'=>'自己', 'id' => $user_auth['uid']]);
		$this->assign('user_list', $user_list);
		return  $this->fetch();
	}

	//测试
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
			
		 $result = Db::name('admin')
								->field("id")
								->where('username', $ownerps)
								->find();
					
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
		
		$AdminData = new AdminData();
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
			//用户角色
			$item['role_name'] = $AdminData->get_role_name($item['owner']);
			
			//话单来源用户的名称
			$item['member_name'] = $AdminData->get_username($item['member_id']);
			
		}
		
		$count = Db::name('tel_order');
		$pagecount = Db::name('tel_order');
		
		$count = $count->where('owner', $uid);
		$pagecount = $pagecount->where('owner', $uid);
		
		
		if(!empty($startTime)){
			$pagecount = $pagecount->where('create_time', '>=', strtotime($startTime));
		}
		if(!empty($endDate)){
			$pagecount = $pagecount->where('create_time', '<=', strtotime($endDate));
		}
		$pagecount = $pagecount->count('id');
		$count = $count->sum('money');
		
		//$count = Db::name('tel_order')->where($where)->count('id');
		$pageCount = ceil($pagecount/$pageSize);
		
		$back = array();
		$back['total'] = $count;
		$back['Nowpage'] = $page;
		$back['list'] = $list;
		$back['page'] = $pageCount;
		
		return returnAjax(0,"获取数据成功",$back);
	}


	//传入页码，返回消耗流水的列表数据
	public function getConsume(){
	
		$pageSize = 10;
		$page = input('page','1','trim,strip_tags');
		
		$endTime = input('endTime','','trim,strip_tags');
		$startDate = input('startDate','','trim,strip_tags');
	
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
	
		$AdminData = new AdminData();
		// create_time
		
		$list = Db::name('tel_deposit')
					->where('owner', $uid)
					// ->whereOr('recharge_member_id', $uid)
					->page($page,$pageSize);
		//收入
		$income = Db::name('tel_deposit')
							->where('owner', $uid);
		//支出
		$expenditure = Db::name('tel_deposit')
									->where('recharge_member_id', $uid);
		if(!empty($startDate)){
			$startDate = strtotime($startDate);
			$list = $list->where('create_time', '>=', $startDate);
			$income = $income->where('create_time', '>=', $startDate);
			$expenditure = $expenditure->where('create_time', '>=', $startDate);
		}
		if(!empty($endTime)){
			$endTime = strtotime($endTime);
			$list = $list->where('create_time', '<=', $endTime);
			$income = $income->where('create_time', '<=', $endTime);
			$expenditure = $expenditure->where('create_time', '<=', $endTime);
		}
		$list = $list->order('create_time desc')
								->select();
		foreach($list as $key=>$value){
			$list[$key]['member_name'] = $AdminData->get_username($value['owner']);
			$list[$key]['recharge_member_name'] = $AdminData->get_username($value['recharge_member_id']);
			$list[$key]['create_time'] = date('Y-m-d H:i:s', $value['create_time']);
		}
					
		
		$income = $income->sum('menoy');
		$income = $income?$income:0;
		$expenditure = $expenditure->sum('menoy');
		$expenditure = $expenditure?$expenditure:0;
		
		// $count = Db::name('tel_deposit')->where($where)->sum('menoy');
		
		$pagecount = Db::name('tel_deposit')
									->where('owner', $uid)
									->whereOr('recharge_member_id', $uid)
									->count('id');
	
		$pageCount = ceil($pagecount/$pageSize);
	
		$back = array();
		//收入
		$back['income'] = $income;
		//支出
		$back['expenditure'] = $expenditure;
		//当前页码
		$back['Nowpage'] = $page;
		//数据
		$back['list'] = $list;
		//总页码
		$back['page'] = $pageCount;
		return returnAjax(0,"获取数据成功",$back);
	}


	/**
	 * 获取历史消费统计
	 * 
	 * @param int $member_id
	 * @param string $start_time 开始时间
	 * @param string $end_tiem 结束时间
	 * @param int $page 
	 * @return Json
	*/
	public function get_consumption_statistics_api()
	{
		if(IS_POST){
			$user_auth = session('user_auth');
			$uid = $user_auth['uid'];
			$user_auth_sign = session('user_auth_sign');
			if(empty($user_auth_sign) || empty($user_auth)){
				return returnAjax(2, 'error', '未登陆');
			}
			$page = input('page', '', 'trim,strip_tags');
			$start_time = input('start_time', '', 'trim,strip_tags');
			$end_time = input('end_time', '', 'trim,strip_tags');
			$member_id = input('member_id', '', 'trim,strip_tags');
			$args = [];
			if(!empty($start_time)){
				$args['start_time'] = $start_time;
			}
			if(!empty($end_time)){
				$args['end_time'] = $end_time;
			}
			if(!empty($member_id)){
				$args['member_id'] = $member_id;
			}
			$ConsumptionStatistics = new ConsumptionStatistics();
			$result = [];
			$result['data'] = $ConsumptionStatistics->gets($uid, $args, $page);
			//汇总消费金额
			$result['summary_consumption'] = $ConsumptionStatistics->summary_consumption($uid, $args);
			//汇总识别次数
			$result['summary_distinguish_count'] = $ConsumptionStatistics->summary_distinguish_count($uid, $args);
			//总行数
			$result['count'] = $ConsumptionStatistics->get_count($uid, []);
			return returnAjax(0, 'success', $result);
		}
	}
	
	/**
	 * 获取充值记录
	 * 
	 * @param int $page 
	 * @return json
	*/
	public function get_recharge_record_api()
	{
		if(IS_POST){
			$user_auth = session('user_auth');
			$uid = $user_auth['uid'];
			$user_auth_sign = session('user_auth_sign');
			$RechargeRecord = new RechargeRecord();
			$page = input('page', '', 'trim,strip_tags');
			$start_time = input('start_time', '', 'trim,strip_tags');
			$end_time = input('end_time', '', 'trim,strip_tags');
			$member_id = input('member_id', '', 'trim,strip_tags');
			$args = [];
			if(!empty($start_time)){
				$args['start_time'] = $start_time;
			}
			if(!empty($end_time)){
				$args['end_time'] = $end_time;
			}
			if(!empty($member_id)){
				$args['member_id'] = $member_id;
			}
			$datas = $RechargeRecord->gets($uid, $args, $page);
			$summary_money = $RechargeRecord->summary_money($uid, $args);
			return returnAjax(0, 'success', ['list' => $datas, 'summary_money' => $summary_money]);
		}
	}
	
	/**
	 * 获取今天消费的统计
	 * 
	 * @param int $member_id
	 * @return Json
	*/
	public function get_today_consumption_statistic_api()
	{
		$user_auth = session('user_auth');
		$uid = $user_auth['uid'];
		$user_auth_sign = session('user_auth_sign');
		if(empty($user_auth_sign) || empty($user_auth)){
			return returnAjax(2, 'error', '未登陆');
		}
		$ConsumptionStatistics = new ConsumptionStatistics();
		$result = [
			'distinguish_count'	=> $ConsumptionStatistics->get_today_distinguish_count($uid),
			'cost'	=>	$ConsumptionStatistics->get_today_cost($uid)
		];
		return returnAjax(0, 'success', $result);
	}


}













