<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use app\common\controller\Log;

//会员用户数据处理类
use app\common\controller\AdminData;
//线路数据处理类
use app\common\controller\LinesData;
//机器人分配处理
use app\common\controller\RobotDistribution;

class Device extends User{

  
  public function _initialize() {
    parent::_initialize();
  
    $request = request();
    $action = $request->action();

  }
  
  
  //设备主界面
  public function index()
  {

    return $this->fetch();
    
  }
  
  //设备主界面
  public function voip()
  {

    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    $super = $user_auth["super"];

    $where = array();
    $list = Db::name('tel_device')->where($where)->order('id desc')
    ->paginate(10, false, array('query'  =>  $this->param));

    $page = $list->render();
    $list = $list->toArray();

    $this->assign('list', $list['data']);
    $this->assign('page', $page);
    
    return $this->fetch();
    
  }
  
  public function lines(){
    
         
    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    $super = $user_auth["super"];
    
    $where = array();
    $where['member_id'] = ['=',$uid];
    // if(!$super){
      
    // }
    // if($super == 0){
    //   //获取线路
    //   $list = Db::name('tel_line')
    //           ->where($where)
    //           ->order('id desc')
    //           ->paginate(10, false, array('query'  =>  $this->param));
    // }else{
      //获取线路
      $list = Db::name('tel_line')
              ->where($where)
              ->order('id desc')
              ->paginate(10, false, array('query'  =>  $this->param));
    // }
    

    $page = $list->render();
    $list = $list->toArray();

    foreach ($list['data'] as $k=>$v){
      
      $admin = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
      $list['data'][$k]["username"] = $admin["username"];
      
      $memberInfo = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
      $list['data'][$k]["username"] = $memberInfo["username"];
    
    }
    
    //获取下属用户信息
    $subordinate_members = $this->get_subordinate_members($uid);
  
  	$this->assign('subordinate_members', $subordinate_members);

    $this->assign('list', $list['data']);
    $this->assign('page', $page);
              
    $this->assign('super', $super);
    $result = Db::name('admin')->where(array('status'=>1,'super'=>0))->select();
    $this->assign('memberList', $result);
    $this->assign('uid', $uid);
  

    return $this->fetch();
    
  }
  
  //添加设备信息
  public function addLine(){

    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    
    $data = array();
    $data['name'] = input('name','','trim,strip_tags');
    // $data['member_id'] = input('member_id','','trim,strip_tags');
    $data['member_id'] = $uid;
    $data['phone'] = input('phone','0','trim,strip_tags');
    $data['call_prefix'] = input('call_prefix','','trim,strip_tags');
    $data['inter_ip'] = input('inter_ip','','trim,strip_tags');
    
    
    $data['gateway'] = input('gateway','','trim,strip_tags');
    $data['sales_price'] = input('price', '', 'trim,strip_tags');
    
    //'sofia/gateway/mygateway/%s',
    //sofia/external/15%s@119.23.133.180:2080
    $type = input('type/d','','trim,strip_tags');
    $data['type'] = $type;
    if ($type == 0){
      $dial_format  = 'sofia/external/';
      if ($data['call_prefix']){
        $dial_format  .= $data['call_prefix'];
      }
      $dial_format  .= '%s@'.$data['inter_ip'];
    }
    else{
      $dial_format  = 'sofia/gateway/';
      if ($data['gateway']){
        $dial_format  .= $data['gateway'];
      }
      $dial_format  .= '/%s';
    }
    
    
    $data['dial_format'] = $dial_format;
    
    $data['remark'] = input('remark','','trim,strip_tags');
    $data['status'] = 1;
    $result = Db::name('tel_line')->insertGetId($data);
  
    if ($result){
      
       return returnAjax(0,'success!');
    }
    else{
       return returnAjax(1,'failure!');
    }
    
  }
  
