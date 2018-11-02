<?php
namespace app\common\controller;

use think\Db;
use app\common\controller\Log;
use app\common\controller\AdminData;

//消费统计处理类
class ConsumptionStatistics extends Base{
	
	/**
	 * 写入
	 * 
	 * @param int $member_id 用户
	 * @param int $call_count 呼叫次数
	 * @param int $charging_duration 计费时长(分钟)
	 * @param int $connect_duration 通话时长
	 * @param float $money 金额
	 * @param int $distinguish_count 识别次数
	 * @retrun bool
	*/
	public function insert($member_id, $call_count, $charging_duration, $connect_count, $connect_duration, $money, $distinguish_count)
	{
		if(empty($member_id)){
			return false;
		}
		if(empty($money)){
			$money = 0;
		}
		if(empty($distinguish_count)){
			$distinguish_count = 0;
		}
		if(empty($call_count)){
			$call_count = 0;
		}
		if(empty($charging_duration)){
			$charging_duration = 0;
		}
		if(empty($connect_duration)){
			$connect_duration = 0;
		}
		if(empty($connect_count)){
			$connect_count = 0;
		}
		$create_time = time();
		$result = Db::name('consumption_statistics')
							->insert([
								'date'	=>	date("Y-m-d", strtotime('-1 day')),
								'member_id'	=>	$member_id,
								'call_count' => $call_count,
								'charging_duration'	=>	$charging_duration,
								'connect_count'	=>	$connect_count,
								'connect_duration'	=>	$connect_duration,
								'money'	=>	$money,
								'distinguish_count' => $distinguish_count,
								'create_time'	=>	$create_time
							]);
		if(!empty($result)){
			return true;
		}
		return false;
	}
	
	
	
	/**
	 * 获取数据
	 * 
	 * @param int $member_id
	 * @param array $args
	 * @param int $page
	 * @return array
	*/
	public function gets($member_id, $args = [], $page = 1)
	{
		$datas = Db::name('consumption_statistics');
		foreach($args as $key=>$value){
			if($key === 'start_time'){
				$datas = $datas->where('date', '>=', $value);
			}else if($key === 'end_time'){
				$datas = $datas->where('date', '<=', $value);
			}else if($key === 'member_id'){
				$datas = $datas->where('member_id', $value);
			}
		}
		$AdminData = new AdminData();
		$ids = [];
		if(isset($args['member_id']) === false){
			$ids[] = $member_id;
			$find_ids = $AdminData->get_find_member_ids($member_id);
			$ids = array_merge($ids, $find_ids);
			$args['member_id'] = ['in', $ids];
			$datas = $datas->where('member_id', 'in', $ids);
		}else{
			$ids[] = $args['member_id'];
		}
		$users = [];
		foreach($ids as $key=>$value){
			$users[$value] = $AdminData->get_user_data($value);
		}
		$datas = $datas->page($page.',10')
							->select();
		foreach($datas as $key=>$value){
			//用户名称
			$datas[$key]['member_name'] = $users[$value['member_id']]['username'];
			//角色名称
			$datas[$key]['role_name'] = $users[$value['member_id']]['role_name'];
			//余额
			$datas[$key]['user_money'] = $users[$value['member_id']]['money'];
			//机器人数量
			$datas[$key]['robot_cnt'] = $users[$value['member_id']]['robot_cnt'];
		}
		return $datas;
	}
	
	/**
	 * 获取总行数
	 * 
	 * @param int $member_id
	 * @param array $args
	 * @return int 
	*/
	public function get_count($member_id, $args = [])
	{
		if(empty($member_id)){
			return false;
		}
		$ids = [];
		$ids[] = $member_id;
		$AdminData = new AdminData();
		$find_ids = $AdminData->get_find_member_ids($member_id);
		$ids = array_merge($ids, $find_ids);
		$args['member_id'] = ['in', $ids];
		$count = Db::name('consumption_statistics')
							->where($args)
							->count('id');
		return $count;
	}
	
