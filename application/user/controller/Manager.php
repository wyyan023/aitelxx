<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
//会员用户数据处理类
use app\common\controller\AdminData;
//机器人分配处理类
use app\common\controller\RobotDistribution;
//线路数据处理类
use app\common\controller\LinesData;

class Manager extends User{


	public function _initialize() {
		parent::_initialize();

		$request = request();
		$action = $request->action();

	}


	//会员列表
	public function index()
	{
		$keyword = input('keyword','','trim,strip_tags');
		$user_auth = session('user_auth');
	  //获取当前用户的角色
	  $user_role = $this->get_user_role($user_auth['uid']);
	  if($user_role === '管理员'){
	    if ($keyword) {
  			$list = Db::name('admin')->where('id', '<>', $user_auth['uid'])->where('username like "%'.$keyword.'%"')->where('user_type',0)->paginate(10, false, array('query'  =>  $this->param));
  		} else {
  			$list = Db::name('admin')->where('id', '<>', $user_auth['uid'])->where('user_type',0)->paginate(10, false, array('query'  =>  $this->param));
  		}
	  }else{
	    if ($keyword) {

  			$list = Db::name('admin')
  			        ->where('user_type' , '=', 0)
  			        ->where('pid', '=', $user_auth['uid'])
  			        ->where('username', 'like', '%'.$keyword.'%')
  			        ->paginate(10, false, array('query'  =>  $this->param));
  		} else {
  			$list = Db::name('admin')
  			        ->where('user_type', '=', 0)
  			        ->where('pid', '=', $user_auth['uid'])
  			        ->paginate(10, false, array('query'  =>  $this->param));
  		}
	  }

		$page = $list->render();
		$list = $list->toArray();
		foreach ($list['data'] as $k=>$v){
			$list['data'][$k]['create_time'] = date("Y-m-d H:i:s", $v['create_time']);
			// $list['data'][$k]['expiry_date'] = date("Y-m-d", $v['expiry_date']);
			$role = Db::name('admin_role')->field('name')->where('id', $v['role_id'])->find();

			$list['data'][$k]['role_name'] = $role['name'];
			$list['data'][$k]['isSuper'] = $v['super']?'是':'否';

		}

		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		//获取用户角色列表
		$mlist = Db::name('admin_role')
		          ->field('id,name')
		          ->where('status', 1)
		          ->where('level', '>', $user_auth['level'])
		          ->order('id asc')
		          ->select();
		//获取下属账户
		$AdminData = new AdminData();
		$find_users = $AdminData->get_find_users($user_auth['uid']);
		$this->assign('find_users', $find_users);
		$this->assign('rolelist', $mlist);
		$this->assign('date', date('Y-m-d'));
		return $this->fetch();
	}

	//获取用户的角色
	protected function get_user_role($user_id)
	{
	  if(empty($user_id)){
	    return false;
	  }
	  $role_name = Db::name('admin')
	               ->alias('a')
	               ->join('admin_role ar', 'a.role_id = ar.id', 'LEFT')
	               ->where(['a.id' => ['=', $user_id]])
	               ->value('ar.name');
	  return $role_name;
	}


	//销售人员列表
	public function sales(){

		$keyword = input('keyword','','trim,strip_tags');
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		if ($keyword) {
			$list = Db::name('admin')->where('username like "%'.$keyword.'%"')->where(array('pid'=>$uid,'user_type'=>1))->paginate(10, false, array('query'  =>  $this->param));
		} else {
			$list = Db::name('admin')->where(array('pid'=>$uid,'user_type'=>1))->paginate(10, false, array('query'  =>  $this->param));
		}
		$page = $list->render();
		$list = $list->toArray();

		foreach ($list['data'] as $k=>$v){
			$list['data'][$k]['create_time'] = date("Y-m-d H:i:s", $v['create_time']);
			//最近登陆时间
			if ($v['last_login_time']){
				$list['data'][$k]['last_login_time'] = date("Y-m-d H:i:s", $v['last_login_time']);
			}else{
				$list['data'][$k]['last_login_time'] =  "";
			}
			//创建时间
			if(!empty($v['create_time'])){
				$list['data'][$k]['create_time'] = date('Y-m-d H:i:s', $v['create_time']);
			}
			//到期时间
			if(!empty($v['expiry_date'])){
				$list['data'][$k]['expiry_date'] = date('Y-m-d H:i:s', $v['expiry_date']);
			}

			$list['data'][$k]['num'] = Db::name('member')->where('salesman',$v['id'])->count("uid");
		}

		$this->assign('list', $list['data']);
		$this->assign('page', $page);


		return $this->fetch();
	}

