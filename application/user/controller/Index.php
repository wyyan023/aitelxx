<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\user\controller;
use think\Db;
use app\common\controller\User;
//后台用户
use app\common\controller\AdminData;
//客户数据
use app\common\controller\MemberData;
//线路书记
use app\common\controller\LinesData;
//人工座席
use app\common\controller\DevicesData;

class Index extends User{
	
	//首页
	public function index(){
		// $Yesterdaytime = strtotime(date("Y-m-d", strtotime("-1 day")));
		// $Todaytime = strtotime(date("Y-m-d", time()));
		// $Nowtime = time();
    //获取用户的基本信息
    $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		$AdminData = new AdminData();
		$role_name = $AdminData->get_role_name($uid);
		// $super = $user_auth["super"];
		// $where['status'] = ['>',0];
		// if (!$super){
		// 	$where["owner"] = $uid;
		// }
	  //用户数据
		$user_data = $this->get_user_data($uid);
		//当前运行的机器人数量
		$user_data['run_robot_count'] = $AdminData->get_run_robot_count($uid);
		if(empty($user_data['run_robot_count'])){
			$user_data['run_robot_count'] = 0;
		}
		//待拨打的用户
		$user_data['run_customer_count'] = $AdminData->get_wait_call_phone_count($uid);
		if(empty($user_data['run_customer_count'])){
			$user_data['run_customer_count'] = 0;
		}
		//运行的任务数量
		$user_data['run_task_count'] = $AdminData->get_run_task_count($uid);
		if(empty($user_data['run_task_count'])){
			$user_data['run_task_count'] = 0;
		}
		//机器人的使用率
		if(empty($user_data['run_robot_count']) || empty($user_data['robot_cnt'])){
			$user_data['robot_usage_rate'] = 0;
		}else{
			$user_data['robot_usage_rate'] = round($user_data['run_robot_count'] / $user_data['robot_cnt'] * 100, 2);
		}
		if(empty($user_data['robot_usage_rate'])){
			$user_data['robot_usage_rate'] = 0;
		}
		//本月充值的金额 
		$user_data['month_recharge_money'] = $AdminData->get_month_recharge_money($uid);
		if(empty($user_data['month_recharge_money'])){
			$user_data['month_recharge_money'] = 0;
		}
		//本月消费的金额
		$user_data['month_consumption_money'] = $AdminData->get_month_consumption_money($uid);
		if(empty($user_data['month_consumption_money'])){
			$user_data['month_consumption_money'] = 0;
		}
		//给子账户分配的机器人数量
		$user_data['find_distribution_robot_count'] = $AdminData->get_find_distribution_robot_count($uid);
		//获取所有子账户正在使用的机器人数量
		$user_data['find_member_now_use_robot_count'] = $AdminData->get_find_member_now_use_robot_count($uid);
		//获取所有子账户的机器人总数
		$user_data['find_member_robot_total_count'] = $AdminData->get_find_member_robot_total_count($uid);
		//获取所有子账户的空闲的机器人数量
		$user_data['find_member_free_robot_count'] = $user_data['find_member_robot_total_count'] - $user_data['find_member_now_use_robot_count'];
		//所有子账户的机器人使用率
		if(empty($user_data['find_member_now_use_robot_count']) || empty($user_data['find_member_robot_total_count'])){
			$user_data['find_member_now_use_rate'] = 0;
		}else{
			$user_data['find_member_now_use_rate'] = round($user_data['find_member_now_use_robot_count']/$user_data['find_member_robot_total_count']*100, 2);
		}
		//当前用户自己使用的机器人和给下级用户开通的比例
		if(empty($user_data['find_member_robot_total_count']) || empty($user_data['robot_cnt'])){
			$user_data['member_and_find_member_rate'] = 0;
		}else{
			$user_data['member_and_find_member_rate'] = round($user_data['find_member_robot_total_count']/$user_data['robot_cnt']*100, 2);
		}
		
		
		//获取所有子账户
		// $find_members = Db::name()
		//
		
		// // 获取昨天
		// $Ylist = Db::name('member')
		// 		->field('status')
		// 		->where( $where)
		// 		->where('last_dial_time','between time',[$Yesterdaytime,$Todaytime])
		// 		->select();
		
		// $Ytotal = count($Ylist); //昨天拨打总数
		// $Yintention = 0; // 昨天有意向
		// $Yrefuse = 0; // 昨天拒绝
		// $Yfail = 0; // 昨天失败
		// foreach ($Ylist as $kk=>$vv){
			
		// 	if($vv['status'] == 3 || $vv['status'] == 4){
		// 		 $Yintention++;
		// 	}else if($vv['status'] == 2 || $vv['status'] == 1){
		// 		  $Yrefuse ++;
		// 	}else{
		// 		  $Yfail++;
		// 	}

		// }
		
		// $ydata = array();
		// $ydata["Ytotal"] = $Ytotal;
		// $ydata["Yintention"] = $Yintention;
		// $ydata["Yrefuse"] = $Yrefuse;
		// $ydata["Yfail"] = $Yfail;
		
		// // 获取今天
		// $Tlist = Db::name('member')
		// 		->field('status')
		// 		->where($where)
		// 		->where('last_dial_time','between time',[$Todaytime,$Nowtime])
		// 		->select();
		// $Ttotal = count($Tlist); //昨天拨打总数
		// $Tintention = 0; // 昨天有意向
		// $Trefuse = 0; // 昨天拒绝
		// $Tfail = 0; // 昨天失败
		// foreach ($Tlist as $key=>$val){
			
		// 	if($val['status'] == 3 || $val['status'] == 4){
		// 		 $Tintention++;
		// 	}else if($val['status'] == 2 || $val['status'] == 1){
		// 			$Trefuse ++;
		// 	}else{
		// 			$Tfail++;
		// 	}

		// }
			
	 // $tdata = array();
	 // $tdata["Ttotal"] = $Ttotal;
	 // $tdata["Tintention"] = $Tintention;
	 // $tdata["Trefuse"] = $Trefuse;
	 // $tdata["Tfail"] = $Tfail;		
		
	 // $this->assign('ydata', $ydata);
	 // $this->assign('tdata', $tdata);
		$this->setMeta('后台首页');
		switch($role_name){
			case '管理员':
				$this->assign('user_data', $user_data);
				return $this->fetch('administrator');
				break;
			case '运营商':
				$this->assign('user_data', $user_data);
				return $this->fetch('operator');
				break;
			case '代理商':
				$this->assign('user_data', $user_data);
				return $this->fetch('agent');
				break;
			default:
			 //	$where = array();
			 // $where['c.member_id'] = $uid;
				// $where['c.status'] = ['>', -1];
				// // $where['c.id'] = array('EXP','IS NULL');
				// $list = Db::name('tel_config')
			 //       ->alias('c')
			 //       ->field('c.*')
			 //       ->join('admin a', 'a.id = c.member_id', 'LEFT')
				// 			->where($where)
  		//         ->order('id desc')
  		//         ->select();
				// foreach ($list as $key => $value) {
			
				// 	//$config = Db::name('tel_config')->where("task_id",$value['uuid'])->find();
				// 	$scenarios = Db::name('tel_scenarios')->where("id",$value['scenarios_id'])->value('name');
				// 	$list[$key]['scenarios'] = $scenarios;
					
					
				// 	$list[$key]['create_datetime']= date('Y-m-d H:i:s', $value['create_time']);
					
				// 	//下面是计算完成度
					
				// 	$cwhere = array();
				// 	if($value['task_id']){
				// 		$cwhere["task"] =$value['task_id'];
				// 	}
				// 	$cwhere["status"] = ['>=',0];
				// 	$count = Db::name('member')->where($cwhere)->count(1);
					
				// 	$here = array();
				// 	if($value['task_id']){
				// 		$here["task"] =$value['task_id'];
				// 	}
				// 	$here["status"] = ['>',1];
				// 	$Molecular  = Db::name('member')->where($here)->count(1);
				// 	if($count > 0 && $Molecular > 0){
				// 		$percent = round(($Molecular / $count) * 100,2);
				// 	}else{
				// 		$percent = 0;
				// 	}
					
				// 	$list[$key]['Molecular'] = $Molecular;
				// 	$list[$key]['denominator'] = $count;
				// 	if(empty($list[$key]['Molecular']) || empty($list[$key]['denominator'])){
				// 		$list[$key]['percent_complete'] = 0;
				// 	}else{
				// 		$list[$key]['percent_complete'] = round($list[$key]['Molecular']/$list[$key]['denominator']*100, 2);
				// 	}
				// 	$list[$key]['percent'] = $percent;
				// }
				//获取中继线路的数量
				$LinesData = new LinesData();
				$user_data['line_count'] = $LinesData->get_line_count($uid);
				//获取人工座席的数量
				$DevicesData = new DevicesData();
				$user_data['seat_count'] = $DevicesData->get_count($uid);
				//获取销售的人数
				$user_data['sale_count'] = $AdminData->get_sale_count($uid);
				$this->assign('user_data', $user_data);
				// $this->assign('list', $list);
				return $this->fetch('indexV');
				break;
		}
		
	}
	