	/**
	 * 汇总消费金额
	 * 
	 * @param int $member_id
	 * @param array $args 筛选参数
	 * @return float
	*/
	public function summary_consumption($member_id, $args = [])
	{
		if(empty($member_id)){
			return false;
		}
		$money = Db::name('consumption_statistics');
		foreach($args as $key=>$value){
			if($key === 'start_time'){
				$money = $money->where('date', '>=', $value);
			}else if($key === 'end_time'){
				$money = $money->where('date', '<=', $value);
			}else if($key === 'member_id'){
				$money = $money->where('member_id', $value);
			}
		}
		$AdminData = new AdminData();
		if(isset($args['member_id']) === false){
			$ids = [];
			$ids[] = $member_id;
			$find_ids = $AdminData->get_find_member_ids($member_id);
			$ids = array_merge($ids, $find_ids);
			$args['member_id'] = ['in', $ids];
			$money = $money->where('member_id', 'in', $ids);
		}
		$money = $money->sum('money');
		return $money;
	}
	/**
	 * 汇总识别次数
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function summary_distinguish_count($member_id, $args = [])
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('consumption_statistics');
		foreach($args as $key=>$value){
			if($key === 'start_time'){
				$count = $count->where('date', '>=', $value);
			}else if($key === 'end_time'){
				$count = $count->where('date', '<=', $value);
			}else if($key === 'member_id'){
				$count = $count->where('member_id', $value);
			}
		}
		$AdminData = new AdminData();
		if(isset($args['member_id']) === false){
			$ids = [];
			$ids[] = $member_id;
			$find_ids = $AdminData->get_find_member_ids($member_id);
			$ids = array_merge($ids, $find_ids);
			$args['member_id'] = ['in', $ids];
			$count = $count->where('member_id', 'in', $ids);
		}
		$count = $count->sum('distinguish_count');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	/**
	 * 汇总呼叫次数
	 * 
	 * @param int $member_id
	 * @param array $args
	 * @return int
	*/
	public function summary_call_count($member_id, $args = [])
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('consumption_statistics');
		foreach($args as $key=>$value){
			if($key === 'start_time'){
				$count = $count->where('date', '>=', $value);
			}else if($key === 'end_time'){
				$count = $count->where('date', '<=', $value);
			}else if($key === 'member_id'){
				$count = $count->where('member_id', $value);
			}
		}
		$AdminData = new AdminData();
		if(isset($args['member_id']) === false){
			$ids = [];
			$ids[] = $member_id;
			$find_ids = $AdminData->get_find_member_ids($member_id);
			$ids = array_merge($ids, $find_ids);
			$args['member_id'] = ['in', $ids];
			$count = $count->where('member_id', 'in', $ids);
		}
		$count = $count->sum('call_count');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	
	/**
	 * 汇总接通次数
	 * 
	 * @param int $member_id
	 * @param array $args
	 * @return int 
	*/
	public function summary_connect_count($member_id, $args = [])
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('consumption_statistics');
		foreach($args as $key=>$value){
			if($key === 'start_time'){
				$count = $count->where('date', '>=', $value);
			}else if($key === 'end_time'){
				$count = $count->where('date', '<=', $value);
			}else if($key === 'member_id'){
				$count = $count->where('member_id', $value);
			}
		}
		$AdminData = new AdminData();
		if(isset($args['member_id']) === false){
			$ids = [];
			$ids[] = $member_id;
			$find_ids = $AdminData->get_find_member_ids($member_id);
			$ids = array_merge($ids, $find_ids);
			$args['member_id'] = ['in', $ids];
			$count = $count->where('member_id', 'in', $ids);
		}
		$count = $count->sum('connect_count');
		if(empty($count)){
			return 0;
		}
		return $count;
	}
	
	
		
	/**
	 * 计算用户咋天的总消费额
	 * 
	 * @param int $member_id
	 * @return float
	*/
	public function get_yesterday_cost($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$yesterday = date("Y-m-d", strtotime('-1 day'));
		$start_time = strtotime($yesterday);
		$end_time = $start_time + (24 * 3600);
		$sum = Db::name('tel_order')
						->where('owner', $member_id)
						->where('create_time', '>=', $start_time)
						->where('create_time', '<=', $end_time)
						->sum('money');
		if(empty($sum)){
			return 0;
		}
		return $sum;
	}
	
	/**
	 * 计算用户今天的消费金额
	 * 
	 * @param int $member_id
	 * @return float
	*/
	public function get_today_cost($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$today = date("Y-m-d");
		$start_time = strtotime($today);
		$sum = Db::name('tel_order')
						->where([
							'owner'	=>	$member_id,
							'create_time'	=>	['>=', $start_time],
						])
						->sum('money');
		if(empty($sum)){
			return 0;
		}
		return $sum;
	}
	
	/**
	 * 计算用户咋天总的识别次数
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_yesterday_distinguish_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$yesterday = date("Y-m-d", strtotime('-1 day'));
		$start_time = strtotime($yesterday);
		$end_time = $start_time + (24 * 3600);
		$sum = Db::name('tel_order')
						->where('owner', $member_id)
						->where('create_time', '>=', $start_time)
						->where('create_time', '<=', $end_time)
						->sum('asr_cnt');
		if(empty($sum)){
			return 0;
		}
		return $sum;
	}
	
	/**
	 * 计算用户昨天的呼叫总数
	 * 
	 * @param int $member_id
	 * @return int 
	*/
	public function get_yesterday_call_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$yesterday = date("Y-m-d", strtotime('-1 day'));
		$start_time = strtotime($yesterday);
		$end_time = $start_time + (24 * 3600);
		$count = Db::name('member')
							->where('owner', $member_id)
							->where('status', 2)
							->where('reg_time', '>=', $start_time)
							->where('reg_time', '<=', $end_time)
							->count('1');
		return $count;
	}
	
	/**
	 * 计算用户今天的呼叫总数
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_call_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$time = strtotime(date('Y-m-d'));
		$count = Db::name('member')
							->where('owner', $member_id)
							->where('status', 2)
							->where('reg_time', '>=', $time)
							->count('1');
		return $count;
	}
	
	/**
	 * 计算用户昨天计费时长(分钟)
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_yesterday_charging_duration($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$yesterday = date("Y-m-d", strtotime('-1 day'));
		$start_time = strtotime($yesterday);
		$end_time = $start_time + (24 * 3600);
		$sql = '
			SELECT 
				sum(ceil(duration/60)) as charging_duration
			FROM 
				rk_tel_order
			WHERE 
				owner = :member_id
				and 
				create_time >= :start_time
				and 
				create_time <= :end_time
		';
		$charging_duration = Db::query($sql, [
			'member_id'	=>	$member_id,
			'start_time'	=>	$start_time,
			'end_time'	=>	$end_time,
		]);
		return $charging_duration[0]['charging_duration'];
	}
	
	/**
	 * 获取用户今天的计算时长(分钟)
	 * 
	 * @param int $member_id
	 * @return int 
	*/
	public function get_charging_duration($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$time = strtotime(date('Y-m-d'));
		$sql = '
			SELECT 
				sum(ceil(duration/60)) as charging_duration
			FROM 
				rk_tel_order
			WHERE 
				owner = :member_id
				and 
				create_time >= :time
		';
		$charging_duration = Db::query($sql, [
			'member_id'	=>	$member_id,
			'time'	=>	$time
		]);
		return $charging_duration[0]['charging_duration'];
	}
	
	/**
	 * 计算用户昨天的通话总时长
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_yesterday_connect_duration($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$yesterday = date("Y-m-d", strtotime('-1 day'));
		$start_time = strtotime($yesterday);
		$end_time = $start_time + (24 * 3600);
		$connect_duration = Db::name('tel_order')
												->where('owner', $member_id)
												->where('create_time', '>=', $start_time)
												->where('create_time', '<=', $end_time)
												->sum('duration');
		return $connect_duration;
	}
	
	/**
	 * 计算用户昨天的接通次数
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_yesterday_connect_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$yesterday = date("Y-m-d", strtotime('-1 day'));
		$start_time = strtotime($yesterday);
		$end_time = $start_time + (24 * 3600);
		$connect_count = Db::name('tel_order')
												->where('owner', $member_id)
												->where('create_time', '>=', $start_time)
												->where('create_time', '<=', $end_time)
												->count('1');
		return $connect_count;
	}
	
	/**
	 * 获取今天昨天的通话时长
	 * 
	 * @param int $member_id
	 * @return int 
	*/
	public function get_connect_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$time = strtotime(date('Y-m-d'));
		$connect_count = Db::name('tel_order')
												->where('owner', $member_id)
												->where('create_time', '>=', $time)
												->count('1');
		return $connect_count;
	}
	
	/**
	 * 获取今天昨天的通话时长
	 * 
	 * @param int $member_id
	 * @return int 
	*/
	public function get_connect_duration($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$time = strtotime(date('Y-m-d'));
		$connect_duration = Db::name('tel_order')
												->where('owner', $member_id)
												->where('create_time', '>=', $time)
												->sum('duration');
		return $connect_duration;
	}
	
	/**
	 * 计算用户今天的识别次数
	 * 
	 * @param int $member_id
	 * @return float
	*/
	public function get_today_distinguish_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$today = date("Y-m-d");
		$start_time = strtotime($today);
		$sum = Db::name('tel_order')
						->where([
							'owner'	=>	$member_id,
							'create_time'	=>	['>=', $start_time],
						])
						->sum('asr_cnt');
		if(empty($sum)){
			return 0;
		}
		return $sum;
	}
	
}