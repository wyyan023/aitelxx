<?php
namespace app\common\widget;

/**
 * 上传插件widget
 * 用于动态调用分类信息
 */
class Form {

	public function show($field, $info){
		$type = isset($field['type']) ? $field['type'] : 'text';
		//类型合并
		if (in_array($type, array('string'))) {
			$type = 'text';
		}
		if (in_array($type, array('picture'))) {
			$type = 'image';
		} 
		if (in_array($type, array('attach'))) {
			$type = 'attach';
		}
		if (in_array($type, array('private'))) {
			$type = 'private';
		}
		
		$data = array(
			'type'      => $type,
			'field'    => isset($field['name']) ? $field['name'] : '',
			'value'     => isset($info[$field['name']]) ? $info[$field['name']] : '',
			'size'      => isset($field['size']) ? $field['size'] : 12,
			'option'    =>isset($field['option']) ? $field['option'] : ''
		);
		$no_tem = array('readonly', 'text', 'password', 'textarea', 'select', 'bind', 'checkbox', 'radio', 'num','bool','decimal');
		$type = !in_array($type, $no_tem) ? $type : 'show';
		$view = new \think\View();
		$view->assign($data);
		return $view->fetch('common@default/form/'.$type);
	}
}