	/**
	 * 获取任务列表
	 * 
	 * @param date $date 
	 * @param int $page
	 * @return json
	*/
	public function get_task_list_api()
	{
		$user_auth = session('user_auth');
		if(empty($user_auth) || empty($user_auth['uid'])){
			return returnAjax(2, 'error', '未登陆');
		}
		$date = input('date', '', 'trim,strip_tags');
		$page = input('page', '', 'trim,strip_tags');
		if(empty($page)){
			$page = 1;
		}
		$where = array();
	  $where['member_id'] = $user_auth['uid'];
		$where['status'] = ['>', -1];
		$where['type'] = 0;
		$time = strtotime($date);
		if(!empty($time)){
			$where['create_time'] = [['>=', $time], ['<=', $time + 24 * 3600]];
		}
		
		$list = Db::name('tel_config')
					->where($where)
	        ->order('id desc')
	        ->page($page.',10')
	        ->select();
		foreach ($list as $key => $value) {
	
			//$config = Db::name('tel_config')->where("task_id",$value['uuid'])->find();
			$scenarios = Db::name('tel_scenarios')->where("id",$value['scenarios_id'])->value('name');
			$list[$key]['scenarios'] = $scenarios;
			
			
			$list[$key]['create_datetime']= date('Y-m-d H:i:s', $value['create_time']);
			//拨打类型
			if($value['call_type'] === 0){
				$list[$key]['call_type_name'] = '语音网关';
			}else{
				$list[$key]['call_type_name'] = '中继线路';
			}
			if($value['status'] === 0){
				$list[$key]['status_name'] = '暂停';
			}else if($value['status'] === 1){
				$list[$key]['status_name'] = '开启';
			}else if($value['status'] === 2){
				$list[$key]['status_name'] = '人工暂停';
			}else if($value['status'] === 3){
				$list[$key]['status_name'] = '停止';
			}else if($value['status'] === 4){
				$list[$key]['status_name'] = '欠费';
			}else{
				$list[$key]['status_name'] = '未知状态';
			}
			//下面是计算完成度
			
			$cwhere = array();
			if($value['task_id']){
				$cwhere["task"] =$value['task_id'];
			}
			$cwhere["status"] = ['>=',0];
			$count = Db::name('member')->where($cwhere)->count(1);
			
			$here = array();
			if($value['task_id']){
				$here["task"] =$value['task_id'];
			}
			$here["status"] = ['>',1];
			$Molecular  = Db::name('member')->where($here)->count(1);
			if($count > 0 && $Molecular > 0){
				$percent = round(($Molecular / $count) * 100,2);
			}else{
				$percent = 0;
			}
			
			$list[$key]['Molecular'] = $Molecular;
			$list[$key]['denominator'] = $count;
			if(empty($list[$key]['Molecular']) || empty($list[$key]['denominator'])){
				$list[$key]['percent_complete'] = 0;
			}else{
				$list[$key]['percent_complete'] = round($list[$key]['Molecular']/$list[$key]['denominator']*100, 2);
			}
			$list[$key]['percent'] = $percent;
		}
		return returnAjax(0, 'success', $list);
	}
	
