<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: yangweijie <yangweijiester@gmail.com> <code-tech.diandian.com>
// +----------------------------------------------------------------------


namespace addons\sitestat;
use app\common\controller\Addons;

/**
 * 系统环境信息插件
 * @author thinkphp
 */

class Sitestat extends Addons{

    public $info = array(
        'name'=>'Sitestat',
        'title'=>'站点统计信息',
        'description'=>'统计站点的基础信息',
        'status'=>1,
        'author'=>'thinkphp',
        'version'=>'0.2'
    );

    public function install(){
        return true;
    }

    public function uninstall(){
        return true;
    }

    //实现的AdminIndex钩子方法
    public function AdminIndex($param){
        $config = $this->getConfig();
        $this->assign('addons_config', $config);
		$map['status'] = array('egt',0);
		$maps['is_read'] = array('eq',0);
        if($config['display']){
            $info['users']		=	db('Member')->where($map)->count();
            $info['userall']		=	db('Member')->count();
            $info['action']		=	db('ActionLog')->where(array('create_time'=>array('gt',strtotime(date('Y-m-d')))))->count();
            $info['category']	=	db('Category')->count();
            $info['model']   =   db('Model')->count();
            $this->assign('info',$info);
            $this->template('index/info');
        }
    }
}