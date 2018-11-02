<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;

class Content extends User{

	public function _initialize() {
		parent::_initialize();
	
	}

	public function index() {
		$map  = array('status' => array('gt', -1));
		$list = db('Category')->where($map)->order('sort asc,id asc')->column('*', 'id');
	
		if (!empty($list)) {
			$tree = new \com\Tree();
			$list = $tree->toFormatTree($list);
		}
	
		$this->assign('tree', $list);
		$this->setMeta('栏目列表');
		return $this->fetch();
	}
	

	/* 单字段编辑 */
	public function editable($name = null, $value = null, $pk = null) {
		if ($name && ($value != null || $value != '') && $pk) {
			db('Category')->where(array('id' => $pk))->setField($name, $value);
		}
	}
	
	/* 编辑分类 */
	public function edit($id = null, $pid = 0) {
		if (IS_POST) {
			$category = model('Category');
			//提交表单
			$result = $category->change();
			if (false !== $result) {
				//记录行为
				action_log('update_category', 'category', $id, session('user_auth.uid'));
				return $this->success('编辑成功！', url('index'));
			} else {
				$error = $category->getError();
				return $this->error(empty($error) ? '未知错误！' : $error);
			}
		} else {
			$cate = '';
			if ($pid) {
				/* 获取上级分类信息 */
				$cate = db('Category')->find($pid);
				if (!($cate && 1 == $cate['status'])) {
					return $this->error('指定的上级分类不存在或被禁用！');
				}
			}
			/* 获取分类信息 */
			$info = $id ? db('Category')->find($id) : '';
	
			$this->assign('info', $info);
			$this->assign('category', $cate);
			$this->setMeta('编辑分类');
			return $this->fetch();
		}
	}
	/* 新增分类 */
	public function add($pid = 0) {
		$Category = model('Category');
	
		if (IS_POST) {
			//提交表单
			$id = $Category->change();
			if (false !== $id) {
				action_log('update_category', 'category', $id, session('user_auth.uid'));
				return $this->success('新增成功！', url('index'));
			} else {
				$error = $Category->getError();
				return $this->error(empty($error) ? '未知错误！' : $error);
			}
		} else {
			$cate = array();
			if ($pid) {
				/* 获取上级分类信息 */
				$cate = $Category->info($pid, 'id,name,title,status');
				if (!($cate && 1 == $cate['status'])) {
					return $this->error('指定的上级分类不存在或被禁用！');
				}
			}
			/* 获取分类信息 */
			$this->assign('info', null);
			$this->assign('category', $cate);
			$this->setMeta('新增分类');
			return $this->fetch('edit');
		}
	}
	/**
	 * 删除一个分类
	 * @author huajie <banhuajie@163.com>
	 */
	public function remove($id) {
		if (empty($id)) {
			return $this->error('参数错误!');
		}
		//判断该分类下有没有子分类，有则不允许删除
		$child = db('Category')->where(array('pid' => $id))->field('id')->select();
		if (!empty($child)) {
			return $this->error('请先删除该分类下的子分类');
		}
		//判断该分类下有没有内容
		$document_list = db('content')->where(array('category_id' => $id))->field('id')->select();
		if (!empty($document_list)) {
			return $this->error('请先删除该分类下的文章（包含回收站）');
		}
		//删除该分类信息
		$res = db('Category')->where(array('id' => $id))->delete();
		if ($res !== false) {
			//记录行为
			action_log('update_category', 'category', $id, session('user_auth.uid'));
			return $this->success('删除分类成功！');
		} else {
			return $this->error('删除分类失败！');
		}
	}
	
