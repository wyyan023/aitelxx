<?php
namespace extend\PHPExcel;
namespace extend\PHPExcel\PHPExcel;
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;

use Qiniu\json_decode;
 

class Member extends User{
	
	
	/**
	 * 用户管理首页
	 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
	 */
	public function index() {
		
		$connect = Db::connect('db_config1');
	
		$tasklist = $connect->table('autodialer_number_1')->field('number,hangupcause')->where('state', 10)->select();
		foreach($tasklist as $item){
			if ($item['hangupcause'] == 'NORMAL_CLEARING'){
				Db::name('member')->where('mobile',$item['number'])->update(array('status'=>2));
			}
			else{
				Db::name('member')->where('mobile',$item['number'])->update(array('status'=>3));
				
			}
			
			
		}
		
		
		
		$nickname = input('nickname');
		$map['status'] = array('egt', 0);
		if (is_numeric($nickname)) {
			$map['uid|nickname'] = array(intval($nickname), array('like', '%' . $nickname . '%'), '_multi' => true);
		} else {
			$map['nickname'] = array('like', '%' . (string)$nickname . '%');
		}

		$order = "uid desc";
		$list = model('User')->where($map)->order($order)->paginate(15);

		$data = array(
			'list'  => $list,
			'page'  => $list->render(),
		);
		$this->assign($data);
		$this->setMeta('用户信息');
		return $this->fetch();
	}
	
	/**
	 * 添加用户
	 * @author colin <molong@tensent.cn>
	 */
	public function add(){
		$model = \think\Loader::model('User');
		if(IS_POST){
			$data = $this->request->param();
			//创建注册用户
			$uid = $model->register($data['username'], $data['password'], $data['repassword'], $data['email'], false);
	
			if(0 < $uid){
				$userinfo = array('nickname' => $data['username'], 'status' => 1,'reg_time'=>time(),'last_login_time'=>time(),'last_login_ip'=>get_client_ip(1));
				/*保存信息*/
				if(!db('Member')->where(array('uid'=>$uid))->update($userinfo)){
					return $this->error('用户添加失败！', '');
				} else {
					return $this->success('用户添加成功！', url('admin/user/index'));
				}
			}else{
				return $this->error($model->getError());
			}
		}else{
			$data = array(
					'keyList' => $model->addfield
			);
			$this->assign($data);
			$this->setMeta("添加用户");
			return $this->fetch('public/edit');
		}
	}


	/**
	 * 修改昵称初始化
	 * @author huajie <banhuajie@163.com>
	 */
	
	public function edit() {
		
		$model = model('User');
		
		if(IS_POST){
			$data = $this->request->post();
			unset($data['id']);
			$reuslt = $model->editUser($data, true);
				
			if (false !== $reuslt) {
				return $this->success('修改成功！', url('user/user/index'));
			}else{
				return $this->error($model->getError(), '');
			}
		}else{
			$info = $this->getUserinfo();
	
			$data = array(
					'info'  => $info,
					'keyList' => $model->editfield
			);
			$this->assign($data);
			$this->setMeta("编辑用户");
			return $this->fetch('public/edit');
		}
	}
	
	/**
	 * 获取某个用户的信息
	 * @var uid 针对状态和删除启用
	 * @var pass 是查询password
	 * @var errormasg 错误提示
	 * @author colin <colin@tensent.cn>
	 */
	private function getUserinfo($uid = null,$pass = null,$errormsg = null){
		$user = model('User');
		$uid = $uid ? $uid : input('id');
		//如果无UID则修改当前用户
		$uid = $uid ? $uid : session('user_auth.uid');
		$map['uid'] = $uid;
		if($pass != null ){
			unset($map);
			$map['password'] = $pass;
		}
		$list = $user::where($map)->field('uid,username,nickname,sex,email,qq,score,signature,status,salt')->find();
		if(!$list){
			return $this->error($errormsg ? $errormsg : '不存在此用户！');
		}
		return $list;
	}
	
	public function auth(){
		$access = model('AuthGroupAccess');
		$group = model('AuthGroup');
		if (IS_POST) {
			$uid = input('uid','','trim,intval');
			$access->where(array('uid'=>$uid))->delete();
			$group_type = config('user_group_type');
			foreach ($group_type as $key => $value) {
				$group_id = input($key,'','trim,intval');
				if ($group_id) {
					$add = array(
							'uid' => $uid,
							'group_id' => $group_id,
					);
					$access->save($add);
				}
			}
			return $this->success("设置成功！");
		}else{
			$uid = input('id','','trim,intval');
			$row = $group::select();
			$auth = $access::where(array('uid'=>$uid))->select();
	
			$auth_list = array();
			foreach ($auth as $key => $value) {
				$auth_list[] = $value['group_id'];
			}
			foreach ($row as $key => $value) {
				$list[$value['module']][] = $value;
			}
			$data = array(
					'uid'   => $uid,
					'auth_list' => $auth_list,
					'list' => $list
			);
			$this->assign($data);
			$this->setMeta("用户分组");
			return $this->fetch();
		}
	}
	
	/**
	 * 修改密码初始化
	 * @author huajie <banhuajie@163.com>
	 */
	public function editpwd() {
		
		
		if (IS_POST) {
			$user = model('User');
			$data = $this->request->post();
				
			if ($data['password'] != $data['repassword']){
				return $this->error('两次输入新密码不一致!');
			}
			unset($data['repassword']);
				
			$data['uid'] = session('user_auth.uid');
			$res = $user->editpw($data);
				
			if($res){
				return returnAjax(1,"修改密码成功！");
					
			}else{
				return returnAjax(0,"修改密码失败！");
			}
		}else{
			$this->setMeta('修改密码');
			return $this->fetch();
		}
	}
	
	/**
	 * del
	 * @author colin <colin@tensent.cn>
	 */
	public function del($id){
		$uid = array('IN',is_array($id) ? implode(',',$id) : $id);
		//获取用户信息
		$find = $this->getUserinfo($uid);
		model('User')->where(array('uid'=>$uid))->delete();
		return $this->success('删除用户成功！');
	}
	
	
	/**
	 * 等级列表
	 */
	public function grade(){
	
		$list = Db::name('member_level')->paginate(5, false, array('query'  =>  $this->param));
	
		$page = $list->render();
		$list = $list->toArray();
		//dump($list['data']);exit;
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		return $this->fetch();
	}


	/**
	 * 修改等级状态，转入id 状态，错误就有返回
	 * @return \think\mixed
	 */
	public function gradeStatus(){
		$gid = input('id');
		$data=array();
		$data['status'] = input('status');
		$list = Db::name('member_level')->where('id',$gid)->update($data);
		
		if(!$list){
			echo "修改失败。";
		}
	}
	
	/**
	 * 添加等级
	 * @return \think\mixed
	 */
	public function addGrade(){
		if(IS_POST){
			
			$ctype=array();
			$ctype['name'] = input('name');
			$ctype['order_money'] = input('order_money');
			$ctype['order_count'] = input('order_count');
			$ctype['discount'] = input('discount');
			
			$result = Db::name('member_level')->insertGetId($ctype);

			if($result){
				$data = array();
				$data['code'] = 1;
				$data['msg'] = "新建成功";
				$data['url'] = Url("User/Member/grade");
				echo json_encode($data);
					
			}else{
				$data = array();
				$data['code'] = 0;
				$data['msg'] = "新建失败";
				$data['url'] = Url("User/Member/addGrade");
				echo json_encode($data);
			}
	
		}else{
			$this->assign('current', '添加');
			return $this->fetch();
		}
	}
	
	/**
	 * 编辑等级 
	 */
	public function editGrade(){
		if(IS_POST){

			$ctype=array();
			$ctype['name'] = input('name');
			$ctype['order_money'] = input('order_money');
			$ctype['order_count'] = input('order_count');
			$ctype['discount'] = input('discount');
	
			$result = Db::name('member_level')->where('id', input('gradeId'))->update($ctype);
		
			if($result){
				$data = array();
				$data['code'] = 1;
				$data['msg'] = "编辑成功";
				$data['url'] = Url("User/Member/grade");
				echo json_encode($data);
					
			}else{
				$data = array();
				$data['code'] = 0;
				$data['msg'] = "编辑失败";
				$data['url'] = Url("User/Member/editGrade",array('id'=>input('gradeId')));
				echo json_encode($data);
			}

	
		}else{
			$id = input('id');
			$levellist =  Db::name('member_level')->where('id', $id)->find();
			$this->assign('levellist', $levellist);
			$this->assign('current', '编辑');
			return $this->fetch('addgrade');
		}
	}
	
	/**
	 * 根据id删除等级  
	 */
	public function delGrade($id = ''){
	
		$list = Db::name('member_level')->where('id', $id)->delete();
	
		if(!$list){
			echo "删除失败。";
		}
	}

	/**
	 * 会员列表
	 */
	public function userList(){
	
		$mobile = input('mobile');
		$email = input('email');
		if ($mobile || $email) {
			$list = Db::name('member')->where('mobile like "%'.$mobile.'%" or email = "'.$email.'"')->paginate(6, false, array('query'  =>  $this->param));
		} else {
			$list = Db::name('member')->paginate(5, false, array('query'  =>  $this->param));
		}
		
		
	
		$page = $list->render();
		$list = $list->toArray();
	
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		return $this->fetch();
	}
	
