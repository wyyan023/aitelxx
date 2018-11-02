<?php
namespace app\common\controller;

use think\Db;
//后台用户
use app\common\controller\AdminData;

//会员用户数据处理类
class RechargeRecord extends Base{
	/**
	 * 充值记录
	 * 
	 * @param int $member_id
	 * @param array $args
	 * @param int $page 
	 * @return array
	*/
	public function gets($member_id, $args = [], $page = 1)
	{
		if(empty($member_id)){
			return $member_id;
		}
		if(empty($page)){
			$page = 1;
		}
		$datas = Db::name('tel_deposit')
							->where('recharge_member_id', $member_id);
		if(!empty($args['start_time'])){
			$datas = $datas->where('create_time', '>=', strtotime($args['start_time']));
		}
		if(!empty($args['end_time'])){
			$datas = $datas->where('create_time', '<=', strtotime($args['end_time']));
		}
		if(!empty($args['member_id'])){
			$datas = $datas->where('owner', $args['member_id']);
		}
		$datas = $datas->page($page . ',10')
						 ->select();
		$AdminData = new AdminData();
		foreach($datas as $key=>$value){
			//用户
			$datas[$key]['member_name'] = $AdminData->get_username($value['owner']);
			//日期
			$datas[$key]['date'] = date('Y-m-d H:m', $value['create_time']);
		}
		return $datas;
	}
	/**
	 * 充值记录汇总
	 * 
	 * @param int $member_id
	 * @param arra $args
	 * @return float
	*/
	public function summary_money($member_id, $args = [])
	{
		if(empty($member_id)){
			return false;
		}
		$money = Db::name('tel_deposit')
							->where('recharge_member_id', $member_id);
		if(!empty($args['start_time'])){
			$money = $money->where('create_time', '>=', strtotime($args['start_time']));
		}
		if(!empty($args['end_time'])){
			$money = $money->where('create_time', '<=', strtotime($args['end_time']));
		}
		if(!empty($args['member_id'])){
			$money = $money->where('owner', $args['member_id']);
		}
		$money = $money->sum('menoy');
		if(empty($money)){
			return 0;
		}
		return $money;
	}
}