	/**
	 * 操作分类初始化
	 * @param string $type
	 * @author huajie <banhuajie@163.com>
	 */
	public function operate($type = 'move', $from = '') {
		//检查操作参数
		if ($type == 'move') {
			$operate = '移动';
		} elseif ($type == 'merge') {
			$operate = '合并';
		} else {
			return $this->error('参数错误！');
		}
	
		if (empty($from)) {
			return $this->error('参数错误！');
		}
		//获取分类
		$map  = array('status' => 1, 'id' => array('neq', $from));
		$list = db('Category')->where($map)->field('id,pid,title')->select();
		//移动分类时增加移至根分类
		if ($type == 'move') {
			//不允许移动至其子孙分类
			$list = tree_to_list(list_to_tree($list));
	
			$pid = db('Category')->getFieldById($from, 'pid');
			$pid && array_unshift($list, array('id' => 0, 'title' => '根分类'));
		}
	
		$this->assign('type', $type);
		$this->assign('operate', $operate);
		$this->assign('from', $from);
		$this->assign('list', $list);
		$this->setMeta($operate . '分类');
		return $this->fetch();
	}
	/**
	 * 移动分类
	 * @author huajie <banhuajie@163.com>
	 */
	public function move() {
		$to   = input('post.to');
		$from = input('post.from');
		$res  = db('Category')->where(array('id' => $from))->setField('pid', $to);
		if ($res !== false) {
			return $this->success('分类移动成功！', url('index'));
		} else {
			return $this->error('分类移动失败！');
		}
	}
	/**
	 * 合并分类
	 * @author huajie <banhuajie@163.com>
	 */
	public function merge() {
		$to    = input('post.to');
		$from  = input('post.from');
		$Model = model('Category');
		/* //检查分类绑定的模型
		$from_models = explode(',', $Model->getFieldById($from, 'model'));
		$to_models   = explode(',', $Model->getFieldById($to, 'model'));
		
		//var_dump($Model,$from_models,$to_models);exit;
		
		foreach ($from_models as $value) {
			if (!in_array($value, $to_models)) {
				return $this->error('请给目标分类绑定' . get_document_model($value, 'title') . '模型');
			}
		}
		//检查分类选择的文档类型
		$from_types = explode(',', $Model->getFieldById($from, 'type'));
		$to_types   = explode(',', $Model->getFieldById($to, 'type'));
		
		var_dump($from_types,$to_types);exit;
		foreach ($from_types as $value) {
			if (!in_array($value, $to_types)) {
				$types = config('document_model_type');
				return $this->error('请给目标分类绑定文档类型：' . $types[$value]);
			}
		} */
		//合并文档
		$res = Db::name('Content')->where(array('category_id' => $from))->setField('category_id', $to);
	
		if ($res !== false) {
			//删除被合并的分类
			Db::name('Category')->where(array('id' => $from))->delete();
			//$Model->delete($from);
			return $this->success('合并分类成功！', url('index'));
		} else {
			return $this->error('合并分类失败！');
		}
	}
	
	public function status() {
		$id = $this->getArrayParam('id');
		$status = input('status', '0', 'trim,intval');
	
		if (!$id) {
			return $this->error("非法操作！");
		}
	
		$map['id'] = array('IN', $id);
		$result    = db('Category')->where($map)->setField('status', $status);
		if ($result) {
			return $this->success("设置成功！");
		} else {
			return $this->error("设置失败！");
		}
	}
	
	

    /**
     * 文章列表
     */
    public function documentList(){
    	
    	$keyword = input('keyword');
    	$category = input('category');
    		
    	$sqlStr = "";
    	if($keyword){
    		$sqlStr = 'title like "%'.$keyword.'%"';
    	}
    	if($category){
    		if($sqlStr){
    			$sqlStr .= 'or category_id = "'.$category.'"';
    		}else{
    			$sqlStr = 'category_id = "'.$category.'"';
    		}
    	}
    		
    	if ($sqlStr) {
    		$list = Db::name('content')->field('id,uid,author,title,is_top,create_time,update_time,status')
    		->where($sqlStr)
    		->where("type",1)
    		->order('id DESC')
    		->paginate(10, false, array('query'  =>  $this->param));
    	
    	} else {
    		$list = Db::name('content')->field('id,uid,author,title,is_top,create_time,update_time,status')
    		->where("type",1)
    		->order('id DESC')
    		->paginate(10, false, array('query'  =>  $this->param));
    	}
    		
    	$page = $list->render();
    	$list = $list->toArray();
    		
    	foreach ($list['data'] as $k=>$v){
    		$Mlist = Db::name('member')->field('username')->where('uid', $v['uid'])->find();
    			
    		if($Mlist['username']){
    			$list['data'][$k]['userName'] = $Mlist['username'];
    		}else{
    			$list['data'][$k]['userName'] = '';
    		}
    	
    		$list['data'][$k]["createTime"] = date("Y-m-d H:i:s",$v["create_time"]);
    		$list['data'][$k]["updateTime"] = date("Y-m-d H:i:s",$v["update_time"]);
    		$list['data'][$k]["content_url"] = config('res_url')."/wap/vote/content/contentId/".$v['id'];
    	}
    		
    	// dump($list['data']);exit;
    	$category = "";
    	$cate_list = parse_field_bind('category', $category, 0);
    	
		$this->assign('cate_list', $cate_list);
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
    	
    	return $this->fetch();
    }
    