	//用户列表
	public function memberList(){
	    	
        $mobile = input('mobile','','trim,strip_tags');
		$startDate = input('startDate','','trim,strip_tags');
		$endTime = input('endTime','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$startNum = input('startNum','','trim,strip_tags');
		$endNum = input('endNum','','trim,strip_tags');
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		 $where = array();
    	if($mobile){
    		$where["m.mobile"] = $mobile;
    	}
    	
		if (!$super){
			$where["m.owner"] = $uid;
		}
		
    	if($startDate && $endTime){
    		$where["m.reg_time"] = ["between time",[$startDate,$endTime]];
    	}
    	
    	if($startNum>=0 && $endNum){
    		$where["m.duration"] = ["between",[$startNum,$endNum]];
     	}
      else if($startNum > 0){
    		$where["m.duration"] = [">=",$startNum];
    	}
    	
    	if($status != ""){
    		$where["m.status"] = $status;
    	}
		//dump($where);exit;
        $where["m.user_type"] = 0;  //白名单   0是普通用户 1是白名单用户

		$list = Db::name('member')
			->field('g.name,m.uid,m.username,m.nickname,m.mobile,m.reg_time,m.status,m.uid,m.duration')
			->alias('m')
			->where($where)
			->join('member_group g','g.id = m.group_id','LEFT')
			
			->order('m.reg_time desc')
			->paginate(10, false, array('query'  =>  $this->param));
		
		
		$total = Db::name('member')->alias('m')->where($where)->count('uid');
    		
    	$page = $list->render();
    	$list = $list->toArray();
    		
    	foreach ($list['data'] as $k=>$v){
    		if($v["reg_time"]){
    			$list['data'][$k]["reg_time"] = date("Y-m-d H:i:s",$v["reg_time"]);
    		}else{
    			$list['data'][$k]["reg_time"] = "";
    		}
    	}
    	
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
	
    	$this->assign('total', $total);
    	
    	//让客户选择导入到哪个任务里面
    			
		$where = array();
   		if(!$super){
   			$where['member_id'] = (int)$uid;
   		}
		if (config('db_config1')){
			$connect = Db::connect('db_config1');
		}
		else{
			$connect = Db::connect();
		}
		$where['start'] = 1;
		$gatewayUser = config('notify_url');
		if ($gatewayUser){
			$where['call_notify_url'] = $gatewayUser;
		}
		
		$tasklist = $connect->table('autodialer_task')->field('uuid,name')->where($where)->order('uuid desc')->select();
		//var_dump($tasklist);
		//exit;
		$tlst = array();
		$tlst['tasklist'] = $tasklist;
		$tlst['length'] = count($tasklist);
		$this->assign('tlst', $tlst);

		$groupList = array();
		$groupList = Db::name('member_group')->field('id,name')->where('status', 1)->order('id asc')->select();
		$this->assign('groupList',$groupList); 
		
		
    	return $this->fetch();
    	
    }
	
  public function detail(){
	    	
    	$uid = input('id','','trim,strip_tags');
			
			$memberInfo = Db::name('member')->field('mobile,nickname,status,level,sex,duration,last_dial_time,record_path,uuid')->where('uid',$uid)->find();
			
			if ($memberInfo['uuid']){
				
				$bills = Db::name('tel_bills')->where('call_id',$memberInfo['uuid'])->order('id asc')->select();
			}
			else{
				$bills = Db::name('tel_bills')->where('phone',$memberInfo['mobile'])->order('id asc')->select();
			}
			
			if ($memberInfo['sex'] >= 0){
				$memberInfo['sex'] = $memberInfo['sex']?'女':'男';
			}
			else{
				$memberInfo['sex'] = '未知';
			}
			$memberInfo['nickname'] = $memberInfo['nickname']? $memberInfo['nickname']:'--';
			
			$memberInfo['last_dial_time'] = date('Y-m-d H:i:s', $memberInfo['last_dial_time']);
			
			
			switch ($memberInfo['status']) {
					case 1:
						$memberInfo['status'] = '排除中';
						break;
			
					case 2:
						$memberInfo['status'] = '已接通';
						break;
			
					case 3:
						$memberInfo['status'] = '未接听挂断/关机/欠费';
						break;
			
					default:
						$memberInfo['status'] = '排除中';
				}
			
			//$memberInfo['record_path'] = '';
			$this->assign('memberInfo', $memberInfo);
			$this->assign('bills', $bills);
    	return $this->fetch();
    }

    //返回详细信息
  public function backdetail(){

    	$uid = input('id','','trim,strip_tags');
		
			$memberInfo = Db::name('member')
			->field('mobile,nickname,status,level,sex,duration,last_dial_time,record_path,uuid,call_rotation,originating_call,task')
			->where('uid',$uid)->find();
			
			$num = Db::name('tel_bills')->where('status',1)->where('call_id',$uid)->count("id");

			
			if ($memberInfo['uuid']){
				
				$bills = Db::name('tel_bills')->where('call_id',$memberInfo['uuid'])->order('id asc')->select();
			}
			else{
				$bills = Db::name('tel_bills')->where('phone',$memberInfo['mobile'])->order('id asc')->select();
			}
			
			if ($memberInfo['sex'] >= 0){
				$memberInfo['sex'] = $memberInfo['sex']?'女':'男';
			}
			else{
				$memberInfo['sex'] = '未知';
			}
			$memberInfo['nickname'] = $memberInfo['nickname']? $memberInfo['nickname']:'--';
			
			$memberInfo['last_dial_time'] = date('Y-m-d H:i:s', $memberInfo['last_dial_time']);
			
			$config = Db::name('tel_config')->where('task_id',$memberInfo['task'] )->find();
			if ($config['call_prefix']){
				$memberInfo['record_path'] = str_replace($memberInfo['mobile'], $config['call_prefix'].$memberInfo['mobile'], $memberInfo['record_path']);
			}
			switch ($memberInfo['status']) {
					case 1:
						$memberInfo['status'] = '排除中';
						break;
			
					case 2:
						$memberInfo['status'] = '已接通';
						break;
			
					case 3:
						$memberInfo['status'] = '未接听挂断/关机/欠费';
						break;
			
					default:
						$memberInfo['status'] = '排除中';
				}
			
		
			$data = array();
			$data['memberInfo'] = $memberInfo;
			$data['bills'] = $bills;
			$data['num'] = $num;
			 
			return returnAjax(0,'获取成功',$data);


    }

     //删除用户
	public function delMember($id=''){
    
    	foreach ($id as $k=>$v){
    		$list = Db::name('member')->where('uid', $v)->delete();
    		if(!$list){
    			break;
    		}
    	}
    
    	if(!$list){
    		echo "删除失败。";
    	}
    
    }

    //编辑用户
    public function editMember(){
    	if(IS_POST){
        
         
			$ctype=array();
			$ctype['real_name'] = input('realname');
			$ctype['nickname'] = input('nickname');
			$ctype['sex'] = input('sex');  //0是男  1是女
			$ctype['mobile'] = input('phonenumber','','trim,strip_tags');
			$ctype['group_id'] = input('groupId','0','trim,strip_tags');
			$uid =  input('mumid');
			
			$user_auth = session('user_auth');
			$owner = $user_auth["uid"];
			$memberInfo = Db::name('member')->where(array('mobile'=>$ctype['mobile'],'owner'=>$owner))->find();
				
		
			if ($memberInfo && $memberInfo['uid'] != $uid){
				
				return returnAjax(1,'手机号码已存在！');
			}
				
            $result = Db::name('member')->where('uid', input('mumid'))->update($ctype);
            
     		if($result >= 0){
	    			
					return returnAjax(0,'success');
	    			
	    		}else{

	    			return returnAjax(1,'success');
	    		}
	 		 
	 		
		}else{
			
	 
				$id = input('id','','trim,strip_tags');
				$mlist = Db::name('member')->where('uid', $id)->find();
				$groupList = array();
				$groupList = Db::name('member_group')->field('id,name')->where('status', 1)->order('id asc')->select();
				$this->assign('groupList',$groupList); 
			
    		$this->assign('dvlist', $mlist);
    		$this->assign('current', '编辑');
  

			return $this->fetch('adddriver');
    	
			
		}
    }

    //添加用户
    public function addMember(){
			
    	if(IS_POST){
    	
				$ctype=array();
				$ctype['real_name'] = input('realname');
				$ctype['nickname'] = input('nickname');
				$ctype['group_id'] = input('groupId','0','trim,strip_tags');
				$ctype['username'] = input('phonenumber','','trim,strip_tags');
				$ctype['sex'] = input('sex');  //0是男  1是女
				$ctype['mobile'] = input('phonenumber','','trim,strip_tags');
				
				$user_auth = session('user_auth');
				$uid = $user_auth["uid"];
				$memberInfo = Db::name('member')->where(array('mobile'=>$ctype['mobile'],'owner'=>$uid))->find();
				if ($memberInfo){
					
					return returnAjax(1,'手机号码已存在！');
				}
				
				
				$user_auth = session('user_auth');
				$uid = $user_auth["uid"];		 
				$ctype['owner'] = $uid;
				$ctype['reg_time'] = time();
		
				$ctype['salt'] = rand_string(6);
				$ctype['password'] = md5(substr(input('phonenumber'),5).$ctype['salt']);
					
					
	    		$request = request();
	    		$ctype['reg_ip'] = $request->ip(0,true);
    		
				$ctype['is_new'] = 1;
				
	    		$result = Db::name('member')->insertGetId($ctype);
	    		if($result){
	    			
					return returnAjax(0,'success');
	    			
	    		}else{

	    			return returnAjax(1,'success');
	    		}
	    
    	}
		else{

    		$groupList = array();
			$groupList = Db::name('member_group')->field('id,name')->where('status', 1)->order('id asc')->select();
			$this->assign('groupList',$groupList); 

    		$picdata=array();
			$this->assign('picdata', $picdata);
  
    		$cardpic = array();
    		$this->assign('cardpic',$cardpic);
    		 
    		$bsnscardpic = array();
    		$this->assign('bsnscardpic',$bsnscardpic); 
    	
		    $cbgcardpic = array();
    		$this->assign('cbgcardpic',$cbgcardpic); 
    	
    	    $idcardpic2 = array();
    		$this->assign('idcardpic2',$idcardpic2); 
    		
    		$this->assign('current', '新建');
            return $this->fetch('adddriver');
   
    		
    	}
   
	  }
    
    //导入文件
    public function importExcel(){

			$tmp_file = $_FILES ['excel'] ['tmp_name'];
			$file_types = explode ( ".", $_FILES ['excel'] ['name'] );
			$file_type = $file_types [count ( $file_types ) - 1];

		

			/*设置上传路径*/
			$savePath = './uploads/Excel/';
			// 如果不存在则创建文件夹
			if (!is_dir($savePath)){
					mkdir($savePath); 
			}  
			
			/*以时间来命名上传的文件*/
			$str = date ( 'Ymdhis' ); 
			$file_name = $str . "." . $file_type;

			/*是否上传成功*/
			if (! copy ( $tmp_file, $savePath . $file_name )) 
			{
				$this->error ( '上传失败' );
			}
			
			$foo = new \PHPExcel();
			 $extension = strtolower( pathinfo($file_name, PATHINFO_EXTENSION) );

			//区分上传文件格式
			if($extension == 'xlsx') {
				$inputFileType = 'Excel2007';
				$objReader = \PHPExcel_IOFactory::createReader($inputFileType);
			}
			else{
				$inputFileType = 'Excel5';
				$objReader = \PHPExcel_IOFactory::createReader($inputFileType);
			}
			$objPHPExcel = $objReader->load($savePath.$file_name, $encode = 'utf-8');
			
			$excelArr = $objPHPExcel->getsheet(0)->toArray();
			
			
			if (count($excelArr) < 2){
				$this->redirect(Url("User/Member/memberList"),'导入的文件没有数据!');
				return;
			}
			
			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];
			$data = array();
		
			foreach ( $excelArr as $k => $v ){
					
					if ($k == 0){
						 continue;
					}
					
					$groupId = 0;
					if ($v[2]){
						$group = Db::name('member_group')->field('id,name')->where(array('status'=>1,'name'=>$v[2]))->find();
						if ($group){
							$groupId = $group['id'];
						}
					}
						
					$user['real_name'] = trim($v[0]);
					$user['owner'] = $uid;
					$user['nickname'] = trim($v[0]);
					$user['group_id'] = trim($groupId);
					$user['username'] = trim($v[0]);
					$user['sex'] = 0;  //0是男  1是女
					$isMob="/^1[2345789]{1}\d{9}$/";
					$user['mobile'] = trim(preg_replace("/(\s|\&nbsp\;|　|\xc2\xa0)/","",$v[1]));//trim(trim($v[1],''));
				   
					$mlist = Db::name('member')->field('owner,mobile')->where(array('mobile'=>$user['mobile']))->find();
					if(!empty($mlist) && ($mlist['owner'] == $user['owner'])){
                          continue;
					}
 
					$user['reg_time'] = time();
					$user['salt'] = rand_string(6);
					$user['password'] = md5(substr(input('phonenumber'),5).$user['salt']);
					array_push($data,$user);

			}
        	
       $result = Db::name('member')->insertAll($data);
       

       $this->redirect(Url("User/Member/memberList"),'导入成功');
    }

    
	//用户列表
    public function copyData(){
    	
        $idlist = input('id/a','','trim,strip_tags');
        $taskId = input("taskId","",'trim,strip_tags');
        $flag = input("flag","",'trim,strip_tags');
		
        if (config('db_config1')){
			$connect = Db::connect('db_config1');
		}
		else{
			$connect = Db::connect();
		}

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		
         
		$where = array();
		$where['owner'] = (int)$uid;
					
         if($flag == "join"){

				$result = $connect->table('autodialer_number_'.$taskId)->field('id')->order('id asc')->find();
				\think\Log::record('result='.json_encode($result));
				if($result){
					$Maximum = $result["id"];
				}
			  
				foreach ($idlist as $k=>$v){

                   	$where['uid'] = $v;
					$memberInfo = Db::name('member')->field('mobile,is_new,user_type')->where($where)->find();
					if ($memberInfo['user_type']){
						continue;
					}
					
				    $numarr = array();
				 	$numarr['number'] = $memberInfo['mobile'];

					if($memberInfo['is_new'] == 1 && $result){

                        $Maximum = $Maximum - 1;
						$numarr['id'] = $Maximum;
           
					}
    		        $connect->table('autodialer_number_'.$taskId)->insertGetId($numarr);

    		        $res = Db::name('member')->where($where)->update(['status' => 1,'task'=>$taskId]);
				}
				
         }else if($flag == "all"){
			

			$where['status'] = 0;
			$count = Db::name('member')->field('mobile')->where($where)->count();
			$page = 0;
			$pageSize = 30;

			$result = $connect->table('autodialer_number_'.$taskId)->field('id')->order('id asc')->find();

			  if($result){
		          $Maximum = $result["id"];
		      }

	      //  $Maximum = $result[0]["id"];
		
			while($page < $count){
				
				$mlist = Db::name('member')->field('uid,mobile,is_new')->where($where)->limit($pageSize)->select();

				foreach ($mlist as $k=>$v){

                    $numarr = array();
				 	$numarr['number'] = $v['mobile'];

					if($v['is_new'] == 1 && $result){

                        $Maximum = $Maximum - 1;
						$numarr['id'] = $Maximum;
                     
					}

                  
    		        $connect->table('autodialer_number_'.$taskId)->insertGetId($numarr);

                	$where['uid'] = $v['uid'];
    		        $res = Db::name('member')->where($where)->update(['status' => 1,'task'=>$taskId]);
					
				}
				$page += $pageSize;
				  \think\Log::record('#####copyData#####page='.$page. '#######count='.$count);
				//$connect->table('autodialer_number_'.$taskId)->insertAll($mobiles);
				
				//$mobileArr = array_column($mobiles, 'number');
				//$mobileStr = implode(',', $mobileArr);

				//Db::name('member')->where('mobile','in', $mobileStr)->update(['status' => 1,'task'=>$taskId]);
			

				
			}

			
			// $where['status'] = 0;
			// $count = Db::name('member')->field('mobile')->where($where)->count();
			// $page = 0;
			// $pageSize = 30;
		
			// while($page < $count){
				
			// 	$mobiles = Db::name('member')->field('mobile as number')->where($where)->limit($pageSize)->select();
			// 	$connect->table('autodialer_number_'.$taskId)->insertAll($mobiles);
				
			// 	$mobileArr = array_column($mobiles, 'number');
			// 	$mobileStr = implode(',', $mobileArr);

			// 	Db::name('member')->where('mobile','in', $mobileStr)->update(['status' => 1,'task'=>$taskId]);
			
			// 	$page += $pageSize;
			// }

			 				
         }else if($flag == "finish"){
						 
			//\think\Log::record('$flag="finish"');
			
			foreach ($idlist as $k=>$v){
				
						//\think\Log::record('$id='.$v);
					
						$where['uid'] = $v;
						$mlist = Db::name('member')->field('mobile,status,task')->where($where)->find();
				
					if($mlist['status'] == 1){
										
							$connect->execute("DELETE FROM `autodialer_number_".$mlist['task']."` WHERE `number` = ".$mlist['mobile']."");
						
							$res = Db::name('member')->where('uid',$v)->update(array('status'=>0));
					
					}
					
				}	
					
				// $connect->execute("DELETE FROM `autodialer_number_".$taskId."`");
				// Db::execute("UPDATE rk_member SET status = 0,task =''");
				
							
						 
         } else if($flag == "stopAll"){
					
			\think\Log::record('flag="stopAll"');
					 
			 $where['status'] = 1;
			 $idlist = Db::name('member')->field('uid,mobile,status,task')->where($where)->select();
				
				foreach ($idlist as $k=>$v){
			
				//\think\Log::record('$id='.$v);
				
				//$where['uid'] = $v;
				//$mlist = Db::name('member')->field('mobile,status,task')->where($where)->find();
				
				if($v['status'] == 1){
									
						$connect->execute("DELETE FROM `autodialer_number_".$v['task']."` WHERE `number` = ".$v['mobile']."");
					
						$res = Db::name('member')->where('uid',$v['uid'])->update(array('status'=>0));
						
				}
				
			}	
					
			// $connect->execute("DELETE FROM `autodialer_number_".$taskId."`");
			// Db::execute("UPDATE rk_member SET status = 0,task =''");
						
				
						 
         } 
       
        
         return returnAjax(0,'成功');
      	
 
    }
		
    
    //用户列表
    public function adminList(){
    
    	$username = input('username');
    	$mobile = input('mobile');
    
    	$sqlStr = "";
    	if($username){
    		$sqlStr = 'username like "%'.$username.'%"';
    	}
    	if($mobile){
    		if($sqlStr){
    			$sqlStr .= 'or mobile = "'.$mobile.'"';
    		}else{
    			$sqlStr = 'mobile = "'.$mobile.'"';
    		}
    	}
    
    	if ($sqlStr) {
    		$list = Db::name('master')->field('uid,username,nickname,email,mobile,sex,reg_time,id_card,logo,status')
    		->where($sqlStr)
    		->paginate(10, false, array('query'  =>  $this->param));
    		 
    	} else {
    		$list = Db::name('master')->field('uid,username,nickname,email,mobile,sex,reg_time,id_card,logo,status')
    		->paginate(10, false, array('query'  =>  $this->param));
    	}
    
    	$page = $list->render();
    	$list = $list->toArray();
    
    	foreach ($list['data'] as $k=>$v){
    		if($v["reg_time"]){
    			$list['data'][$k]["reg_time"] = date("Y-m-d H:i:s",$v["reg_time"]);
    		}else{
    			$list['data'][$k]["reg_time"] = "";
    		}
    		$piclist = Db::name('picture')->field('path')->where('id', $v['logo'])->find();
    		 
    		if($piclist['path']){
    			$list['data'][$k]['user_logo'] = $piclist['path'];
    		}else{
    			$list['data'][$k]['user_logo'] = "/application/user/static/images/innin.png";
    		}
    	}
    
    	// dump($list['data']);exit;
    	 
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
    
    
    	return $this->fetch();
    }
    