  /**
   * 编辑设备信息
   *
   * @description 超级管理员可以编辑任何线路 其他角色用户只能编辑自己的线路
  */
  public function editLine(){
    
    $data = array();
    $data['name'] = input('name','','trim,strip_tags');
    // $data['member_id'] = input('member_id','','trim,strip_tags');
    $user_auth = session('user_auth');
    if($user_auth['super'] == 0){
      // if($data['member_id'] != $user_auth['uid']){
      //   return returnAjax(1,'failure!');
      // }
      
    }
    $data['member_id'] = $user_auth['uid'];
    
    //线路ID
    $simId = input('simId','','trim,strip_tags');
    //获取线路数据
    $line_pid = Db::name('tel_line')
    							->where('id', $simId)
    							->value('pid');
    if($line_pid != 0){
    	return returnAjax(0, 'error', '无效线路');
    }
    $data['phone'] = input('phone','0','trim,strip_tags');
    
    $data['call_prefix'] = input('call_prefix','','trim,strip_tags');
    $data['inter_ip'] = input('inter_ip','','trim,strip_tags');
    
    $data['gateway'] = input('gateway','','trim,strip_tags');
    $data['sales_price'] = input('price', '', 'trim,strip_tags');
    
    //'sofia/gateway/mygateway/%s',
    //sofia/external/15%s@119.23.133.180:2080
    $type = input('type/d','','trim,strip_tags');
    $data['type'] = $type;
    if ($type == 0){
      $dial_format  = 'sofia/external/';
      if ($data['call_prefix']){
        $dial_format  .= $data['call_prefix'];
      }
      $dial_format  .= '%s@'.$data['inter_ip'];
    }
    else{
      $dial_format  = 'sofia/gateway/';
      if ($data['gateway']){
        $dial_format  .= $data['gateway'];
      }
      $dial_format  .= '/%s';
    }
    
    $data['dial_format'] = $dial_format;
    $data['remark'] = input('remark','','trim,strip_tags');
    
  
    $result = Db::name('tel_line')->where('id', $simId)->update($data);
    
    if ($result){
    
       return returnAjax(0,'success!');
    }
    else{
       return returnAjax(1,'failure!');
    }

  
    
  }

  //获取设备信息
  public function getLineInfo(){
    $id = input('id','','trim,strip_tags');
    $slist = Db::name('tel_line')->where('id', $id)->find();
    echo json_encode($slist,true);
  }
  
  /**
   * 删除设备
   *
   * @description 超级管理员可以删除所有的线路 其他用户角色智能删除自己的线路
  */
  public function delLine(){
    $user_auth = session('user_auth');
    $ids= input('id/a','','trim,strip_tags');
    if($user_auth['super'] == 0){
      if(!empty($ids) && is_array($ids) === true){
        $ids_count = count($ids);
        if($ids_count > 1){
          echo '最多只能删除一个。';
          exit;
        }
        //获取当前线路的所属人
        $LinesData = new LinesData();
        $member_id = $LinesData->get_line_member_id($ids[0]);
        if($member_id != $user_auth['uid']){
          echo '删除失败。';
          exit;
        }
      }else{
        echo '删除失败';
        exit;
      }
    }
    $list = Db::name('tel_line')->where('id','in', $ids)->delete();
    
    if(!$list){
      echo "删除失败。";
    }
  }
  public function setLineStatus(){

    $sId = input('sId','','trim,strip_tags');
    $status = input('status','','trim,strip_tags');
    
    $data=array();
    $data['status'] = $status;

    $list = Db::name('tel_line')->where('id',$sId)->update($data);

     if($list){
      return returnAjax(0,'成功',$list);
    }else{
      return returnAjax(1,'error!',"失败");
    }
  }
  
  //添加设备信息
  public function addDevice(){

    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    
    $data = array();
    // $data['member_id'] = $uid;
    $data['name'] = htmlspecialchars_decode(input('name','','trim,strip_tags'));
    $data['number'] = input('number','','trim,strip_tags');
    $data['dial_format'] = input('dial_format','','trim,strip_tags');
    $data['type'] = input('type','','trim,strip_tags');
    $data['desc'] = input('desc','','trim,strip_tags');
    
    $result = Db::name('tel_device')->insertGetId($data);
  
    if ($result){
      
       return returnAjax(0,'success!');
    }
    else{
       return returnAjax(1,'failure!');
    }
    
  }
  
  //编辑设备信息
  public function editDevice(){

    $data = array();
    $data['name'] = htmlspecialchars_decode(input('name','','trim,strip_tags'));
    $data['dial_format'] = input('dial_format','','trim,strip_tags');
    $data['number'] = input('number','','trim,strip_tags');
    $data['type'] = input('type','','trim,strip_tags');
    $data['desc'] = input('desc','','trim,strip_tags');
    
    $deviceId = input('deviceId','','trim,strip_tags');
  
    $result = Db::name('tel_device')->where('id', $deviceId)->update($data);
    
    if ($result){
    
       return returnAjax(0,'success!');
    }
    else{
       return returnAjax(1,'failure!');
    }

  
    
  }

