<?php
namespace app\common\controller;

use think\Db;

//菜单数据处理类
class MenuData extends Base{
  
  /**
   * 获取当前模块的信息
   * 
   * @return array
  */
  public function get_current_modular()
  {
    return MODULE_NAME;
  }
  
  /**
   * 获取菜单数据
   * 
   * @param int $url
   * @return array
  */
  public function get_menu_data($url)
  {
  	if(empty($url)){
  		return false;
  	}
  	$menu_data = Db::name('menu')
  								->field('id,title,pid,url')
  								->where('url', $url)
  								->find();
  	$menu_data['pid_name'] = $this->get_parent_menu_name($menu_data['pid']);
  	if(empty($menu_data['url'])){
  		$menu_data['url'] = '';
  	}
  	if(empty($menu_data['title'])){
  		$menu_data['title'] = '';
  	}
  	return $menu_data;
  }
  /**
   * 获取上级菜单名称
   * 
   * @param int $id
   * @return string
  */
  public function get_parent_menu_name($id)
  {
  	if(empty($id)){
  		return false;
  	}
  	$menu_name = Db::name('menu')
  								->where('id', $id)
  								->value('title');
		return $menu_name;
  }
  
  
  
}