	public function saveSale(){

		if(IS_POST){
			$id = input('adminId','','trim,strip_tags');
			$mdata = array();

			$mdata['username'] = input('username','','trim,strip_tags');
			$mdata['realname'] = input('realname','','trim,strip_tags');
			$mdata['mobile'] = input('mobile','','trim,strip_tags');
			$mdata['sex'] = input('sex','','trim,strip_tags');
			$mdata['email'] = input('email','','trim,strip_tags');
			$mdata['month_price'] = input('month_price', '', 'trim,strip_tags');
			$mdata['asr_price'] = input('asr_price', '', 'trim,strip_tags');
			$mdata['credit_line'] = input('credit_line', '', 'trim,strip_tags');
			// $mdata['remark'] = input('remark','','trim,strip_tags');


			$uid = session('user_auth.uid');
			$res = Db::name('admin')->field('role_id,open_tsr')->where('id', $uid)->find();
			// $mdata['expiry_date'] = $res['expiry_date'];
			$mdata['open_tsr'] = $res['open_tsr'];
			$mdata['role_id'] = 19; //角色ID是写死的

			if ($id){
				$mdata['update_time'] = time();
				$result = Db::name('admin')->where('id', $id)->update($mdata);
			}else{
				$res = Db::name('admin')->field('id')->where('username', $mdata['username'])->find();
				if( $res['id']){
					return returnAjax(1,'该用户名已经存在。');
				}
				$mdata['user_type'] = 1;
				$mdata['pid'] = $uid;
				$password = input('password','','trim,strip_tags');
				$salt = rand_string(6);
				$mdata['password'] = md5($password.$salt);
				$mdata['salt'] = $salt;
				$mdata['create_time'] = time();
				$result = Db::name('admin')->insertGetId($mdata);
			}

			if($result >= 0){
				return returnAjax(0,'保存成功',$result);
			}else{
				return returnAjax(1,'error!',"保存失败");
			}

		}
	}

	public function getSale(){
		$id = input('id','','trim,strip_tags');

		$result = Db::name('admin')->field('username,realname,mobile,email,sex,remark')->where('id', $id)->find();

		return returnAjax(0,'sucess',$result);
	}

	public function resetPwd(){
		$id = input('id','','trim,strip_tags');

		$salt = rand_string(6);
		$password = '654321';
		$mdata['salt'] = $salt;
		$mdata['password'] = md5($password.$salt);
		$result = Db::name('admin')->where('id', $id)->update($mdata);
		if($result >= 0){
			return returnAjax(0,'初始密码是：'.$password, '');
		}else{
			return returnAjax(1,'重置密码失败!');
		}

	}

