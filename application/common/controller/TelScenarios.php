<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;


//话术场景处理类
class TelScenarios extends Base{
	
	/**
	 * 获取话术场景名称
	 * 
	 * @param int $id
	 * @return string
	*/
	public function get_name($id)
	{
		if(empty($id)){
			return false;
		}
		$name = Db::name('tel_scenarios')
						->where('id', $id)
						->value('name');
		return $name;
	}
	
	
	
}