	/**
	 * 获取任务详情
	 * 
	 * @param int $task_id
	 * @return json
	*/
	public function get_task_data_api()
	{
		if(IS_POST){
			$task_id = input('task_id', '', 'trim,strip_tags');
			if(empty($task_id)){
				return returnAjax(2, 'error', '参数错误');
			}
			//获取任务基本信息
			$conf_data = Db::name('tel_config')
										->field('task_name,call_type,scenarios_id,robot_cnt,create_time,status')
										->where('task_id', $task_id)
										->find();
			if($conf_data['call_type'] == 1){
				$conf_data['call_type'] = '中继线路';
			}else{
				$conf_data['call_type'] = '语音网关';
			}
			if($conf_data['status'] === 0){
				$conf_data['task_status'] = '暂停';
			}else if($conf_data['status'] === 1){
				$conf_data['task_status'] = '开启';
			}else if($conf_data['status'] === 2){
				$conf_data['task_status'] = '人工暂停';
			}else if($conf_data['status'] === 3){
				$conf_data['task_status'] = '终止';
			}else if($conf_data['status'] === 4){
				$conf_data['task_status'] = '欠费';
			}else{
				$conf_data['task_status'] = '未知状态';
			}
			$result = $conf_data;
			//话术名称
			// scenarios_id
			$result['scenarios_name'] = Db::name('tel_scenarios')
																	->where('id', $result['scenarios_id'])
																	->value('name');
			//创建时间
			$result['create_time'] = date('Y-m-d H:i:s', $result['create_time']);
			$MemberData = new MemberData();
			//获取接通数量
			$result['connect_count'] = $MemberData->get_connect_count($task_id);
			//获取拒接数量 
			$result['not_connect_count'] = $MemberData->get_not_connect_count($task_id);
			//获取等待数量
			$result['wait_count'] = $MemberData->get_wait_count($task_id);
			//获取总数量
			$result['count'] = $MemberData->get_count($task_id);
			
			if(!empty($result['count'])){
				//接通率
				$result['connect_rate'] = round($result['connect_count']/$result['count']*100, 1);
				//获取A意向等级的数量
				$result['level_a'] = $MemberData->get_level_count($task_id, 6);
				if(!empty($result['level_a'])){
					$result['level_a'] = round($result['level_a']/$result['count']*100,1);
				}else{
					$result['level_a'] = 0;
				}
				//B 
				$result['level_b'] = $MemberData->get_level_count($task_id, 5);
				if(!empty($result['level_b'])){
					$result['level_b'] = round($result['level_b']/$result['count']*100,1);
				}else{
					$result['level_b'] = 0;
				}
				//C 
				$result['level_c'] = $MemberData->get_level_count($task_id, 4);
				if(!empty($result['level_c'])){
					$result['level_c'] = round($result['level_c']/$result['count']*100,1);
				}else{
					$result['level_c'] = 0;
				}
				//D
				$result['level_d']  = $MemberData->get_level_count($task_id, 3);
				if(!empty($result['level_d'])){
					$result['level_d'] = round($result['level_d']/$result['count']*100,1);
				}else{
					$result['level_d'] = 0;
				}
				//E 
				$result['level_e'] = $MemberData->get_level_count($task_id, 2);
				if(!empty($result['level_e'])){
					$result['level_e'] = round($result['level_e']/$result['count']*100,1);
				}else{
					$result['level_e'] = 0;
				}
				//F 
				$result['level_f'] = $MemberData->get_level_count($task_id, 1);
				if(!empty($result['level_f'])){
					$result['level_f'] = round($result['level_f']/$result['count']*100,1);
				}else{
					$result['level_f'] = 0;
				}
				//A+B
				$result['level_a_b_rate'] = round($result['level_a'] + $result['level_b'], 1);
				//获取通话时长 <= 10s
				$result['duration_1'] = $MemberData->get_duration_count($task_id, 1);
				if(!empty($result['duration_1'])){
					$result['duration_1'] = round($result['duration_1']/$result['count']*100,2);
				}else{
					$result['duration_1'] = 0;
				}
				//10-30
				$result['duration_2'] = $MemberData->get_duration_count($task_id, 2);
				if(!empty($result['duration_2'])){
					$result['duration_2'] = round($result['duration_2']/$result['count']*100,2);
				}else{
					$result['duration_2'] = 0;
				}
				//30-60
				$result['duration_3'] = $MemberData->get_duration_count($task_id, 3);
				if(!empty($result['duration_3'])){
					$result['duration_3'] = round($result['duration_3']/$result['count']*100,2);
				}else{
					$result['duration_3'] = 0;
				}
				//>60
				$result['duration_4'] = $MemberData->get_duration_count($task_id, 4);
				if(!empty($result['duration_4'])){
					$result['duration_4'] = round($result['duration_4']/$result['count']*100,2);
				}else{
					$result['duration_4'] = 0;
				}
				//平均时长
				$connect_duration = $MemberData->get_connect_duration($task_id);
				if(!empty($connect_duration) && !empty($result['connect_count'])){
					$result['average_duration'] = round($MemberData->get_connect_duration($task_id) / $result['connect_count'], 2);
				}else{
					$result['average_duration'] = 0;
				}
			}else{
				//接通率
				$result['connect_rate'] = 0;
				//获取A意向等级的数量
				$result['level_a'] = 0;
				//B 
				$result['level_b'] = 0;
				//C 
				$result['level_c'] = 0;
				//D
				$result['level_d'] = 0;
				//E 
				$result['level_e'] = 0;
				//F 
				$result['level_f'] = 0;
				//A+B
				$result['level_a_b_rate'] = 0;
				//获取通话时长 <= 10s
				$result['duration_1'] = 0;
				//10-30
				$result['duration_2'] = 0;
				//30-60
				$result['duration_3'] = 0;
				//>60 
				$result['duration_4'] = 0;
				//平均时长
				$result['average_duration'] = 0;
			}
			return returnAjax(0, 'success', $result);
		}
	}
	