	public function myCustomer(){
		$id = input('id','','trim,strip_tags');


	    $where = array();
        $mobile = input('keyword','','trim,strip_tags');
        $status = input('status','','trim,strip_tags');
    	if($mobile){
    		$where["m.mobile"] = $mobile;
    	}

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();



		if ($id){
			$where["m.salesman"] = $id;
		}
		else{
			if(!$super){
				$where['m.salesman'] = $uid;
			}
		}


        $where["m.status"] = ['>',0];
    	if($status != ""){
    		 $where["m.status"] = $status;
    	}




		$list = Db::name('member')
		->field('m.uid,m.username,m.real_name,m.mobile,m.last_dial_time,m.status,m.task,m.uid,m.level')
		->alias('m')

		->order('m.last_dial_time desc')
		->where($where)
		->paginate(10, false, array('query'  =>  $this->param));


	 	$page = $list->render();
	   	$list = $list->toArray();

		foreach($list['data'] as &$item){

			if ($item['last_dial_time'] > 0){
				$item['last_dial_time'] = date('Y-m-d H:i:s', $item['last_dial_time']);
			}
			else{
				$item['last_dial_time'] = "";
			}

			switch ($item['level']) {
	    		case 5:
	    			$item['level'] = 'A类';
	    			break;
	    		case 4:
	    			$item['level'] = 'B类';
	    			break;

	    		case 3:
	    			$item['level'] = 'C类';
					break;
				case 2:
	    			$item['level'] = 'D类';

	    			break;
	    		default:
	    			$item['level'] = 'E类';

			}

		}

		$cwhere = array();
		if($mobile){
			$cwhere["mobile"] = $mobile;
		}

    	$cwhere["status"] = ['>',0];
    	if($status != ""){
    		 $cwhere["status"] = $status;
    	}



		$cwhere["salesman"] = $id;

		$count = Db::name('member')->where($cwhere)->count('uid');

	    $this->assign('list',$list['data']);
	  	$this->assign('page', $page);
	    $this->assign('total', $count);


	    return $this->fetch();
	}

	public function getQRUrl(){
		$id = input('id/d','','trim,strip_tags');
		$qrImg = "";

		$wxInfo = db('wx_user',[],false)->where(array('is_default'=>1,'status'=>1))->find();
		$extends = & load_wechat('Extends', $wxInfo);

		$result = Db::name('admin')->field('ticket')->where('id',$id)->find();
		if (!$result['ticket']){
			$result = $extends->getQRCode($id, 1);

			if ($result['ticket']){

				$ret = Db::name('admin')->where('id',$id)->update(array('ticket'=>$result['ticket']));
			}
		}

		$wxInfo = db('wx_user',[],false)->where(array('is_default'=>1,'status'=>1))->find();
		$extends = & load_wechat('Extends', $wxInfo);
		$qrImg = $extends->getQRUrl($result['ticket']);



		return returnAjax(0,'success',$qrImg);

	}

	public function removeBinding(){
		$id = input('id','','trim,strip_tags');
		$res = Db::name('admin')->field('open_id')->where('id',$id)->find();
		if ($res['open_id']){

			$ret = Db::name('admin')->where('id',$id)->update(array('open_id'=>''));
			if ($ret >=0){
				return returnAjax(0,'解除绑定成功');
			}
		}



		return returnAjax(1,'绑定失败');
	}

