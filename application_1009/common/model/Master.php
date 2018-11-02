<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\common\model;

/**
* 用户模型
*/
class Master extends Base{

	protected $name = "Master";
	protected $createTime = 'reg_time';
	protected $updateTime = 'last_login_time';

	protected $type = array(
		'uid'  => 'integer',
	);
	protected $insert = array('salt', 'password', 'status', 'reg_time');
	protected $update = array();

	public $editfield = array(
		array('name'=>'uid','type'=>'hidden'),
		array('name'=>'username','title'=>'用户名','type'=>'readonly','help'=>''),
		array('name'=>'nickname','title'=>'昵称','type'=>'text','help'=>''),
		array('name'=>'password','title'=>'密码','type'=>'password','help'=>'为空时则不修改'),
		array('name'=>'sex','title'=>'性别','type'=>'select','option'=>array('0'=>'保密','1'=>'男','2'=>'女'),'help'=>''),
		array('name'=>'email','title'=>'邮箱','type'=>'text','help'=>'用户邮箱，用于找回密码等安全操作'),
		array('name'=>'qq','title'=>'QQ','type'=>'text','help'=>''),
		array('name'=>'score','title'=>'用户积分','type'=>'text','help'=>''),
		array('name'=>'signature','title'=>'用户签名','type'=>'textarea','help'=>''),
		array('name'=>'status','title'=>'状态','type'=>'select','option'=>array('0'=>'禁用','1'=>'启用'),'help'=>''),
	);

	public $addfield = array(
		array('name'=>'username','title'=>'用户名','type'=>'text','help'=>'用户名会作为默认的昵称'),
		array('name'=>'password','title'=>'密码','type'=>'password','help'=>'用户密码不能少于6位'),
		array('name'=>'repassword','title'=>'确认密码','type'=>'password','help'=>'确认密码'),
		array('name'=>'email','title'=>'邮箱','type'=>'text','help'=>'用户邮箱，用于找回密码等安全操作'),
	);
    
	public $useredit = array(
		array('name'=>'uid','type'=>'hidden'),
		array('name'=>'nickname','title'=>'昵称','type'=>'text','help'=>''),
		array('name'=>'sex','title'=>'性别','type'=>'select','option'=>array('0'=>'保密','1'=>'男','2'=>'女'),'help'=>''),
		array('name'=>'email','title'=>'邮箱','type'=>'text','help'=>'用户邮箱，用于找回密码等安全操作'),
		array('name'=>'mobile','title'=>'联系电话','type'=>'text','help'=>''),
		array('name'=>'qq','title'=>'QQ','type'=>'text','help'=>''),
		array('name'=>'signature','title'=>'用户签名','type'=>'textarea','help'=>''),
	);

	public $userextend = array(
		array('name'=>'company','title'=>'单位名称','type'=>'text','help'=>''),
		array('name'=>'company_addr','title'=>'单位地址','type'=>'text','help'=>''),
		array('name'=>'company_contact','title'=>'单位联系人','type'=>'text','help'=>''),
		array('name'=>'company_zip','title'=>'单位邮编','type'=>'text','help'=>''),
		array('name'=>'company_depart','title'=>'所属部门','type'=>'text','help'=>''),
		array('name'=>'company_post','title'=>'所属职务','type'=>'text','help'=>''),
		array('name'=>'company_type','title'=>'单位类型','type'=>'select', 'option'=>'', 'help'=>''),
	);

	protected function setStatusAttr($value){
		return 1;
	}

	protected function setPasswordAttr($value, $data){
		return md5($value.$data['salt']);
	}

	/**
	* 用户登录模型
	*/
	public function login($username = '', $password = '', $type = 1,$isautologin=1, $location= ''){
		$map = array();
		if (\think\Validate::is($username,'email')) {
			$type = 2;
		}elseif (preg_match("/^1[34578]{1}\d{9}$/",$username)) {
			$type = 3;
		}
		
		switch ($type) {
			case 1:
				$map['username'] = $username;
				break;
			case 2:
				$map['email'] = $username;
				break;
			case 3:
				$map['mobile'] = $username;
				break;
			case 4:
				$map['uid'] = $username;
				break;
			case 5:
				$map['uid'] = $username;
				break;
			default:
				return 0; //参数错误
		}
		
		$user = $this->where($map)->find()->toArray();
		//var_dump($user);exit;
		if(is_array($user) && $user['status']){
			/* 验证用户密码 */
			if(md5($password.$user['salt']) === $user['password']){
				//更新坐标
				if ($location){
					$user['location'] = $location;
				}
				
				$this->autoLogin($user,$isautologin); //更新用户登录信息
				return $user['uid']; //登录成功，返回用户ID
			} else {
				return -2; //密码错误
			}
		} else {
			return -1; //用户不存在或被禁用
		}
	}