    //修改管理员状态
    public function adminStatus(){
    	$mem_id = $_POST['mem_id'];
    	
    	$data=array();
    	$data['status'] = input('status');
    	 
    	$list = Db::name('master')->where('uid','in', $mem_id)->update($data);
    	 
    	
    	if(!$list){
    		echo "修改失败。";
    	}
    }

    //添加用户
    public function addAdmin(){
    	if(IS_POST){
    		//  var_dump($_POST);exit;
    		$ctype=array();
    		$ctype['username'] = input('username');
    		$ctype['nickname'] = input('nickname');
    		$ctype['email'] = input('email');
    		$ctype['logo'] = input('logo');
    		$ctype['mobile'] = input('mobile');
    
    		$ctype['sex'] = input('sex');
    		$ctype['birthday'] = input('birthday');
    		$ctype['qq'] = input('qq');
    		$ctype['score'] = input('score');
    		$ctype['money'] = input('money');
    		
    		$ctype['is_admin'] = 1;
    		$ctype['reg_time'] = time();
    
    		$request = request();
    		$ctype['reg_ip'] = $request->ip(0,true);
    
    		$result = Db::name('master')->insertGetId($ctype);
    		if($result){
    			$data = array();
    			$data['code'] = 1;
    			$data['msg'] = "新建成功";
    			$data['url'] = Url("User/Member/adminList");
    			echo json_encode($data);
    
    		}else{
    			$data = array();
    			$data['code'] = 0;
    			$data['msg'] = "新建失败";
    			$data['url'] = Url("User/Member/addAdmin");
    			echo json_encode($data);
    		}
    
    	}else{
    		$picdata=array();
    
    		$this->assign('picdata', $picdata);
    		$this->assign('create_time', date("Y-m-d H:i:s", time()));
    		$this->assign('current', '新建');
    		return $this->fetch("addmember");
    	}
    }
    