	//添加
	public function addAdmin(){

		if(IS_POST){

		//	$auth = input('auth/a','','trim,strip_tags');//接收数组

			$password = input('password','','trim,strip_tags');

		  $salt = rand_string(6);

			$mdata = array();
			$mdata['role_id'] = input('roleId','','trim,strip_tags');
			$mdata['username'] = input('userName','','trim,strip_tags');

			$list = Db::name('admin')->field('id')->where('username', $mdata['username'])->find();

			if($list['id']){
					$this->error("该用户名已经存在。",Url("User/manager/addadmin"));
			}


			// $adminInfo = Db::name('admin')->field('destination_extension')->order('create_time desc')->find();

			// if ($adminInfo && $adminInfo['destination_extension'] > 0){
				// $destination_extension = ((int)$adminInfo['destination_extension'])+1;
			// }
			// else{
				// $destination_extension =  88881;
			// }



			$mdata['password'] = md5($password.$salt);

			$mdata['mobile'] = input('mobile','','trim,strip_tags');
			$mdata['email'] = input('email','','trim,strip_tags');
			//$mdata['destination_extension'] = $destination_extension;
			$mdata['status'] = 1;
			$mdata['create_time'] = time();
			$mdata['salt'] = $salt;

			// $expiry_date = input('expiry_date',"",'trim,strip_tags');
			// if(empty($expiry_date)){
			// 	return returnAjax(2, '请选择有效期');
			// }
			// $expiry_date = strtotime($expiry_date);
			// if($expiry_date){
			// 	$mdata['expiry_date'] = $expiry_date;
			// }

			$mdata['open_tsr'] = input('open_tsr','','trim,strip_tags');
			$mdata['examine'] = input('examine','','trim,strip_tags');

			$mdata['time_price'] = input('time_price','','trim,strip_tags');
			$mdata['month_price'] = input('month_price','','trim,strip_tags');
			$mdata['asr_price'] = input('asr_price','','trim,strip_tags');
			$mdata['credit_line'] = input('credit_line','','trim,strip_tags');
			// $mdata['robot_cnt'] = input('robot_cnt','','trim,strip_tags');
			// $loss_rate = input('loss_rate','0','trim,strip_tags');
			// if($loss_rate == 0){
			// 	$loss_rate = 0;
			// }
			// $mdata['loss_rate'] = $loss_rate;

			//获取用户的基本信息
      $user_auth = session('user_auth');
      $mdata['pid'] = $user_auth['uid'];
			//var_dump($mdata);exit;

			//新建用户，并返回新建用户的id号
			$member_id = Db::name('admin')->insertGetId($mdata);


			if($member_id){
				//判断当前用户是否是管理员或运营商
				$user_role = $this->get_user_role($member_id);
				if($user_role === '管理员' || $user_role === '运营商'){
					$pid = $user_auth['uid'];
					//获取当前用户配置的基础设置的配置值（管理员或运营商）
					$config_value = Db::name('config')->where(array('member_id'=>$user_auth['uid'],'group'=>36))->value('value');

				}else{
					//获取当前用户父id的基础设置的配置值（代理商或商家）
					$config_data = Db::name('config')
													->field('value,pid')
													->where([
														'member_id'	=>	$user_auth['uid'],
														'group'	=>	36
													])
													->find();

					$config_value = $config_data['value'];
					$pid = $config_data['pid'];
				}

				//生成新建用户中用户配置的基础设置
				$config = array();
				$config['pid'] = $pid;
				$config['member_id'] = $member_id;
				$config['title'] = '基础设置';
				$config['group'] = 36;
				$config['create_time'] = time();
				$config['value'] = $config_value;
				$config['status'] = 1;
				$config_id = Db::name('config')->insertGetId($config);

				if($config_id){
					return returnAjax(0,'新建成功',$config_value);
				}else{
					return returnAjax(2,'error!',"新建配置表失败");
				}

			}else{
				return returnAjax(1  ,'error!',"新建失败");
			}


		}else{

			$mlist = Db::name('admin_role')->field('id,name')->where('status', 1)->order('id asc')->select();


			$this->assign('rolelist', $mlist);
			$this->assign('current', '添加');
			return $this->fetch();
		}


	}