  //获取设备信息
  public function getDeviceInfo(){
    $id = input('id','','trim,strip_tags');
    $slist = Db::name('tel_device')->where('id', $id)->find();
    echo json_encode($slist,true);
  }
  
  
  //删除设备
   public function delDevice(){
    $ids= input('id/a','','trim,strip_tags');
    $list = Db::name('tel_device')->where('id','in', $ids)->delete();
  
    if(!$list){
      echo "删除失败。";
    }
  }
   public function robot(){
         
    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    $super = $user_auth["super"];
    
    $where = array();
    if(!$super){
      $where['member_id'] = $uid;
    }
    

    $list = Db::name('tel_sim')->where($where)->order('id desc')
    ->paginate(10, false, array('query'  =>  $this->param));

    $page = $list->render();
    $list = $list->toArray();

    
    
  

    $this->assign('list', $list['data']);
    $this->assign('page', $page);
              

  
    return $this->fetch();
  }
  
  public function simPage(){
         
    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    $super = $user_auth["super"];
    
    $where = array();
    if(!$super){
      $where['member_id'] = $uid;
    }
      $id = input('id','','trim,strip_tags');

    $where['device_id'] = $id;

    $list = Db::name('tel_sim')->where($where)->order('position asc')
    ->paginate(10, false, array('query'  =>  $this->param));

    $page = $list->render();
    $list = $list->toArray();

    foreach ($list['data'] as $k=>$v){
      
      
      $device = Db::name('tel_device')->field("name")->where('id',$v["device_id"])->find();
      $list['data'][$k]["devicename"] = $device["name"];
      
      $memberInfo = Db::name('admin')->field("username")->where('id',$v["member_id"])->find();
      $list['data'][$k]["username"] = $memberInfo["username"];
    
    }
    
    
    $this->assign('thisId', $id);

    $this->assign('list', $list['data']);
    $this->assign('page', $page);
              

    $result = Db::name('admin')->where(array('status'=>1,'super'=>0,'user_type'=>0))->select();
    $this->assign('memberList', $result);
  

    return $this->fetch();
  }

  //添加设备信息
  public function addSim(){

    $user_auth = session('user_auth');
    $uid = $user_auth["uid"];
    
    $data = array();
    $data['member_id'] = input('member_id','','trim,strip_tags');
    $data['phone'] = htmlspecialchars_decode(input('phone','','trim,strip_tags'));
    $data['call_prefix'] = input('call_prefix','','trim,strip_tags');
    
    
    $sim = Db::name('tel_sim')->where('phone', $data['phone'])->find();
    if ($sim){
      return returnAjax(1,'号码已存在!');
    }
    
    $data['device_id'] = input('deviceId','','trim,strip_tags');
    $data['position'] = input('position','0','trim,strip_tags');
    $data['remark'] = input('remark','','trim,strip_tags');
      $data['status'] = 1;
    $result = Db::name('tel_sim')->insertGetId($data);
  
    if ($result){
      
       return returnAjax(0,'success!');
    }
    else{
       return returnAjax(1,'failure!');
    }
    
  }
  
  //编辑设备信息
  public function editSim(){

    $data = array();
    $data['phone'] = htmlspecialchars_decode(input('phone','','trim,strip_tags'));
    $data['position'] = input('position','0','trim,strip_tags');
    $data['member_id'] = input('member_id','','trim,strip_tags');
    $data['call_prefix'] = input('call_prefix','','trim,strip_tags');
    $data['remark'] = input('remark','','trim,strip_tags');
    $simId = input('simId','','trim,strip_tags');
  
    $result = Db::name('tel_sim')->where('id', $simId)->update($data);
    
    if ($result){
    
       return returnAjax(0,'success!');
    }
    else{
       return returnAjax(1,'failure!');
    }

  
    
  }

  //获取设备信息
  public function getSimInfo(){
    $id = input('id','','trim,strip_tags');
    $slist = Db::name('tel_sim')->where('id', $id)->find();
    echo json_encode($slist,true);
  }
  
  //删除设备
  public function delSim(){
    $ids= input('id/a','','trim,strip_tags');
    $list = Db::name('tel_sim')->where('id','in', $ids)->delete();
  
    if(!$list){
      echo "删除失败。";
    }
  }
  
