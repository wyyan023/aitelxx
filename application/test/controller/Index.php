<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\test\controller;
use think\Db;
use app\common\controller\User;

class Index extends User{

  public function account(){
    print('12344556');
  }
  
	public function index(){
		
		$Yesterdaytime = strtotime(date("Y-m-d", strtotime("-1 day")));
		$Todaytime = strtotime(date("Y-m-d", time()));
		$Nowtime = time();
    //获取用户的基本信息
    $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		$where['status'] = ['>',0];
		if (!$super){
			$where["owner"] = $uid;
		}
	  //用户数据
		$user_data = $this->get_user_data($uid);
		// 获取昨天
		$Ylist = Db::name('member')
				->field('status')
				->where( $where)
				->where('last_dial_time','between time',[$Yesterdaytime,$Todaytime])
				->select();
		
		$Ytotal = count($Ylist); //昨天拨打总数
		$Yintention = 0; // 昨天有意向
		$Yrefuse = 0; // 昨天拒绝
		$Yfail = 0; // 昨天失败
		foreach ($Ylist as $kk=>$vv){
			
			if($vv['status'] == 3 || $vv['status'] == 4){
				 $Yintention++;
			}else if($vv['status'] == 2 || $vv['status'] == 1){
				  $Yrefuse ++;
			}else{
				  $Yfail++;
			}

		}
		
		$ydata = array();
		$ydata["Ytotal"] = $Ytotal;
		$ydata["Yintention"] = $Yintention;
		$ydata["Yrefuse"] = $Yrefuse;
		$ydata["Yfail"] = $Yfail;
		
		// 获取今天
		$Tlist = Db::name('member')
				->field('status')
				->where($where)
				->where('last_dial_time','between time',[$Todaytime,$Nowtime])
				->select();
		$Ttotal = count($Tlist); //昨天拨打总数
		$Tintention = 0; // 昨天有意向
		$Trefuse = 0; // 昨天拒绝
		$Tfail = 0; // 昨天失败
		foreach ($Tlist as $key=>$val){
			
			if($val['status'] == 3 || $val['status'] == 4){
				 $Tintention++;
			}else if($val['status'] == 2 || $val['status'] == 1){
					$Trefuse ++;
			}else{
					$Tfail++;
			}

		}
			
	  $tdata = array();
	  $tdata["Ttotal"] = $Ttotal;
	  $tdata["Tintention"] = $Tintention;
	  $tdata["Trefuse"] = $Trefuse;
	  $tdata["Tfail"] = $Tfail;		
		
	  $this->assign('ydata', $ydata);
	  $this->assign('tdata', $tdata);
		$this->assign('user_data', $user_data);
		$this->setMeta('后台首页');
		return $this->fetch();
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
	            ->field('time_price,month_price,asr_price,credit_line,money,robot_cnt')
	            ->where(array('id' => $user_id))
	            ->find();
	  $user_data['distinguish_frequency'] = $this->get_distinguish_frequency($user_id); //识别次数
	  return $user_data;
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
			
				->count('uid');
				
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
			        ->field('a.*, ar.level')
			        ->join('admin_role ar', 'a.role_id = ar.id', 'LEFT')
			        ->where('a.username',$username)
			        ->find();	
			if($user && $user['status']){
		
				$mpassword = md5($password);
		        if($user['salt']){
		        	$mpassword = md5($password.$user['salt']);
		        }

				if($mpassword === $user['password']){
					
					if(time() > $user['expiry_date']){
						return $this->error('您的会员有效期已过！','');
					}
					
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
			$res = Db::name('config')->where('group', 36)->find();
				
			$res['val'] = unserialize($res['value']);
				
	
			$cover = array();
			if($res['val']["cover"]){
				
				$plist = Db::name('picture')->field('path')->where('id', $res['val']["cover"])->find();
				$cover['cover'] = $plist["path"];

			}else{
				$cover['cover'] = "";
			}
				
			$res['val']["logo"] = $cover['cover'];
			
			//var_dump($res['val'],$cover);exit;	
			$this->assign('allcinfig', $res['val']);
			
			
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
			    ->count("uid");

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
			    ->count("uid");
		  
      
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

	    $total = Db::name('member')->alias('m')->where($where)->count('uid');

        $swhr = array();
		if(!$super){
			$swhr['member_id'] = $uid;
		}
        $simtotal = Db::name('tel_sim')->where($swhr)->count('id');


        $tsrwhr = array();
		if(!$super){
			$tsrwhr['member_id'] = $uid;
		}
        $tsrtotal = Db::name('tel_tsr')->where($tsrwhr)->count('id');


        $saleswhere = array();
		$saleswhere['user_type'] = 1;
		if (!$super){
			$saleswhere["pid"] = $uid;
		}
        $salestotal = Db::name('admin')->where($saleswhere)->count('id');


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
	
	
	
}
  