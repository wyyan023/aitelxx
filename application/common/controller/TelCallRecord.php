<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;


//通话记录处理类
class TelCallRecord extends Base{
	
	/**
	 * 获取通话记录ID
	 * 
	 * @param int $mobile
	 * @param int $task_id
	 * @return int
	*/
	public function get_id($mobile, $task_id)
	{
		if(empty($mobile) || empty($task_id)){
			return false;
		}
		$id = Db::name('tel_call_record')
					->where([
						'mobile'	=>	$mobile,
						'task_id'	=>	$task_id
					])
					->value('id');
		return $id;
	}
	
	
	
}