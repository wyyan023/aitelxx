<?php
namespace app\api\controller;
use app\common\controller\Base;
use think\Db;

class show extends Base{	
    
  public function _initialize(){
		parent::_initialize();
	}
   
  
	
 public function getRecord(){
	 
	 $result['code'] = $code;
	 $result['msg'] = $msg;
	 $result['data'] = $data;
	 
	 \think\Log::record('code='.$code.'#msg='.$msg.'#data='.json_encode($data));
	 return $result;	
	 
    //return returnAjax(0,"成功",$contentlist);
 }
		
}

?>