  // 修改状态
  public function setSimStatus(){

    $sId = input('sId','','trim,strip_tags');
    $status = input('status','','trim,strip_tags');
    
    $data=array();
    $data['status'] = $status;

    $list = Db::name('tel_sim')->where('id',$sId)->update($data);

     if($list){
      return returnAjax(0,'成功',$list);
    }else{
      return returnAjax(1,'error!',"失败");
    }
  }
  
  /**
   * 获取下属用户信息
   * 
   * @param int $member_id 用户ID
   * @return array
  */
  protected function get_subordinate_members($member_id)
  {
  	if(empty($member_id)){
  		return false;
  	}
  	$datas = Db::name('admin')
  						->field('id,username')
  						->where([
  							'pid'	=>	$member_id
  						])
  						->select();
  	return $datas;
  }
  
  
  /**
   * 线路分配写入接口
  */
  // public function insert_line_allocation_api()
  // {
  //   //使用者ID
  //   $member_id = input('member_id', '', 'trim,strip_tags');
  //   //拥有者ID
  //   $have_member_id = input('have_member_id', '', 'trim,strip_tags');
  //   //销售价格
  //   $sales_price = input('sales_price', '', 'trim,strip_tags');
  //   //线路ID
  //   $line_id = input('line_id', '', 'trim,strip_tags');
  //   if(
  //     empty($member_id) ||
  //     empty($have_member_id) ||
  //     empty($sales_price) ||
  //     empty($line_id)
  //   ){
  //     return returnAjax(1, 'error!', '参数错误');
  //   }
  //   if($this->verify_whether_existence($member_id, $line_id) === false){
  //   	return returnAjax(1, 'error!', '无效线路');
  //   }
  //   $result = $this->insert_line_allocation($member_id, $have_member_id, $sales_price, $line_id);
  //   if($result === true){
  //     return returnAjax(0, 'success!', '成功');
  //   }else{
  //   	return returnAjax(1, 'error!', '失败');
  //   }
  // }
  /**
   * 验证当前线路是否存在
   *
   * @param int $member_id 拥有者ID
   * @param int $line_id 线路ID
   * @return bool
  */
  protected function verify_whether_existence($member_id, $line_id)
  {
    if(empty($member_id) || empty($line_id)){
      return false;
    }
    $count = Db::name('tel_line')
            ->where([
              'member_id'  =>  $member_id,
              'id'  =>  $line_id
            ])
            ->count();
  	if($count !== 0){
  		return true;
  	}
  	return false;
  }
	
	
	/**
   * 线路分配写入Api
   *
   * @param int $member_id 使用者的用户ID
   * @param int $have_member_id 用户者的用户ID
   * @param float $sales_price 销售价格
   * @param int $line_id 线路ID
   * @return Json
  */
  public function insert_line_allocation_api()
  {
  	$user_auth_sign = session('user_auth_sign');
  	if(empty($user_auth_sign)){
  		return returnAjax(1, 'error', '未登陆');
  	}
  	//获取当前用户的数据
  	$user_auth = session('user_auth');
  	//获取指定的用户ID
  	$member_id = input('member_id', '', 'trim,strip_tags');
  	//获取消费价格
  	$sales_price = input('sales_price', '', 'trim,strip_tags');
  	//获取线路ID
  	$line_id = input('line_id', '', 'trim,strip_tags');
  	if(empty($member_id) || empty($sales_price) || empty($line_id)){
  		return returnAjax(1, 'error', '参数错误');
  	}
  	$count = Db::name('tel_line')
  						->where([
  							'member_id'	=>	$member_id,
  							'id'	=>	$line_id
  						])
  					->count();
  	if(!empty($count)){
  		return returnAjax(2, 'error', '该线路已存在');
  	}
  	$result = $this->insert_line_allocation($member_id, $user_auth['uid'], $sales_price, $line_id);
  	if($result === true){
  		return returnAjax(0, 'success', '成功！');
  	}
  	return returnAjax(1, 'error', '失败');
  	
  }
  