	/**
	 * 获取用户的信息 
	 * 
	 * @param int $user_id
	 * @return array
	*/
	protected function get_user_data($user_id)
	{
	  if(empty($user_id)){
	    return false;
	  }
	  $user_data = Db::name('admin')
	            ->field('time_price,month_price,asr_price,credit_line,money,robot_cnt,usable_robot_cnt')
	            ->where(array('id' => $user_id))
	            ->find();
	  $user_data['distinguish_frequency'] = $this->get_distinguish_frequency($user_id); //识别次数
	  return $user_data;
	}
	
	/**
	 * 获取线路详情
	 * 
	 * @param int $duration 时长(天数)
	 * @return json
	*/
	public function get_member_lines_details_api()
	{
		$user_auth_sign = session('user_auth_sign');
		$user_auth = session('user_auth');
		if(empty($user_auth) || empty($user_auth_sign)){
			return returnAjax(2, 'error', '未登录');
		}
		$duration = input('duration', '', 'trim,strip_tags');
		if(empty($duration)){
			return returnAjax(3, 'error', '参数错误');
		}
		$LinesData = new LinesData();
		$lines_data = $LinesData->get_member_lines_details($user_auth['uid'], $duration);
		return returnAjax(0, 'success', $lines_data);
	}
	
	/**
	 * 获取指定用户在拨打电话的过程中语音识别所识别的次数
	 * 
	 * @param int $user_id 
	 * @return int 
	*/
	protected function get_distinguish_frequency($user_id)
	{
	  if(empty($user_id)){
	    return false;
	  }
	  // select * from `rk_tel_order` where owner = 5575
	  $frequency = Db::table('rk_tel_order')
	               ->alias('o')
	               ->join('rk_tel_bills b', 'b.id = o.member_id', 'LEFT')
	               ->where(['owner' => $user_id])
	               ->count('o.id');
	  return $frequency;
	}
	
	
	/**
	 * 获取拨打号码的数量
	 * 
	 * @return Json
	*/
	public function getCallNumber(){
		
		$number = 0;
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		$where['status'] = ['>',0];
		if (!$super){
			$where["owner"] = $uid;
		}
		// 获取昨天
		$number = Db::name('member')
			
				->where($where)
			
				->count(1);
				
		return returnAjax(0,'success', $number);
	}
	
	
	public function login($username = '', $password = '', $verify = ''){
		if (IS_POST) {
			if (!$username || !$password) {
				return $this->error('用户名或者密码不能为空！','');
			}

			//验证码验证
			$this->checkVerify($verify);

			$user = Db::name('admin')
			        ->alias('a')
			        ->field('a.*, ar.level, ar.name as role_name')
			        ->join('admin_role ar', 'a.role_id = ar.id', 'LEFT')
			        ->where('a.username',$username)
			        ->find();	
			if($user && $user['status']){
		
				$mpassword = md5($password);
		        if($user['salt']){
		        	$mpassword = md5($password.$user['salt']);
		        }

				if($mpassword === $user['password']){
					
					// if(time() > $user['expiry_date']){
					// 	return $this->error('您的会员有效期已过！','');
					// }
					
					$data = array(
							'last_login_time' => time(),
							'last_login_ip'   => get_client_ip(1),
					);
					Db::name('admin')->where(array('id'=>$user['id']))->update($data);
					
				

					$headpic = $user['logo'];
					
					if($user['logo']){
							if (is_numeric($user['logo'])) {
								$pic = Db::name('picture')->field('path')->where('id', $user['logo'])->find();
								if($pic['path']){
									$headpic = $pic['path'];
								}
							}else{
								$headpic = $user['logo'];
							} 

					}
					
					// $res = Db::name('config')->where('group', 36)->find();
				 //    $res['val'] = unserialize($res['value']);
                   
					// if($res['val']["cover"]){
				
					// 		$list = Db::name('picture')->field('path')->where('id', $res['val']["cover"])->find();
					// 		if($list['path']){
					// 			$headpic = $list['path'];
					// 		}
		
					// }
							
					
					$auth = array(
							'uid'             => $user['id'],
							'username'        => $user['username'],
							'last_login_time' => $user['last_login_time'],
							'level'           => $user['level'],
							'role'						=> $user['role_name'],
							'logo' => $headpic,
							'super' => $user['super'],
					);
					
					session('user_auth', $auth);
					session('user_auth_sign', data_auth_sign($auth));
					
					return $this->success('登录成功！',url('user/index/index'));
				} else {
				  	return $this->error('密码错误！',''); //密码错误
				}
			} else {
	
			     	return $this->error('用户不存在或被禁用！','');
			}
			
			//var_dump($list);exit;	
			
			
       /* 
			$user = model('User');
			$uid = $user->login($username,$password);
			if ($uid > 0) {
				return $this->success('登录成功！',url('user/index/index'));
			}else{
				switch($uid) {
					case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
					case -2: $error = '密码错误！'; break;
					default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
				}
				return $this->error($error,'');
			} 
			 */
		}else{
			
			// 设置全体 title 和 logo的
			// $res = Db::name('config')
			// 				->where('group', 36)
			// 				->find();
				
			// $res['val'] = unserialize($res['value']);
				
	
			// $cover = array();
			// if($res['val']["cover"]){
				
			// 	$plist = Db::name('picture')->field('path')->where('id', $res['val']["cover"])->find();
			// 	$cover['cover'] = $plist["path"];

			// }else{
			// 	$cover['cover'] = "";
			// }
				
			// $res['val']["logo"] = $cover['cover'];
			
			//var_dump($res['val'],$cover);exit;	
			// $this->assign('allcinfig', $res['val']);
			
			
			return $this->fetch();
		}
	}