	/**
	 * 用户注册
	 * @param  integer $user 用户信息数组
	 */
 	function register($mobile, $password, $username='',$userType=0, $email='', $inviteCode =''){
		$data['username'] = $username?$username:$mobile;
		$data['salt'] = rand_string(6);
		$data['password'] = $password;
		$data['email'] = $email;
		$data['mobile'] = $mobile;
		$data['user_type'] = $userType;
		$data['invite_code'] = rand_string(10,'',time());	
		
		//获取邀请人的uid
		if ($inviteCode){
			$userInfo = $this->getUserInfoByInviteCode($inviteCode);
			if ($userInfo){
				$data['puid'] = $userInfo['uid'];
			}
		}		
	
		$result = $this->validate(false)->save($data);
		if ($result) {	
			//添加邀请记录
			if (isset($userInfo)){	
				$this->insertInvite($userInfo['uid'], $result,$userType);				
			}
			
			return $result;
		}else{
			
			return false;
		}
	}

	
	/**
	 * 用户注册
	 * @param  integer $user 用户信息数组
	 */
/* 	function register($username, $password, $repassword, $email, $isautologin = true){
		$data['username'] = $username;
		$data['salt'] = rand_string(6);
		$data['password'] = $password;
		$data['email'] = $email;
		$result = $this->validate(true)->save($data);
		if ($result) {
			$this->data['uid'] = $result;
			$this->extend()->save($data);
			if ($isautologin) {
				$this->autoLogin($this->data);
			}
			return $result;
		}else{
			if (!$this->getError()) {
				$this->error = "注册失败！";
			}
			return false;
		}
	} */
	
	
	/**
	 * 添加邀请记录
	 * @param  invite table
	 * @result id或false
	 */
	private function insertInvite($inviteUid, $inviteeUid, $userType){
		
		$data['invite_id'] = $inviteUid;
		$data['be_invited_id'] = $inviteeUid;
		$data['invite_time'] = date("y-m-d H:i:s",time());
		$data['type'] = $userType;
		
		$result = db('invite')->insertGetId($data);
		if ($result){
			return $result;
		}
		else{
			\think\Log::record('insertInvite method error!');	
			return false;
		}
	}
	
	
	/**
	 * 根据邀请code获取用户信息
	 * @param  string invite_code 
	 * @result 用户数据或false
	 */
	 private function getUserInfoByInviteCode($inviteCode){
			
				$data = $this->where('status','gt',0)
				-where('invite_code',$inviteCode)
				->find();
				
				if ($data){
					return $data;
				}
				else{
					return false;
				}	
	 }
	 

	/**
	 * 自动登录用户
	 * @param  integer $user 用户信息数组 $type 0保存到session 1不保存，返回给客户端
	 */
	private function autoLogin($user, $isautologin=1){
		/* 更新登录信息 */
		$data = array(
			'uid'             => $user['uid'],
			'login'           => array('exp', '`login`+1'),
			'last_login_time' => time(),
			'last_login_ip'   => get_client_ip(1),
			'location'				=> $user['location']
		);
		$this->where(array('uid'=>$user['uid']))->update($data);
		
		$user = $this->where(array('uid'=>$user['uid']))->find();		
		if ($isautologin){
			/* 记录登录SESSION和COOKIES */
			$auth = array(
				'uid'             => $user['uid'],
				'username'        => $user['username'],
				'last_login_time' => $user['last_login_time'],
			);
	
			session('user_auth', $auth);
			session('user_auth_sign', data_auth_sign($auth));
		}
	}

	public function logout(){
		session('user_auth', null);
		session('user_auth_sign', null);
	}

	public function getInfo($uid){
		$data = $this->where(array('uid'=>$uid))->find();
		if ($data) {
			return $data;
		}else{
			return false;
		}
	}
	
	public function getInfoByMobile($mobile){
		$data = $this->where(array('mobile'=>$mobile))->find();
		if ($data) {
			return $data;
		}else{
			return false;
		}
	}

	/**
	 * 修改用户资料
	 */
	public function editUser($data, $ischangepwd = false){
		if ($data['uid']) {
			if (!$ischangepwd || ($ischangepwd && $data['password'] == '')) {
				unset($data['salt']);
				unset($data['password']);
			}else{
				$data['salt'] = rand_string(6);
			}
			unset($data['id']);
			$result = $this->validate('master.edit')->save($data, array('uid'=>$data['uid']));//
			
			if ($result) {
				return $this->save($data, array('uid'=>$data['uid']));
			}else{
				return false;
			}
		}else{
			$this->error = "非法操作！";
			return false;
		}
	}

	public function editpw($data, $is_reset = false){
		
		$uid = $data['uid'] ? $data['uid'] : session('user_auth.uid');
		
		if (!$is_reset) {
			
			//后台修改用户时可修改用户密码时设置为true
			$checkReturn =  $this->checkPassword($uid,$data['oldpassword']);
			//echo $this->error;
			
			if(!$checkReturn){
			   return false;
			}
			$validate = $this->validate('member.password');
			if (false === $validate) {
				return false;
			}
		}

		$data['salt'] = rand_string(6);
		
	    unset($data['oldpassword']);

		return $this->save($data, array('uid'=>$uid));
	}

	protected function checkPassword($uid,$password){
		if (!$uid || !$password) {
			//$this->error = '原始用户UID和密码不能为空';
			\think\Log::record('uid='.$uid.'原始用户UID和密码不能为空！');
			return false;
		}

		$user = $this->where(array('uid'=>$uid))->find();
		if (md5($password.$user['salt']) === $user['password']) {
			return true;
		}else{
			//$this->error = '原始密码错误！';
			\think\Log::record('uid='.$uid.'原始密码错误！');
			return false;
		}
	}

	public function extend(){
		return $this->hasOne('MemberExtend', 'uid');
	}
	
	
}