   //编辑管理员
	public function editAdmin(){

		if(IS_POST){

			//	$auth = input('auth/a','','trim,strip_tags');//接收数组

			$mdata = array();
			$roleId = input('roleId','','trim,strip_tags');
		if ($roleId){
			$mdata['role_id']  = $roleId;

		}
			$mdata['username'] = input('userName','','trim,strip_tags');

				$adminId = input('adminId','','trim,strip_tags');

			$list = Db::name('admin')->field('id')->where('username', $mdata['username'])->find();

			if($list['id'] != $adminId && isset($list['id'])){
					$this->error("该用户名已经存在。",Url("User/manager/addadmin"));
			}

			$mdata['mobile'] = input('mobile','','trim,strip_tags');
			$mdata['email'] = input('email','','trim,strip_tags');
			$mdata['logo'] = input('headpic','','trim,strip_tags');
			$mdata['status'] = input('status','1','trim,strip_tags');
			$mdata['update_time'] = time();
			// $mdata['expiry_date'] = strtotime(input('expiry_date','','trim,strip_tags'));
			$mdata['open_tsr'] = input('open_tsr','','trim,strip_tags');
			$mdata['examine'] = input('examine','','trim,strip_tags');

			$mdata['time_price'] = input('time_price','','trim,strip_tags');
			$mdata['month_price'] = input('month_price','','trim,strip_tags');
			$mdata['asr_price'] = input('asr_price','','trim,strip_tags');
			$mdata['credit_line'] = input('credit_line','','trim,strip_tags');
			// $mdata['robot_cnt'] = input('robot_cnt','','trim,strip_tags');
			// $loss_rate = input('loss_rate','0','trim,strip_tags');
			// if($loss_rate == 0){
			// 	$loss_rate = 0;
			// }
			// $mdata['loss_rate'] = $loss_rate;


			$result = Db::name('admin')->where('id', $adminId)->update($mdata);

			if($result){
				return returnAjax(0,'编辑成功',$result);
			}else{
				return returnAjax(1,'error!',"编辑失败");
			}


		}else{

			$Aid = input('id','','trim,strip_tags');

//
//    		$mlist = Db::name('admin_role')->field('id,name')->where('status', 1)->order('id asc')->select();
//    		$this->assign('rolelist', $mlist);
//

			$result = Db::name('admin')->where('id', $Aid)->find();

			// if($result['expiry_date']){
			// 	 $result['expirydate'] = date("Y-m-d H:i:s", $result['expiry_date']);
			// }

			$this->assign('list', $result);


			$picdata=array();
			if($result['logo']){
					if (is_numeric($result['logo'])) {
						$pic = Db::name('picture')->field('path')->where('id', $result['logo'])->find();
						if($pic['path']){
							$picdata['headpic'] = $result['logo'];
						}
					}
//        else {
// 						$picdata['headpic'] = $result['logo'];
// 					}
			}

			//var_dump($picdata);
			//exit;

			$this->assign('picdata', $picdata);


			$this->assign('current', '编辑');

			return $this->fetch('addadmin');
		}

  }

	public function addMoney(){

		$user_auth = session('user_auth');
		$pid = $user_auth['uid'];
		$user_auth_sign = session('user_auth_sign');
		if(empty($user_auth_sign) || empty($user_auth)){
			return returnAjax(2, 'error', '未登陆');
		}

		//给哪这个用户充值 用户ID
		$Aid = input('thisAdmin','','trim,strip_tags');
		//充值金额
    $money = input('moneyNum','','trim,strip_tags');
    //备注
    $note = input('note', '', 'trim,strip_tags');
    if(empty($Aid) || empty($money)){
    	return returnAjax(3, 'error!', '参数错误');
    }
    $AdminData = new AdminData();
		$role_name = $AdminData->get_role_name($pid);
		if($role_name != '管理员'){
			if($pid == $Aid){
				return returnAjax(4, 'error', '不能给自己充值');
			}
		}
    //获取余额
    $defore_balance = Db::name('admin')
    						->where('id', $Aid)
    						->value('money');
		$result = Db::name('admin')->where('id', $Aid)->setInc('money',$money);
		//获取充值后余额
		$balance = Db::name('admin')
								->where('id', $Aid)
								->value('money');
		if($result){

			$mdata = array();
			//获取用户的基本信息
			//$user_auth = session('user_auth');
			//$uid = $user_auth["uid"];
			$mdata['recharge_member_id'] = $pid;
			$mdata['owner'] = $Aid;
			$mdata['menoy'] = $money;
			$mdata['remak'] = $note;
			$mdata['defore_balance'] = $defore_balance;
			$mdata['balance'] = $balance;

			$mdata['type'] = 1;
			$mdata['status'] = 1;
			$mdata['create_time'] = time();
// 			$mdata['deposit_type'] = dfasf();
// 			$mdata['out_trade_no'] = time();
			//var_dump($mdata);exit;

			Db::name('tel_deposit')->insertGetId($mdata);


			return returnAjax(0,'充值成功',$result);
		}else{
			return returnAjax(1,'error!',"充值失败");
		}

		//Db::table('think_user')->where('id', 1)->setInc('score', 5);

	}


   /**
    * 修改状态
    */
   public function setstatus(){

   	$adminId = input('arrayIds/a','','trim,strip_tags');
   	$status = input('status','','trim,strip_tags');

   	$data=array();
   	$data['status'] = $status;

   //	var_dump();exit;
   	$list = Db::name('admin')->where('id','in', $adminId)->update($data);

   	if($list){
   		return returnAjax(0,'成功',$list);
   	}else{
   		return returnAjax(1,'失败',"失败");
   	}
   }