    //编辑用户
    public function editAdmin(){
    	if(IS_POST){
    	
    		$ctype=array();
    		$ctype['username'] = input('username');
    		$ctype['nickname'] = input('nickname');
    		$ctype['email'] = input('email');
    		$ctype['logo'] = input('logo');
    		$ctype['mobile'] = input('mobile');
    
    		$ctype['sex'] = input('sex');
    		$ctype['birthday'] = input('birthday');
    		$ctype['qq'] = input('qq');
    		$ctype['score'] = input('score');
    		$ctype['money'] = input('money');
    		 
    		$result = Db::name('master')->where('uid', input('uid'))->update($ctype);
    		if($result){
    			$data = array();
    			$data['code'] = 1;
    			$data['msg'] = "编辑成功";
    			$data['url'] = Url("User/Member/adminList");
    			echo json_encode($data);
    
    		}else{
    			$data = array();
    			$data['code'] = 0;
    			$data['msg'] = "编辑失败";
    			$data['url'] = Url("User/Member/editAdmin",array('id' => input('uid')));
    			echo json_encode($data);
    		}
    
    	}else{
    		$id = input('id');
    		$mlist =  Db::name('master')->where('uid', $id)->find();
    
    		$pic = Db::name('picture')->where('id', $mlist['logo'])->find();
    		$picdata=array();
    		if($pic){
    			$picdata['logo']=$mlist['logo'];
    		}
    		$this->assign('picdata', $picdata);
    			
    		if($mlist["birthday"] == "0000-00-00"){
    			$mlist["birthday"] = "";
    		}
    			
    		
    		$this->assign('mlist', $mlist);
    		$this->assign('create_time', date("Y-m-d H:i:s", time()));
    		$this->assign('current', '编辑');
    		return $this->fetch('addmember');
    	}
    }
    
    //删除管理员
    public function delAdmin($id=''){
    	foreach ($id as $k=>$v){
    		$list = Db::name('master')->where('uid', $v)->delete();
    		if(!$list){
    			break;
    		}
    	}
    	
    	if(!$list){
    		echo "删除失败。";
    	}
    }
    
    //获取全部用户供选择为管理员
    public function getUser(){

    	$username = input('username');
    	$mobile = input('mobile');
    	$Page_size = 5;
    	
    	$page = input('page');
    	
    	if(!$page){
    		$page = 1;
    	}
    	
    	$sqlStr = "";
    	if($username){
    		$sqlStr = 'username like "%'.$username.'%"';
    	}
    	if($mobile){
    		if($sqlStr){
    			$sqlStr .= 'or mobile = "'.$mobile.'"';
    		}else{
    			$sqlStr = 'mobile = "'.$mobile.'"';
    		}
    	}
    	
    	if ($sqlStr) {
    		$list = Db::name('member')->field('uid,username,nickname,email,mobile,sex,reg_time,id_card,logo,status,department,positional')
    		->where($sqlStr)
    		->page($page,$Page_size)->select();
    		 
    	} else {
    		$list = Db::name('member')->field('uid,username,nickname,email,mobile,sex,reg_time,id_card,logo,status,department,positional')
    		->page($page,$Page_size)->select();
    	}

    	foreach ($list as $k=>$v){
    		if($v["reg_time"]){
    			$list[$k]["reg_time"] = date("Y-m-d H:i:s",$v["reg_time"]);
    		}else{
    			$list[$k]["reg_time"] = "";
    		}

    		$piclist = Db::name('picture')->field('path')->where('id', $v['logo'])->find();
    		if($piclist['path']){
    			$list[$k]['user_logo'] = $piclist['path'];
    		}else{
    			$list[$k]['user_logo'] = "/application/user/static/images/innin.png";
    		}
    	
    	}
    	if ($sqlStr) {
    		$count = Db::name('member')->where($sqlStr)->count('uid');
    	}else{
    		$count = Db::name('member')->count('uid');
    	}
       // var_dump($count);exit;
    	$page_count = ceil($count/$Page_size);
    	
    	 
    	$this->assign('Nowpage', $page);
    	$this->assign('list', $list);
    	$this->assign('page', $page_count);
    	
    	
    	return $this->fetch();
    	
    }

