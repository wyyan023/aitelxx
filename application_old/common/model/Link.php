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
 * 友情链接类
 * @author Wayne <wayne@ruikesoft.com>
 */
class Link extends \app\common\model\Base {

	public $keyList = array(
		array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
		array('name'=>'title' ,'title'=>'友链标题', 'type'=>'text', 'help'=>''),
		array('name'=>'url' ,'title'=>'URL链接', 'type'=>'text', 'help'=>''),
		array('name'=>'ftype' ,'title'=>'友链类别', 'type'=>'select', 'option'=>array(
			'1' => '常用链接',
			'2' => '网站导读',
			'3' => '对公服务',
			'4' => '校内服务',
		), 'help'=>''),
		array('name'=>'cover_id' ,'title'=>'网站LOGO', 'type'=>'image', 'help'=>''),
		array('name'=>'status' ,'title'=>'状态', 'type'=>'select','option'=>array('1'=>'启用','0'=>'禁用'), 'help'=>''),
		array('name'=>'sort' ,'title'=>'链接排序', 'type'=>'text', 'help'=>''),
		array('name'=>'descrip' ,'title'=>'描述', 'type'=>'textarea', 'help'=>'')
	);

    protected $auto = array('update_time');

	protected $type = array(
		'cover_id'  => 'integer',
		'sort'  => 'integer',
	);
}