    /**
     * 添加文章
     */
    public function addDocument(){

    	if(IS_POST){
    		
    		$data=array();
    		$data['uid'] = $_SESSION["user"]["user_auth"]["uid"];
    		$data['author'] = input('author');
    		$data['title'] = input('title');
    		$data['category_id'] = input('category');//htmlspecialchars_decode
    		$data['description'] = htmlspecialchars_decode(input('description'));
    		$data['type'] = input('contentType');//类型为图文，1为图文 2为视频
    		$data['video_link'] = input('videoLink','','trim,strip_tags');
    	    $data['position'] = input('position');//推荐位
    	    $data['external_link'] = input('link'); //外链
    	    $data['cover_id'] = input('cover');
    	    $data['display'] = input('display'); //可见性
    	    $data['deadline'] = strtotime(input('deadline'));
    	    $data['view'] = input('view');
    	    $data['praise'] = input('praise');
    	    $data['comment'] = input('comment');
    	    $data['level'] = input('level'); //优先级，权重
    	    $data['is_top'] = 0;  //是否置顶
    	    $data['create_time'] = strtotime(input('create_time'));
    	    $data['update_time'] = time();
    	    $data['status'] = 0;
    	    $data['keyword'] = htmlspecialchars_decode(input('keyword'));
    	    $data['is_share'] = input('is_share');  //是否可以分享
    	    $data['is_comment'] = input('is_comment');
    	    $data['is_examine'] = input('is_examine');
    	   
    		$result = Db::name('content')->insertGetId($data);
    	
    		if($result){
    			
    			$contentdata=array();
    		    $contentdata['doc_id'] = $result;
    			$contentdata['content'] = htmlspecialchars_decode(input('content'));
    			$contentdata['tags'] = input('Label');
    			$rescon = Db::name('content_detail')->insertGetId($contentdata);
	
    			//添加关键字
    			$kdata=array();
    			$kdata['key'] = input('keyword');
    			$kdata['type'] = 'content';
    			$kdata['module_id'] = $result;
    			$kdata['sort'] = input('level');
    			$keyresult = Db::name('wx_keyword')->insertGetId($kdata);
    			
    			if($rescon && $keyresult){
    				if($data['type'] == 1){
    					$this->redirect("User/Content/documentList");
    				}else{
    					$this->redirect("User/Content/videoList");
    				}
    			}else{
    				$this->error("添加内容或关键字失败。",Url("User/Content/addDocument",['id'=>$data['type']]));
    			}
    			
    	
    		}else{
    			$this->error("添加失败。",Url("User/Content/addDocument",['id'=>$data['type']]));
    		}
    	
    	}else{
    			
    		$category = "";
    		$cate_list = parse_field_bind('category', $category, 0);
    		$this->assign('cate_list', $cate_list);
    		
    		$picdata=array();
    		$this->assign('picdata', $picdata);
    		
    		$imagesdata=array();
    		$this->assign('imgdata', $imagesdata);
    		
    		$type = input('type');
    		$this->assign('type', $type);
    		//dump($type);exit;
    		$this->assign('create_time', date("Y-m-d H:i:s", time()));
    		$this->assign('current', '添加');
    		return $this->fetch();
    			
    	}
    	
    }
    