    //用户分布，地图
    public function distribution(){
    	if(IS_POST){
    		
    		
    		$coor = input('lng').",".input('lat');
    		
    		$list = Db::name('mall_order')
    		->field('order_id,order_sn,member_id,consignee,address,add_time')
    		->where('coordinate', $coor)
    		->order('add_time desc')
    		->select();
    		
    		foreach ($list as $k=>$v){
    			if($v["add_time"]){
    				$list[$k]["add_time"] = date("Y-m-d H:i:s",$v["add_time"]);
    			}else{
    				$list[$k]["add_time"] = "";
    			}
    			
    			$memlist = Db::name('member')->field('username,nickname,logo')->where('uid', $v['member_id'])->find();
    			$list[$k]['username'] = $memlist['username'];
    			$list[$k]['nickname'] = $memlist['nickname'];
    			
    			$goodsdata = Db::name('mall_order_goods')->field('goods_name')
    			->where(array('order_id'=>$v['order_id']))->find();
    			$list[$k]["goods_name"] = $goodsdata["goods_name"];
    				
    			
    			$piclist = Db::name('picture')->field('path')->where('id', $memlist['logo'])->find();
    			 
    			if($piclist['path']){
    				$list[$k]['user_logo'] = $piclist['path'];
    			}else{
    				$list[$k]['user_logo'] = "/application/user/static/images/innin.png"; ///uploads/picture/20170220/514de07dea725cf39ec545dd9a7b7177.jpg
    			}
    			$list[$k]['count'] = count($list);
    		}
    		
    		 if(count($list)){
    		    return returnAjax(1,'返回成功',$list);
    		 }else{
    		    return returnAjax(0,'error',$list);
    		 }
    		
    
    	}else{
    		
    		$result = Db::name('mall_order')->field('coordinate')->select();
    		
    		$coordinate = array();
    		
    			foreach ($result as $k=>$v){
    			if ($v["coordinate"]){
    				$temp = explode(",",$v["coordinate"]);
	    			$coordinate[$k]['lng'] = $temp[0];
	    			$coordinate[$k]['lat'] = $temp[1];
    			}
    			
    		}
    	
    		
    		//dump($coordinate);exit;
    		$this->assign('list', $coordinate);
    		return $this->fetch();
    	} 
    	
    }

    /**
     * 分组管理
     */
    public function group(){

    	
    	$arr = array();
    	$arr['id'] = 0;
    	$arr['name'] = "无分组";
    	$arr['status'] = 1;
    	$arr['remark'] = "没有进行分组的成员";
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		$where = array();
		if (!$super){
			$where['owner'] = $uid;
		}
		
		
		$list = Db::name('member_group')->where($where)->paginate(5, false, array('query'  =>  $this->param));
    	
    	$page = $list->render();
    	$list = $list->toArray();
    	
		
		$where['group_id'] = 0;
    	$number = Db::name('member')->field('id')->where($where)->count();
    	$arr['number'] = $number;
    	
    	$this->assign('arr', $arr);
    	
    	foreach($list['data'] as $k=>$v){
    		$tempnum = Db::name('member')->field('id')->where('group_id', $v['id'])->count();
    		$list['data'][$k]['number'] = $tempnum;
    	}

    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
    	
    	return $this->fetch();
    }
    
    /**
     * 添加分组
     * @return \think\mixed
     */
    public function addGroup(){
    	if(IS_POST){

    		$ctype=array();
    		$ctype['name'] = input('name');
    		$ctype['status'] = input('status');
    		$ctype['remark'] = input('remark');
    	
    		$result = Db::name('member_group')->insertGetId($ctype);
    
    		if($result){
    			$data = array();
    			$data['code'] = 1;
    			$data['msg'] = "新建成功";
    			$data['url'] = Url("User/Member/group");
    			echo json_encode($data);
    				
    		}else{
    			$data = array();
    			$data['code'] = 0;
    			$data['msg'] = "新建失败";
    			$data['url'] = Url("User/Member/addGroup");
    			echo json_encode($data);
    		}
    			
    	}else{
    		$this->assign('current', '添加');
    		return $this->fetch();
    	}
    }
    
    /**
     * 编辑分组
     */
    public function editGroup(){
    	if(IS_POST){
    
    		$ctype=array();
    		$ctype['name'] = input('name');
    		$ctype['status'] = input('status');
    		$ctype['remark'] = input('remark');
    		
    		$result = Db::name('member_group')->where('id', input('groupId'))->update($ctype);
    
    		if($result){
    			$data = array();
    			$data['code'] = 1;
    			$data['msg'] = "编辑成功";
    			$data['url'] = Url("User/Member/group");
    			echo json_encode($data);
    				
    		}else{
    			$data = array();
    			$data['code'] = 0;
    			$data['msg'] = "编辑失败";
    			$data['url'] = Url("User/Member/editGroup",array('id'=>input('groupId')));
    			echo json_encode($data);
    		}
    
    
    	}else{
    		$id = input('id');
    		$grouplist =  Db::name('member_group')->where('id', $id)->find();
    		$this->assign('grouplist', $grouplist);
    		$this->assign('current', '编辑');
    		return $this->fetch('addgroup');
    	}
    }
    
    /**
     * 根据id删除分组
     */
    public function delGroup($id = ''){
    
    	$list = Db::name('member_group')->where('id', $id)->delete();
			$result = Db::name('member')->where('group_id', $id)->update(array('group_id'=>0));
			if(!$list){
			
				echo "删除失败。";
			}
    }
    
    /**
     * 根据分组id查看分组里面的成员
     */
    public function groupList(){
    	
        $groupId = input('groupId');

    	$sqlStr = 'group_id = "'.$groupId.'"';
        
    	$list = Db::name('member')->field('uid,username,nickname,email,mobile,sex,reg_time,id_card,logo,status')
    	->where($sqlStr)
    	->paginate(10, false, array('query'  =>  $this->param));
    	
    		
    	$page = $list->render();
    	$list = $list->toArray();
    		
    	foreach ($list['data'] as $k=>$v){
    		if($v["reg_time"]){
    			$list['data'][$k]["reg_time"] = date("Y-m-d H:i:s",$v["reg_time"]);
    		}else{
    			$list['data'][$k]["reg_time"] = "";
    		}
    	    $piclist = Db::name('picture')->field('path')->where('id', $v['logo'])->find();
    			
    		if($piclist['path']){
    			$list['data'][$k]['user_logo'] = $piclist['path'];
    		}else{
    			$list['data'][$k]['user_logo'] = "/application/user/static/images/innin.png";
    		}
    	}
    		
    
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
    	
    	return $this->fetch();
    }
    
    
    /**
     * 从用户表导入管理员表，传用户id
     */
    public function importAdmin($user_id=''){
 
    		$mlist =  Db::name('member')->where('uid', $user_id[0])->find();
    		$uresult =  Db::name('master')->where('mobile', $mlist['mobile'])->find();
    		if($uresult){
    			echo "保存失败，该用户已经是管理员";
    		}else{
    			unset($mlist['uid']);
    			unset($mlist['department']);
    			unset($mlist['positional']);
    			
    			$result = Db::name('master')->insertGetId($mlist);
    		}

    }
    

