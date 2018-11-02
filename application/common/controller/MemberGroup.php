<?php
namespace app\common\controller;

use think\Db;

//日志
use app\common\controller\Log;


//客户分配处理类
class MemberGroup extends Base{
	
	/**
	 * 获取分组名称
	 * 
	 * @param int $id
	 * @return string
	*/
	public function get_name($id)
	{
		if(!empty($id)){
			return false;
		}
		$name = Db::name('member_group')
						->where('id', $id)
						->value('name');
		return $name;
	}
	
}