  /**
   * 线路分配写入
   *
   * @param int $member_id 使用者的用户ID
   * @param int $have_member_id 用户者的用户ID
   * @param float $sales_price 销售价格
   * @param int $line_id 线路ID
   * @return bool
  */
  protected function insert_line_allocation($member_id, $have_member_id, $sales_price, $line_id)
  {
    if(empty($member_id) || empty($have_member_id) || empty($sales_price) || empty($line_id)){
      return false;
    }
    //获取线路数据
    $line_data = $this->get_line_data($have_member_id, $line_id);
    $line_data['member_id'] = $member_id;
    $line_data['sales_price'] = $sales_price;
    $line_data['pid'] = $line_id;
    unset($line_data['id']);
    // $line_data = json_encode($line_data);
    // $line_data = json_decode($line_data);
    $result = Db::name('tel_line')
              ->insert($line_data);
    if(!empty($result)){
      return true;
    }
    return false;
  }
  
  /**
   * 获取线路信息的接口
   * 
   * @param int $member_id 拥有者的用户ID
   * @param int $line_id 线路ID
   * @return Json
  */
  public function get_line_data_api($member_id, $line_id)
  {
  	$user_auth_sign = session('user_auth_sign');
  	if(empty($user_auth_sign)){
  		return returnAjax(1, 'error', '未登陆');
  	}
  	$member_id = input('member_id', '', 'trim,strip_tags');
  	$line_id = input('line_id', '', 'trim,strip_tags');
  	if(empty($member_id) || empty($line_id)){
  		return returnAjax(1, 'error!', '参数错误');
  	}
  	$line_data = $this->get_line_data($member_id, $line_id);
  	if($line_data !== false){
  		return returnAjax($line_data, 'success!', $line_data);
  	}
  	return returnAjax(1, 'error!', '失败');
  }
  
  /**
   * 获取线路信息
   *
   * @param int $member_id 用户ID
   * @param int $line_id 线路ID
   * @return array
  */
  protected function get_line_data($member_id, $line_id)
  {
    if(empty($line_id) || empty($member_id)){
      return false;
    }
    $line_data = Db::name('tel_line')
                  ->where([
                  	'id'	=> $line_id,
                  	'member_id'	=>	$member_id
                  ])
                  ->find();
    return $line_data;
  }
  
  /**
   * 获取用户的线路接口
   * 
   * @param int $member_id 用户ID
   * @return json
  */
  public function get_member_line_data_api()
  {
  	$user_auth_sign = session('user_auth_sign');
  	if(empty($user_auth_sign)){
  		return returnAjax(1, 'error', '未登陆');
  	}
  	$member_id = input('member_id', '', 'trim,strip_tags');
  	if(empty($member_id)){
  		return returnAjax(1, 'error!', '参数错误');
  	}
  	$user_auth = session('user_auth');
  	$line_data = $this->get_member_line_data_func($member_id);
  	$line_ids = [];
  	foreach($line_data as $key=>$value){
  		$line_data[$key]['price'] = $this->get_line_price($value['pid']);
  		$line_ids[] = $value['pid'];
  	}
  	$LinesData = new LinesData();
  	//获取当前用户可以使用的线路
  	$current_user_lines = $LinesData->get_distribution_lines($user_auth['uid'], $line_ids);
  	
  	return returnAjax(0, 'success!', ['lines' => $line_data, 'user_lines' => $current_user_lines]);
  }
  
  /**
   * 获取用户的线路
   * 
   * @param int $member_id 用户ID
   * @return Json 
  */
  protected function get_member_line_data_func($member_id)
  {
  	if(empty($member_id)){
  		return false;
  	}
  	$line_data = Db::name('tel_line')
  								->where('member_id', $member_id)
  								->where('pid', '>', 0)
  								->select();
  	return $line_data;
  }
	
	
	/**
	 * 获取线路的成本价
	 * 
	 * @param int $line_id 
	 * @return float
	*/
  protected function get_line_price($line_id)
  {
  	if(empty($line_id)){
  		return false;
  	}
  	$price = Db::name('tel_line')
  						->where('id', $line_id)
  						->value('sales_price');
  	return $price;
  }
  