    /**
     * 修改昵称提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitNickname() {
    
    	//获取参数
    	$nickname = input('post.nickname');
    	$password = input('post.password');
    	if (empty($nickname)) {
    		return $this->error('请输入昵称');
    	}
    	if (empty($password)) {
    		return $this->error('请输入密码');
    	}
    
    	//密码验证
    	$User = new UserApi();
    	$uid = $User->login(UID, $password, 4);
    	if ($uid == -2) {
    		return $this->error('密码不正确');
    	}
    
    	$Member = model('User');
    	$data = $Member->create(array('nickname' => $nickname));
    	if (!$data) {
    		return $this->error($Member->getError());
    	}
    
    	$res = $Member->where(array('uid' => $uid))->save($data);
    
    	if ($res) {
    		$user = session('user_auth');
    		$user['username'] = $data['nickname'];
    		session('user_auth', $user);
    		session('user_auth_sign', data_auth_sign($user));
    		return $this->success('修改昵称成功！');
    	}
    	else {
    		return $this->error('修改昵称失败！');
    	}
    }
		
		
    /**
     * 会员状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method = null) {
    	$id = array_unique((array)input('id', 0));
    	if (in_array(config('user_administrator'), $id)) {
    		return $this->error("不允许对超级管理员执行该操作!");
    	}
    	$id = is_array($id) ? implode(',', $id) : $id;
    	if (empty($id)) {
    		return $this->error('请选择要操作的数据!');
    	}
    	$map['uid'] = array('in', $id);
    	switch (strtolower($method)) {
    		case 'forbiduser':
    			$this->forbid('Member', $map);
    			break;
    
    		case 'resumeuser':
    			$this->resume('Member', $map);
    			break;
    
    		case 'deleteuser':
    			$this->delete('Member', $map);
    			break;
    
    		default:
    			return $this->error('参数非法');
    	}
    }
    

	 //我的订单列表
    public function myOrder(){

    	$where = array();
    	$member_id = trim(input('id'));
    	if($member_id != ''){
    		$where["from_memer_id"] = $member_id;
    	}

    	
    	$list = Db::name('express')->where($where)->order('create_time desc')->paginate(10, false, array('query'  =>  $this->param));
    	
    	$amounttotal = Db::name('express')->where($where)->sum('real_pay_money');
    	$total = Db::name('express')->where($where)->count('id');
    
    	$page = $list->render();
    	$list = $list->toArray();
    	
    	foreach($list['data'] as $k=>$v){
    		if($v['express_type'] == 1 || $v['express_type'] == 2 || $v['express_type'] == 4){
			/*	$recvInfoArr = json_decode($v['to'],true);
				$recvInfo = $recvInfoArr[count($recvInfoArr)-1];
				$list['data'][$k]['to'] = $recvInfo['address'];
				//$value['to_mobile'] = $recvInfo['mobile'];*/
				$list['data'][$k]['to'] = json_decode($v['to'],true);
			}
     
				
			
    	}
    /*
    	var_dump($list['data']);
    	exit;
    	*/
    	$this->assign('orderList',$list['data']);
    	$this->assign('page', $page);
    	
      //  var_dump($list);exit;
        
    	
    	$this->assign('amounttotal', $amounttotal);
    	$this->assign('total', $total);
    	
    	return $this->fetch("myorder");
    }



    //添加或编辑上传提现二维码图片的
    public function uploadimg(){
    	 
    	$picdata = input('picdata');
    
    	$date = date("Ymd",time());
    	$dir = "./uploads/picture/".$date;
    	 
    	// 如果不存在则创建文件夹
    	if (!is_dir($dir)){
    		mkdir($dir);
    	}
    
    	$str = explode(',', $picdata);
    
    	$string = explode(';', $str[0]);
    	$type = explode('/', $string[0]);
    
    	//var_dump($type[1]);exit;
    
    	$tmp = base64_decode($str[1]);
    
    	$fp = "./uploads/picture/".$date."/".time().rand(1,100).".".$type[1];
    	// 检测目录中是否存在文件
    	if (!file_exists($fp)){
    		file_put_contents($fp, $tmp); // 如果图片不存在则创建*/
    	}else{
    		$string = "fuben";
    		$fp = "./uploads/picture/".$date."/".time().rand(1,100).$string.".".$type[1];
    		file_put_contents($fp, $tmp); // 如果存在则创建加一
    	}
    
    	$backurl = ltrim($fp,".");
    	$backurl = ltrim($backurl,"/");
    	$return['url'] = config('res_url').$backurl;
    	$return['code'] = 1;
    	echo json_encode($return);
    
    }	
    
    //会员设置
    public function set(){
    	if (IS_POST){
    		$act = input('act');
    		$data['reg_reward'] = input('reg_reward');
    		$data['invite_reward_l1'] = input('invite_reward1');
    		$data['invite_reward_l2'] = input('invite_reward2');
    		$data['invite_reward_l3'] = input('invite_reward3');
    		if ($act == 'insert'){
    			$ret = Db::name('member_set')->insert($data);
    		}
    		else{
    			$ret = Db::name('member_set')->where('id',1)->update($data);
    		}
    		return returnAjax();
    		
    	}else{
    		$memberSet = Db::name('member_set')->find();
    		$this->assign('act',$memberSet?'update':'insert');
    		$this->assign('set',$memberSet);
    		return $this->fetch();
    	}
    }
    

    //司机管理
    public function driver()
    {
    	
    	$where = array();
	    $where["user_type"] = 1;
	    	
    	$mobile = input('mobile','','trim,strip_tags');
    	if($mobile){
    		$where["mobile"] = $mobile;
    	}
    	
    	$uid = input('uid','','trim,strip_tags');
    	if($uid){
    		$where["uid"] = $uid;
    	}
    	
    	$status = input('status','','trim,strip_tags');
    	if($status != ""){
    		$where["status"] = $status;
    	}
    	
    	$audited = input('audited','','trim,strip_tags');
        if($audited != ""){
    		$where["Audited"] = $audited;
    	}

		//$keyword = input('keyword','','trim,strip_tags');
		
		//if ($keyword) {
			$list = Db::name('member')
			->field('uid,username,nickname,real_name,status,reg_time,money,vehicle_size,vehicle_type,vechicle_plate_number,level,mobile,logo,qrcode,Audited,employee')
			->where($where)->where('is_admin',0)->paginate(10, false, array('query'  =>  $this->param));
		   
		    $sum = Db::name('member')->where($where)->where('is_admin',0)->sum('money');
    		$total = Db::name('member')->where($where)->where('is_admin',0)->count('uid');
		/*} else {
			$list = Db::name('member')
			->field('uid,username,nickname,real_name,reg_time,money,vehicle_size,vehicle_type,vechicle_plate_number,level,mobile,logo,qrcode,Audited,employee')
			->where('user_type',1)->where('is_admin',0)->paginate(10, false, array('query'  =>  $this->param));
			
			 $sum = Db::name('member')->where('user_type',1)->where('is_admin',0)->sum('money');
    		 $total = Db::name('member')->where('user_type',1)->where('is_admin',0)->count('uid');
		}*/
		
		$page = $list->render();
		$list = $list->toArray();
	
		foreach ($list['data'] as $k=>$v){
			$drvlist =  Db::name('picture')->field('path')->where('id', $v['logo'])->find();
			
			//if($drvlist['path']){
				$list['data'][$k]['headpicture'] = ltrim($drvlist['path'],".");
			//}
			$list['data'][$k]['reg_time'] = date("Y-m-d", $v['reg_time']);
		} 
		
		
		$this->assign('sum', $sum); 
		$this->assign('total', $total);
		
		// 模板变量赋值
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		
		return $this->fetch();
	}
    
    //添加司机
    public function addDriver(){
    	if(IS_POST){
    		 
    		$driver=array();
    		$driver['nickname'] = htmlspecialchars_decode($_POST['nickname']);
    		$driver['real_name'] = htmlspecialchars_decode($_POST['realname']);
    		$driver['logo'] = (int)$_POST['headpic'];
    		$driver['sex'] = (int)$_POST['sex'];//0是男  1是女
    		$driver['status'] = (int)0;//0是关闭  1是开启
    		 
    		$driver['id_card_pic'] = $_POST['id_card_pic'];
    		$driver['id_card'] = $_POST['id_card'];
    		$driver['account'] = $_POST['account'];
    		$driver['account_type'] = $_POST['accounttype'];
    		$driver['email'] = $_POST['mailbox'];
    		$driver['mobile'] = $_POST['phonenumber'];
    		$driver['user_type'] = 1;
    		 
    		$driver['username'] = htmlspecialchars_decode($_POST['phonenumber']);
    		$driver['salt'] = rand_string(6);
    		$driver['invite_code'] = substr($_POST['phonenumber'],5);
    		$driver['password'] = md5(substr($_POST['phonenumber'],5).$driver['salt']);
    		
    	    $driver['vehicle_license'] = input('vehicle_license_pic','','trim,strip_tags');
    	    $driver['vehicle_driving'] = input('vehicle_driving_pic','','trim,strip_tags');
    	    $driver['vehicle_pic'] = input('vehicle_pic_pic','','trim,strip_tags');
    
    		$result = Db::name('member')->insertGetId($driver);
    
    		if($result){
    			$this->redirect("User/Member/driver");
    		}else{
    			$this->error("新建失败。",Url("User/Member/addDriver"));
    		}
    	}else{
    		
    		$picdata=array();
    		$this->assign('picdata', $picdata);
    		 
    		$cardpic=array();
    		$this->assign('cardpic',$cardpic);
    
            		 
    		$vcpicpic = array();
    		$this->assign('vcpicpic',$vcpicpic); 

    		$vcdrpic = array();
    		$this->assign('vcdrpic',$vcdrpic); 
    		
    		$vclcpic = array();
    		$this->assign('vclcpic',$vclcpic); 
	
    
    
    		$this->assign('current', '添加');
    		return $this->fetch();
    		
    		
    	}
    
    }
    
    //编辑司机页面
    public function editDriver(){
    	if(IS_POST){
    		$driver=array();
    		$driver['nickname'] = htmlspecialchars_decode($_POST['nickname']);
    		$driver['username'] = htmlspecialchars_decode($_POST['realname']);
    		$driver['logo'] = (int)$_POST['headpic'];
    		$driver['sex'] = (int)$_POST['sex'];//0是男  1是女
    		$driver['id_card_pic'] = $_POST['id_card_pic'];
    		$driver['id_card'] = $_POST['id_card'];
    		$driver['account'] = $_POST['account'];
    		$driver['account_type'] = $_POST['accounttype'];
    		$driver['email'] = $_POST['mailbox'];
    		$driver['mobile'] = $_POST['phonenumber'];
    		$driver['user_type'] = 1;
    	    $driver['vehicle_license'] = input('vehicle_license_pic','','trim,strip_tags');
    	    $driver['vehicle_driving'] = input('vehicle_driving_pic','','trim,strip_tags');
    	    $driver['vehicle_pic'] = input('vehicle_pic_pic','','trim,strip_tags');
    	    
    	    
    		$result = Db::name('member')->where('uid', $_POST['mumid'])->update($driver);
    
    		 if($result >= 0){
    			$this->redirect("User/Member/driver");
    		}else{
    			$this->error("编辑失败。",Url("User/Member/editDriver",array('id'=>$_POST['mumid'])));
    		}
    
    
    	}else{
    		 
    		 
    		$id = input('id');
    		$dvlist =  Db::name('member')->where('uid', $id)->find();
    		 
    		 
    		$list = Db::name('picture')->field('path')->where('id', $dvlist['logo'])->find();
    		$picdata=array();
    		if($list['path']){
    			$picdata['headpic']=$dvlist['logo'];
    		}
    		$this->assign('picdata', $picdata);
    		 
    		$icplist = Db::name('picture')->field('path')->where('id', $dvlist['id_card_pic'])->find(); 
    		$cardpic = array();
    		if($icplist){
    			$cardpic['id_card_pic'] = $dvlist['id_card_pic'];
    		}
    		$this->assign('cardpic',$cardpic);
    		 
    		/*$bsnscardpic = array();
    		if(get_image($dvlist['business_card'])){ 
    			$bsnscardpic['business_card_pic'] = $dvlist['business_card'];
    		}
    		$this->assign('bsnscardpic',$bsnscardpic); 
    	
		    $cbgcardpic = array();
    		if(get_image($dvlist['card_bg_img'])){ 
    			$cbgcardpic['card_bg_pic'] = $dvlist['card_bg_img'];
    		}
    		$this->assign('cbgcardpic',$cbgcardpic); 
    	
    	    $idcardpic2 = array();
    		if(get_image($dvlist['id_card_pic2'])){ 
    			$idcardpic2['id_card_pic2'] = $dvlist['id_card_pic2'];
    		}
    		$this->assign('idcardpic2',$idcardpic2); 
    	 */
		  
    			 
    		$vcpiclist = Db::name('picture')->field('path')->where('id', $dvlist['vehicle_pic'])->find();
    		$vcpicpic = array();
    		if($vcpiclist){ 
    			$vcpicpic['vehicle_pic_pic'] = $dvlist['vehicle_pic'];
    		}
    		$this->assign('vcpicpic',$vcpicpic); 
	 
	 
    		$vdimglist = Db::name('picture')->field('path')->where('id', $dvlist['vehicle_driving'])->find();
    		$vcdrpic = array();
    		if($vdimglist){ 
    			$vcdrpic['vehicle_driving_pic'] = $dvlist['vehicle_driving'];
    		}
    		$this->assign('vcdrpic',$vcdrpic); 
    		
    		$vclicenselist = Db::name('picture')->field('path')->where('id', $dvlist['vehicle_license'])->find();
    		$vclcpic = array();
    		if($vclicenselist){ 
    			$vclcpic['vehicle_license_pic'] = $dvlist['vehicle_license'];
    		}
    		$this->assign('vclcpic',$vclcpic); 
	
	 
    		$this->assign('dvlist', $dvlist);
    		$this->assign('current', '编辑');
    		return $this->fetch('adddriver');
    		 
    	}
    }
    
    //删除司机
    public function delDriver($driverids=''){
    
    	foreach ($driverids as $k=>$v){
    		$list = Db::name('member')->where('uid', $v)->delete();
    		//var_dump($list);
    		if($list != 1){
    			break;
    		}
    	}
    
    	if(!$list){
    		echo "'删除失败,'.$list";
    	}
    
    	}
    
    	//获取司机的审核必需信息
    	public function getMessage(){
    		
		    if(input('driver')){
		    	$id = input('driver');
		    }else{
		    	echo "获取审核信息失败。";
		    	exit;
		    }
		    
		    $driver = Db::name('member')->field('uid,username,real_name,id_card_pic,mobile,Audited,id_card,business_card,card_bg_img,vehicle_license,vehicle_type,vehicle_size,id_card_pic2,vehicle_driving,vehicle_pic,reasons')->where('uid', $id)->find();
	
		    $msg=array();
		    $msg['uid'] = $driver['uid'];
		    $msg['username'] = $driver['username'];
		    $msg['mobile'] = $driver['mobile'];
		    $msg['Audited'] = $driver['Audited'];
		    $msg['id_card'] = $driver['id_card'];
		    $msg['id_card_pic'] = get_image($driver['id_card_pic']);
		    $msg['business_card_pic'] = get_image($driver['business_card']);//ltrim($business['path'],".");
		    $msg['card_bg_pic'] = get_image($driver['card_bg_img']);//ltrim($card_bg['path'],".");
		    $msg['real_name'] = $driver['real_name'];
		    
		    $msg['id_card_pic2'] = get_image($driver['id_card_pic2']);
		    $msg['vehicle_pic_pic'] = get_image($driver['vehicle_pic']);
		    $msg['vehicle_driving_pic'] = get_image($driver['vehicle_driving']);
		    $msg['vehicle_license_pic'] = get_image($driver['vehicle_license']);
		    $msg['vehicle_size'] = $driver['vehicle_size'];
		    $msg['vehicle_type'] = $driver['vehicle_type'];
		    $msg['reasons'] = $driver['reasons'];
		    
		    if($driver['Audited'] == '1'){
		        $msg['audited_status'] = '已经提交资料';
		    }else if($driver['Audited'] == '2'){
		        $msg['audited_status'] = '已经通过审核';
		    }else{
		        $msg['audited_status'] = '未通过审核';
		    }
		    
		    echo json_encode($msg,true);
    
    }
        
    
    //我的订单列表
  	public function orderList(){

		    $where = array();
	    	$member_id = trim(input('id','','trim,strip_tags'));
	    	if($member_id != ''){
	    		$where["express_id"] = $member_id;
	    	}
	
	    	
	    	$list = Db::name('express')->where($where)->order('create_time desc')->paginate(10, false, array('query'  =>  $this->param));
	    	
	    	//$amounttotal = Db::name('express')->where($where)->sum('real_pay_money');
	    	$total = Db::name('express')->where($where)->count('id');
	    
	    	$page = $list->render();
	    	$list = $list->toArray();
	    	
	    	foreach($list['data'] as $k=>$v){
	    		if($v['express_type'] == 1 || $v['express_type'] == 2 || $v['express_type'] == 4){
					$list['data'][$k]['to'] = json_decode($v['to'],true);
				}	
	    	}
	
	    	$this->assign('orderList',$list['data']);
	    	$this->assign('page', $page);
	
	    	$this->assign('total', $total);
	    	
	    	return $this->fetch();	
		    		

    }

 
	
	public function changeLevel(){
		$level = input('level');
		$uid = input('id');
		
		$res = Db::name('member')->where('uid',$uid)->update(array('level'=>$level));
		
		if ($res >= 0){
			return returnAjax(0,'修改成功');
		}
		else{
			return returnAjax(1,'修改失败');
		}
		
	}
    
 
	 //呼叫记录列表
  	public function callrecord(){
          
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
	    $where = array();
        $mobile = input('keyword','','trim,strip_tags');
        $status = input('status','','trim,strip_tags');
    	if($mobile){
    		$where["m.mobile"] = $mobile;
    	}
		
		if (!$super){
			$where["m.owner"] = $uid;
		}
		

        $where["m.status"] = ['>',0];
    	if($status > 0){
    		 $where["m.status"] = $status;
    	}   
    	
    	$startNum = input('startNum','','trim,strip_tags');
    	$endNum = input('endNum','','trim,strip_tags');
    	
    	if($startNum>=0 && $endNum){
    		$where["m.duration"] = ["between",[$startNum,$endNum]];
    	}
    	else if($startNum > 0){
    		$where["m.duration"] = [">=",$startNum];
    	}
			
		$level = input('level','','trim,strip_tags');
		if($level){
			$where["m.level"] = $level;
		}
	

		$list = Db::name('member')
		->field('g.name,m.uid,m.username,m.nickname,m.mobile,m.last_dial_time,m.status,m.task,m.uid,m.level,m.duration')
		->alias('m')
		->join('member_group g','g.id = m.group_id','LEFT')
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
			
		if($level){
			$cwhere["level"] = $level;
		}
		 
		if (!$super){
			$cwhere["owner"] = $uid;
		}

		$count = Db::name('member')->where($cwhere)->count('uid');

	    $this->assign('mList',$list['data']);
	  	$this->assign('page', $page);
	    $this->assign('total', $count);

	    	
	    return $this->fetch();	
		    		

    }


    //白名单
    public function whitelist(){
    	   	
    	$mobile = input('mobile','','trim,strip_tags');
		  $startDate = input('startDate','','trim,strip_tags');
	  	$endTime = input('endTime','','trim,strip_tags');
		//$status = input('status','','trim,strip_tags');
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		 $where = array();
    	if($mobile){
    		$where["m.mobile"] = $mobile;
    	}
    	
		if (!$super){
			$where["m.owner"] = $uid;
		}
		
    	if($startDate && $endTime){
    		$where["reg_time"] = ["between time",[$startDate,$endTime]];
    	}
    	
   
	    $where["m.user_type"] = 1;  //白名单   0是普通用户 1是白名单用户

	  	$list = Db::name('member')
			->field('g.name,m.uid,m.username,m.nickname,m.mobile,m.reg_time,m.status,m.uid')
			->alias('m')
			->where($where)
			->join('member_group g','g.id = m.group_id','LEFT')
			
			->order('m.reg_time desc')
			->paginate(10, false, array('query'  =>  $this->param));
		
		
		$total = Db::name('member')->alias('m')->where($where)->count('uid');
    		
    	$page = $list->render();
    	$list = $list->toArray();
    		
    	foreach ($list['data'] as $k=>$v){
    		if($v["reg_time"]){
    			$list['data'][$k]["reg_time"] = date("Y-m-d H:i:s",$v["reg_time"]);
    		}else{
    			$list['data'][$k]["reg_time"] = "";
    		}
    	}
    	
      // dump($list);exit;

    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
	
    	$this->assign('total', $total);
			
			
			$groupList = array();
			$groupList = Db::name('member_group')->field('id,name')->where('status', 1)->order('id asc')->select();
			$this->assign('groupList',$groupList); 
    	
    	return $this->fetch();

    }
		
		
	 //添加白名单
    public function addwhite(){

    	if(IS_POST){
    	
				$ctype=array();
				$ctype['real_name'] = input('realname');
				$ctype['nickname'] = input('nickname');
				$ctype['group_id'] = input('groupId','0','trim,strip_tags');
				$ctype['username'] = input('phonenumber','','trim,strip_tags');
				$ctype['sex'] = input('sex');  //0是男  1是女
				$ctype['mobile'] = input('phonenumber','','trim,strip_tags');
			
				$user_auth = session('user_auth');
				$uid = $user_auth["uid"];		 
				$ctype['owner'] = $uid;
				$ctype['reg_time'] = time();
		
				$ctype['salt'] = rand_string(6);
				$ctype['password'] = md5(substr(input('phonenumber'),5).$ctype['salt']);
					
					
	    		$request = request();
	    		$ctype['reg_ip'] = $request->ip(0,true);
    		
				$ctype['is_new'] = 1;

				$ctype['user_type'] = 1;
				
	    		$result = Db::name('member')->insertGetId($ctype);

	    		if($result){
 		
	    			//  $this->error("新建成功",Url("User/Member/memberList"));
	    			$data = array();
	    			$data['code'] = 1;
	    			$data['msg'] = "添加成功";
	    			$data['url'] = Url("User/Express/template");

	    			echo json_encode($data);
    			   
	    		}else{
	    	
	    	        $data = array();
	    			$data['code'] = 0;
	    			$data['msg'] = "添加失败";
	    			$data['url'] = Url("User/Express/add");
	    			echo json_encode($data);
	    			//return returnAjax(1,'添加失败',$data);
	    		}
    
    	}
		else{

    		$groupList = array();
			$groupList = Db::name('member_group')->field('id,name')->where('status', 1)->order('id asc')->select();
			$this->assign('groupList',$groupList); 
    		
    		$this->assign('current', '新建');
            return $this->fetch('addwhite');
   
    		
    	}
   
    }

     //编辑白名单
    public function editwhite(){
       if(IS_POST){

					 
					$ctype=array();
					
					$ctype['nickname'] = input('nickname');
					$ctype['sex'] = input('sex');  //0是男  1是女
					$ctype['mobile'] = input('phonenumber','','trim,strip_tags');
					$ctype['group_id'] = input('groupId','0','trim,strip_tags');
				 
					$result = Db::name('member')->where('uid', input('mumid'))->update($ctype);
								
					if($result >= 0){
						
						$data = array();
						$data['code'] = 1;
						$data['msg'] = "编辑成功";
						$data['url'] = Url("User/Member/memberList");
						
						//echo json_encode($data);
						return returnAjax(1,'编辑成功',$data);
						//$this->redirect("User/Member/memberList");
						
					 }else{
						 
						$data = array();
						$data['code'] = 0;
						$data['msg'] = "编辑失败";
						$data['url'] = Url("User/Member/editMember",array('id' => input('uid')));
						//echo json_encode($data);

						return returnAjax(1,'编辑失败',$data);
						//$this->error("编辑失败。",Url("User/Member/editMember",array('id'=>$_POST['mumid'])));
						
					 }
					 
		 		
			}else{
				
		 
				$id = input('id','','trim,strip_tags');
				$mlist = Db::name('member')->where('uid', $id)->find();
				$groupList = array();
				$groupList = Db::name('member_group')->field('id,name')->where('status', 1)->order('id asc')->select();
				$this->assign('groupList',$groupList); 
				
	    		$this->assign('dvlist', $mlist);
	    		$this->assign('current', '编辑');
		  

		       	return $this->fetch('addwhite');
	    	
				
			}
    }
	
	  //返回白名单编辑的信息
	 public function getwhite(){
		 
		 $id = input('id','','trim,strip_tags');
		 $mlist = Db::name('member')->where('uid', $id)->find();
		 
		 return returnAjax(0,'获取数据成功',$mlist);
		 
	 }
 
   //导出文件
 /**
 * 导出excel表格
 *
 * @param   array    $columName    第一行的列名称
 * @param   array    $list         二维数组
 * @param   string   $setTitle    sheet名称
 * @return  
 * @author  Tggui <tggui@vip.qq.com>
 */
