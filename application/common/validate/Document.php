<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\common\validate;

/**
* 设置模型
*/
class Document extends Base{

	protected $rule = array(
		'title'   => 'require',
	);
	
	protected $message = array(
		'title.require'   => '字段标题不能为空！',
	);
	
	protected $scene = array(
		'add'   => 'title',
		'edit'   => 'title'
	);
}