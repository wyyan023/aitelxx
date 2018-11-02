<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;


//线路数据处理类
class MemberData extends Base{
	
	/**
	 * 查询指定任务已接通的次数
	 * 
	 * @param int $task_id
	 * @return int
	*/
	public function get_connect_count($task_id)
	{
		if(empty($task_id)){
			return false;
		}
		$count = Db::name('member')
							->where([
								'task'	=>	$task_id,
								'status'	=>	2
							])
							->count();
		return $count;
	}
	
	/**
	 * 查询拒接的数量
	 * 
	 * @param int $task_id
	 * @return int
	*/
	public function get_not_connect_count($task_id)
	{
		if(empty($task_id)){
			return false;
		}
		$count = Db::name('member')
							->where([
								'task'	=>	$task_id,
								'status'	=>	3
							])
							->count();
		return $count;
	}
	
	/**
	 * 获取等待的数量
	 * 
	 * @param int $task_id
	 * @return int
	*/
	public function get_wait_count($task_id)
	{
		if(empty($task_id)){
			return false;
		}
		$count = Db::name('member')
							->where([
								'task'	=>	$task_id,
								'status'	=>	['<=', 1]
							])
							->count('uid');
		return $count;
	}
	
	/**
	 * 获取总数量
	 * 
	 * @param int $task_id
	 * @return int
	*/
	public function get_count($task_id)
	{
		if(empty($task_id)){
			return false;
		}
		$count = Db::name('member')
							->where([
								'task'	=>	$task_id,
							])
							->count();
		return $count;
	}
	
	/**
	 * 获取通话时长
	 * 
	 * @param int $task_id
	 * @return int
	*/
	public function get_connect_duration($task_id)
	{
		if(empty($task_id)){
			return false;
		}
		$duration = Db::name('member')
								->where([
									'task'	=>	$task_id
								])
								->sum('duration');
		return $duration;
	}
	/**
	 * 获取指定意向的数量
	 * 
	 * @param int $task_id
	 * @param int $level
	 * @return int
	*/
	public function get_level_count($task_id, $level = 6)
	{
		if(empty($task_id) || empty($level)){
			return false;
		}
		$count = Db::name('member')
							->where([
								'task'	=>	$task_id,
								'level'	=>	$level
							])
							->count();
		return $count;
	}
	/**
	 * 获取各种通话时长的数量
	 * 
	 * @param int $task_id
	 * @param int $type
	 * @return int
	*/
	public function get_duration_count($task_id, $type)
	{
		$where = [];
		$count = Db::name('member');
		$count = $count->where('task', $task_id);
		if($type === 1){
			$count = $count->where('duration', '<=', 10);
		}elseif($type === 2){
			$count = $count->where('duration', '>', 10);
			$count = $count->where('duration', '<=', 30);
		}elseif($type === 3){
			$count = $count->where('duration', '>', 30);
			$count = $count->where('duration', '<=', 60);
		}else{
			$count = $count->where('duration', '>', 60);
		}
		$count = $count->count();
		return $count;
	}
	
}