function exportExcel()
{

	$columName = ['主叫机号码','客户号码','客户姓名','呼叫结果','客户等级','通话时长','通话轮次','呼叫时间','分配状态','全程录音'];
	
	$user_auth = session('user_auth');
	$uid = $user_auth["uid"];		 
	$ctype['owner'] = $uid;
    $super = $user_auth["super"];

	$cwhere = array();
	$cwhere["status"] = ['>',0];
	if (!$super){
		$cwhere["owner"] = $uid;
	}


    $mobile = input('mobile','','trim,strip_tags');
    $status = input('status','','trim,strip_tags');
    $level = input('type','','trim,strip_tags');

	if($mobile){
		$cwhere["mobile"] = $mobile;
	}
		
	if($status > 0){
		 $cwhere["status"] = $status;
	}   
			
	if($level){
		$cwhere["level"] = $level;
	}
			

    $mList = Db::name('member')
		    ->field('originating_call,mobile,nickname,status,level,duration,call_rotation,last_dial_time,salesman,record_path')
		    ->where($cwhere)
		    ->order('uid asc')
		    ->select();

    foreach($mList as &$item){

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


		switch ($item['status']) {
    		case 3:
    			$item['status'] = '未接听挂断/关机/欠费';
				break;
			case 2:
    			$item['status'] = '已接通';
    			break;
    		default:
    			$item['status'] = '拨打排队中';
			
		}

		if($item['salesman'] > 0){
            $adminlist = Db::name('admin')->field('username,mobile')->where('id', $item['salesman'])->find();
            if($adminlist['username']){
              $item['salesman'] = $adminlist['username'];
            }else{
            	 $item['salesman'] = $adminlist['mobile'];
            }
           
		}else{
           $item['salesman'] = "未分配";
		}

		$item['record_path'] = config('res_url')."/".$item['record_path'];
			
	}
		


	// $one = ['1','2','3','4','5','6','7','8','9','10'];
	// $two = ['2','2','3','4','5','6','7','8','9','10'];
	// $three = ['3','2','3','4','5','6','7','8','9','10'];
	$list = $mList; //array($one,$two,$three);

	$setTitle='Sheet1';
	$fileName='文件名称';

    if ( empty($columName) || empty($list) ) {
        return '列名或者内容不能为空';
    }
    
    if ( count($list[0]) != count($columName) ) {
        return '列名跟数据的列不一致';
    }
    
    //实例化PHPExcel类
    $PHPExcel = new \PHPExcel();
    //获得当前sheet对象  
    $PHPSheet = $PHPExcel->getActiveSheet();
    //定义sheet名称
    $PHPSheet->setTitle($setTitle);
    
    //excel的列 这么多够用了吧？不够自个加 AA AB AC ……
    $letter = [
        'A','B','C','D','E','F','G','H','I','J','K','L','M',
        'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
    ];
    //把列名写入第1行 A1 B1 C1 ...
    for ($i=0; $i < count($list[0]); $i++) {
        //$letter[$i]1 = A1 B1 C1  $letter[$i] = 列1 列2 列3
        $PHPSheet->setCellValue("$letter[$i]1","$columName[$i]");
    }
    //内容第2行开始
    foreach ($list as $key => $val) {
        //array_values 把一维数组的键转为0 1 2 3 ..
        foreach (array_values($val) as $key2 => $val2) {
            //$letter[$key2].($key+2) = A2 B2 C2 ……
            $PHPSheet->setCellValue($letter[$key2].($key+2),$val2);
        }
    }

    $execlpath = './uploads/exportExcel/';
    if (!file_exists($execlpath)){
		mkdir($execlpath);
	}
	$execlpath .= rand_string(12,'',time()).'excel.xls';

    //生成2007版本的xlsx
    $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel,'Excel2007');
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename='.$fileName.'.xlsx');
    header('Cache-Control: max-age=0');
    $PHPWriter->save($execlpath);

    echo config('res_url').ltrim($execlpath,"."); 

}
// 其他自己加，什么字符格式了 样式了 各位需要的自己写了
    

// 修改任务状态
public function redial(){
	 if (config('db_config1')){
		$connect = Db::connect('db_config1');
	}
	else{
		$connect = Db::connect();
	}
	
	$task = input('task','','trim,strip_tags');
	$mobile = input('mobile','','trim,strip_tags');
 	$res = $connect->execute("UPDATE `autodialer_number_".$task."` SET state = 0 WHERE `number` = ".$mobile." limit 1");
	
	if ($res >=0 ){
		return  returnAjax(0,'添加到拨打对列成功');
	}
	else{
		
		return  returnAjax(1,'添加到拨打对列失败');
	}

   
}	
	



}


?>