  /**
   * 删除子账户的分配的线路Api
   * 
   * @param int $have_member_id 拥有者ID
   * @param int $line_id 线路ID
   * @return Json
  */
  public function delete_subordinate_line_api()
  {
  	$user_auth_sign = session('user_auth_sign');
  	//获取当前用户信息
  	$uid = session('user_auth.uid');
  	if(empty($user_auth_sign) || empty($uid)){
  		return returnAjax(1, 'error', '未登陆');
  	}
  	$member_id = input('member_id', '', 'trim,strip_tags');
  	$line_id = input('line_id', '', 'trim,strip_tags');
  	if(empty($member_id) || empty($line_id)){
  		return returnAjax(1, 'error', '参数错误');
  	}
  	//验证线路是否存在
  	$line_data = Db::name('tel_line')
  								->where([
  									'id'	=>	$line_id,
  									'member_id'	=>	$member_id
  								])
  								->find();
  	if(empty($line_data)){
  		return returnAjax(1, 'error', '线路不存在');
  	}
  	$count = Db::name('tel_line')
  						->where([
  							'id'	=>	$line_data['pid'],
  							'member_id'	=> $uid
  						])
  						->count();
  	if(empty($count)){
  		return returnAjax(1, 'error', '该线路无权限删除');
  	}
  	if($this->delete_subordinate_line($member_id, $line_id) === true){
  		return returnAjax(0, 'success', '成功');
  	}
  	return returnAjax(1, 'error', '失败');
  }
  
  /**
   * 删除子账户的分配的线路
   * 
   * @param int $member_id 拥有者ID
   * @param int $line_id 线路ID
   * @return bool
  */
  protected function delete_subordinate_line($member_id, $line_id)
  {
  	if(empty($member_id) || empty($line_id)){
  		return false;
  	}
  	//验证当前这条线路是否存在
  	if($this->verify_whether_existence($member_id, $line_id) === false){
  		Log::info('不存在');
  		return false;
  	}
  	$line_ids = [];
  	$line_ids[] = $line_id;
  	$line_data = Db::name('tel_line')
		  						->where('pid', $line_id)
		  						->find();
  	while(isset($line_data['id']) === true && !empty($line_data['id'])){
  		//收集ID
  		$line_ids[] = $line_data['id'];
  		//获取下一层分配的线路
  		$line_data = Db::name('tel_line')
  									->where('pid', $line_data['id'])
  									->find();
  	}
  	Log::info(json_encode($line_ids));
  	$result = Db::name('tel_line')
  						->where('id', 'in', $line_ids)
  						->delete();
  	if(!empty($result)){
  		return true;
  	}
  	return false;
  }
  
  /**
   * 机器人分配列表
  */
 	public function robot_distribution()
 	{
 		$user_auth = session('user_auth');
 		$uid = $user_auth['uid'];
 		$page = input('page', '', 'trim,strip_tags');
 		
 		$AdminData = new AdminData();
 		//获取用户数据
 		$users = $AdminData->get_find_users($uid);
 		//获取机器人分配数据
 		$RobotDistribution = new RobotDistribution();
 		$robot_datas = $RobotDistribution->get_robot_datas($uid, $page);
 		// $page = $list->render();
 		
 		$this->assign('users', $users);
 		$this->assign('robot_datas', $robot_datas);
 		return $this->fetch();
 	}
	
	/**
	 * 获取机器人分配数据
	 * 
	 * @param int $id
	 * @return Json
	*/
	public function get_robot_data_api()
	{
		if(IS_POST){
			$user_auth = session('user_auth');
			$pid = $user_auth['uid'];
			$user_auth_sign = session('user_auth_sign');
			if(empty($user_auth_sign) || empty($user_auth)){
				return returnAjax(2, 'error', '未登陆');
			}
			$id = input('id', '', 'trim,strip_tags');
			if(empty($id)){
				return returnAjax(3, 'error', '参数错误');
			}
			$RobotDistribution = new RobotDistribution();
			$robot_data = $RobotDistribution->get_robot_data($id);
			return returnAjax(0, 'success', $robot_data);
		}
	}
	
	
	/**
	 * 开通机器人Api接口
	 * 
	 * @param int $pid 开通者用户ID
	 * @param int $member_id 用户ID
	 * @param int $number 机器人数量
	 * @param int $duration 时长(天数)
	 * @return Json
	*/
	public function open_up_api()
	{
		if(IS_POST){
			$user_auth = session('user_auth');
			$pid = $user_auth['uid'];
			$user_auth_sign = session('user_auth_sign');
			if(empty($user_auth_sign) || empty($user_auth)){
				return returnAjax(2, 'error', '未登陆');
			}
			// $pid = input('pid', '', 'trim,strip_tags');
			$member_id = input('member_id', '', 'trim,strip_tags');
			$number = input('number', '', 'trim,strip_tags');
			$duration = input('duration', '', 'trim,strip_tags');
			$note = input('note', '', 'strip_tags');
			if(empty($member_id) || empty($number) || empty($duration)){
				return returnAjax(3, 'error', '参数错误');
			}
			
			$AdminData = new AdminData();
			$role_name = $AdminData->get_role_name($pid);
			$RobotDistribution = new RobotDistribution();
			if($role_name != '管理员'){
				//获取开通者用户的机器人数量
				$p_number = $RobotDistribution->get_usable_robot_count($pid);
				if($p_number < $number){
					return returnAjax(4, 'error', '机器人数量不足');
				}
			}
			
			$result = $RobotDistribution->open_up($pid, $member_id, $number, $duration, $note);
			if($result === true){
				return returnAjax(0, 'success', '成功');
			}
			return returnAjax(1, 'error', '失败');
		}
	}
	