   /**
    * 修改人口座机状态
    */
   public function openAuditing(){

   	$adminId = input('arrayIds/a','','trim,strip_tags');
   	$status = input('status','','trim,strip_tags');

   	$data=array();
   	$data['examine'] = $status;

   //	var_dump();exit;
   	$list = Db::name('admin')->where('id','in', $adminId)->update($data);

   	if($list){
   		return returnAjax(0,'成功',$list);
   	}else{
   		return returnAjax(1,'error!',"失败");
   	}
   }


   /**
    * 删除，批量删除，接收数组
    */
   public function delAdmin(){

   	$adminId = input('admin_id/a','','trim,strip_tags');//接收数组

  	/**
  	 * 如果当前要删除的用户角色为"销售人员"
  	 * 那么进行回收上级用户所分配的机器人数量和线路
  	*/
  	$AdminData = new AdminData();
  	$LinesData = new LinesData();
  	foreach($adminId as $admin_id){
  		//验证当前用户的角色
	  	$role_name = $AdminData->get_role_name($admin_id);
	  	if($role_name === '销售人员'){
	  		$RobotDistribution = new RobotDistribution();
	  		//回收机器人数量 并 删除记录
	  		$result = $RobotDistribution->reset($admin_id);
	  		if($result === false){
	  			Log::info('回收机器人和删除分配记录失败');
	  			Log::info($admin_id);
	  		}
	  		//删除分配的线路
	  		$LinesData->delete_sale_lines($admin_id);
	  	}
  	}

   	$list = Db::name('admin')->where('id','in', $adminId)->delete();
   	if($list){
   		return returnAjax(0,'成功',$list);
   	}else{
   		return returnAjax(1,'error!',"失败");
   	}
   }


   	/**
	 * 修改密码初始化
	 * @author huajie <banhuajie@163.com>
	 */
	public function editpwd() {
		if (IS_POST) {

			//$user = model('User');
			$data = $this->request->post();


			if ($data['password'] != $data['repassword']){
				return $this->error('两次输入新密码不一致!');
			}
			unset($data['repassword']);

			$uid = session('user_auth.uid');
			$password = $data['password'] ;

			$oldpassword = $data['oldpassword'] ;

		 	$userinfo =  Db::name('admin')->field("password,salt")->where('id', $uid)->find();

	        $mpassword = md5($oldpassword);

		    if($userinfo['salt']){

		         $mpassword = md5($oldpassword.$userinfo['salt']);
		    }


			if($mpassword === $userinfo['password']){

			    $salt = rand_string(6);

				$mdata = array();
				$mdata['password'] = md5($password.$salt);
				$mdata['salt'] = $salt;

		   		$result = Db::name('admin')->where('id', $uid)->update($mdata);

			}else{
				//$this->error = '原始密码错误！';
				\think\Log::record('uid='.$uid.'原始密码错误！');
				return returnAjax(0,"修改密码失败,原始密码错误！");
			}


		//	$res = $user->editpw($data);

			if($result){

				return returnAjax(1,"修改密码成功！");

			}else{
				return returnAjax(0,"修改密码失败！");
			}
		}else{
			$this->setMeta('修改密码');
			return $this->fetch();
		}
	}

   //检查是否重名
	 public function chackname(){

		 $name = input('name','','trim,strip_tags');

		 $list = Db::name('admin')->field('id')->where('username', $name)->find();

		 if($list['id']){
		 	return returnAjax(0,'该用户名已经存在',$list);
		 }else{
		 	return returnAjax(1,'ok!',"可以用");
		 }
	 }

	 	//返回白名单编辑的信息
	 	public function getadmin(){

	 		$id = input('id','','trim,strip_tags');
	 		$mlist = Db::name('admin')->where('id', $id)->find();

			// $mlist['expiry_date'] = date("Y-m-d H:i:s",$mlist['expiry_date']);

	 		if($mlist){

				return returnAjax(0,'获取数据成功',$mlist);

			}else{
				return returnAjax(1,'获取数据失败');

			}


	 	}



}
