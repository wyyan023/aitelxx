<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;


//任务配置处理类
class TelConfig extends Base{
	
	/**
	 * 获取任务名称
	 * 
	 * @param int $task_id
	 * @return string
	*/
	public function get_task_name($task_id)
	{
		if(empty($task_id)){
			return false;
		}
		$task_name = Db::name('tel_config')
									->where('task_id', $task_id)
									->value('task_name');
		return $task_name;
	}
	
}