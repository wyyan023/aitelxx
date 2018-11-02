<?php
namespace app\common\controller;

use think\Db;
//日志
use app\common\controller\Log;


//会员用户数据处理类
class AdminData extends Base{
  
  /**
	 * 获取用户的上级、上上级等用户的ID
	 * 
	 * @param int $user_id
	 * @return array
	*/
	public function get_parents_user_id($user_id)
	{
	  if(empty($user_id)){
	    return [];
	  }
	  $pids = [];
	  $pid = $this->get_parent_user_id($user_id);
	  if(!empty($pid)){
	    $pids[] = $pid;
	  }
	  while(!empty($pid)){
	    $pid = $this->get_parent_user_id($pid);
	    if(!empty($pid)){
	      $pids[]  = $pid;
	    }
	  }
	  return $pids;
	}
	
	/**
	 * 获取子账户ID
	 * 
	 * @param int $member_id
	 * @return array
	*/
	public function get_find_member_ids($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$result = Db::name('admin')
						->field('id')
						->where('pid', $member_id)
						->select();
		$ids = [];
		foreach($result as $key=>$value){
			$ids[] = $value['id'];
		}
		return $ids;
	}
	
	/**
	 * 获取上级用户ID
	 * 
	 * @param int $user_id 用户ID
	 * @return int 
	*/
	public function get_parent_user_id($user_id)
	{
	  if(empty($user_id)){
	    return false;
	  }
	  $pid = Db::name('admin')
	          ->where('id', $user_id)
	          ->value('pid');
	  return $pid;
	}
	/**
	 * 获取子账户
	 * 
	 * @param int $member_id
	 * @return array
	*/
	public function get_find_users($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$datas = Db::name('admin')
							->field('id,username')
							->where('pid', $member_id)
							->select();
		return $datas;
	}
  /**
   * 获取用户角色名称
   * 
   * @param int $member_id
   * @return string 
  */
  public function get_role_name($member_id)
  {
  	if(empty($member_id)){
  		return false;
  	}
  	$role_name = Db::name('admin')
									->alias('a')
									->join('admin_role', 'a.role_id = admin_role.id', 'LEFT')
									->where('a.id', $member_id)
									->value('admin_role.name');
		return $role_name;
  }
  /**
	 * 获取用户名称
	 * 
	 * @param int $member_id
	 * @return string
	*/
	public function get_username($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$username = Db::name('admin')
								->where('id', $member_id)
								->value('username');
		return $username;
	}
	
	/**
	 * 获取用户信息
	 * 
	 * @param int $member_id
	 * return array
	*/
	public function get_user_data($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$user_data = Db::name('admin')
									->alias('a')
									->field('a.id,a.username,a.money,a.robot_cnt,ar.name as role_name')
									->join('admin_role ar', 'ar.id = a.role_id', 'LEFT')
									->where('a.id', $member_id)
									->find();
		return $user_data;
	}
	
