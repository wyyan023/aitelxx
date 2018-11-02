<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;

//人工座席数据处理类
class DevicesData extends Base{
	
	/**
	 * 获取座席数量
	 * 
	 * @param int $member_id
	 * @return int
	*/
	public function get_count($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$count = Db::name('tel_device')
							->where('owner', $member_id)
							->count();
		return $count;
	}
}