	public function logout(){
		$user = model('User');
		$user->logout();
		$this->redirect('index/login');
	}

	public function clear(){
		if (IS_POST) {
			$clear = input('post.clear/a',array());
			foreach ($clear as $key => $value) {
				if ($value == 'cache') {
					\think\Cache::clear(); // 清空缓存数据
				}elseif ($value == 'log') {
					\think\Log::clear();
				}
			}
			return $this->success("更新成功！",url('user/index/index'));
		}else{
			$keylist = array(
				array('name'=>'clear','title'=>'更新缓存','type'=>'checkbox','help'=>'','option'=>array(
					'cache' => '缓存数据',
					'log' => '日志数据'
					)
				)
			);
			$data = array(
				'keyList'  => $keylist,
			);
			$this->assign($data);
			$this->setMeta("更新缓存");
			return $this->fetch('public/edit');
		}
	}

    //返回收益
	public function amount(){
	
		$arr = array();
		$dates = array();
		for($i=0;$i<input('time');$i++){
			
			if($i){
				$start2 = strtotime(date("Y-m-d", strtotime("-".$i." day")));
				$start1 = strtotime(date("Y-m-d", strtotime("-".($i-1)." day")));
				
				$amountlist = Db::name('mall_order')->where('pay_status',1)->where('pay_time','between time',[$start2,$start1])->sum('total_amount');
			
				$arr[$i] = $amountlist;
				$dates[$i] = date("Y-m-d", strtotime("-".$i." day"));
			}else{
			
				$start1 = strtotime(date("Y-m-d", time()));
				$enddate = time();
				$amountlist = Db::name('mall_order')->where('pay_status',1)->where('pay_time','between time',[$start1,$enddate])->sum('total_amount');
				
				$arr[$i] = $amountlist;
				$dates[$i] = date("Y-m-d", time());
			}
			
		}
		
	
		krsort($arr);
		krsort($dates);
		
		$data = array();
		$date = array();
		$j = 0;
		foreach ($arr as $key=>$val){
			$data[$j] = $val;
			$date[$j] = $dates[$key];
			$j++;
		}
		
		$reback = array();
		$reback['data'] = $data;
		$reback['date'] = $date;
		
		echo json_encode($reback);
		
	}

   
   //返回拨打状态 
	public function backData(){
	

		//\think\Log::record('user_auth='.json_encode($user_auth));

	    $backtime = array();  //返回的时间列表

	    $time = input('time','7','trim,strip_tags');
	    $timelist = array();
		if($time == 7){
			for ($i=1; $i <=8 ; $i++) { 
                $temp = strtotime(date("Y-m-d", strtotime("-".$i." day")));
                array_push($timelist, $temp);	
              
                $month = date("m", strtotime("-".$i." day"));
                $str1 = substr($month,0,1); 
                $length = strlen($month);
                if($str1==0){
                	$str2 = substr($month,1,($length-1));
                	$month = $str2;
                }

                $day = date("d", strtotime("-".$i." day"));
                $daystr1 = substr($day,0,1); 
                $daylength = strlen($day);
                if($daystr1==0){
                	$daystr2 = substr($day,1,($daylength-1));
                	$day = $daystr2;
                }

                array_push($backtime, $month.'/'.$day);	

			}

		}
		else if($time == 30){
			for ($i=1; $i <=31 ; $i++) { 
                $temp = strtotime(date("Y-m-d", strtotime("-".$i." day")));
                array_push($timelist, $temp);	

                $month = date("m", strtotime("-".$i." day"));
                $str1 = substr($month,0,1); 
                $length = strlen($month);
                if($str1==0){
                	$str2 = substr($month,1,($length-1));
                	$month = $str2;
                }

                $day = date("d", strtotime("-".$i." day"));
                $daystr1 = substr($day,0,1); 
                $daylength = strlen($day);
                if($daystr1==0){
                	$daystr2 = substr($day,1,($daylength-1));
                	$day = $daystr2;
                }

                array_push($backtime, $month.'/'.$day);	
   
			}

		}
		else{

			for ($i=0; $i <=12 ; $i++) { 
                  
                $month = date("Y-m", strtotime("-".$i." month"))."-01";

                $temp = strtotime($month);
                array_push($timelist, $temp);	

                $month = date("m", strtotime("-".$i." month"));
                $str1 = substr($month,0,1); 
                $length = strlen($month);
                if($str1==0){
                	$str2 = substr($month,1,($length-1));
                	$month = $str2;
                }

           
                array_push($backtime, $month.'/1');	
   
			}


		}

        

	     //判断是否是超级管理员
	    $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();
		if (!$super){
			$where["owner"] = $uid;
		}

		  
      	$backtime = array_reverse($backtime); 
        array_shift($backtime);

        $timelist = array_reverse($timelist);
		$back = array();

		foreach ($timelist as $key => $value) {

			if($key){

				$list = Db::name('member')
			    ->field('status,last_dial_time,uid')
			    ->where('status','>',0)
			    ->where($where)
			    ->where('last_dial_time','between time',[$timelist[$key - 1],$value])
			    ->select();


                $zero = 0;
                $one = 0;
                $two = 0;
                $three = 0;

			    foreach ($list as $keys => $values) {

			    	if($values['status'] == 0){
			    		$zero = $zero + 1;
			    	}else if($values['status'] == 1){
			    		$one = $one + 1;
			    	}else if($values['status'] == 2){
			    		$two = $two + 1;
			    	}else if($values['status'] == 3){
			    		$three = $three + 1;
			    	}
                  
			    }

			    $back['zero'][$key -1] = $zero;
			    $back['one'][$key -1] = $one;
			    $back['two'][$key -1] = $two;
			    $back['three'][$key -1] = $three;

			    $total = Db::name('member')
			    ->where('status','>',0)
			    ->where($where)
                ->where('last_dial_time','between time',[$timelist[$key - 1],$value])
			    ->count(1);

			     $back['total'][$key -1] = $total;

			}
			
		}
		
		
		$reback = array();
		$reback['timelist'] = $timelist;
		$reback['backtime'] = $backtime;
		//$reback['total'] = $total;
		$reback['back'] = $back;
		
		return $reback;
		
	} 

