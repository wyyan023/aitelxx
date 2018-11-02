<?php
namespace app\common\controller;

use think\Db;
use app\common\controller\Log;
use app\common\controller\AdminData;

//任务计划处理类
class PlanData extends Base{
	
	private $connect;
	
	public $call_pause_second = 5;
	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();
		if (config('db_config1')){
			$this->connect = Db::connect('db_config1');
		}
		else{
			$this->connect = Db::connect();
		}
	}
	/**
	 * 创建任务 
	 * 
	 * @param int $member_id 用户ID
	 * @param int $scenarios_id 话术ID
	 * @param int $call_phone_id 线路ID 
	 * @param int $phone 被拨打的电话 
	 * @return bool
	*/
	public function add_plan($member_id, $scenarios_id, $call_phone_id, $phone)
	{
		//获取参数
		//呼叫线路ID
		$call_type = 1;
		//占用一个机器人
		$robot_cnt = 1;
		
		//检查累计机器人数量
		$usable_robot_cnt = Db::name('admin')
						->where("id", $member_id)
						->value('usable_robot_cnt');
		//获取正在使用的机器人的数量
		$totalRobotCnt =  Db::name('tel_config')
											->where('member_id',$member_id)
											->where('status', '1')
											->sum('robot_cnt');
		//合计当前需多少机器人
		$totalRobotCnt = $robot_cnt+(int)$totalRobotCnt;
		//验证当前可用的机器人数量是否足够
		if ($totalRobotCnt > $usable_robot_cnt){
			return returnAjax(1,'超出购买机器人数量，请联系销售人员');
		}
		//验证当前的线路是否存在
		$line_data = Db::name('tel_line')
									->field('id,name,phone,call_prefix,dial_format,originate_variables')
									->where([
										'member_id'	=>	$member_id,
										'id'	=>	$call_phone_id
									])
									->find();
		if(empty($line_data['id'])){
			return returnAjax(1, '线路不存在');
		}
		//开启状态
		$status = 1;
		//验证余额是否充足
		if($status == 1){
			$AdminData = new AdminData();
			if($AdminData->verify_member_open_task_condition($member_id) === false){
				return returnAjax(1, '当前用户或上级余额不足');
			}
		}
		
		
		// 时间分组的
		$timegroup = array();
		$timegroup['name'] = uniqid();
		$timegroup['domain'] = uniqid();
		$timegroup['member_id'] = $member_id;
		$autodialer_timegroup_id = $this->connect->table('autodialer_timegroup')->insertGetId($timegroup);
		
		// 时间分组下面的时间明细
		 $TimeRange = array();
		 $TimeRange['onetime'] = '08:00:00';
		 $TimeRange['twotime'] = '14:00:00';
		 $TimeRange['threetime'] = '14:00:00';
		 $TimeRange['fourtime'] = '20:00:00';
		 
		 $SaveRange = array();

		 foreach ($TimeRange as $tkey => $tvalue) {
			 
			 $temp = array();
			 
			 $temp['group_uuid'] = $autodialer_timegroup_id;
			 $temp['member_id'] = $member_id;
			 
			 if($tkey == 'onetime'){
				$temp['begin_datetime'] = "00:00:00";
				$temp['end_datetime'] = $tvalue;
				
				array_push($SaveRange,$temp);

			 }
			 
			 if($tkey == 'threetime'){
			   $temp['begin_datetime'] = $TimeRange['twotime'];
			   $temp['end_datetime'] = $tvalue;
				 array_push($SaveRange,$temp);
			 }
			 
		   if($tkey == 'fourtime'){
		   	$temp['begin_datetime'] = $tvalue;
		   	$temp['end_datetime'] = "23:59:59";
				array_push($SaveRange,$temp);
		   }
			 
		 }
		 
		$TRresult = $this->connect->table('autodialer_timerange')->insertAll($SaveRange);	
			
		$task_name = '加入拨打';
		// 任务表的 
		$task = array();
		$task['name'] =  $task_name ;
		$task['create_datetime'] = date("Y-m-d H:i:s",time());
		$task["alter_datetime"] = date("Y-m-d H:i:s",time());
		$task['disable_dial_timegroup'] = $autodialer_timegroup_id;
		$task['member_id'] = $member_id;
		//备注
		$task['remark'] = '';
		//默认间隔时间加5
		$task['call_pause_second'] = $this->call_pause_second;
		//回调url
		$task['call_notify_url'] = config('notify_url');		
		//开启状态
		$task['start'] = $status;
		//
		$task['call_notify_type'] = 2;
		$task['cache_number_count'] = 0;
		
		$max_destination_extension = Db::name('tel_config')->field('destination_extension')->order('id desc')->find();	
		if ($max_destination_extension && $max_destination_extension['destination_extension'] > 0){
			$destination_extension = ((int)$max_destination_extension['destination_extension'])+1;
		}else{
			$destination_extension =  config('destination_extension');
		}
		$task['destination_extension'] = $destination_extension;
		
		// if ($call_type){
			$task['dial_format'] = $line_data['dial_format'];
			$task['_origination_caller_id_number'] = $line_data['phone'];
			$task['originate_variables'] = $line_data['originate_variables'];
		// }else{
		// 	$task['dial_format'] = $sim['dial_format'];
		// 	$task['_origination_caller_id_number'] = $sim['call_prefix'];
		// }
		
		if (config('start_da2')){
			if (isset($task['originate_variables']) && $task['originate_variables']){
				$task['originate_variables'] = $task['originate_variables'].','.config('start_da2');
			}else{
				$task['originate_variables']  = config('start_da2');
			}
		}
		
		$task['destination_dialplan'] = "XML";
		$task['destination_context'] = "default";
		$task['maximumcall'] = $robot_cnt;
		//写入fs的任务表一条数据
		$task_id = $this->connect->table('autodialer_task')->insertGetId($task);
		
		$week = array();
		$zhou = array();
		$week['Monday'] = 1;
		$week['Tuesday'] = 1;
		$week['Wednesday'] = 1;
		$week['Thursday'] = 1;
		$week['Friday'] = 1;
		$week['Saturday'] = 1;
		$week['Sunday'] = 1;
		
		foreach ($week as $key => $value) {
			if($value == 0){
				array_push($zhou, $key);
			}		
		}

		
		$weeklist = implode(",",$zhou);
		$timertask = array();

		$timertask['group_id'] = $autodialer_timegroup_id;
		$timertask['date_list'] = '';
		$timertask['week_list'] = $weeklist;
		$timertask["task_id"] = $task_id;
		$timerresult = $this->connect->table('autodialer_timer_task')->insertGetId($timertask);
		// 配置表的 场景
		$cdata = array();
		$cdata['member_id'] = $member_id;
		
		$levelArr = [1];
		if ($levelArr){
			$cdata['level'] =  implode(",",$levelArr);
		}
		$sale_ids_arr = '';
		if ($sale_ids_arr){
			$cdata['sale_ids'] =  implode(",",$sale_ids_arr);
		}
		
		$cdata["task_id"] = $task_id;
		$cdata["task_name"] = $task_name;
		//话术ID
		$cdata["scenarios_id"] = input('scenarios_id','','trim,strip_tags');
		
		// $bridge = input('bridge','','trim,strip_tags');
		// $tsr = Db::name('tel_tsr')
		// 				->field('phone')
		// 				->where("id",$bridge)->find();
		//转接
		$cdata["bridge"] = '';
		$cdata["call_type"] = $call_type;
		$cdata["status"] = $status;
		$cdata["destination_extension"] = $destination_extension;
		$cdata["phone"] = $line_data['phone'];
		$cdata["call_prefix"] = $line_data['call_prefix'];

		$cdata['robot_cnt'] = $robot_cnt;
		$cdata['create_time'] = time();
		//新增-线路ID
		$cdata['call_phone_id'] = $call_phone_id;
		//任务类型
		$cdata['type'] = 1;
		$config_id = Db::name('tel_config')->insertGetId($cdata);
							
		if ($task_id){
			$this->connect->execute("CREATE TABLE `autodialer_number_".$task_id."` (
							`id` int(11) NOT NULL AUTO_INCREMENT,
							`number` VARCHAR(20) NOT NULL,
							`state` INT(11) NULL DEFAULT NULL,
							`description` VARCHAR(255) NULL DEFAULT NULL,
							`recycle` INT(11) NULL DEFAULT NULL,
							`callid` VARCHAR(255) NULL DEFAULT NULL,
							`calldate` DATETIME NULL DEFAULT NULL,
							`calleridnumber` VARCHAR(50) NULL DEFAULT NULL,
							`answerdate` DATETIME NULL DEFAULT NULL,
							`hangupdate` DATETIME NULL DEFAULT NULL,
							`bill` INT(11) NULL DEFAULT NULL,
							`duration` INT(11) NULL DEFAULT NULL,
							`hangupcause` VARCHAR(255) NULL DEFAULT NULL,
							`bridge_callid` VARCHAR(255) NULL DEFAULT NULL,
							`bridge_number` VARCHAR(20) NULL DEFAULT NULL,
							`bridge_calldate` DATETIME NULL DEFAULT NULL,
							`bridge_answerdate` DATETIME NULL DEFAULT NULL,
							`recordfile` VARCHAR(255) NULL DEFAULT NULL,
							`status` VARCHAR(100) NULL DEFAULT NULL,
							 PRIMARY KEY (`id`)
						)ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2000");
			$this->add_mobile($member_id, $task_id, $scenarios_id, $phone);
			return true;
		}
		return false;
	}
	/**
	 * 导入号码
	 * 
	 * @param int $member_id
	 * @param int $scenarios_id 
	 * @param int $task_id
	 * @param int $mobile
	 * @return bool
	*/
	public function add_mobile($member_id, $task_id, $scenarios_id, $mobile)
	{
		if(empty($member_id) || empty($task_id) || empty($scenarios_id) || empty($mobile)){
			return false;
		}
		$members = [];
		$request = request();
		$ip = $request->ip(0,true);
		$input_result = Db::name('member')
										->insert([
											'owner'	=>	$member_id,
											'reg_ip'	=>	$ip,
											'reg_time'	=>	time(),
											'mobile'	=>	$mobile,
											'salt'	=>	'',
											'password'	=>	'',
											'is_new'	=>	1,
											'task'	=>	$task_id,
											'status'	=>	1,
											'scenarios_id'	=>	$scenarios_id
										]);
		if(!empty($input_result)){
			$taskdata = array();
			$taskdata['number'] = $mobile;
			$timerresult = $this->connect->table('autodialer_number_'.$task_id)->insertGetId($taskdata);
			if(!empty($timerresult)){
				return true;
			}
		}
		return false;
	}
	
}