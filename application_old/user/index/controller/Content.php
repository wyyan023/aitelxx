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

class Content extends Fornt {

	protected $beforeActionList = array(
		'setModel' => array('except' => 'category'),
	);

	//模块频道首页
	public function index() {
		$id   = input('id', '', 'trim,intval');
		$name = input('name', '', 'trim');
		if ($name) {
			$id = db('Category')->where(array('name' => $name))->getField('id');
		}

		if (!$id) {
			return $this->error("无此频道！");
		}

		$cate = $this->getCategory($id);

		//获得当前栏目的所有子栏目
		$ids = get_category_child($id);

		$data = array(
			'category'   => $cate,
			'child_cate' => $ids,
		);
		if ($cate['template_index']) {
			$teamplate = 'content/' . $this->modelInfo['name'] . '/' . $cate['template_index'];
		} else {
			$teamplate = 'content/' . $this->modelInfo['name'] . '/index';
		}
		$this->assign($data);
		$this->setSeo($cate['name']);
		return $this->fetch($teamplate);
	}

	//模块列表页
	public function lists($id = '', $name = '') {
		if ($name) {
			$id = db('Category')->where(array('name' => $name))->getField('id');
		}

		if (!$id) {
			return $this->error("无此栏目！");
		}

		$cate = $this->getCategory($id);

		//获得当前栏目的所有子栏目
		$ids                = get_category_child($id);
		$map['category_id'] = array('IN', $ids);
		$map['model_id']    = $this->modelInfo['id'];
		$map['status']      = array('GT', 0);

		if ($this->modelInfo['extend'] > 1) {
			$order = "id desc";
		} else {
			$order = "is_top desc,id desc";
		}
		$model = $this->model;
		$list = $model->where($map)->order($order)->paginate(15);

		$data = array(
			'list' => $list,
			'cate' => $cate,
			'page' => $list->render(),
		);

		if ($cate['template_lists']) {
			$teamplate = 'content/' . $this->modelInfo['name'] . '/' . $cate['template_lists'];
		} else {
			$teamplate = 'content/' . $this->modelInfo['name'] . '/list';
		}
		$this->setSeo($cate['title']);
		$this->assign($data);
		return $this->fetch($teamplate);
	}

	public function category() {
		$id = $this->request->param('id');
		if (!$id) {
			return $this->error("非法操作");
		}
		$cate = $this->getCategory($id);

		$category = get_category_child($id);
		$map      = array(
			'category_id' => array('IN', $category),
		);

		$order = "id desc";
		$list  = model('Document')->where($map)->order($order)->paginate(15);

		$data = array(
			'list' => $list,
			'cate' => $cate,
			'page' => $list->render(),
		);
		if ($cate['template_lists']) {
			$teamplate = 'content/' . $cate['template_lists'];
		} else {
			$teamplate = 'content/list';
		}
		$this->setSeo($cate['title']);
		$this->assign($data);
		return $this->fetch($teamplate);
	}

	//模块内容详情页
	public function detail($id = '', $name = '') {
		//当为文章模型时
		$info = $this->model->detail($id);

		//文档模型数据统计,同一台电脑半小时更新一次
		if ($this->modelInfo['extend'] = 1 && (time() - session('set_content_view')) > 1800) {
			db('Document')->where(array('id' => $id))->setInc('view');
			session('set_content_view', time());
		}

		if (empty($info)) {
			return $this->error("无此内容！");
		}

		$data = array(
			'info' => $info,
		);
		if (isset($info['template_detail']) && $info['template_detail']) {
			$teamplate = 'content/' . $this->modelInfo['name'] . '/' . $info['template_detail'];
		} else {
			$teamplate = 'content/' . $this->modelInfo['name'] . '/detail';
		}
		$this->assign($data);
		$title       = isset($info['title']) ? $info['title'] : '';
		$tags        = isset($info['tags']) ? $info['tags'] : '';
		$description = isset($info['description']) ? $info['description'] : '';
		$this->setSeo($title, $tags, $description);
		return $this->fetch($teamplate);
	}

	protected function getCategory($id) {
		$data = db('Category')->find($id);
		return $data;
	}

	protected function setModel() {
		$model_name = $this->request->param('model');
		$model_id   = $this->request->param('model_id');
		$row        = db('Model')->select();
		foreach ($row as $key => $value) {
			$name_list[$value['name']] = $value;
			$id_list[$value['id']]     = $value;
		}

		if (empty($name_list[$model_name]) && empty($id_list[$model_id])) {
			return $this->error("无此模型！");
		} else {
			$this->modelInfo = $model_name ? $name_list[$model_name] : $id_list[$model_id];
			if ($this->modelInfo['extend'] > 1) {
				$this->model = model($this->modelInfo['name']);
			} else {
				$this->model = model('Document')->extend($this->modelInfo['name']);
			}

			$this->assign('model_id', $this->modelInfo['id']);
			$this->assign('model_list', $name_list);
		}
	}
}