	/**
	 * 延长有效时长Api接口
	 * 
	 * @param int $id
	 * @param int $duration 时长(天数)
	 * @return Json
	*/
	public function extend_duration_api()
	{
		if(IS_POST){
			//获取当前用户信息
			$user_auth = session('user_auth');
			$pid = $user_auth['uid'];
			$user_auth_sign = session('user_auth_sign');
			if(empty($user_auth_sign) || empty($user_auth)){
				return returnAjax(2, 'error', '未登陆');
			}
			//分配记录ID
			$id = input('id', '', 'trim,strip_tags');
			//延长的时长
			$duration = input('duration', '', 'trim,strip_tags');
			if(empty($id) || empty($duration)){
				return returnAjax(3, 'error', '参数错误');
			}
			$RobotDistribution = new RobotDistribution();
			//获取分配记录的数据
			$data = $RobotDistribution->get_robot_data($id);
			//判断是否属于上下级关系
			if($RobotDistribution->verify_whether_belong_to_find_account($data['member_id']) === false){
				return returnAjax(4, 'error', '不属于子账户');
			}
			//验证状态
			$state = $RobotDistribution->get_state($id);
			
			
			if($state == 0){
				$AdminData = new AdminData();
				//获取当前用户的角色名称
				$role_name = $AdminData->get_role_name($pid);
				$RobotDistribution = new RobotDistribution();
				if($role_name != '管理员'){
					//获取开通者用户可用的机器人数量
					$p_number = $RobotDistribution->get_usable_robot_count($pid);
					if($p_number < $data['member_id']){
						return returnAjax(5, 'error', '机器人数量不足');
					}
					//扣除当前用户的机器人数量
					$result = $RobotDistribution->deduction_robot_number($pid, $data['member_id']);
					if($result === false){
						Log::info('扣除开通者用户的机器人失败');
						return returnAjax(6, 'error', '失败');
					}
				}
				//给子用户添加机器人数量
				$result = $RobotDistribution->increase_find_member_robot_number($data['member_id'], $data['member_id']);
				if($result === false){
					return returnAjax(6, 'error', '失败');
				}
			}
			
			//延长有效期
			if($RobotDistribution->extend_duration($id, $duration) === true){
				return returnAjax(0, 'success', '成功');
			}
			return returnAjax(1, 'error', '失败');
		}
	}
	
	/**
	 * 回收机器人Api
	 * 
	 * @param int $id
	 * @param int $number
	 * @return bool
	*/
	public function recovery_robot_api()
	{
		if(IS_POST){
			$user_auth = session('user_auth');
			$pid = $user_auth['uid'];
			$user_auth_sign = session('user_auth_sign');
			if(empty($user_auth_sign) || empty($user_auth)){
				return returnAjax(2, 'error', '未登陆');
			}
			$id = input('id', '', 'trim,strip_tags');
			$number = input('number', '', 'trim,strip_tags');
			if(empty($id) || empty($number)){
				return returnAjax(3, 'error', '参数错误');
			}
			$RobotDistribution = new RobotDistribution();
			$robot_data = $RobotDistribution->get_robot_data($id);
			//获取被回收用户的机器人数量
			if($robot_data['number'] < $number){
				return returnAjax(4, 'error', '机器人不足');
			}
			$result = $RobotDistribution->recovery_robot($id, $number);
			if(!empty($result)){
				return returnAjax(0, 'success', '成功');
			}
			return returnAjax(1, 'error', '失败');
		}
	}
	

}