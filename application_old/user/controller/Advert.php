<?php
namespace app\user\controller;
use app\common\controller\User;


class Advert extends User
{
	protected $ad;
	protected $adplace;
	public function _initialize()
	{
		parent::_initialize();
		$this->ad = db('Ad');
		$this->adplace = db('AdPlace');
	}
	
	/**
	* 插件列表
	*/
	public function index(){
		$map = array();
		$order = "id desc";

		$list = db('AdPlace')->where($map)->order($order)->paginate(10);
		
		$data = array(
			'list'  => $list,
			'page'  => $list->render()
		);
		$this->assign($data);
		$this->setMeta("广告管理");
		return $this->fetch();
	}

	/**
	 * 广告位添加
	 */
	public function add(){
		$place = model('AdPlace');
		
		if (IS_POST) {
			$result = $place->change();
			if ($result !== false) {
				return $this->success("添加成功！",url('index'));
			}else{
				return $this->error($place->getError());
			}
		}else{
			$data = array(
					'keyList' => $place->keyList
			);
			$this->assign($data);
			$this->setMeta("添加广告位");
			return $this->fetch('public/edit');
		}
	}
	
	//编辑广告位
	public function edit($id = null){
		$place = model('AdPlace');
		if (IS_POST) {
			$result = $place->change();
			if ($result) {
				return $this->success("修改成功！", url('user/Advert/index'));
			}else{
				return $this->error($this->adplace->getError());
			}
		}else{
			$info = db('AdPlace')->where(array('id'=>$id))->find();
			
			if (!$info) {
				return $this->error("非法操作！");
			}
			$data = array(
					'info'   => $info,
					'keyList' => $place->keyList
			);
			//var_dump($data);exit;
			$this->assign($data);
			$this->setMeta("编辑广告位");
			return $this->fetch('public/edit');
		}
	}
	
	//编辑广告位
	public function del(){
		$id = $this->getArrayParam('id');
	
		if (empty($id)) {
			return $this->error("非法操作！");
		}
		$map['id'] = array('IN',$id);
		$result = $this->adplace->where($map)->delete();
		if ($result) {
			return $this->success("删除成功！");
		}else{
			return $this->error("删除失败！");
		}
	}
	
	//广告列表
	public function lists($id = null){
		$map['place_id'] = $id;
		$order = "id desc";
	
		$list = db('Ad')->where($map)->order($order)->paginate(10);
		$data = array(
				'id'  => $id,
				'list'  => $list,
				'page'  => $list->render()
		);
		$this->assign($data);
		$this->setMeta("广告管理");
		return $this->fetch();
	}

	//添加广告
	public function addad($id){
		$ad = model('ad');
		if (IS_POST) {
			$result = $ad->change();
			//exit;
			if ($result) {
				return $this->success("添加成功！", url('user/Advert/lists',array('id'=>$this->param['place_id'])));
			}else{
				return $this->error($ad->getError());
			}
		}else{
			$info['place_id'] = $id;
			$data = array(
					'info'   => $info,
					'keyList' => $ad->keyList
			);
			$this->assign($data);
			$this->setMeta("添加广告位");
			return $this->fetch('public/edit');
		}
	}
	
	//编辑广告
	public function editad($id = null){
		$ad = model('ad');
		if (IS_POST) {
			$result = $ad->change();
			if ($result) {
				return $this->success("修改成功！", url('user/Advert/lists',array('id'=>$this->param['place_id'])));
			}else{
				return $this->error($ad->getError());
			}
		}else{
			$info = db('ad')->where(array('id'=>$id))->find();
		
			if (!$info) {
				return $this->error("非法操作！");
			}
			$data = array(
					'info'   => $info,
					'keyList' => $ad->keyList
			);
			$this->assign($data);
			$this->setMeta("编辑广告位");
			return $this->fetch('public/edit');
		}
	}
	
	//删除广告
	public function delad(){
		$id = $this->getArrayParam('id');
	
		if (empty($id)) {
			return $this->error("非法操作！");
		}
		$map['id'] = array('IN',$id);
		$result = db('ad')->where($map)->delete();
		if ($result) {
			return $this->success("删除成功！");
		}else{
			return $this->error("删除失败！");
		}
	}
	
	
}