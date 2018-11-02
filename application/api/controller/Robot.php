<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use think\Db;
use app\common\controller\Base;
use Overtrue\Pinyin\Pinyin;
use app\common\controller\Log;
//机器人分配
use app\common\controller\RobotDistribution as RD_Data;

class Robot extends Base{
	//回收
	public function inspect()
	{
		
		//获取当前时间
		$time = time();
		//1.获取状态为1(开启)且已过期的分配记录
		$datas = Db::name('robot_distribution')
							->where([
								'state'	=>	1,
								'end_time'	=>	['<=', $time]
							])
							->select();
		//2.回收机器人
		foreach($datas as $key=>$value){
			//2.1.回收用户的机器人数量
			
			
			
			
		}
		
		
		
		
		return 'OK';
	}
	//扣费
	public function charging()
	{
		//1.获取所有用户
		$users = Db::name('admin')
							->field('id,robot_cnt,month_price,asr_price')
							->select();
		$i = 0;
		foreach($users as $key=>$value){
			//2.根据每个用户的机器人数量 计算今天的费用
			$cost = $value['month_price'] / date('t');
			$cost = round($cost * $value['robot_cnt'], 2);
			//3.扣除用户的余额
			$result = Db::name('admin')
								->where('id', $value['id'])
								->setDec('money', $cost);
			if(empty($result)){
				Log::info('扣费失败');
				Log::info(json_encode($value));
				Log::info('扣除的费用：' . $cost);
			}
			//4.生成消费订单
			$order_data = [
				'owner'	=>	$value['id'],
				'member_id'	=>	$value['id'],
				'money'	=>	$cost,
				'create_time'	=>	time(),
				'month_price'	=>	$value['month_price'],
				'asr_price'	=>	$value['asr_price'],
				'asr_cnt'	=>	0,
				'time_price'	=>	0,
				'note'	=>	'机器人日租'
			];
			$result = Db::name('tel_order')
								->insert($order_data);
			if(empty($result)){
				Log::info('生成订单失败');
				Log::info(json_encode($order_data));
			}
		}
		//5.完成
		return 'OK';
	}
}