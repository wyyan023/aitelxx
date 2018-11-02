<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\user\controller;
use app\common\controller\User;

class Upload extends User { 
	
	public function delete(){
		
		$controller = controller('common/Upload');
		$action = ACTION_NAME;
		
		return $controller->$action();
	}

	public function upload(){
		  
		// \think\Log::record('upload failure='.json_encode($_POST)); 
		
		$controller = controller('common/Upload');
		$action = ACTION_NAME;
		
		return $controller->$action();
	}
	
	public function editor(){
		  		
		$controller = controller('common/Upload');
		$action = ACTION_NAME;
		
		return $controller->$action();
	}
}