    /**
     *编辑文章
     */
    public function editDocument(){
    
    	if(IS_POST){
    		//	dump($_POST);exit;
    		$data=array();
    		//$data['uid'] = $_SESSION["user"]["user_auth"]["uid"];
    		$data['author'] = input('author');
    		$data['title'] = input('title');
    		$data['category_id'] = input('category');//htmlspecialchars_decode
    		$data['description'] = htmlspecialchars_decode(input('description'));
    		$data['type'] = input('contentType');//类型为图文，1为图文 2为视频
    		$data['video_link'] = input('videoLink');
    		$data['position'] = input('position');//推荐位
    		$data['external_link'] = input('link'); //外链
    		$data['cover_id'] = input('cover');
    		$data['display'] = input('display'); //可见性
    		$data['deadline'] = strtotime(input('deadline'));
    		$data['view'] = input('view');
    		$data['praise'] = input('praise');
    		$data['comment'] = input('comment');
    		$data['level'] = input('level'); //优先级，权重
    		$data['create_time'] = strtotime(input('create_time'));
    		$data['update_time'] = time();
    		$data['keyword'] = htmlspecialchars_decode(input('keyword'));
    		$data['is_share'] = input('is_share');  //是否可以分享
    		$data['is_comment'] = input('is_comment');
    		$data['is_examine'] = input('is_examine');
    		
    		$result = Db::name('content')->where('id', input('docId'))->update($data);
    		
    		Db::name('content_detail')->where('doc_id', input('docId'))->delete();
    		$contentdata=array();
    		$contentdata['content'] = htmlspecialchars_decode(input('content'));
    		$contentdata['tags'] = input('Label');
    		$contentdata['doc_id'] = input('docId');
    		$rescon = Db::name('content_detail')->insertGetId($contentdata);
    
    		//处理关键字的
    		$kdata=array();
    		$kdata['key'] = input('keyword');
    		$kdata['type'] = 'content';
    		$kdata['module_id'] = input('docId');
    		$kdata['sort'] = input('level');
    		Db::name('wx_keyword')->where('module_id', input('docId'))->delete();
    		$keyinsert = Db::name('wx_keyword')->insertGetId($kdata);
    	
    		
    		if($result || $rescon){
    			if($data['type'] == 1){
    				$this->redirect("User/Content/documentList");
    			}else{
    					$this->redirect("User/Content/videoList");
    			}
    		
    		}else{
    			$this->error("编辑失败。",Url("User/Content/editDocument",['id'=>input('docId')]));
    		}
    		 
    	}else{
    		 
    		$category = "";
    		$cate_list = parse_field_bind('category', $category, 0);
    		$this->assign('cate_list', $cate_list);
    
    		$id = input('id');
    		$doclist =  Db::name('content')->where('id', $id)->find();
    		$doclist["create_time"] = date("Y-m-d H:i:s",$doclist["create_time"]);
    		$doclist["deadline"] = date("Y-m-d H:i:s",$doclist["deadline"]);
    		
    		
    		$type = $doclist['type'];
    		$this->assign('type', $type);
    		
    		$imglist = null;
    		
    		$rescon = Db::name('content_detail')->where('doc_id', $id)->find();
    	
    		$pic = Db::name('picture')->where('id', $doclist['cover_id'])->find();
    		$picdata=array();
    		if($pic){
    			$picdata['cover']=$doclist['cover_id'];
    		}
    		$this->assign('picdata', $picdata);
    		
   
    		$this->assign('doclist', $doclist);
    		$this->assign('rescon', $rescon);
    		$this->assign('create_time', date("Y-m-d H:i:s", time()));
    		
    		$this->assign('current', '编辑');
    		return $this->fetch('adddocument');
    		 
    	}
    	 
    }
    
    /**
     * 设置置顶
     */
    public function settop($id, $is_top){
    	
    	$data=array();
    	$data['is_top'] = $is_top;
    	$rescon = Db::name('content')->where('id', $id)->update($data);
    	
    	if($rescon){
    		$return['msg'] = "修改成功。";
    		$return['key'] = 0;
    		echo json_encode($return);
    	}else{
    		$return['msg'] = "修改失败。";
    		$return['key'] = 1;
    		echo json_encode($return);
    	}
    }
    
