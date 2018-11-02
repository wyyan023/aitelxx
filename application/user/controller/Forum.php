<?php
namespace app\user\controller;
use app\common\controller\User;
use wechatsdk\wechat;
use think\Request;
use app\user\model\Devicemodel;
use think\Db;

class Forum extends User
{

	public function _initialize()
	{
		parent::_initialize();
	}
	
	public function index()
	{
        $forumname = input('forumname');
    		
    	$sqlStr = "";
    	if($forumname){
    		$sqlStr = 'name like "%'.$forumname.'%"';
    	}

    	if ($sqlStr) {
    		$list = Db::name('forum')->where($sqlStr)->paginate(10, false, array('query'  =>  $this->param));
    	
    	} else {
    		$list = Db::name('forum')->paginate(10, false, array('query'  =>  $this->param));
    	}
    		
    	$page = $list->render();
    	$list = $list->toArray();
    	
    	foreach ($list['data'] as $k=>$v){
    	    $piclist = Db::name('picture')->field('path')->where('id', $v['cover'])->find();
    			
    		if($piclist['path']){
    			$list['data'][$k]['logo'] = $piclist['path'];
    		}else{
    			$list['data'][$k]['logo'] = "/application/user/static/images/innin.png";
    		}
    	}
    	
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
        
		return $this->fetch();
	}
	
	public function add(){

		if(IS_POST){
			$data=array();
			$data['name'] = input('name');
			$data['desc'] = input('desc');
			$data['cover'] = input('cover');
			$data['status'] = 1; //默认禁用
			$data['is_share'] = input('is_share');
			$data['is_focus'] = input('is_focus');
			
			$data['auth_url'] = input('auth_url');
			$data['share_url'] = input('share_url');
			$data['return_url'] = input('return_url');
		
			$result = db('forum')->insertGetId($data);

			if($result){
				$data = array();
				$data['code'] = 1;
				$data['msg'] = "新建成功";
				$data['url'] = Url("User/forum/index");
				echo json_encode($data);
			
			}else{
				$data = array();
				$data['code'] = 0;
				$data['msg'] = "新建失败";
				$data['url'] = Url("User/forum/add");
				echo json_encode($data);
			}
		}else{
			$picdata=array();
			$this->assign('picdata', $picdata);
			$this->assign('current', '添加');
			return $this->fetch();
		}
		
	}

	public function  edit(){
		if(IS_POST){
		    $data=array();
			$data['name'] = input('name');
			$data['desc'] = input('desc');
			$data['cover'] = input('cover');
			
			$data['is_share'] = input('is_share');
			$data['is_focus'] = input('is_focus');
		
		$data['auth_url'] = input('auth_url');
			$data['share_url'] = input('share_url');
			$data['return_url'] = input('return_url');
			
			$result = db('forum')->where('id', input('forumId'))->update($data);

			if($result){
				$data = array();
				$data['code'] = 1;
				$data['msg'] = "编辑成功";
				$data['url'] = Url("User/forum/index");
				echo json_encode($data);
			
			}else{
				$data = array();
				$data['code'] = 0;
				$data['msg'] = "新建失败";
				$data['url'] = Url("User/forum/edit",array('id'=>input('forumId')));
				echo json_encode($data);
			}
		
		}else{
		
			$id = input('id');
			$list = db('forum')->where('id', $id)->find();

			$pic = Db::name('picture')->where('id', $list['cover'])->find();
			$picdata=array();
			if($pic){
				$picdata['cover']=$list['cover'];
			}
			$this->assign('picdata', $picdata);
		
			$this->assign('forumlist', $list);
			$this->assign('current', '编辑');
				
			return $this->fetch('add');
		}
	}
	
	//社区帖子
	public function posts(){
		$nickname = input('nickname');

		$sqlStr = "";
		if($nickname){
			$sqlStr = 'nickname like "%'.$nickname.'%"';
		}
		
		if ($sqlStr) {
			$list = Db::name('forum_posts')
			 ->field('id,status,client_ip,nickname,avatar,likes_num,comments_num,create_time,member_id')
			 ->where($sqlStr)->paginate(10, false, array('query'  =>  $this->param));
			 
		} else {
			$list = Db::name('forum_posts')
			->field('id,status,client_ip,nickname,avatar,likes_num,comments_num,create_time,member_id')
			->paginate(10, false, array('query'  =>  $this->param));
		}
		
		$page = $list->render();
		$list = $list->toArray();
		
		
		//dump($list['data']);exit;
		 
		$this->assign('list', $list['data']);
		$this->assign('page', $page);
		
		return $this->fetch();
	}

