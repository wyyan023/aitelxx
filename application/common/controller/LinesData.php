<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;

//线路数据处理类
class LinesData extends Base{
  
  /**
   * 获取线路的归属人ID
   * 
   * @param int $line_id 线路ID
   * @return int 用户ID
  */
  public function get_line_member_id($line_id)
  {
    if(empty($line_id)){
      return false;
    }
    $member_id = Db::name('tel_line')
                  ->where('id', $line_id)
                  ->value('member_id');
    return $member_id;
  }
  /**
   * 获取用户的线路的详情
   * 
   * @param int $member_id
   * @param int $duration 时长(天数)
   * @return array
  */
  public function get_member_lines_details($member_id, $duration = 1)
  {
  	if(empty($member_id)){
  		return false;
  	}
  	$lines = Db::name('tel_line')
  						->field('id,name')
  						->where('member_id', $member_id)
  						->select();
  	$lines_data = [];
  	foreach($lines as $key=>$value){
  		$lines_data[$key]['name'] = $value['name'];
  		//线路总拨打的数量
  		$count = $this->get_line_call_count($value['id'], $duration);
  		$lines_data[$key]['count'] = $count;
  		//应答率
  		$answer_count = $this->get_line_answer_count($value['id'], $duration);
  		$lines_data[$key]['answer_count'] = $answer_count;
  		if(empty($answer_count) || empty($count)){
  			$lines_data[$key]['answer_rate'] = 0;
  		}else{
  			$lines_data[$key]['answer_rate'] = round($answer_count/$count*100, 2);
  		}
  		//接通率
  		$connect_count = $this->get_line_connect_count($value['id'], $duration);
  		$lines_data[$key]['connect_count'] = $connect_count;
  		if(empty($connect_count) || empty($count)){
  			$lines_data[$key]['connect_rate'] = 0;
  		}else{
  			$lines_data[$key]['connect_rate'] = round($connect_count/$count*100, 2);
  		}
  		//通话时长
  		$call_duration = $this->get_line_call_total_duration($value['id'], $duration);
  		if(empty($call_duration) || empty($count)){
  			$lines_data[$key]['call_duration'] = 0;
  		}else{
  			$lines_data[$key]['call_duration'] = round($call_duration/60, 2);
  		}
  		//通话费用
  		$lines_data[$key]['call_money'] = $this->get_line_call_total_money($value['id'], $duration);
  	}
  	return $lines_data;
  }
  
  /**
   * 获取线路的总拨打数量
   * 
   * @param int $line_id 
   * @param int $duration 时长(天数) 为1时表示当天的
   * @return float
  */
  public function get_line_call_count($line_id, $duration = 1)
  {
  	if(empty($line_id) || empty($duration)){
  		return false;
  	}
  	//天数转秒
  	if($duration != 1){
  		$duration = $duration * 24 * 3600;
	  	$time = time() - $duration;
  	}else{
  		$time = strtotime(date("Y-m-d"));
  	}
  	$count = Db::name('tel_config')
  						->alias('c')
  						->join('member m', 'm.task = c.task_id', 'LEFT')
  						->where([
  							'm.last_dial_time' => ['>=', $time],
  							'c.call_phone_id' => $line_id
  						])
  						->count('m.uid');
  	return $count;
  }
  
  /**
   * 获取中继线路的数量
   * 
   * @param int $member_id
   * @return int 
  */
  public function get_line_count($member_id)
  {
  	if(empty($member_id)){
  		return false;
  	}
  	$count = Db::name('tel_line')
  						->where('member_id', $member_id)
  						->count('id');
  	return $count;
  }
  
  /**
   * 获取线路的总的通话时长
   * 
   * @param int $line_id
   * @param int $duration 时长(天数) 为1时表示当天的
   * @return float
  */
  public function get_line_call_total_duration($line_id, $duration = 1)
  {
  	if(empty($line_id)){
  		return false;
  	}
  	//天数转秒
  	if($duration != 1){
  		$duration = $duration * 24 * 3600;
	  	$time = time() - $duration;
  	}else{
  		$time = strtotime(date("Y-m-d"));
  	}
  	$total_duration = Db::name('tel_config')
  										->alias('c')
  										->join('member m', 'm.task = c.task_id', 'LEFT')
  										->where([
  											'm.last_dial_time'	=>	['>=', $time],
  											'c.call_phone_id'	=>	$line_id
  										])
  										->sum('m.duration');
  	return $total_duration;
  }
  