    /**
     * 设置状态
     */
    public function setstatus($id, $status){
    	 
    	$data=array();
    	$data['status'] = $status;
    	$rescon = Db::name('content')->where('id', $id)->update($data);
    	 
    	if($rescon){
    		$return['msg'] = "修改成功。";
    		$return['key'] = 0;
    		echo json_encode($return);
    	}else{
    		$return['msg'] = "修改失败。";
    		$return['key'] = 1;
    		echo json_encode($return);
    	}
    }
    
    //删除内容
    public function del($id=''){
    
    	foreach ($id as $k=>$v){
    		$list = Db::name('content')->where('id', $v)->delete();
    		Db::name('content_detail')->where('doc_id', $v)->delete();
    		if(!$list){
    			break;
    		}
    	}
    
    	if(!$list){
    		echo "删除失败。";
    	}
    
    }
    
    /**
     * 视频内容
     */
    public function videoList(){
    	$keyword = input('keyword');
    	$category = input('category');
    	
    	$sqlStr = "";
    	if($keyword){
    		$sqlStr = 'title like "%'.$keyword.'%"';
    	}
    	if($category){
    		if($sqlStr){
    			$sqlStr .= 'or category_id = "'.$category.'"';
    		}else{
    			$sqlStr = 'category_id = "'.$category.'"';
    		}
    	}
    	
    	if ($sqlStr) {
    		$list = Db::name('content')->field('id,uid,author,title,is_top,create_time,update_time,status')
    		->where($sqlStr)
    		->where("type",2)
    		->order('id DESC')
    		->paginate(10, false, array('query'  =>  $this->param));
    		 
    	} else {
    		$list = Db::name('content')->field('id,uid,author,title,is_top,create_time,update_time,status')
    		->where("type",2)
    		->order('id DESC')
    		->paginate(10, false, array('query'  =>  $this->param));
    	}
    	
    	$page = $list->render();
    	$list = $list->toArray();
    	
    	foreach ($list['data'] as $k=>$v){
    		$Mlist = Db::name('member')->field('username')->where('uid', $v['uid'])->find();
    		 
    		if($Mlist['username']){
    			$list['data'][$k]['userName'] = $Mlist['username'];
    		}else{
    			$list['data'][$k]['userName'] = '';
    		}
    		 
    		$list['data'][$k]["createTime"] = date("Y-m-d H:i:s",$v["create_time"]);
    		$list['data'][$k]["updateTime"] = date("Y-m-d H:i:s",$v["update_time"]);
    	}
    	
    	// dump($list['data']);exit;
    	$category = "";
    	$cate_list = parse_field_bind('category', $category, 0);
    	 
    	$this->assign('cate_list', $cate_list);
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
    	return $this->fetch();
    }	

	/**
	 * 查看评论
	 */
    public function comments(){
    	$id = input('id');
    		
    		if (!$id) {
    			return $this->error("非法操作！");
    		}
    		
    		$content = input('content');
			$userName = input('userName');
			
			$sqlStr = "";
			if($content){
				$sqlStr = 'content like "%'.$content.'%"';
			}
			if($userName){
				if($sqlStr){
					$sqlStr .= 'or username = "'.$userName.'"';
				}else{
					$sqlStr = 'username = "'.$userName.'"';
				}
			}
			
			if ($sqlStr) {
				$list = Db::name('content_comment')->field('comment_id,content_id,username,content,add_time,ip_address,is_show')
				->where($sqlStr)
				->where('content_id', $id)
				//->order('add_time DESC')
				->paginate(6, false, array('query'  =>  $this->param));
				
			} else {
				$list = Db::name('content_comment')->field('comment_id,content_id,username,content,add_time,ip_address,is_show')
				->where('content_id', $id)
				//->order('add_time DESC')
				->paginate(6, false, array('query'  =>  $this->param));
			}
			
			$page = $list->render();
			$list = $list->toArray();
			
			foreach ($list['data'] as $k=>$v){
				$clist = Db::name('content')->field('title')->where('id', $v['content_id'])->find();
			
				if($clist['title']){
					$list['data'][$k]['content_name'] = $clist['title'];
				}else{
					$list['data'][$k]['content_name'] = '';
				}
	
				$list['data'][$k]["play_time"] = date("Y-m-d H:i:s",$v["add_time"]);
			}
			
		   // dump($list['data']);exit;
			// 模板变量赋值
			$this->assign('list', $list['data']);
			$this->assign('page', $page);
		
    	   return $this->fetch();
    
    }