	/**
	 * 获取当前运行的机器人数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_run_robot_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('tel_config')
							->where([
								'member_id'	=>	$member_id,
								'status'	=>	1,
							])
							->sum('robot_cnt');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 获取待拨打的电话
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_wait_call_phone_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('tel_config')
							->alias('tc')
							->join('member m', 'm.task = tc.task_id', 'LEFT')
							->where([
								'tc.status'	=>	1,
								'tc.member_id'	=>	$member_id,
								'm.status'	=>	['in', [0,1]]
							])
							->count('m.uid');
		// $count = Db::name('member')
		// 					->where([
		// 						'owner'	=>	$member_id,
		// 						'last_dial_time'	=>	0
		// 					])
		// 					->count();
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 获取用户可用的机器人数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_member_usable_robot_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('admin')
							->where('id', $member_id)
							->value('usable_robot_cnt');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 获取当前运行的任务数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_run_task_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('tel_config')
							->where([
								'member_id'	=>	$member_id,
								'status'	=>	1
							])
							->count();
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 获取用户本月充值的金额
	 * 
	 * @param int $member_id
	 * @return float
	*/
	public function get_month_recharge_money($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$year = date('Y');
		$month = date('m');
		//开始时间
		$start_time = strtotime($year . '-' . $month);
		
		$menoy = Db::name('tel_deposit')
							->where([
								'owner'	=>	$member_id,
								'create_time'	=>	['>=', $start_time],
							])
							->sum('menoy');
		if(empty($menoy)){
			return 0;
		}
		return $menoy;
	}
	/**
	 * 获取本月消费的金额
	 * 
	 * @param int $member_id
	 * @return float
	*/
	public function get_month_consumption_money($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$year = date('Y');
		$month = date('m');
		//开始时间
		$start_time = strtotime($year . '-' . $month);
		$menoy = Db::name('tel_order')
							->where([
								'owner'	=>	$member_id,
								'create_time'	=>	['>=', $start_time],
							])
							->sum('money');
		if(empty($menoy)){
			return 0;
		}
		return $menoy;
	}
	
	/**
	 * 给子账户分配的机器人数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_find_distribution_robot_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('robot_distribution')
							->where([
								'pid'	=>	$member_id,
								'state'	=>	1
							])
							->sum('number');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 获取所有子账户正在使用的机器人数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_find_member_now_use_robot_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		//获取所有子账户的ID
		$find_ids = $this->get_find_member_ids($member_id);
		$count = Db::name('tel_config')
							->where([
								'member_id'	=>	['in', $find_ids],
								'status'	=>	2
							])
							->sum('robot_cnt');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 获取所有子账户的机器人总数
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_find_member_robot_total_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		//获取所有子账户的ID
		$find_ids = $this->get_find_member_ids($member_id);
		$count = Db::name('admin')
							->where('id', 'in', $find_ids)
							->sum('robot_cnt');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	
	/**
	 * 获取销售用户的数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_sale_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('admin')
							->where([
								'pid'	=>	$member_id,
								'user_type'	=>	1
							])
							->count();
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	
	/**
	 * 获取用户的语音识别费用
	 * 
	 * @param int $member_id
	 * @return float
	*/
	public function get_asr_price($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$asr_price = Db::name('admin')
									->where('id', $member_id)
									->value('asr_price');
		if(empty($asr_price)){
			return 0;
		}
		return $asr_price;
	}
	
	/**
	 * 验证用户是否符合开启任务的条件
	 * 
	 * @description 首先验证当前用户余额是否足够 如果不足 提醒欠费(返回false) 反之 追溯上一层级的用户余额是否足够 类推到运营商为止(包括运营商) 如果在都足够都情况下 返回true
	 * @param int $member_id
	 * @return bool
	*/
	public function verify_member_open_task_condition($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$user_data = Db::name('admin')
									->alias('a')
									->join('admin_role ar', 'a.role_id = ar.id', 'LEFT')
									->field('a.id,a.money,a.credit_line,a.pid,ar.name as role_name')
									->where('a.id', $member_id)
									->find();
		
		while(!empty($user_data['pid']) && $user_data['role_name'] != '管理员'){
			Log::info(json_encode($user_data));
			//验证当前余额(余额+透支额度)是否足够
			if(($user_data['money'] + $user_data['credit_line']) <= 0){
				return false;
			}
			
			//追溯上一层级的用户
			$user_data = Db::name('admin')
									->alias('a')
									->join('admin_role ar', 'a.role_id = ar.id', 'LEFT')
									->field('a.id,a.money,a.credit_line,a.pid,ar.name as role_name')
									->where('a.id', $user_data['pid'])
									->find();
		}
		
		if($user_data['pid'] == 0 && $user_data['role_name'] != '管理员'){
			//验证当前余额(余额+透支额度)是否足够
			if(($user_data['money'] + $user_data['credit_line']) <= 0){
				return false;
			}
		}
		return true;
	}

	
	
}