	 //返回意向等级 
	public function levelData(){
	
	
	    $backtime = array();  //返回的时间列表

	    $time = input('time','7','trim,strip_tags');
	    $timelist = array();

		if($time == 7){

			$start = strtotime(date("Y-m-d", strtotime("-8 day")));
			$end = strtotime(date("Y-m-d", strtotime("-1 day")));

		}
		else if($time == 30){

			$start = strtotime(date("Y-m-d", strtotime("-31 day")));
			$end = strtotime(date("Y-m-d", strtotime("-1 day")));


		}
		else{

			for ($i=0; $i <=12 ; $i++) { 
                  
                $start = date("Y-m", strtotime("-12 month"))."-01";

                $start = strtotime($start);

                $end = strtotime(date("Y-m-d", time()));
   
               // array_push($backtime, date("m", strtotime("-".$i." month"))."/01");		

			}


		}

        
          //判断是否是超级管理员
	    $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();
		if (!$super){
			$where["owner"] = $uid;
		} 

	    $list = Db::name('member')
		    ->field('level,last_dial_time,count(uid) as num')
		    ->group('level')
		    ->where('level','>',0)
		    ->where('status','>',0)
		     ->where($where)
		    ->where('last_dial_time','between time',[$start,$end])
		    ->select();

        $total = Db::name('member')
			    ->where('status','>',0)
			     ->where('level','>',0)
			     ->where($where)
                ->where('last_dial_time','between time',[$start,$end])
			    ->count(1);
		  
      
		$back = array();


        $typeA = 0;
        $typeB = 0;
        $typeC = 0;
        $typeD = 0;
        $typeE = 0;

	    foreach ($list as $keys => $values) {
	        $percent = round(($values['num'] / $total) * 100,2);

	    	switch ($values['level']) {
	    		case 5:
	    		    $typeA = $percent;
	    			break;
	    		case 4:
	    			$typeB = $percent;
	    			break;
	    		case 3:
	    			$typeC = $percent;
					break;
				case 2:
					$typeD = $percent;
	    			break;
	    		default:
	    			$typeE = $percent;
				
			}

	    
	    }

	    $back['typeA'] = $typeA;
	    $back['typeB'] = $typeB;
	    $back['typeC'] = $typeC;
	    $back['typeD'] = $typeD;
        $back['typeE'] = $typeE;

	
		
		$reback = array();
		
		$reback['back'] = $back;
		
		return $reback;
		
	} 