    /**
     * 回复评论
     */
    public function replyComment(){
    
    	$id = input('id');
    	$model_id = input('model_id');
    	if(IS_POST){
    		$ctype=array();
    		$ctype['content_id'] = input('content_id');
    		$ctype['parent_id'] = input('parent_id');
    		$ctype['username'] = $_SESSION["user"]["user_auth"]["username"];
    		$ctype['user_id'] = $_SESSION["user"]["user_auth"]["uid"];
    		$ctype['content'] = htmlspecialchars_decode(input('content'));
    		$ctype['add_time'] = time();
    		$ctype['is_show'] = 1;
    			
    		$rescom = Db::name('content_comment')->insertGetId($ctype);
    
    
    		if($rescom){
    			$this->redirect('User/Content/comments',['id'=>$ctype['content_id'],'model_id'=>$model_id]);
    		}else{
    				
    			$this->error("回复失败。",Url("User/Content/replyComment",['id'=>$ctype['content_id'],'model_id'=>$model_id]));
    		}
    
    	}else{
    
    		$list = Db::name('content_comment')->field('comment_id,content_id,user_id,content,add_time')->where('comment_id', $id)->find();
    		$memlist = Db::name('member')->field('logo')->where('uid', $list['user_id'])->find();
    		$piclist = Db::name('picture')->field('path')->where('id', $memlist['logo'])->find();
    			
    		if($piclist['path']){
    			$list['user_logo'] = $piclist['path'];
    		}else{
    			$list['user_logo'] = "/application/user/static/images/innin.png";
    		}
    		$list["play_time"] = date("Y-m-d H:i:s",$list["add_time"]);
    		//config('res_url').$piclist['path'];
    		
    		$rpllist = Db::name('content_comment')->field('comment_id,content_id,user_id,content,add_time')->where('parent_id', $id)->select();
    			
    		foreach ($rpllist as $k=>$v){
    			$rplmemlist = Db::name('member')->field('logo')->where('uid', $v['user_id'])->find();
    			$rplpiclist = Db::name('picture')->field('path')->where('id', $rplmemlist['logo'])->find();
    
    			if($rplpiclist['path']){
    				$rpllist[$k]['user_logo'] = $rplpiclist['path'];
    			}else{
    				$rpllist[$k]['user_logo'] = "/application/user/static/images/innin.png";
    			}
    			$rpllist[$k]["play_time"] = date("Y-m-d H:i:s",$v["add_time"]);
    		}
    
    
    		$this->assign('rpllist', $rpllist);
    		$this->assign('list', $list);
    			
    		return $this->fetch();
    	}
    }
    
    /**
     * 删除评论
     * @param string $comment_id
     */
    public function delComment($comment_id = ""){
    
    	foreach ($comment_id as $k=>$v){
    		$list = Db::name('content_comment')->where('comment_id', $v)->delete();
    		if(!$list){
    			break;
    		}
    	}
    
    	if(!$list){
    		echo "删除失败。";
    	}
    }
    
    /**
     * 修改评论状态
     */
    public function changeComment(){
    
    	$comment_id = $_POST['comment_id'];
    
    	$data=array();
    	$data['is_show'] = input('status');
    
    	foreach ($comment_id as $k=>$v){
    		$list = Db::name('content_comment')->where('comment_id', $v)->update($data);
    		if(!$list){
    			break;
    		}
    	}
    
    	if(!$list){
    		echo "修改失败。";
    	}
    }
    
    
  
  
  
}