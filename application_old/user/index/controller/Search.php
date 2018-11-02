<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\index\controller;
use app\common\controller\Fornt;

class Search extends Fornt{

	//文档搜索结果显示
	public function index(){
		$content = model('Document');

		$map = $this->mapBuild();
		$list = $content->where($map)->order('create_time desc')->paginate(10);
		$data = array(
			'list'   => $list,
			'page'   => $list->render()
		);
		$this->assign($data);
		return $this->fetch();
	}

	//查询条件组装
	protected function mapBuild(){
		$keyword = input('keyword', '', 'trim');

		$map['status'] = array('GT',0);

		if ($keyword) {
			$map['title'] = array("LIKE","%$keyword%");
		}
		$search = array(
			'keyword'=>$keyword
		);
		$this->assign('search',$search);
		return $map;
	}
}
