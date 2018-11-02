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
* 设置模型
*/
class AuthRule extends Base{

	const rule_url = 1;
	const rule_mian = 2;

	protected $type = array(
		'id'    => 'integer',
	);

	public $keyList = array(
		array('name'=>'module','title'=>'所属模块','type'=>'hidden'),
		array('name'=>'title','title'=>'节点名称','type'=>'text','help'=>''),
		array('name'=>'name','title'=>'节点标识','type'=>'text','help'=>''),
		array('name'=>'group','title'=>'功能组','type'=>'text','help'=>'功能分组'),
		array('name'=>'status','title'=>'状态','type'=>'select','option'=>array('1'=>'启用','0'=>'禁用'),'help'=>''),
		array('name'=>'condition','title'=>'条件','type'=>'text','help'=>'')
	);

	public function uprule($data, $type){
		foreach ($data as $value) {
			$data = array(
				'module' => $type,
				'type'   => 2,
				'name'   => $value['url'],
				'title'  => $value['title'],
				'group'  => $value['group'],
				'status' => 1,
			);
			$id = $this->where(array('name' => $data['name']))->value('id');
			if ($id) {
				$data['id'] = $id;
				$this->save($data, array('id' => $id));
			} else {
				self::create($data);
			}
		}
		return true;
	}
}