  /**
   * 获取线路的总的通话费用
   * 
   * @param int $line_id
   * @param int $duration 时长(天数) 为1时表示当天的
   * @return float
  */
  public function get_line_call_total_money($line_id, $duration = 1)
  {
  	if(empty($line_id)){
  		return false;
  	}
  	//天数转秒
  	if($duration != 1){
  		$duration = $duration * 24 * 3600;
	  	$time = time() - $duration;
  	}else{
  		$time = strtotime(date("Y-m-d"));
  	}
  	$total_money = Db::name('tel_order')
  										->where([
  											'create_time'	=>	['>=', $time],
  											'call_phone_id'	=>	$line_id
  										])
  										->sum('money');
  	return $total_money;
  }
  
  /**
   * 获取线路接通的数量 (通话状态为:已接通+未接听+挂机+关机+欠费)
   * 
   * @param int $line_id
   * @param int $duration 时长(天数)
   * @return float
  */
  public function get_line_connect_count($line_id, $duration = 1)
  {
  	if(empty($line_id) || empty($duration)){
  		return false;
  	}
  	//天数转秒
  	if($duration != 1){
  		$duration = $duration * 24 * 3600;
	  	$time = time() - $duration;
  	}else{
  		$time = strtotime(date("Y-m-d"));
  	}
  	$count = Db::name('tel_config')
  						->alias('c')
  						->join('member m', 'm.task = c.task_id', 'LEFT')
  						->where([
  							'c.call_phone_id' => $line_id,
  							'm.status' => ['in', [2,3]],
  							'm.last_dial_time' => ['>=', $time]
  						])
  						->count('m.uid');
  	return $count;
  }
  /**
   * 获取线路应答的数量 (通话状态为:已接通)
   * 
   * @param int $line_id
   * @param int $duration 时长(天数)
   * @return float
  */
  public function get_line_answer_count($line_id, $duration = 1)
  {
  	if(empty($line_id) || empty($duration)){
  		return false;
  	}
  	//天数转秒
  	if($duration != 1){
  		$duration = $duration * 24 * 3600;
	  	$time = time() - $duration;
  	}else{
  		$time = strtotime(date("Y-m-d"));
  	}
  	$count = Db::name('tel_config')
  						->alias('c')
  						->join('member m', 'm.task = c.task_id', 'LEFT')
  						->where([
  							'c.call_phone_id' => $line_id,
  							'm.status' => 2,
  							'm.last_dial_time' => ['>=', $time]
  						])
  						->count('m.uid');
  	return $count;
  }
  /**
   * 获取用户可以分配的线路
   * 
   * @param int $member_id 当前账户ID
   * @param int $not_in 不包含的线路 可选
   * @return array
  */
  public function get_distribution_lines($member_id, $not_in = [])
	{
		if(empty($member_id)){
			return false;
		}
		$lines = Db::name('tel_line')
							->field('id,name,sales_price')
							->where('member_id', $member_id);
		if(is_array($not_in) === true && count($not_in) > 0){
			$lines = $lines->where('id', 'NOT IN', $not_in);
		}
		$lines = $lines->select();
		Log::info(json_encode($lines));
		return $lines;
	}
	
	/**
	 * 删除销售人员的线路
	 * 
	 * @param int $member_id
	 * @return bool
	*/
	public function delete_sale_lines($member_id)
	{
		if(empty($member_id)){
			return false;
		}
		$result = Db::name('tel_line')
							->where('member_id', $member_id)
							->delete();
		if(!empty($result)){
			return true;
		}
		Log::info('销售人员ID:' . $member_id . '删除失败');
		return false;
	}
  
  /**
   * 获取销售价格
   * 
   * @param int $id 
   * @return float
  */
  public function get_sales_price($id)
  {
  	if(empty($id)){
  		return 0;
  	}
  	$sales_price = Db::name('tel_line')
  									->where('id', $id)
  									->value('sales_price');
  	if(empty($sales_price)){
  		return 0;
  	}
  	return $sales_price;
  }
  
  
}