	//修改帖子状态
	public function forumStatus(){
		
		$forum_id = $_POST['forum_id'];
		$data=array();
		$data['status'] = input('status');
		 
		$list = Db::name('forum')->where('id','in', $forum_id)->update($data);
	
		if(!$list){
			echo "修改失败。";
		}
	}
	
	
	//修改帖子状态
	public function changesStatus(){
		
		$posts_id = $_POST['posts_id'];
		$data=array();
		$data['status'] = input('status');
		 
		$list = Db::name('forum_posts')->where('id','in', $posts_id)->update($data);
	
		if(!$list){
			echo "修改失败。";
		}
	}
	
	public function delForum(){
		$id = $_POST['id'];
    	$list = Db::name('forum')->where('id','in', $id)->delete();
    	 
    	if(!$list){
    		echo "删除失败。";
    	}
	}
	
	//删除帖子
	public function delPosts(){
    
		$id = $_POST['id'];
    	$list = Db::name('forum_posts')->where('id','in', $id)->delete();
    	$mlist = Db::name('forum_comments')->where('pid','in',$id)->delete();
    	if(!$list){
    		echo "删除失败。";
    	}
    
    }
    
    //获取帖子详情
    public function postsDetail(){
    	
    	$id = input('id');
    	$list = Db::name('forum_posts')->where('id', $id)->find();
  
        if($list){
    		return returnAjax(0,'success',$list);
    	}else{
    		return returnAjax(1,'error!',"获取数据失败。");
    	}
    	 
    }
    
    //获取帖子评论
    public function postsComment(){
       $postId = input('postId');
		$sqlStr = "";
		
    	if($postId){
    		$sqlStr = 'pid = "'.$postId.'"';
    	}
    	
    	$nickname = input('nickname');
    	if($nickname){
    		if($sqlStr){
    			$sqlStr .= 'and nickname like "%'.$nickname.'%"';
    		}else{
    			$sqlStr = 'nickname like "%'.$nickname.'%"';
    		}
    	}
    	
    	if ($sqlStr) {
    		$list = Db::name('forum_comments')
    		->field('id,status,client_ip,nickname,avatar,create_time,member_id')
    		->where($sqlStr)->paginate(10, false, array('query'  =>  $this->param));
    	
    	} else {
    		$list = Db::name('forum_comments')
    		->field('id,status,client_ip,nickname,avatar,create_time,member_id')
    		->paginate(10, false, array('query'  =>  $this->param));
    	}
    	
    	$page = $list->render();
    	$list = $list->toArray();
    	
    	
    	//dump($list['data']);exit;
    		
    	$this->assign('list', $list['data']);
    	$this->assign('page', $page);
    	
    	return $this->fetch();
    
    }

    //修改评论状态
    public function commentsStatus(){
    
    	$comments_id = $_POST['comments_id'];
    	$data=array();
    	$data['status'] = input('status');
    		
    	$list = Db::name('forum_comments')->where('id','in', $comments_id)->update($data);
    
    	if(!$list){
    		echo "修改失败。";
    	}
    }
    
    //删除评论
    public function delComments(){
    
    	$id = $_POST['id'];
    	$list = Db::name('forum_comments')->where('id','in', $id)->delete();
    	 
    	if(!$list){
    		echo "删除失败。";
    	}
    
    }
    
    //获取评论详情
    public function commentsDetail(){
    	 
    	$id = input('id');
    	$list = Db::name('forum_comments')->where('id', $id)->find();
    
    	if($list){
    		return returnAjax(0,'success',$list);
    	}else{
    		return returnAjax(1,'error!',"获取数据失败。");
    	}
    
    }
    
    //屏蔽发贴人或评论人
    public function shield(){
    	
    	$id = input('id');
    	$data=array();
    	$data['status'] = 0;
    	
    	//var_dump($id,$data);exit;	
    	$list = db('fans')->where('id',$id)->update($data);
    
    	if(!$list){
    		echo "修改失败,此用户可能已经被屏蔽";
    	}
    	
    }
    
    
    
    
    
}