	 //返回是否显示提示
	public function getisshow(){
	    $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

	    $list = Db::name('admin')
		    ->field('index_show_tip')
		    ->where('id',$uid)
		    ->find();

	   
		$reback = array();
		
		$reback['isShow'] = $list['index_show_tip'];
			

		if($list){

			return returnAjax(0,"成功",$reback['isShow']);	

		}
		else{

			return returnAjax(1,"失败");

		}	
			
	} 
     
    //改变是否显示提示
	public function changeShow(){

	  	  	$user_auth = session('user_auth');
		  	$uid = $user_auth["uid"];
		  	
		  	$idata = array();
		  	$idata['index_show_tip'] = 1;
		  
		  	$result = Db::name('admin')->where('id',$uid)->update($idata);

		  	if($result){
		  	
		  		return returnAjax(0,"成功");
		  			
		  	}else{
		  		
		  		return returnAjax(1,"失败");
		  		
		  	}

	}
	
	//获取我的数据并返回
	public function getMyData()
	{

	  

	  $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();
	  	if (!$super){
			$where["m.owner"] = $uid;
		}
		$where["m.status"] = ['<=',1];
        $where["m.user_type"] = 0;  //白名单   0是普通用户 1是白名单用户	

	    $total = Db::name('member')->alias('m')->where($where)->count(1);

        $swhr = array();
		if(!$super){
			$swhr['member_id'] = $uid;
		}
        $simtotal = Db::name('tel_sim')->where($swhr)->count(1);


        $tsrwhr = array();
		if(!$super){
			$tsrwhr['member_id'] = $uid;
		}
        $tsrtotal = Db::name('tel_tsr')->where($tsrwhr)->count(1);


        $saleswhere = array();
		$saleswhere['user_type'] = 1;
		if (!$super){
			$saleswhere["pid"] = $uid;
		}
        $salestotal = Db::name('admin')->where($saleswhere)->count(1);


        $reback = array();
		$reback['mtotal'] = $total;
		$reback['simtotal'] = $simtotal;
        $reback['tsrtotal'] = $tsrtotal;
        $reback['sales'] = $salestotal;

     	if($reback){
	  	
	  		return returnAjax(0,"成功",$reback);
	  			
	  	}else{
	  		
	  		return returnAjax(1,"失败",0);
	  		
	  	}
		
	}
	public function administrator()
	{
		
		return $this->fetch();
	}
	
	public function agent()
	{
		return $this->fetch();
	}
	public function operator()
	{
		return $this->fetch();
	}
	
	public function indexV()
	{
		return $this->fetch('indexV');
	}
}
  