<?php
namespace extend\PHPExcel;
namespace extend\PHPExcel\PHPExcel;
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use Overtrue\Pinyin\Pinyin;
use Qiniu\json_decode;

//用户数据管理
use app\common\controller\AdminData;
//日志
use app\common\controller\Log;


class scenarios extends User{
	
// type = 0 //流程语音   classify 0正常流程 1介绍

// type = 1  问题语音    classify：
// <option value="1"> 默认回复流程</option>
// <option value="2"> 用户提问时的回复</option>
// <option value="3"> 用户说话听不懂时的回复</option>
// <option value="4"> 用户说忙时的回复 </option>
// <option value="5"> 用户拒绝时的回复 </option>
// <option value="6"> 主动结束时的回复 </option>
// <option value="7"> 用户未说话时的回复 </option>
// <option value="8"> 回答不了时的回复 </option>

// type  = 2  结束语音  classify  0 正常结束   1 结束转人工

	
	public function _initialize() {
		parent::_initialize();
	
		$request = request();
		$action = $request->action();

	}
	
	
	//话术场景主界面
	public function index()
	{

			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];
			$super = $user_auth["super"];
	
			$where = array();
			$where['is_tpl'] = 0;
			if(!$super){
				$where['member_id'] = $uid;
			}
			
			$list = Db::name('tel_scenarios')
				->field('s.*,a.username')
				->alias('s')
				->join('admin a','a.id = s.member_id')
				->where($where)->order('id desc')
				->paginate(10, false, array('query'  =>  $this->param));
	
			$page = $list->render();
			$list = $list->toArray();
			
			
			$checklist = Db::name('tel_scenarios')->where('is_tpl',1)->order('id desc')->select();
			$this->assign('checklist', $checklist);

			$this->assign('list', $list['data']);
			$this->assign('page', $page);

			$adminlist = Db::name('admin')->field('examine')->where('id', $uid)->find();
            $this->assign('examine', $adminlist['examine']);
			$this->assign('super', $super);
		
			return $this->fetch();
		
	}
	
	
	//添加场景
	public function addScenarios(){
				
		if(IS_POST){

			 $user_auth = session('user_auth');
			 $uid = $user_auth["uid"];
			
			$memberInfo =  Db::name('admin')->field('examine')->where('id', $uid)->find();
			
			$data = array();
			$data['name'] = htmlspecialchars_decode(input('name','','trim,strip_tags'));
			$data['type'] = input('tradeType','','trim,strip_tags');
			$data['member_id'] = $uid;
			
			$isTpl = input('is_tpl','','trim,strip_tags');
			
			$data['is_tpl'] = 0;
			$data['status'] = 1;
			//当前话术是否审核
			$data['auditing'] = 0;
			if ($memberInfo['examine']){
				$data['auditing'] = 1;
			}
			
			$data['break'] = input('break','','trim,strip_tags');
			$data['update_time'] = time();

			$result = Db::name('tel_scenarios')->insertGetId($data);

          //$this->addtirule($result);   // 新建话术场景的时候添加默认规则

      $this->recovery($result);   // 新建话术场景的时候添加默认规则
		   
			$res = Db::name('tel_knowledge')->field("name,type,keyword,keyword_py,action,is_default")->where('scenarios_id', 0)->select();
			foreach ($res as &$v){
				$v['scenarios_id'] = $result;
				$v['create_time'] = time();
				$v['update_time'] = time();
			}
			$result = Db::name('tel_knowledge')->insertAll($res);
			// if($isTpl){
				// //这个逻辑是复制的，循环复制
				// $tList =  Db::name('tel_flow')->where('scenarios_id', $isTpl)->select();				 
				// foreach ($tList as $k=>$val){
						 // $teldata = array();
						 // $teldata['scenarios_id'] = $result;
						 // $teldata['content'] = $val["content"];
						 // $teldata['path'] = $val["path"];
						 // $teldata['keyword'] = $val["keyword"];
						 // $teldata['classify'] = $val["classify"];
						 // $teldata['bridge'] = $val["bridge"];
						 // $teldata['type'] = $val["type"];
						
			
						 // Db::name('tel_flow')->insertGetId($teldata);
				// }
				
				// $keywords =  Db::name('tel_keyword')->where('scenarios_id', $isTpl)->select();				
			// }
			// else{
				// $keywords = Db::name('tel_keyword')->where('scenarios_id', 11)->select();
			// }
			
			// foreach ($keywords as $k=>$val){
					 // $teldata = array();
					 // $teldata['scenarios_id'] = $result;
					 // $teldata['priority'] = 0;
					 // $teldata['type'] = $val["type"];
					 // $teldata['keyword'] = $val["keyword"];
					 // $teldata['pinyin'] = $val["pinyin"];
					 // Db::name('tel_keyword')->insertGetId($teldata);
			// }
			
			// if ($result >= 0){
				 // $back = array();
				 // $back["url"] = Url("User/Scenarios/index");
				 // return returnAjax(0,'success!',$back);		
			// }
			// else{
				 // return returnAjax(1,'failure!');
			// }
			return returnAjax(0,'success!');	
		}
		else{
			    $this->assign('current', "添加");
				return $this->fetch();
		}
		
	}
    
    //新建话术场景的时候添加默认规则
	public function addtirule($result){

			$tidata = array();
	        $tidata['scenarios_id'] = $result;
	        $tidata['name'] = '以上规则均不满足时，将客户意向标签设置为';
			$tidata['level'] = 4;
			$tidata['type'] = 1;
			$tidata['sort'] = 0;
			$tidata['status'] = 0;
			$tidata['create_time'] = time();
			$tidata['update_time'] = time();
            $tiresult = Db::name('tel_intention_rule')->insertGetId($tidata);


	}
	
	//获取场景数据
	public function getmessage(){
		  $id = input('id','','trim,strip_tags');
			$slist =  Db::name('tel_scenarios')->where('id', $id)->find();
			echo json_encode($slist,true);
	}
	
	//编辑场景
	public function editscenarios(){
		$data = array();
		$data['name'] = htmlspecialchars_decode(input('name','','trim,strip_tags'));
		$data['type'] = input('tradeType','','trim,strip_tags');
		$data['update_time'] = time();
		$data['break'] = input('break','','trim,strip_tags');
		
		$id = input('scenariosId','','trim,strip_tags');

			
		$result = Db::name('tel_scenarios')->where('id', $id)->update($data);
		if ($result){
			 return returnAjax(0,'success!');		
		}
		else{
			 return returnAjax(1,'failure!');
		}
	}
	
	//删除场景
	public function delScenarios(){
		
		$scenariosId= input('id','','trim,strip_tags');
		$ret = Db::name('tel_scenarios')->where('id', $scenariosId)->delete();
		$ret = Db::name('tel_scenarios_node')->where('scenarios_id', $scenariosId)->delete();
		$ret = Db::name('tel_flow_node')->where('scenarios_id', $scenariosId)->delete();
		$ret = Db::name('tel_corpus')->where('scenarios_id', $scenariosId)->delete();
		$ret = Db::name('tel_knowledge')->where('scenarios_id', $scenariosId)->delete();
        $ret = Db::name('tel_intention_rule')->where('scenarios_id', $scenariosId)->delete();
        $ret = Db::name('tel_learning')->where('scenarios_id', $scenariosId)->delete();

    	if(!$ret){
    		//echo "删除失败。";
    	}
    	
	}
	
	// 修改状态
	public function setstatus(){

		$sId = input('sId','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$data=array();
		$data['status'] = $status;
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		// if (!$super && $status){
			// $list = Db::name('tel_scenarios')->where('member_id',$uid)->update(array('status'=>0));
		// }
		
		$list = Db::name('tel_scenarios')->where('id',$sId)->update($data);
	
	   if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}
	}
	
	//设置
	public function flow(){
			$id = input('id','','trim,strip_tags');
			$type = input('type','0','trim,strip_tags');
			$where = array();
			$where['scenarios_id'] = $id;
			$where['type'] = $type;
			
			$list = Db::name('tel_flow')->where($where)->order('id asc')
			->paginate(20, false, array('query'  =>  $this->param));
	
			$page = $list->render();
			$list = $list->toArray();

			foreach ($list['data'] as $k=>$v){
			
				$list['data'][$k]["path"] = config('res_url').$v["path"];
			
			}
			
			
			
			$this->assign('thisId', $id);

			$this->assign('list', $list['data']);
			$this->assign('page', $page);
			
			$result = Db::name('tel_keyword')->where('scenarios_id',$id)->order('id asc')->select();
			$this->assign('kwlist', $result);
	       	return $this->fetch();

	}
	
	public function addflow(){
			$tmp_file = $_FILES ['update-audio-file'] ['tmp_name'];
			$data = array();
			if($tmp_file){
				$file_types = explode ( ".", $_FILES ['update-audio-file'] ['name'] );
				$file_type = $file_types [count ( $file_types ) - 1];


				if (strtolower ( $file_type ) != "wav")              
				{
				  $this->error ( '不是wav文件，只能上传wav文件，重新上传' );
				}

				/*以时间来命名上传的文件夹*/
				$datestr = date ( 'Ymd' ); 

				$savePath = './uploads/audio/'.$datestr.'/';
				// 如果不存在则创建文件夹
				if (!is_dir($savePath)){
				  mkdir($savePath); 
				}  

	            /*以时间来命名上传的文件*/
				$str = date ( 'Ymdhis' ); 


				$file_name = $str . "." . strtolower($file_type);

				/*是否上传成功*/
				if (! copy ( $tmp_file, $savePath . $file_name )) 
				{
				  $this->error ( '上传失败' );
				}

				$path = $savePath . $file_name;
				$path = ltrim($path,".");


				$data['path'] = $path;
			}
							
			$flowItemId = input('flowItemId','','trim,strip_tags');
			
			$data['content'] = input('words-content','','trim,strip_tags');
			$data['scenarios_id'] = input('scenariosId','','trim,strip_tags');
			$data['priority'] = input('priority','0','trim,strip_tags');
			
			$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
			$data['keyword'] = input('hit-keys','','trim,strip_tags');
			if ($data['keyword']){
				$py = $pinyin->sentence($data['keyword']);
				$data['keyword_py'] = $py;//str_replace(' ', '', $py);
			}
			
			
			$data['bridge'] = input('bridge','0','trim,strip_tags');
			$data['type'] = (int)input('flowType','','trim,strip_tags');
			$data['break']= input('break','','trim,strip_tags');
			$data['classify']= input('classify','','trim,strip_tags');
			
			if($flowItemId){
					$result = Db::name('tel_flow')->where('id', $flowItemId)->update($data);
			}else{
					
					$result = Db::name('tel_flow')->insertGetId($data);
			}
			
			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];

			$memberInfo =  Db::name('admin')->field('examine')->where('id', $uid)->find();
			if ($memberInfo['examine']){
				$ret = Db::name('tel_scenarios')->where('id',$data['scenarios_id'])->update(array('auditing'=>1));	
			}
			
			$this->redirect(Url("User/Scenarios/flow",['id'=>$data['scenarios_id']]));
 
	}
	
	//获取话术item信息
	public function getflow(){
		$id = input('id','','trim,strip_tags');
		$slist =  Db::name('tel_flow')->where('id', $id)->find();
		
		$slist["path"] = config('res_url').$slist["path"];

		echo json_encode($slist,true);
	}
	
		//删除场景
	public function delFlow(){
		
			$ids= input('id/a','','trim,strip_tags');
			$scenariosId = input('scenariosId','','trim,strip_tags');
			$ret = Db::name('tel_flow')->where('id','in', $ids)->delete();

			if(!$ret){ 
				echo "删除失败。";
			}
			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];

			$memberInfo =  Db::name('admin')->field('examine')->where('id', $uid)->find();
			if ($memberInfo['examine']){
				$ret = Db::name('tel_scenarios')->where('id',$scenariosId)->update(array('auditing'=>1));	
			}
	}
	
	
		//获取话术item信息
		public function getSelectflow(){
			
			$scenariosId = input('scenariosId','','trim,strip_tags');
			$type = (int)input('type','0','trim,strip_tags');
			$classify = (int)input('classify','','trim,strip_tags');
			
			$where = array();
			$where['scenarios_id'] = $scenariosId;
			if ($classify){
				$where['classify'] = $classify; 
			}
			$where['type'] = $type;  
			
			$list = Db::name('tel_flow')->where($where)->select();

				$back = array();
				$back['list'] = $list;
	
				return returnAjax(0,'获取数据成功',$back);
				
		}
		
		//添加关键字
		public function addKeysWord(){
		
					$data = array();

					$kwItemId = input('kwItemId','','trim,strip_tags');
					
					$data['priority'] = input('priority','','trim,strip_tags');
					$data['scenarios_id'] = input('skwId','','trim,strip_tags');
			
					$data['keyword'] = input('keyword','','trim,strip_tags');
				
					$data['type'] = input('keystype','','trim,strip_tags');
					
					$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
					
					if ($data['keyword']){
						$py = $pinyin->sentence($data['keyword']);
						$data['pinyin'] = $py;//str_replace(' ', '', $py);
					}
					
		
					if($kwItemId){
							$result = Db::name('tel_keyword')->where('id', $kwItemId)->update($data);
					}else{
							
							$result = Db::name('tel_keyword')->insertGetId($data);
					}
				
					$this->redirect(Url("User/Scenarios/flow",['id'=>$data['scenarios_id']]));
		}
	
		//获取关键字item信息
		public function getKeywordItem(){
			
				$id = input('id','','trim,strip_tags');
				$slist =  Db::name('tel_keyword')->where('id', $id)->find();
				//$slist["path"] = config('res_url').$slist["path"];
				echo json_encode($slist,true);
					
		}
	
		//删除关键字
		public function delKeyword(){

			$ids= input('id','','trim,strip_tags');

			$klist = Db::name('tel_keyword')->where('id',$ids)->delete();

			if(!$klist){ 
				echo "删除失败。";
			}
					
		}

        //返回学习列表
		public function learning(){


	  	$Page_size = 10;
			$page = input('page','1','trim,strip_tags');
	
			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];
			$super = $user_auth["super"];
					
	    $where = array();
	    $mobile = input('keyword','','trim,strip_tags');
	    $status = input('status','','trim,strip_tags');
	
	    $sceneId = input('sceneId','','trim,strip_tags');
	    $type = input('type','','trim,strip_tags');
	
	  	if($status != ""){
	  		 $where["status"] = $status;
	  	}   
	
			if($sceneId != ""){
	  		 $where["scenarios_id"] = $sceneId;
	  	}   
	  	if($type != ""){
	  		 $where["status"] = $type;
	  	}   
			
			if(!$super){
				$where['owner'] = $uid;
			}
		
			$list = Db::name('tel_learning')
			->order('id desc')
			->where($where)
			->page($page,$Page_size)
			->select();
			
			foreach($list as &$item){
				if ($item['create_time'] > 0){
					$item['create_time'] = date('Y-m-d H:i:s', $item['create_time']);
				}else{
					$item['create_time'] = "";
				}
			}
			
			
			
			$count =  Db::name('tel_learning')->where($where)->count('id');
			$page_count = ceil($count/$Page_size);
		
			$back = array();
			$back['total'] = $count;
			$back['Nowpage'] = $page;
			$back['list'] = $list;
			$back['page'] = $page_count;
		
			return returnAjax(0,'获取数据成功',$back);
		}
		
		public function setAuditing(){
			$scenariosId = input('id','','trim,strip_tags');
			$result = Db::name('tel_scenarios')->where('id', $scenariosId)->update(array('auditing'=>2));
			if ($result >= 0){
				
				return returnAjax(0,'success');
			}
			else{
				
				return returnAjax(1,'提交失败');
			}
			
		}
		
		//审核
		public function auditing(){
	
					
			$change = array();
			$scenariosId = input('scenariosId','','trim,strip_tags');
			$change['remark'] = input('remarks','','trim,strip_tags');
			$change['auditing'] = input('status','','trim,strip_tags');
					
					
			$result = Db::name('tel_scenarios')->where('id', $scenariosId)->update($change);

			if($change['auditing'] == 0){
				//删除tel_flow_ok
				$result = Db::name('tel_flow_ok')->where('scenarios_id', $scenariosId)->delete();
				// INSERT INTO db1_name(field1,field2) SELECT field1,field2 FROM db2_name      
				// Db::execute("update think_user set name=:name where status=:status",['name'=>'thinkphp','status'=>1]);
				
				//批量插入
				Db::execute("insert into rk_tel_flow_ok(scenarios_id,content,path,keyword,keyword_py,scenarios_keyword,scenarios_keyword_py,classify,bridge,type,priority,break) select scenarios_id,content,path,keyword,keyword_py,scenarios_keyword,scenarios_keyword_py,classify,bridge,type,priority,break from rk_tel_flow where scenarios_id=:scenarios_id order by id asc", ['scenarios_id'=>$scenariosId]);
				//更改状态
				
				// $flowlist = Db::name('tel_flow')->where('scenarios_id', $scenariosId)->where('is_change', 1)->select();
				
				// foreach ($flowlist as $key => $value) {

						// $flow = array();

						// $flow['scenarios_id'] = $scenariosId;
						// $flow['content'] = $value['content'];
						// $flow['path'] =  $value['path'];
						// $flow['keyword'] = $value['keyword'];
						// $flow['keyword_py'] = $value['keyword_py'];
						 
						// $flow['scenarios_keyword'] = $value['scenarios_keyword'];
						// $flow['scenarios_keyword_py'] = $value['scenarios_keyword_py'];
						// $flow['classify'] = $value['classify'];
						// $flow['bridge'] = $value['bridge'];
						// $flow['type'] = $value['type'];
						// $flow['priority'] = $value['priority'];

						// $res = Db::name('tel_flow_ok')->insertGetId($flow);

						// if($res){

								// $okd = array();
								// $okd['is_change'] = 0;
			 
								// $result = Db::name('tel_flow')->where('id', $value['id'])->update($okd);

						// }
					
				// }

			}

				
				
	
	    }

		//返回详细信息
		public function backdetail(){
	
				$uid = input('id','','trim,strip_tags');
				$mobile = input('mobile','','trim,strip_tags');
				if ($uid){
					$where['uid'] = $uid;
				}
				else{
					$where['mobile'] = $mobile;
				}
			
				$memberInfo = Db::name('member')
				->field('mobile,nickname,status,level,sex,duration,last_dial_time,record_path,call_id,call_rotation,originating_call')
				->where('uid',$uid)->find();
				
				$num = Db::name('tel_bills')->where('status',1)->where('call_id',$uid)->count("id");

				if ($memberInfo['call_id']){
					
					$bills = Db::name('tel_bills')->where('call_id',$memberInfo['call_id'])->order('id asc')->select();
				}
				else{
					$bills = Db::name('tel_bills')->where('phone',$memberInfo['mobile'])->order('id asc')->select();
				}
				
				if ($memberInfo['sex'] >= 0){
					$memberInfo['sex'] = $memberInfo['sex']?'女':'男';
				}
				else{
					$memberInfo['sex'] = '未知';
				}
				$memberInfo['nickname'] = $memberInfo['nickname']? $memberInfo['nickname']:'--';
				
				$memberInfo['last_dial_time'] = date('Y-m-d H:i:s', $memberInfo['last_dial_time']);
				
				
				switch ($memberInfo['status']) {
						case 1:
							$memberInfo['status'] = '排除中';
							break;
				
						case 2:
							$memberInfo['status'] = '已接通';
							break;
				
						case 3:
							$memberInfo['status'] = '未接听挂断/关机/欠费';
							break;
				
						default:
							$memberInfo['status'] = '排除中';
					}
				
			
				$data = array();
				$data['memberInfo'] = $memberInfo;
				$data['bills'] = $bills;
		        $data['num'] = $num;

			    return returnAjax(0,'获取成功',$data);
	
	
		}
	
	   //
		public function changeLevel(){
			$level = input('level');
			$uid = input('id');
			
			$res = Db::name('member')->where('uid',$uid)->update(array('level'=>$level));
			
			if ($res >= 0){
				return returnAjax(0,'修改成功');
			}
			else{
				return returnAjax(1,'修改失败');
			}
			
		}
			
	  	//删除学习
	  	public function delLearning(){
	  		
	  			$ids= input('id/a','','trim,strip_tags');
	  
	  			$flist = Db::name('tel_learning')->where('id','in', $ids)->delete();
	  
	  			if(!$flist){ 
	  				echo "删除失败。";
	  			}
	  			
	  	}


    // 修改状态
	public function changeStatus(){

		$sId = input('Ids/a','','trim,strip_tags');
		$status = input('status','','trim,strip_tags');
		
		$data=array();
		$data['status'] = $status;
		
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
		
		$list = Db::name('tel_learning')->where('id','in',$sId)->update($data);
	
	   if($list){
			return returnAjax(0,'成功',$list);
		}else{
			return returnAjax(1,'error!',"失败");
		}


	}



    //导入文件
    public function importExcel(){

			$tmp_file = $_FILES ['excel'] ['tmp_name'];
			$file_types = explode ( ".", $_FILES ['excel'] ['name'] );
			$file_type = $file_types [count ( $file_types ) - 1];

		

			/*设置上传路径*/
			$savePath = './uploads/Excel/';
			// 如果不存在则创建文件夹
			if (!is_dir($savePath)){
					mkdir($savePath); 
			}  
			
			/*以时间来命名上传的文件*/
			$str = date ( 'Ymdhis' ); 
			$file_name = $str . "." . $file_type;

			/*是否上传成功*/
			if (! copy ( $tmp_file, $savePath . $file_name )) 
			{
				$this->error ( '上传失败' );
			}
			
			$foo = new \PHPExcel();
			 $extension = strtolower( pathinfo($file_name, PATHINFO_EXTENSION) );

			//区分上传文件格式
			if($extension == 'xlsx') {
				$inputFileType = 'Excel2007';
				$objReader = \PHPExcel_IOFactory::createReader($inputFileType);
			}
			else{
				$inputFileType = 'Excel5';
				$objReader = \PHPExcel_IOFactory::createReader($inputFileType);
			}
			$objPHPExcel = $objReader->load($savePath.$file_name, $encode = 'utf-8');
			
             // \think\Log::record('Url='.Url("User/Scenarios/flow/id/".$scenariosId));
	   
          
            $num = $objPHPExcel->getSheetCount(); 

			$scenariosId = input('scenariosId','','trim,strip_tags');

            $SheetNames = $objPHPExcel->getSheetNames();   

            $classify = 0;   
            // var_dump($SheetNames,$num,$objPHPExcel);
            

            for ($i=0; $i < $num ; $i++) { 

                   //var_dump($num[$i]);
                   \think\Log::record('$SheetNames[$i]='.$SheetNames[$i]);

            	   switch ($SheetNames[$i]) {
            	   	case '用户提问流程':
            	   		 $classify = 2;   
            	   		break;
            	   	case '用户挽回流程':
            	   		 $classify = 1;   
            	   		break;
            	   	case '用户拒绝流程':
            	   		 $classify = 5;   
            	   		break;
            	    case '回答不上来流程':
            	   		 $classify = 8;   
            	   		break;
            	    case '用户说忙流程':
            	   		 $classify = 4;   
            	   		break;	
            	   	case '用户未说话':
            	   		 $classify = 7;   
            	   		break;		
            	    case '主动结束流程':
            	   		 $classify = 6;   
            	   		break;	
            	   	default:
            	   		 $classify = 0;   
            	   		break;
            	   }
		              

					$excelArr = $objPHPExcel->getsheet($i)->toArray();
					

					// if (count($excelArr) < 2){
					// 	$this->redirect(url("User/Scenarios/flow",array('id'=>$scenariosId)),'导入的文件没有数据!');
					// 	return;
					// }
					
					$user_auth = session('user_auth');
					$uid = $user_auth["uid"];

		            if (!$scenariosId){
						$this->redirect(url("User/Scenarios/flow",array('id'=>$scenariosId)),'场景错误，请选择场景。');
						return;
					}

					$data = array();
					foreach ( $excelArr as $k => $v ){
							
							if ($k == 0){
								 continue;
							}

							$user['scenarios_id'] = $scenariosId;
							$user['content'] = trim($v[0]);
							$user['path'] = $v[2];

							if($i == 0){
								 $user['type'] = 0;
		                        if($v[1] == '否'){
			                        $user['break'] = 0;
								}else{
			  						$user['break'] = 1;
								}
							}else{
								
                                 $user['type'] = 1;
                                 $user['classify'] = $classify;
								
				              	 $pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
				
                                 $user['keyword'] = $v[1];
								if ($user['keyword']){
									$py = $pinyin->sentence($user['keyword']);
									$user['keyword_py'] = $py;//str_replace(' ', '', $py);
								}

							}
						
							array_push($data,$user);

					}
				
				
		        //	\think\Log::record('$i='.$i);
			  //  \think\Log::record('data='.json_encode($data));
		        
		          $result = Db::name('tel_flow')->insertAll($data);
				  
			
				$user_auth = session('user_auth');
				$uid = $user_auth["uid"];

				$memberInfo =  Db::name('admin')->field('examine')->where('id', $uid)->find();
				if ($memberInfo['examine']){
					 $ret = Db::name('tel_scenarios')->where('id',$scenariosId)->update(array('auditing'=>1));	
				}
		      

            }



 		  $this->redirect(url("User/Scenarios/flow",array('id'=>$scenariosId)),'导入成功');

    }


    //话术管理
    public function scene(){

    $user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];

		$where = array();
		$where['is_tpl'] = 0;
		if(!$super){
			$where['member_id'] = $uid;
		}
		
		$list = Db::name('tel_scenarios')
			->field('s.*,a.username')
			->alias('s')
			->join('admin a','a.id = s.member_id')
			->where($where)->order('id desc')
			->select();

		foreach ($list as $key=>$val){
			$list[$key]["update_time"] = date("Y-m-d H:i:s",$val["update_time"]);
		}
		
		//获取子账户
		$AdminData = new AdminData();
		$user_list = $AdminData->get_find_users($uid);
		array_unshift($user_list, ['id' => $uid, 'username' => '自己']);
		$this->assign('user_list', $user_list);
		$this->assign('scenarioslist', $list);

		$this->assign('num', count($list));

		$adminlist = Db::name('admin')->field('examine')->where('id', $uid)->find();
        $this->assign('examine', $adminlist['examine']);
		$this->assign('super', $super);

		\think\Config::parse(APP_PATH.'intention.json', 'json');
		$intention = \think\Config::get('intention_rule');
	
		$this->assign('intention', $intention);

		$checklist = Db::name('tel_scenarios')->where('is_tpl',1)->order('id desc')->select();
		$this->assign('checklist', $checklist);


        return $this->fetch();

    }
   

     //返回意向标签列表
	public function getLabelList(){


    	$Page_size = 10;
		$page = input('page','1','trim,strip_tags');

		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
		$super = $user_auth["super"];
		
	    $where = array();
        $mobile = input('keyword','','trim,strip_tags');
        $status = input('status','','trim,strip_tags');

        $sceneId = input('sceneId','','trim,strip_tags');
        $type = input('type','','trim,strip_tags');

    	if($status != ""){
    		 $where["status"] = $status;
    	}   

		if($sceneId != ""){
    		 $where["scenarios_id"] = $sceneId;
    	}   
    	if($type != ""){
    		 $where["status"] = $type;
    	}   

	    $where["type"] = 0;

		$list = Db::name('tel_intention_rule')
		->order('sort desc')
		->where($where)
		->page($page,$Page_size)
		->select();
		
 
	
		foreach($list as &$item){

            switch ($item['level']) {
        		case 6:
        			$item['level'] = 'A类(有明确意向)';
        			break;
        		case 5:
        			$item['level'] = 'B类(可能有意向)';
        			break;
        
        		case 4:
        			$item['level'] = 'C类(明确拒绝)';
    				break;
    			case 3:
        			$item['level'] = 'D类(用户忙)';
        			break;
        		case 2:
        			$item['level'] = 'E类(拨打失败)';
        			break;
        		default:
        			$item['level'] = 'F类(无效客户)';
    			
    		}

			if ($item['create_time'] > 0){
				$item['create_time'] = date('Y-m-d H:i:s', $item['create_time']);
			}
			else{
				$item['create_time'] = "";
			}
	
		}
		
		$cwhere = array();
		if($status != ""){
    		 $cwhere["status"] = $status;
    	}  
        if($sceneId != ""){
    		 $cwhere["scenarios_id"] = $sceneId;
    	}   
    	if($type != ""){
    		 $cwhere["status"] = $type;
    	}   

		$count =  Db::name('tel_intention_rule')->where($cwhere)->count('id');
		$page_count = ceil($count/$Page_size);
	
		$back = array();
		$back['total'] = $count;
		$back['Nowpage'] = $page;
		$back['list'] = $list;
		$back['page'] = $page_count;
	
		return returnAjax(0,'获取数据成功',$back);
		

	}

    //返回话术场景默认的值
	public function backdefault(){

        $sceneId = input('sceneId','','trim,strip_tags');
        $where = array();
        $where["type"] = 1;
        $where["scenarios_id"] = $sceneId;

		$list = Db::name('tel_intention_rule')
			->field('id,level')
		    ->where($where)->find();

		    if(isset($list['level'])){
                $list["levelNum"] = $list["level"];
		    	switch ($list['level']) {
	        		case 6:
	        			$list['level'] = 'A类(有明确意向)';
	        			break;
	        		case 5:
	        			$list['level'] = 'B类(可能有意向)';
	        			break;
	        
	        		case 4:
	        			$list['level'] = 'C类(明确拒绝)';
	    				break;
	    			case 3:
	        			$list['level'] = 'D类(用户忙)';
	        			break;
	        		case 2:
	        			$list['level'] = 'E类(拨打失败)';
	        			break;
	        		default:
	        			$list['level'] = 'F类(无效客户)';
	    			
	    		}

		    }else{
		    	$list = array();
		    }

	

		return returnAjax(0,'成功',$list);

	}

    //编辑默认等级
	public function updateDftype(){

         $sceneId = input('sceneId','','trim,strip_tags');
         $level = input('level','','trim,strip_tags');
		 $data = array();
		 $data['level'] = $level;

         $result = Db::name('tel_intention_rule')->where('scenarios_id', $sceneId)->where('type', 1)->update($data);

        if($result){

			return returnAjax(0,'编辑成功了',$result);
	    }
	    else{

			return returnAjax(1,'编辑失败',$result);
	    }



	}

	
	//新的添加场景
	public function addIntention(){


			$data = array();

			$ruler = input('ruler/a','','trim');
			
	        $data['scenarios_id'] = input('scenarios_id','','trim,strip_tags');

			
			$data['level'] = input('classify','','trim,strip_tags');
			$data['type'] = 0;
			
			//$data['sort'] = input('sort','','trim,strip_tags');
		
			
			$data['status'] = 0;
			
			$data['update_time'] = time();

            //  $ruler = json_decode($ruler,true);
	        //\think\Log::record('ruler='.json_decode($ruler));

	        $name = input('name/a','','trim,strip_tags');

            $Joan = array(); 
            $rulername = "";
			
			foreach ($ruler as $key => $value) {

                $temp = array(); 
				$temp['key'] = $value['one'];
				$temp['type'] = $value['four'];
				$temp['op'] = trim($value['two']);

				if($value['one'] == 'say_keyword'){
					 $temp['value'] = explode(",",$value['three']);
				}else{
				     $temp['value'] = $value['three'];	
				}
				 $temp['value'] = $value['three'];	
				array_push($Joan,$temp);

                if($key == 0){
                	\think\Log::record('nametwotxt='.json_encode($name[$key]));
                	if($name[$key]["twotxt"] == '<='){
						\think\Log::record('twotxt dengyu<=');
                	}else if($name[$key]["twotxt"] == ""){
						$name[$key]["twotxt"] = '<=';
                	}
 					$rulername = $name[$key]["onetxt"]." ".$name[$key]["twotxt"]." ".$name[$key]["threetxt"];
 					
                }else{
                	if($name[$key]["twotxt"] == '<='){
						\think\Log::record('twotxt dengyu<=');
                	}else if($name[$key]["twotxt"] == ""){
						$name[$key]["twotxt"] = '<=';
                	}
					$rulername = $rulername." 并且 ".$name[$key]["onetxt"]." ".$name[$key]["twotxt"]." ".$name[$key]["threetxt"];
                }
              

			}
			
	       $data['name'] = $rulername;

			$data['rule'] = serialize($Joan);

		   $sceneId = input('sceneId','','trim,strip_tags');

			if($sceneId){
					$result = Db::name('tel_intention_rule')->where('id', $sceneId)->update($data);
			}else{
					$data['create_time'] = time();
					$result = Db::name('tel_intention_rule')->insertGetId($data);
			}

		

		   if($result){
				return returnAjax(0,'新建成功了',$result);
		   }else{
				return returnAjax(1,'新建失败',$result);
		   }

				
	}

	//删除意向标签
  	public function delLabel(){
  		
  			$ids= input('id/a','','trim,strip_tags');
  
  			$flist = Db::name('tel_intention_rule')->where('id','in', $ids)->delete();
  
  			if(!$flist){ 
  				echo "删除失败。";
  			}
  			
  	}
	
	//获取场景数据
	public function getscene(){

			$id = input('id','','trim,strip_tags');
			$slist =  Db::name('tel_intention_rule')->where('id', $id)->find();

            $slist['rule'] = unserialize($slist['rule']);

            foreach ($slist['rule'] as $key => $value) {

				if($value['key'] == 'say_keyword'){
					if (is_array( $value['value'])){
						$slist['rule'][$key]['value'] = implode(",", $value['value']);
					}
				}
				

			}

	       return returnAjax(0,'成功',$slist);
	

	}

	//恢复默认配置
	public function recovery($sceneId = ""){
    if($sceneId == ""){
      $sceneId = input('sceneId','','trim,strip_tags');
    }
		if(!empty($sceneId)){
			$flist = Db::name('tel_intention_rule')->where('scenarios_id', $sceneId)->delete();
		}
		

		$where = array();
		$where['scenarios_id'] = 0;
		

    $res = Db::name('tel_intention_rule')->field("name,level,rule,type")->where($where)->select();

    $data = array();
    foreach ($res as &$v){
    	$v['scenarios_id'] = $sceneId;
			$v['create_time'] = time();
  		$v['update_time'] = time();
    }

		$result = Db::name('tel_intention_rule')->insertAll($res);

	    if($result){
			return returnAjax(0,'新建成功了',$result);
	    }else{
			return returnAjax(1,'新建失败',$result);
	    }


	}
	


		//新的添加场景
	public function addflowNote(){


			$data = array();

	        $data['scenarios_id'] = input('sceneId','','trim,strip_tags');		
			$data['name'] = input('name','','trim,strip_tags');
			$data['type'] = input('type','0','trim,strip_tags');
			$data['sort'] = 0;
			

		    $flowId = input('flowId','','trim,strip_tags');

			if($flowId){
					$result = Db::name('tel_scenarios_node')->where('id', $flowId)->update($data);
			}else{
					
					$result = Db::name('tel_scenarios_node')->insertGetId($data);
			}

		

		   if($result){
				return returnAjax(0,'新建成功了',$result);
		   }else{
				return returnAjax(1,'新建失败',$result);
		   }

				
	}
    
    //返回流程节点列表
	public function getNoteList()
	{
		  $sceneId = input('sceneId','','trim,strip_tags');		
		  $result = Db::name('tel_scenarios_node')->where('scenarios_id', $sceneId)->select();

		   if($result){
				return returnAjax(0,'有数据了',$result);
		   }else{
				return returnAjax(1,'暂时没有数据',$result);
		   }
	}

   //返回流程节点列表
	public function getflowinfo($value='')
	{
		  $noteId = input('id','','trim,strip_tags');		
		  $result = Db::name('tel_scenarios_node')->where('id', $noteId)->find();

		   if($result){
				return returnAjax(0,'有数据了',$result);
		   }else{
				return returnAjax(1,'暂时没有数据',$result);
		   }
	}
	
	//删除流程节点
  	public function delflowNote(){
  		
  			$ids= input('id','','trim,strip_tags');
  
  			$flist = Db::name('tel_scenarios_node')->where('id', $ids)->delete();
  
  			if(!$flist){ 
  				echo "删除失败。";
  			}
  			
  	}
	

    //添加智库
    public function addThinkTank(){

    		$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
					
    	$keyword = input('keyword','','trim,strip_tags');
			$data = array();
			$data['name'] = input('name','','trim,strip_tags');
			
			$label = input('label','','trim,strip_tags');
			$scenariosId = input('sceneId','','trim,strip_tags');
			
			$data['keyword'] = $keyword;

			if ($data['keyword']){
				$py = $pinyin->sentence($data['keyword']);
				$data['keyword_py'] = $py;//str_replace(' ', '', $py);
			}

			$data['action'] = input('action','','trim,strip_tags');
			$data['action_id'] = input('actionId','','trim,strip_tags');
			$data['intention'] = input('flowNodeLevel','','trim,strip_tags');

			$data['create_time'] = time();
			$data['update_time'] = time();
			$data['scenarios_id'] = $scenariosId;
			$data['label'] = $label;
			
			$knowledgeId = input('ThinkTankId','','trim,strip_tags');

			$pausetime = input('pausetime','','trim,strip_tags');
			if($pausetime == ""){
				$pausetime = 3000;
			}

			$data['pause_time'] = $pausetime;
			
			$knlgType = input('knlgType','','trim,strip_tags');
			if($knlgType != ""){
				$data['type'] = $knlgType;
			}
			

			$delArr = input('delArr/a');
			if(is_array($delArr) && count($delArr)){
					Db::name('tel_corpus')->where('id','in', $delArr)->delete();
			}

			if($knowledgeId){
				$ret = Db::name('tel_knowledge')->where('id', $knowledgeId)->update($data);
				if($ret < 0){
					return returnAjax(1,'保存失败');
				}
				
				$content = input('content/a','','trim,strip_tags');
                if (is_array($content)) {
					foreach ($content as $key => $value) {

						$tcpus = array();
						$tcpus['content'] = $value["con"]; 
							
						if($value["id"] > 0){

							Db::name('tel_corpus')->where('id', $value["id"])->update($tcpus);

						}else{
							$tcpus['src_id'] = $knowledgeId; 
							$tcpus['src_type'] = 1; 
							$tcpus['scenarios_id'] = input('sceneId','','trim,strip_tags');
							Db::name('tel_corpus')->insertGetId($tcpus);
						}
					}
                }
				
				Db::name('tel_label')->where(array('flow_id'=>$knowledgeId, 'type'=>2))->delete();
			}
			else{
					
			 	 
				$knowledgeId = Db::name('tel_knowledge')->insertGetId($data);
				if($knowledgeId <= 0){
					return returnAjax(1,'添加失败');
				}
				
				$content = input('content/a','','trim,strip_tags');
                if (is_array($content)) {

					foreach ($content as $key => $value) {

						$tcpus = array();
						$tcpus['content'] = $value["con"];
						$tcpus['src_id'] = $knowledgeId; 
						$tcpus['src_type'] = 1; 
						$tcpus['scenarios_id'] = input('sceneId','','trim,strip_tags');
						Db::name('tel_corpus')->insertGetId($tcpus);
					}

                }
			}

			//插入标签
			if($label){

				$user_auth = session('user_auth');
				$uid = $user_auth["uid"];
				$super = $user_auth["super"];
				
				$data = array();
				$data['member_id'] = (int)$uid;
				$data['label'] = $label;
				$data['keyword'] = $label;
				$data['flow_id'] = $knowledgeId; 
				$data['scenarios_id'] = $scenariosId;
				$data['type'] = 2; 
				Db::name('tel_label')->insertGetId($data);
			

			}

			return returnAjax(0,'保存成功！');

    }

    //返回知识库列表
    public function getKnowledgeList()
    {
       
    	$Page_size = 10;
			$page = input('page','1','trim,strip_tags');
	
			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];
			$super = $user_auth["super"];
		
	    $where = array();

      $sceneId = input('sceneId','','trim,strip_tags');
      $processId = input('processId','','trim,strip_tags');
      $keyword = input('keyword','','trim,strip_tags');

			if($sceneId != ""){
    		 $where["scenarios_id"] = $sceneId;
    	}   

    	if($keyword != ""){
    		 $where["name"] = $keyword;
    	}   

    	//$where["type"] = 2;

			$list = Db::name('tel_knowledge')
			->where($where)->order('id desc')
			->page($page,$Page_size)
			->select();
		

			foreach($list as &$item){
	
	          
				if ($item['update_time'] > 0){
					$item['update_time'] = date('Y-m-d H:i:s', $item['update_time']);
				}
				else{
					$item['update_time'] = "";
				}
	
				$klist = explode(",", $item['keyword']);
				$item["knum"] = count($klist);
		
			}
			
			$cwhere = array();
	
      if($sceneId != ""){
    		 $cwhere["scenarios_id"] = $sceneId;
    	}   
    	
    	if($keyword != ""){
    		 $cwhere["name"] = $keyword;
    	}   

    	$count = Db::name('tel_knowledge')
				->where($cwhere)->count('id');

	
			$page_count = ceil($count/$Page_size);
			
			$back = array();
			$back['total'] = $count;
			$back['Nowpage'] = $page;
			$back['list'] = $list;
			$back['page'] = $page_count;
		
			return returnAjax(0,'获取数据成功',$back);
			

    }
    
     //删除知识库记录
  	public function delKnowledge(){
  		
  			$knowledgeId = input('id','','trim,strip_tags');
  
  			$flist = Db::name('tel_knowledge')->where('id', $knowledgeId)->delete();
  			
  			$sflist = Db::name('tel_corpus')->where(array('src_id'=>$knowledgeId,'src_type'=>0))->delete();
			
			$ret = Db::name('tel_label')->where(array('flow_id'=>$knowledgeId,'type'=>2))->delete();
  
  			if(!$flist && !$sflist){ 
  				echo "删除失败。";
  			}
  	}

  	//返回知识库记录信息
  	public function getKnowledgeInfo()
  	{

  		  $noteId = input('id','','trim,strip_tags');		
	
		  $result = Db::name('tel_knowledge')
				->where('id', $noteId)->find();

		
			$corpus = Db::name('tel_corpus')->field('id,content,audio')->where(array("src_id"=>$noteId,'src_type'=>1))->select();


			$result['content'] = $corpus;

		   if($result){
				return returnAjax(0,'有数据了',$result);
		   }else{
				return returnAjax(1,'暂时没有数据',$result);
		   }
  	}
	
    //上传音频文件
    public function addSound(){
		
		
		$data = array();
		if(!empty($_FILES['update-audio-file']['tmp_name'])){
		 
		 			$tmp_file = $_FILES ['update-audio-file'] ['tmp_name'];
		 			
		 			if($tmp_file){
		 				$file_types = explode ( ".", $_FILES ['update-audio-file'] ['name'] );
		 				$file_type = $file_types [count ( $file_types ) - 1];
		 
		 
		 				if (strtolower ( $file_type ) != "wav")              
		 				{
		 				  $this->error ( '不是wav文件，只能上传wav文件，重新上传' );
		 				}
		 
		 				/*以时间来命名上传的文件夹*/
		 				$datestr = date ( 'Ymd' ); 
		 
		 				$savePath = './uploads/audio/'.$datestr.'/';
		 				// 如果不存在则创建文件夹
		 				if (!is_dir($savePath)){
		 				  mkdir($savePath); 
		 				}  
		 
		 	            /*以时间来命名上传的文件*/
		 				$str = date ( 'Ymdhis' ); 
		 
		 
		 				$file_name = $str . "." . strtolower($file_type);
		 
		 				/*是否上传成功*/
		 				if (! copy ( $tmp_file, $savePath . $file_name )) 
		 				{
		 				  $this->error ( '上传失败' );
		 				}
		 
		 				$path = $savePath . $file_name;
		 				$path = ltrim($path,".");
		 
		 
		 				$data['audio'] = $path;
		 			}
		 			
		}
		
			$sid = input('sid','','trim,strip_tags');
			$result = Db::name('tel_corpus')->where('id', $sid)->update($data);
			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];

		
			if ($result >= 0){
				return returnAjax(0,'成功',$data['audio']);
			}
			else{
				return returnAjax(1,'失败',$result);
			}
			
		
 
	}
	
    
    //复制话术
  	public function copyScene()
  	{

  		  $targetObj = input('targetObj','','trim,strip_tags');	

  		  $newSName = input('newSName','','trim,strip_tags');

  		  $user_auth = session('user_auth');
				$uid = $user_auth["uid"];
				$super = $user_auth["super"];

		  //复制话术

	      $scenarios = Db::name('tel_scenarios')
				   ->field('name,member_id,type,is_tpl,status,break,auditing')
	  			   ->where('id',$targetObj)->find();

			$tscen = array();
			$tscen['name'] = $newSName;
			$tscen['member_id'] = $scenarios["member_id"];
			$tscen["type"] = $scenarios["type"];
			$tscen['is_tpl'] = $scenarios["is_tpl"];
			$tscen['status'] = $scenarios["status"];
			$tscen['break'] = $scenarios["break"];
			$tscen['auditing'] = $scenarios["auditing"];
			$tscen['update_time'] = time();
			$newId = Db::name('tel_scenarios')->insertGetId($tscen);

    
                     //复制流程节点与流程
         $result = Db::name('tel_scenarios_node')->field('id,name,sort')->where('scenarios_id', $targetObj)->select();	

            $tsarray = array();  //新流程节点的键值对
	        foreach ($result as $key => $value) {

				$tsdata = array();
				$tsdata['scenarios_id'] = $newId;
				$tsdata['name'] = $value["name"];
				$tsdata['sort'] = $value["sort"];
				$TRresult = Db::name('tel_scenarios_node')->insertGetId($tsdata);
				$tsarray[$value["id"]] = $TRresult; 

				$flowList = Db::name('tel_flow_node')->where('scen_node_id', $value['id'])->order("pid asc")->select();

				//\think\Log::record('flowList='.json_encode($flowList));

				//复制 tel_flow_node 表的数据，返回新的Id，把id （按旧Id =》新Id）键值对的形式保存
				$newfnlist = array();	
				foreach ($flowList as $fnkey => $fnval) {

					$fndata = array();
					$fndata['scenarios_id'] = $newId;
					$fndata['scen_node_id'] = $TRresult;
					$fndata['name'] = $fnval["name"];
					$fndata['break'] = $fnval["break"];
					$fndata['type'] = $fnval["type"];
					$fndata['position'] = $fnval["position"];
					if($fnval["pid"] == 0){
					 $fndata['pid'] = 0;  //pid变了
					}
					$fndata['action'] = $fnval["action"];
					$fndata['action_id'] = $fnval["action_id"];
					$fndata['flow_label'] = $fnval["flow_label"];

					
					$fnresult = Db::name('tel_flow_node')->insertGetId($fndata);
					$newfnlist[$fnval["id"]] = $fnresult; 

					if($fnval["type"] == 0){

						$label = Db::name('tel_label')->where(array('flow_id'=>$fnval["id"],'type'=>1))->find();	

						$insertlabel = array();
						$insertlabel['flow_id'] = $fnresult;
						$insertlabel['type'] = $label["type"];  
						$insertlabel['member_id'] = $label["member_id"];
						$insertlabel['scenarios_id'] = $newId;
						$insertlabel['label'] = $label["label"];  
						Db::name('tel_label')->insertGetId($insertlabel);

					}



				}

					 //更新tel_flow_node 表的pid数据
				foreach ($newfnlist as $nkey => $nval) {

				    $data = array();

					foreach ($flowList as $okey => $oval) {
						if($oval["id"] == $nkey){

							if($oval["pid"] > 0){
								$data['pid'] = $newfnlist[$oval["pid"]];//pid变了
							}else{
								$data['pid'] = 0;
							}

						}

					}

				  
				   $result = Db::name('tel_flow_node')->where('id', $nval)->update($data);

				}

				//复制tel_flow_branch表的数据
				foreach ($flowList as $fbkey => $fbval) {

					//复制rk_tel_corpus表的数据
					 $res = Db::name('tel_corpus')->field('content,audio')
						->where(array("src_id"=>$fbval["id"],'src_type'=>0))
						->find();

					 $itemcs = array();
					 $itemcs['scenarios_id'] = $newId;
					 $itemcs['src_type'] = 0;
					 $itemcs['src_id'] = $newfnlist[$fbval["id"]];
					 $itemcs['content'] = $res["content"];
					 $itemcs['audio'] = $res["audio"];
					 $csresult = Db::name('tel_corpus')->insertGetId($itemcs);
					
				
					//复制tel_flow_branch表的数据
					$fbList = Db::name('tel_flow_branch')->where('flow_id', $fbval['id'])->order("id asc")->select();
					//\think\Log::record('fbList='.json_encode($fbList));
					foreach ($fbList as $itemfb => $vfb) {

					 $fbdata = array();
					 $fbdata['flow_id'] = $newfnlist[$vfb["flow_id"]];
					 $fbdata['name'] = $vfb["name"];
					 $fbdata['keyword'] = $vfb["keyword"];
					 $fbdata['keyword_py'] = $vfb["keyword_py"];
					 if(!empty($vfb["next_flow_id"])){
					 	if(!empty($newfnlist[$vfb["next_flow_id"]])){
					 		 $fbdata['next_flow_id'] = $newfnlist[$vfb["next_flow_id"]];	
					 	}
					 }
					 $fbdata['is_select'] = $vfb["is_select"];
					 $fbdata['type'] = $vfb["type"];
					//	\think\Log::record('fbdata='.json_encode($fbdata));
					 $snresult = Db::name('tel_flow_branch')->insertGetId($fbdata);
						// \think\Log::record('snresult='.$snresult);

					}
								

				}


						
				
	        }

                 //更新tel_flow_node 表的 action_id 数据
	         foreach ($tsarray as $ntskey => $ntsvalue) {

	         		$nflowList = Db::name('tel_flow_node')->where('scen_node_id', $ntsvalue)->order("pid asc")->select();

	         		
					foreach ($nflowList as $okey => $oval) {
					           
							if($oval["type"] == 1 && $oval["action"] == 2 && $oval["action_id"]){
							    $data = array();
								$data['action_id'] = $tsarray[$oval["action_id"]];//action_id变了
							    $result = Db::name('tel_flow_node')->where('id', $oval["id"])->update($data);

							}

					}
					



	         }




				         //复制知识库
				        $tfnw = array();
						$tfnw['scenarios_id'] = $targetObj;
								

						$knresult = Db::name('tel_knowledge')
						 ->field('id,scenarios_id,name,type,keyword,keyword_py,action,action_id,intention')
						 ->where($tfnw)
						 ->select();

						//复制 tel_knowledge 表的数据，返回新的Id，把id （按旧Id =》新Id）键值对的形式保存
						//$newknowlist = array();	

						foreach ($knresult as $knkey => $knval) {

							$kndata = array();
							$kndata['scenarios_id'] = $newId;
							$kndata['name'] = $knval["name"];
							$kndata['type'] = $knval["type"];
							$kndata['keyword'] = $knval["keyword"];
							$kndata['keyword_py'] = $knval["keyword_py"];
							$kndata['action'] = $knval["action"];
							$kndata['action_id'] = $knval["action_id"];
							if($knval["action"] == 2){
								$kndata['action_id'] = $tsarray[$knval["action_id"]];//action_id变了
							}
							
							$kndata['intention'] = $knval["intention"];
								
							$knNewRes = Db::name('tel_knowledge')->insertGetId($kndata);

							//$newknowlist[$knval["id"]] = $knNewRes; 

							$res = Db::name('tel_corpus')->field('content,audio')
									->where(array("src_id"=>$knval["id"],'src_type'=>1))
									->select();

							$temp = array();
							foreach ($res as $rkey => $rval) {
								 $tempcs = array();
								 $tempcs['src_id'] = $knNewRes;
								 $tempcs['content'] = $rval["content"];
								 $tempcs['src_type'] = 1;
								 $tempcs['audio'] = $rval["audio"];
								 $tempcs['scenarios_id'] = $newId;
								 array_push($temp,$tempcs);
							}	
							$csresult = Db::name('tel_corpus')->insertAll($temp);	 

							//插入问答标签
							$label = Db::name('tel_label')->where(array('flow_id'=>$fnval["id"],'type'=>2))->find();
							$insertlabel = array();
							$insertlabel['flow_id'] = $knNewRes;
							$insertlabel['type'] = $label["type"];  
							$insertlabel['scenarios_id'] = $newId;
							$insertlabel['member_id'] = $label["member_id"];
							$insertlabel['label'] = $label["label"];  
							Db::name('tel_label')->insertGetId($insertlabel);
						}


				
       



		         //复制意向标签
		        $tirres = Db::name('tel_intention_rule')
				        ->field('name,level,type,rule,sort,status')
				        ->where('scenarios_id', $targetObj)
				        ->select();	
		        $ruletemp = array();
		        foreach ($tirres as $key => $value) {

						$tsdata = array();
						$tsdata['scenarios_id'] = $newId;
						$tsdata['name'] = $value["name"];
						$tsdata['level'] = $value["level"];
						$tsdata['type'] = $value["type"];
						$tsdata['rule'] = $value["rule"];
						$tsdata['sort'] = $value["sort"];
						$tsdata['status'] = $value["status"];
						$tsdata['create_time'] = time();
						$tsdata['update_time'] = time();

						array_push($ruletemp,$tsdata);

		        }
		        $TRresult = Db::name('tel_intention_rule')->insertAll($ruletemp);

     

				 if($newId){
					return returnAjax(0,'有数据了',$newId);
				 }else{
					return returnAjax(1,'暂时没有数据');
				 }


  	}
    
    
     //测试画图的
  	public function drawingImg($value='')
  	{
  			
		return $this->fetch();
		
  	}

  	//测试画图的
  	public function graph()
  	{
  			
		return $this->fetch();
		
  	}

    public function noteList($value='')
    {
    	$sceneId = input('sceneId','','trim,strip_tags');	

    	$tfnw = array();
		$tfnw['scen_node_id'] = $sceneId;
		$tfnw['type'] = [['=',0],['=',1],"or"];

	 	 $result = Db::name('tel_flow_node')
		 	 ->field('id,scen_node_id,name,break,type,position,pid,action,action_id')
		 	 ->where($tfnw)->order("pid asc")
		 	 ->select();

	 	  foreach ($result as $key => $value) {
         
	           if($value['position']){

		           	$position = explode(",", $value['position']);

		           	if(count($position) > 1){
		           		$result[$key]['top'] = $position[0];
			 	     	$result[$key]['left'] = $position[1];
		           	}else{
		           		$result[$key]['top'] = $position[0];
		           		$result[$key]['left'] = 0;
		           	}
			 	  
	           }

	          $res = Db::name('tel_corpus')->field('id,content')->where(array('src_id'=>$value['id'],'src_type'=>0))->find();
	          $result[$key]['content'] = $res["content"];
	          $result[$key]['tc_id'] = $res["id"];

	          $result[$key]['key'] ="node".$value['id'];
	          if($value['type'] == 1){

	          	   $result[$key]['type'] ="WorkTime";
	          	   if($value['action'] == 2){
	          	    $ress = Db::name('tel_scenarios_node')->field('scenarios_id,name')->where('id', $value['action_id'])->find();
	          	    $result[$key]['next_id'] = $value['action_id'];
	          	    $result[$key]['next_name'] = $ress["name"];
	          	   }else{
	          	  
		          	   	switch ($value['action']) {
							case 4:
								$result[$key]['next_name'] = "挂机";
								break;
					
							case 1:
								$result[$key]['next_name'] = "下一场景节点";
								break;
					
							case 3:
								$result[$key]['next_name'] = "返回当前场景节点中的话术";
								break;
							case 0:
								$result[$key]['next_name'] = "等待用户响应";
								break;	
					
							default:
								$result[$key]['next_name'] = "指定场景节点";
						}

	          	   }
	          	    	
	          }else{
	          	  $result[$key]['type'] ="Menu"; 
	          }
			

	          $where = array();
			  $where['flow_id'] = $value['id'];
			  $where['is_select'] = 1;

	          $return = Db::name('tel_flow_branch')->where($where)->order("id asc")->select();

	          foreach ($return as $kk => $val) {
	          //	$return[$kk]['key'] = $val['id'];
	          	$return[$kk]['nextNode'] = "node-".$val['next_flow_id'];
	          }

		 	  $result[$key]['data']['choices'] = $return;

	 	  } 

    	  if($sceneId){
				return returnAjax(0,'有数据了',$result);
		   }else{
				return returnAjax(1,'暂时没有数据');
		   }
    }



    //添加节点
    public function telflowNode()
    {
    	$top = input('top','','trim,strip_tags');	
    	$left = input('left','','trim,strip_tags');	
    	$otherset = input('otherset','','trim,strip_tags');	
    	$custnode = input('custnode/a','','trim,strip_tags');	
    	$fixed = input('fixed/a','','trim,strip_tags');	
    	$AIStechnique = input('AIStechnique','','trim,strip_tags');	
    	$cNodeName = input('cNodeName','','trim,strip_tags');	
    	$sceneId = input('sceneId','','trim,strip_tags');	
    	$nowProcessId = input('nowProcessId','','trim,strip_tags');	
    	$type = input('type','0','trim,strip_tags');	

        $action = input('action','','trim,strip_tags');	
    	$actionId = input('actionId','','trim,strip_tags');	

    	$nodeLabel = input('nodeLabel','','trim,strip_tags');
		$pauseTime = input('pauseTime','3000','trim,strip_tags');
		$eightval = input('eightval','','trim,strip_tags');
    
		$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
		
		$back = array(); //返回的数组

        $data = array();
        $data['scen_node_id'] = $nowProcessId;		
		$data['name'] = $cNodeName;
		$data['break'] = $otherset;
		$data['type'] = $type;
		$data['last_time'] = time();
		$data['scenarios_id'] = $sceneId;
		$data['position'] = $top.",".$left;
		$data['action'] = $action;
		$data['action_id'] = $actionId;
		$data['flow_label'] = $nodeLabel;
		
		if($pauseTime == ""){
			$pauseTime = 3000; 
		}
		$data['pause_time'] = $pauseTime;


		$data['no_speak_knowledge_id'] = $eightval;

		$result = Db::name('tel_flow_node')->insertGetId($data);

		$back["fnode"] = $result;

		//插入标签
		if($nodeLabel && $result){

			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];
			$super = $user_auth["super"];
			
			$Label = array();
			$Label['member_id'] = (int)$uid;
			$Label['label'] = $nodeLabel;
			$Label['keyword'] = $nodeLabel;
			$Label['flow_id'] = $result; 
			$Label['scenarios_id'] = $sceneId;
			$Label['type'] = 1; 
			Db::name('tel_label')->insertGetId($Label);

		}	


		if ($AIStechnique && $result){
			$tcpus = array();
			$tcpus['content'] = $AIStechnique;
			$tcpus['src_id'] = $result; 
			$tcpus['src_type'] = 0; 
			$tcpus['scenarios_id'] = $sceneId;//input('sceneId','','trim,strip_tags');
			$return = Db::name('tel_corpus')->insertGetId($tcpus); 
			$back["tcorpus"] = $return;
		}

	

	    $tfbranch = array(); 

		if ($result && ($type == 0)) {
			if (is_array($custnode)){
				foreach ($custnode as $key => $value) {

					$flowbr = array();
					$flowbr['flow_id'] = $result; 
					$flowbr['name'] = $value["tempName"];
					$flowbr['keyword'] = $value["tempKW"];
					if ($value['tempKW']){
						$py = $pinyin->sentence($value['tempKW']);
						$flowbr['keyword_py'] = $py;//str_replace(' ', '', $py);
					}
					$flowbr['is_select'] = $value["is_select"];
					$flowbr['type'] = 0;
					$tes = Db::name('tel_flow_branch')->insertGetId($flowbr);

					array_push($tfbranch,$tes);
				}
			}

	
			foreach ($fixed as $fkey => $fvalue) {

				$flowbr = array();
				$flowbr['flow_id'] = $result; 
				$flowbr['name'] = $fvalue["name"];
				$flowbr['keyword'] = $fvalue["keyword"];
				if ($fvalue['keyword']){
				 	$py = $pinyin->sentence($fvalue['keyword']);
				 	$flowbr['keyword_py'] = $py;//str_replace(' ', '', $py);
			    }
				$flowbr['is_select'] = $fvalue["is_select"];
				$flowbr['type'] = $fvalue["sort"];

				$res = Db::name('tel_flow_branch')->insertGetId($flowbr);

				array_push($tfbranch,$res);
			}


		}

	    $back["tfbranch"] = $tfbranch;


		if($result){
			return returnAjax(0,'有数据了',$back);
	    }else{
			return returnAjax(1,'暂时没有数据');
	    }


    }
     
     //编辑普通节点 
    public function editflowNode()
    {
    	$top = input('top','','trim,strip_tags');	
    	$left = input('left','','trim,strip_tags');	
    	$otherset = input('otherset','','trim,strip_tags');	
    	$custnode = input('custnode/a','','trim,strip_tags');	
    	$fixed = input('fixed/a','','trim,strip_tags');	
    	$AIStechnique = input('AIStechnique','','trim,strip_tags');	
    	$cNodeName = input('cNodeName','','trim,strip_tags');	
    	$sceneId = input('sceneId','','trim,strip_tags');	
    	$nowProcessId = input('nowProcessId','','trim,strip_tags');	
    	$type = input('type','0','trim,strip_tags');	

        $delNode = input('delNode/a','','trim,strip_tags');	
    	$tcId = input('tc_id','','trim,strip_tags');
    	$nodeId = input('nodeId','','trim,strip_tags');	

    	$nodeLabel = input('nodeLabel','','trim,strip_tags');
        $pauseTime = input('pauseTime','3000','trim,strip_tags');
        $eightval = input('eightval','','trim,strip_tags');
    
		$pinyin = new Pinyin('Overtrue\Pinyin\MemoryFileDictLoader');
		
		$back = array(); //返回的数组

        $data = array();
		$data['name'] = $cNodeName;
		$data['break'] = $otherset;
		$data['position'] = $top.",".$left;
		$data['flow_label'] = $nodeLabel;
		if($pauseTime == ""){
			$pauseTime = 3000;
		}
		$data['pause_time'] = $pauseTime;
		$data['no_speak_knowledge_id'] = $eightval;

		$result = Db::name('tel_flow_node')->where('id', $nodeId)->update($data);
		$back["fnode"] = $result;
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];
			//插入标签
		if($nodeLabel && $nodeId){

			$Label = array();
			$Label['label'] = $nodeLabel;
			$Label['keyword'] = $nodeLabel;
			$Label['scenarios_id'] = $sceneId;
			$Label['type'] = 1;
			$label = Db::name('tel_label')->field('id')->where(array('flow_id'=>$nodeId,'type'=>1))->find();
            if($label){
				Db::name('tel_label')->where('id', $label["id"])->update($Label);
            }
			else{
				$Label['member_id'] = $uid;
				$Label['flow_id'] = $nodeId;
				$ret = Db::name('tel_label')->insertGetId($Label); 
			}
		}	

		$tcpus = array();
		$tcpus['content'] = $AIStechnique;

		if($tcId){
			$return = Db::name('tel_corpus')->where('id', $tcId)->update($tcpus); 
		}else{
			$tcpus['src_id'] = $nodeId; 
			$tcpus['scenarios_id'] = $sceneId;
			$tcpus['src_type'] = 0;
			$return = Db::name('tel_corpus')->insertGetId($tcpus); 
		}

		$back["tcorpus"] = $return;

	    $tfbranch = array(); 

		if(is_array($custnode) && count($custnode)){

			foreach ($custnode as $key => $value) {

				$flowbr = array();
				$flowbr['flow_id'] = $nodeId; 
				$flowbr['name'] = $value["tempName"];
				$flowbr['keyword'] = $value["tempKW"];
				if ($value['tempKW']){
				 	$py = $pinyin->sentence($value['tempKW']);
				 	$flowbr['keyword_py'] = $py;//str_replace(' ', '', $py);
			    }

				$flowbr['is_select'] = $value["is_select"];
				if(!$value["is_select"]){
					$flowbr['next_flow_id'] = null;
				}

				$flowbr['type'] = 0;

				if($value["branchId"]){  
                   $tes = Db::name('tel_flow_branch')->where('id', $value["branchId"])->update($flowbr); 
				}else{
					$tes = Db::name('tel_flow_branch')->insertGetId($flowbr);
				}
				

				array_push($tfbranch,$tes);
			}

		}

		if(is_array($fixed) && count($fixed)){
			foreach ($fixed as $fkey => $fvalue) {

				$flowbr = array();
				$flowbr['flow_id'] = $nodeId; 
				$flowbr['name'] = $fvalue["name"];
				$flowbr['keyword'] = $fvalue["keyword"];
				if ($fvalue['keyword']){
				 	$py = $pinyin->sentence($fvalue['keyword']);
				 	$flowbr['keyword_py'] = $py;//str_replace(' ', '', $py);
			    }
				$flowbr['is_select'] = $fvalue["is_select"];
				$flowbr['type'] = $fvalue["sort"];

				if(!$fvalue["is_select"]){
					$flowbr['next_flow_id'] = null;
				}

				if($fvalue["id"]){  
                   $res = Db::name('tel_flow_branch')->where('id', $fvalue["id"])->update($flowbr); 
				}else{
				   $res = Db::name('tel_flow_branch')->insertGetId($flowbr);
				}
				
				array_push($tfbranch,$res);
			}


		}
	
	
	    if(is_array($delNode) && count($delNode)){
	    	$ret = Db::name('tel_flow_branch')->where('id','in', $delNode)->delete();
	    }
				  

	    $back["tfbranch"] = $tfbranch;
	    $back["fnode"] = $nodeId;


		if($result >=0){
			return returnAjax(0,'有数据了',$back);
	    }else{
			return returnAjax(1,'更新失败');
	    }


    }


         //编辑跳转节点 
    public function editJNode()
    {
    	$top = input('top','','trim,strip_tags');	
    	$left = input('left','','trim,strip_tags');	
    	
    	$AIStechnique = input('AIStechnique','','trim,strip_tags');	
    	$cNodeName = input('cNodeName','','trim,strip_tags');	
    	$sceneId = input('sceneId','','trim,strip_tags');	
    	$nowProcessId = input('nowProcessId','','trim,strip_tags');	
    	$type = input('type','0','trim,strip_tags');	

    	$action = input('action','','trim,strip_tags');	
    	$actionId = input('actionId','','trim,strip_tags');	
	
    	$tcId = input('tc_id','','trim,strip_tags');
    	$nodeId = input('nodeId','','trim,strip_tags');	
        $pauseTime = input('pauseTime','3000','trim,strip_tags');
	
		$back = array(); //返回的数组

        $data = array();
		$data['name'] = $cNodeName;
		$data['position'] = $top.",".$left;

		$data['action'] = $action;
		$data['action_id'] = $actionId;
		
		if($pauseTime == ""){
			$pauseTime = 3000;
		}
		$data['pause_time'] = $pauseTime;
	
		$result = Db::name('tel_flow_node')->where('id', $nodeId)->update($data);
		$back["fnode"] = $result;

		$tcpus = array();
		$tcpus['content'] = $AIStechnique;
		if($tcId){
			$return = Db::name('tel_corpus')->where('id', $tcId)->update($tcpus); 
		}else{
			$tcpus['src_id'] = $nodeId; 
			$tcpus['scenarios_id'] = $sceneId;
			$tcpus['src_type'] = 0;
			$return = Db::name('tel_corpus')->insertGetId($tcpus); 
		}
		
		$back["tcorpus"] = $return;
		$back["fnode"] = $nodeId;


		if($result >=0 || $return >=0){
			return returnAjax(0,'有数据了',$back);
	  }else{
			return returnAjax(1,'更新失败');
	  }
 

    }
   


    //获取节点信息
    public function getFnodeInfo()
    {
    	
        $flowId = input('fId','','trim,strip_tags');	

    	$tfnw = array();
		$tfnw['id'] = $flowId;

	 	$result = Db::name('tel_flow_node')->field('name,break,action,action_id,flow_label,pause_time,no_speak_knowledge_id')->where($tfnw)->find();

	 	$res = Db::name('tel_corpus')->field('id,content')->where(array('src_id'=>$flowId,'src_type'=>0))->find();

        $result['content'] = $res["content"];
        $result['tc_id'] = $res["id"];

		$where = array();
		$where['flow_id'] = $flowId;

        $return = Db::name('tel_flow_branch')->where($where)->order("id asc")->select();

        $result['returns'] = $return;

       
		if($result){
			return returnAjax(0,'获取数据成功',$result);
		}else{
			return returnAjax(1,'暂时没有数据',$result);
		}

    }


     //保存全部的流程节点
    public function saveAllNode()
    {

    	$sceneId = input('sceneId','','trim,strip_tags');	
    	$processId = input('nowProcessId','','trim,strip_tags');	
    	$NodeList = input('NodeList/a','','trim,strip_tags');	

		if(is_array($NodeList) && count($NodeList)){

			foreach ($NodeList as $nkey => $nval) {

				if ($nval['isDelete'] == 1) {
					if($nval["id"] > 0){
						 $tfnres = Db::name('tel_flow_node')->where('id', $nval["id"])->delete();
						 $tcresult = Db::name('tel_corpus')->where(array('src_id'=>$nval["id"],'src_type'=>0))->delete();
						 $tfbresult = Db::name('tel_flow_branch')->where('flow_id', $nval["id"])->delete();
						 Db::name('tel_label')->where(array('flow_id'=>$nval["id"],'type'=>1))->delete();
					}
					
				}
				else{

						$flow = array();
						$flow['scenarios_id'] = $sceneId; 
						$flow['scen_node_id'] = $processId; 

						if($nval["pid"] > 0){
							$flow['pid'] = $nval["pid"]; 
						}

						if(isset($nval["top"]) && isset($nval["left"])){
						  $flow['position'] = $nval["top"].",".$nval["left"];	
						}
						

						if($nval["id"] > 0){
		                  $result = Db::name('tel_flow_node')->where('id', $nval["id"])->update($flow);
						}

						if($nval["type"] == 'Menu' && count($nval["thumb"]) && $nval["id"] > 0){

							   foreach ($nval["thumb"] as $tkey => $tval) {

							   	    $flowbr = array();
									$flowbr['flow_id'] = $nval["id"] ; 
									$flowbr['name'] = $tval["name"];
									if($tval["nextNodeId"]){
										$flowbr['next_flow_id'] = $tval["nextNodeId"];
									}else{
										$flowbr['next_flow_id'] = null;
									}
									
									if($tval["id"] > 0){
					                  $res = Db::name('tel_flow_branch')->where('id', $tval["id"])->update($flowbr);
									}

							   }

						}
		  
				}

			}

		}

       
		if(count($NodeList)){
			return returnAjax(0,'编辑成功');
		}else{
			return returnAjax(1,'编辑失败');
		}



    }


    //返回单个节点的数据
    public function backSingle()
    {
    	$sceneId = input('sceneId','','trim,strip_tags');	
    	$processId = input('nowProcessId','','trim,strip_tags');	
    	$fnodeId = input('nodeId','','trim,strip_tags');

  
    	$tfnw = array();
		$tfnw['scen_node_id'] = $processId;
		$tfnw['type'] = [['=',0],['=',1],"or"];
		$tfnw['id'] = $fnodeId;

	 	$result = Db::name('tel_flow_node')
		 	 ->field('id,scen_node_id,name,break,type,position,pid,action,action_id')
		 	 ->where($tfnw)->find();

         
        if($result['position']){

           	$position = explode(",", $result['position']);

           	if(count($position) > 1){
           		$result['top'] = $position[0];
	 	     	$result['left'] = $position[1];
           	}else if(count($position) == 1){
           		$result['top'] = $position[0];
           		$result['left'] = 0;
           	}else{
           		$result['top'] = 0;
           		$result['left'] = 0;
           	}
	 	  
        }

	      $res = Db::name('tel_corpus')->field('id,content')->where(array('src_id'=>$result['id'],'src_type'=>0))->find();
	      if($res){
	      	    $result['content'] = $res["content"];
	            $result['tc_id'] = $res["id"];
	      }
	  
	          $result['key'] ="node".$result['id'];
	          if($result['type'] == 1){

	          	   $result['type'] ="WorkTime";
	          	   if($result['action'] == 2){
		          	    $ress = Db::name('tel_scenarios_node')->field('scenarios_id,name')->where('id', $result['action_id'])->find();
		          	    $result['next_id'] = $result['action_id'];
		          	    $result['next_name'] = $ress["name"];
	          	   }else{
	          	  
		          	   	switch ($result['action']) {
							case 4:
								$result['next_name'] = "挂机";
								break;
							case 1:
								$result['next_name'] = "下一场景节点";
								break;
					
							case 3:
								$result['next_name'] = "返回当前场景节点中的话术";
								break;
							case 0:
								$result['next_name'] = "等待用户响应";
								break;	
					
							default:
								$result['next_name'] = "指定场景节点";
						}

	          	   }
	          	    	
	          }else{
	          	  $result['type'] ="Menu"; 
	          }
			

	          $where = array();
			  $where['flow_id'] = $result['id'];
			   $where['is_select'] = 1;

	          $return = Db::name('tel_flow_branch')->where($where)->order("id asc")->select();

	          foreach ($return as $kk => $val) {
	          	$return[$kk]['nextNode'] = "node-".$val['next_flow_id'];
	          }

		 	  $result['data']['choices'] = $return;

           	return returnAjax(0,'获取数据成功',$result);

    }
     
     //获取流程节点默认答法的
    public function defaultMt()
    {
         
        // 0 普通 1业务问题 2肯定3 否定 4拒绝 5中性  6 未识别 7重复 8用户未说话 9无法回答 10 无法回答次数 
	    $sceneId = input('sceneId','','trim,strip_tags');	
    	$processId = input('processId','','trim,strip_tags');	

		$typeList = [2, 3, 4, 5, 6];

    	$where = array();
		$where['scenarios_id'] = $sceneId;


		$result = Db::name('tel_knowledge')
		         ->field('id,name,type,keyword')
		         ->where($where)->where('type','in', $typeList)->select();

		if(count($result)){
			return returnAjax(0,'有数据了',$result);
	    }else{
			return returnAjax(1,'暂时没有数据');
	    }

    }



      //返回录音流程记录信息
  	public function getsflowInfo()
  	{

  		     $noteId = input('id','','trim,strip_tags');		
		 	 $result = Db::name('tel_flow_node')->field('name')->where("id", $noteId)->find();
			 $corpus = Db::name('tel_corpus')->field('id,content,audio')->where(array("src_id"=>$noteId,'src_type'=>0))->select();

			 $result['content'] = $corpus;
		     if($result){
				return returnAjax(0,'有数据了',$result);
		     }else{
				return returnAjax(1,'暂时没有数据',$result);
		     }
  	}
	

	    //上传音频文件
    public function addNodeSound(){
		
		$data = array();
		if(!empty($_FILES['update-audio-file']['tmp_name'])){
 
 			$tmp_file = $_FILES ['update-audio-file'] ['tmp_name'];
 			
 			if($tmp_file){
 				$file_types = explode ( ".", $_FILES ['update-audio-file'] ['name'] );
 				$file_type = $file_types [count ( $file_types ) - 1];
 
 
 				if (strtolower ( $file_type ) != "wav")              
 				{
 				  $this->error ( '不是wav文件，只能上传wav文件，重新上传' );
 				}
 
 				/*以时间来命名上传的文件夹*/
 				$datestr = date ( 'Ymd' ); 
 
 				$savePath = './uploads/audio/'.$datestr.'/';
 				// 如果不存在则创建文件夹
 				if (!is_dir($savePath)){
 				  mkdir($savePath); 
 				}  
 
 	            /*以时间来命名上传的文件*/
 				$str = date ( 'Ymdhis' ); 
 
 
 				$file_name = $str . "." . strtolower($file_type);
 
 				/*是否上传成功*/
 				if (! copy ( $tmp_file, $savePath . $file_name )) 
 				{
 				  $this->error ( '上传失败' );
 				}
 
 				$path = $savePath . $file_name;
 				$path = ltrim($path,".");
 
 
 				$data['audio'] = $path;
 			}
		 			
		}
		
		$sid = input('sid','','trim,strip_tags');
		$result = Db::name('tel_corpus')->where('id', $sid)->update($data);
		$user_auth = session('user_auth');
		$uid = $user_auth["uid"];

		if ($result >= 0){
			return returnAjax(0,'成功',$data['audio']);
		}
		else{
			return returnAjax(1,'失败',$result);
		}

	}
	

	 //导出话术
	public function exportexcel(){

		$sceneId = input('sceneId','','trim,strip_tags');

		//导出话术
		$scenarios = Db::name('tel_scenarios')->where('id',$sceneId)->find();

		if (!$scenarios) {
			return returnAjax(1,'暂时没有数据');
		}


		//复制流程节点与流程
    $result = Db::name('tel_scenarios_node')->where('scenarios_id', $sceneId)->select();	

    if (is_array($result) && count($result) < 0) {
			return returnAjax(1,'暂时没有数据');
		}


	
		$obpe = new \PHPExcel();
		/* @func 设置文档基本属性 */
		$obpe_pro = $obpe->getProperties();
		$obpe_pro->setCreator('midoks')//设置创建者
				->setLastModifiedBy(date('Y-m-d H:i:s', time()))//设置时间
				->setTitle('data')//设置标题
				->setSubject('beizhu')//设置备注
				->setDescription('miaoshu')//设置描述
				->setKeywords('keyword')//设置关键字 | 标记
				->setCategory('catagory');//设置类别

		$obpe->setactivesheetindex(0);
		//写入多行数据
		

		//excel的列 这么多够用了吧？不够自个加 AA AB AC ……
	    $letter = [
	        'A','B','C','D','E','F','G','H','I','J','K','L','M',
	        'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
	    ];

	    $PHPSheet = $obpe->getactivesheet();

	    //把列名写入第1行 A1 B1 C1 ...
	    $i = 0;
	   	foreach($scenarios as $key=>$val){
	        //$letter[$i]1 = A1 B1 C1  $letter[$i] = 列1 列2 列3

	        $PHPSheet->setCellValue($letter[$i]."1",$key);

	        $PHPSheet->setCellValue($letter[$i]."2",$val);

	        $i = $i+1;
	    }

		//创建一个新的工作空间(sheet)
		$obpe->createSheet();
		$obpe->setactivesheetindex(1);
		$PHPSheet = $obpe->getactivesheet();
		
		$k = 0;
		//写入多行数据
		foreach($result as $kk=>$vv){

		 	//array_values 把一维数组的键转为0 1 2 3 ..

		 	$j = 0;
	        foreach ($vv as $key2 => $val2) {

	        	if($k == 0){
  					$PHPSheet->setCellValue($letter[$j].($k+1),$key2);
	        	}

	            $PHPSheet->setCellValue($letter[$j].($k+2),$val2);

	            $j = $j+1;
	        }

	        $k = $k+1;

		}


		$flowList = Db::name('tel_flow_node')->where('scenarios_id', $sceneId)->order("pid asc")->select();

		$corpus = array(); 
		$branch = array();
		$labelarr = array(); 


		/*设置上传路径*/
		$savePath = './uploads/download/';
		//$savePath = './uploads/download/'.uniqid().'/';
		// 如果不存在则创建文件夹
		if (!is_dir($savePath)){
			mkdir($savePath); 
		} 

		$pathList = array();  
				

		$f = 0;
		//创建一个新的工作空间(sheet)
		$obpe->createSheet();
		$obpe->setactivesheetindex(2);
		$PHPSheet = $obpe->getactivesheet();

		foreach ($flowList as $fbkey => $fbval) {

			//复制rk_tel_corpus表的数据
			$res = Db::name('tel_corpus')->where(array("src_id"=>$fbval["id"],'src_type'=>0))->find();
			if($res){
				array_push($corpus, $res);
			}

			//复制tel_flow_branch表的数据
			$fbList = Db::name('tel_flow_branch')->where('flow_id', $fbval['id'])->order("id asc")->select();
			if($fbList){

				foreach ($fbList as $fbkey => $fbvalue) {

					if($fbvalue){
						array_push($branch, $fbvalue);
					}
				
				}
			
			}

			$a = 0;
      foreach ($fbval as $key3 => $val3) {

      	if($f == 0){
				$PHPSheet->setCellValue($letter[$a].($f+1),$key3);
      	}

          $PHPSheet->setCellValue($letter[$a].($f+2),$val3);

          $a = $a+1;
      }

      $f = $f+1;

			if($fbval["type"] == 0){

				$label = Db::name('tel_label')->where(array('flow_id'=>$fbval["id"],'type'=>1))->find();	
				if($label){
					array_push($labelarr, $label);
				}

			}

		}

		$fc = 0;
		//创建一个新的工作空间(sheet)
		$obpe->createSheet();
		$obpe->setactivesheetindex(3);
		$PHPSheet = $obpe->getactivesheet();

		foreach ($corpus as $ckey => $cval) {
	
			$ac = 0;
      foreach ($cval as $key4 => $val4) {

      	if($fc == 0){
					$PHPSheet->setCellValue($letter[$ac].($fc+1),$key4);
      	}

        $PHPSheet->setCellValue($letter[$ac].($fc+2),$val4);


       

        	if($key4 == 'audio' && $val4){
        			$source = ltrim($val4,'/');

        			

        		   if(file_exists($source)){
        		   	
        		   	array_push($pathList, $source);
        
	    //             $temp = explode("/", $val4);
	    //             $long = count($temp);

					// $dest = $savePath.$temp[$long - 1];
	    //             copy($source,$dest);

	            }

        	}

          $ac = $ac+1;
      }

	        $fc = $fc+1;

		}


	    $lb = 0;
		//创建一个新的工作空间(sheet)
		$obpe->createSheet();
		$obpe->setactivesheetindex(4);
		$PHPSheet = $obpe->getactivesheet();

		// \think\Log::record('labelarr='.json_encode($labelarr));
		Log::info('------4------');
		Log::info(json_encode($labelarr));
		foreach ($labelarr as $lbkey => $lbval) {
	
			$abc = 0;
	        foreach ($lbval as $keyb => $valb) {

	        	if($lb == 0){
  					$PHPSheet->setCellValue($letter[$abc].($lb+1),$keyb);
	        	}

	            $PHPSheet->setCellValue($letter[$abc].($lb+2),$valb);

	            $abc = $abc+1;
	        }

	        $lb = $lb+1;

		}


		$fb = 0;
		//创建一个新的工作空间(sheet)
		
		$obpe->createSheet();
		$obpe->setactivesheetindex(5);
		$PHPSheet = $obpe->getactivesheet();
		Log::info(json_encode($branch));
		foreach ($branch as $bkey => $bval) {

			$bc = 0;
      foreach ($bval as $key5 => $val5) {

      	if($fb == 0){
					$PHPSheet->setCellValue($letter[$bc].($fb+1),$key5);
      	}

        $PHPSheet->setCellValue($letter[$bc].($fb+2),$val5);

        $bc = $bc+1;
      }

      $fb = $fb+1;

		}


		//复制知识库
		
		$knresult = Db::name('tel_knowledge')->where('scenarios_id', $sceneId)->select();

		//复制 tel_knowledge 表的数据
		$knowlist = array();	
		$knlglabel = array(); 

		$knl = 0;
		//创建一个新的工作空间(sheet)
		
		$obpe->createSheet();
		$obpe->setactivesheetindex(6);
		$PHPSheet = $obpe->getactivesheet();

		//\think\Log::record('knresult='.json_encode($knresult));

		foreach ($knresult as $knkey => $knval) {

			$na = 0;
	        foreach ($knval as $key6 => $val6) {

	        	if($knl == 0){
  					$PHPSheet->setCellValue($letter[$na].($knl+1),$key6);
	        	}

	            $PHPSheet->setCellValue($letter[$na].($knl+2),$val6);

	            $na = $na+1;
	        }

	        $knl = $knl+1;

			$res = Db::name('tel_corpus')->where(array("src_id"=>$knval["id"],'src_type'=>1))->select();

			if($res){
				foreach ($res as $rkey => $rval) {
					 array_push($knowlist,$rval);
				}	
			}

			$klabel = Db::name('tel_label')->where(array('flow_id'=>$knval["id"],'type'=>2))->find();	
			if($klabel){
				array_push($knlglabel, $klabel);
			}
		

		}


		$knc = 0;
		//创建一个新的工作空间(sheet)
		
		$obpe->createSheet();
		$obpe->setactivesheetindex(7);
		$PHPSheet = $obpe->getactivesheet();

		foreach ($knowlist as $kskey => $ksval) {

			$ns = 0;
	        foreach ($ksval as $key7 => $val7) {

	        	if($knc == 0){
  					$PHPSheet->setCellValue($letter[$ns].($knc+1),$key7);
	        	}

	            $PHPSheet->setCellValue($letter[$ns].($knc+2),$val7);


	           

	            	if($key7 == 'audio' && $val7){
	            		  $source = ltrim($val7,'/');

	            		   if(file_exists($source)){

	            		   	  	array_push($pathList, $source);
                
				    //             $temp = explode("/", $val7);
				    //             $long = count($temp);

								// $dest = $savePath.$temp[$long - 1];
				    //             copy($source,$dest);

				            }

	            	}
	          


	            $ns = $ns + 1;
	        }

	        $knc = $knc+1;


		}

     //复制意向标签
    $tirres = Db::name('tel_intention_rule')->where('scenarios_id', $sceneId)->select();	
    
    $rl = 0;
		//创建一个新的工作空间(sheet)
		
		$obpe->createSheet();
		$obpe->setactivesheetindex(8);
		$PHPSheet = $obpe->getactivesheet();

        if($tirres){
        	foreach ($tirres as $keky => $valrl) {

        		$rlm = 0;
		        foreach ($valrl as $key8 => $val8) {

		        	if($rl == 0){
	  					$PHPSheet->setCellValue($letter[$rlm].($rl+1),$key8);
		        	}

		            $PHPSheet->setCellValue($letter[$rlm].($rl+2),$val8);

		            $rlm = $rlm + 1;
		        }

		        $rl = $rl+1;

	        }

        }

         
    //复制知识库的标签
    $knlb = 0;
		//创建一个新的工作空间(sheet)
		$obpe->createSheet();
		$obpe->setactivesheetindex(9);
		$PHPSheet = $obpe->getactivesheet();

		// \think\Log::record('labelarr='.json_encode($labelarr));

		foreach ($knlglabel as $klkey => $klval) {
	
			$abcd = 0;
	        foreach ($klval as $keykn => $valkn) {

	        	if($knlb == 0){
  					$PHPSheet->setCellValue($letter[$abcd].($knlb+1),$keykn);
	        	}

	            $PHPSheet->setCellValue($letter[$abcd].($knlb+2),$valkn);

	            $abcd = $abcd+1;
	        }

	        $knlb = $knlb+1;

		}
      

		$execlpath = './uploads/exportExcel/';
	    if (!file_exists($execlpath)){
				mkdir($execlpath);
		}
		
		$execlpath .= rand_string(12,'',time()).'excel.xls';

	    //生成2007版本的xlsx
	    $PHPWriter = \PHPExcel_IOFactory::createWriter($obpe,'Excel2007');
	    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	    header('Content-Disposition: attachment;filename='.time().'.xlsx');
	    header('Cache-Control: max-age=0');
	    $PHPWriter->save($execlpath);

  	    array_push($pathList, $execlpath);
	   
  //       $temp = explode("/", $execlpath);
  //       $long = count($temp);

		// $dest = $savePath.$temp[$long - 1];
  //       copy($execlpath,$dest);

        $file_template = './uploads/download/kong.zip';//在此之前你的项目目录中必须新建一个空的zip包（必须存在）
		$downname = $scenarios["name"]."-".date ( 'd' ).'.zip';//你即将打包的zip文件名称
		$file_name = './uploads/download/'.uniqid().'.zip';//把你打包后zip所存放的目录
	
		$result = copy($file_template, $file_name);//把原来项目目录存在的zip复制一份新的到另外一个目录并重命名（可以在原来的目录）
		$zip = new \ZipArchive;//新建一个对象
		if ($zip->open($file_name, \ZipArchive::CREATE) === TRUE) { 

			//$zip->addEmptyDir(uniqid());
			foreach ($pathList as $keydl => $valuedl) {

				$temp = explode("/", $valuedl);
		        $long = count($temp);
				$dest = $temp[$long - 1];

				$zip->addFromString($dest , file_get_contents($valuedl));


			}

			//$zip->addFromString('excel.xls' , file_get_contents($dest));//图片的重命名，获取到图片的二进制流

		}

        $zip->close(); 
		$fp = fopen($file_name,"r"); 
		$file_size = filesize($file_name);
		header("Content-type: application/octet-stream");
		header("Accept-Ranges: bytes");
		header("Accept-Length:".$file_size);
		header("Content-Disposition: attachment"); 
		header("Content-Disposition: attachment; filename=$downname"); 
		//header("Content-Type: application/zip"); //zip格式的  
		header("Content-Transfer-Encoding: binary"); //告诉浏览器，这是二进制文件  
		header('Content-Length: '.$file_size); //告诉浏览器，文件大小  
		@readfile($file_name);
		
	    $buffer = 1024;
	    $file_count = 0;
	    while (!feof($fp) && $file_count < $file_size) {
	    	$file_con = fread($fp, $buffer);
	    	$file_count += $buffer;
	    	echo $file_con;
	    }
	    
	    fclose($fp);
	    if($file_count >= $file_size){
	     unlink($file_name);
		}
	
	}




	//导入
	public function leadingZip()
	{

        //var_dump($_FILES);
       // $flag = false;
		if(!empty($_FILES['excel']['tmp_name'])){

			$tmp_file = $_FILES ['excel'] ['tmp_name'];

		}else{
			return returnAjax(1,'上传失败,请下载模板，填好再选择文件上传。');
		}

		$file_types = explode ( ".", $_FILES ['excel'] ['name'] );
		$file_type = $file_types [count ( $file_types ) - 1];
		// $taskId = input('taskID','','trim,strip_tags'); 


		/*设置上传路径*/
		$savePath = './uploads/upload/';
		// 如果不存在则创建文件夹
		if (!is_dir($savePath)){
			mkdir($savePath); 
		}  

		/*以时间来命名上传的文件*/
		$str = date ( 'Ymdhis' ); 
		$file_name = $str . "." . $file_type;

		/*是否上传成功*/
		if (! copy ( $tmp_file, $savePath . $file_name )) 
		{
			//$this->error ( '上传失败' );
			return returnAjax(1,'上传失败');
		}

         
       $filename = $savePath . $file_name;
       $linkpath = $savePath . $file_name;
        //$path = $savePath . $file_name;

        //先判断待解压的文件是否存在
		if(!file_exists($filename)){
			die("文件 $filename 不存在！");
		}
		$starttime = explode(' ',microtime()); //解压开始的时间

		//将文件名和路径转成windows系统默认的gb2312编码，否则将会读取不到
		$filename = iconv("utf-8","gb2312",$filename);
		$path = iconv("utf-8","gb2312",$savePath);
		//打开压缩包
		$resource = zip_open($filename);

		$i = 1;
		//遍历读取压缩包里面的一个个文件
		while ($dir_resource = zip_read($resource)) {
			//如果能打开则继续
			if (zip_entry_open($resource,$dir_resource)) {
				//获取当前项目的名称,即压缩包里面当前对应的文件名
				$file_name = $path.zip_entry_name($dir_resource);
				//\think\Log::record('file_name='.$file_name);
				//以最后一个“/”分割,再用字符串截取出路径部分
				$file_path = substr($file_name,0,strrpos($file_name, "/"));
				//\think\Log::record('file_path='.$file_path);

				$realname = substr($file_name,strrpos($file_name, "/"));

				$exname = substr($file_name,strrpos($file_name, "."));
				if($exname == '.wav'){

					/*以时间来命名上传的文件夹*/
	 				$datestr = date ( 'Ymd' ); 
	 				$savePath = './uploads/audio/'.$datestr;
	 				// 如果不存在则创建文件夹
	 				if (!is_dir($savePath)){
	 				  mkdir($savePath); 
	 				}  

	 				$file_name = $savePath.$realname;

				}else if($exname == '.xls' || $exname == '.xlsx'){

					/*以时间来命名上传的文件夹*/
	 				$datestr = date ( 'Ymd' ); 
	 				$savePath = './uploads/Excel';
	 				// 如果不存在则创建文件夹
	 				if (!is_dir($savePath)){
	 				  mkdir($savePath); 
	 				}  

	 				$file_name = $savePath.$realname;

				}
				//\think\Log::record('exname='.$exname);

				//如果路径不存在，则创建一个目录，true表示可以创建多级目录
				if(!is_dir($file_path)){
					mkdir($file_path,0777,true);
				}

				//如果不是目录，则写入文件
				if(!is_dir($file_name)){
					//读取这个文件
					$file_size = zip_entry_filesize($dir_resource);
					//最大读取6M，如果文件过大，跳过解压，继续下一个
					if($file_size<(1024*1024*30)){
						$file_content = zip_entry_read($dir_resource,$file_size);
						file_put_contents($file_name,$file_content);

						if($exname == '.xls' || $exname == '.xlsx'){
							
							$flag = $this->leadingAlter($file_name);
						}
					}
					else{
						echo "<p> ".$i++." 此文件已被跳过，原因：文件过大， -> ".iconv("gb2312","utf-8",$file_name)." </p>";
					}
				}

				//关闭当前
				zip_entry_close($dir_resource);
			}
		}
		//关闭压缩包
		zip_close($resource);
	   
		unlink($linkpath);

		if($flag){
		    return returnAjax(0,'成功了');
		}else{
			return returnAjax(1,'失败了');
		}



	}


	//导入话术
	public function leadingAlter($file_name)
	{
		
			$foo = new \PHPExcel();
			$extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION) );
			
			//区分上传文件格式
			if($extension == 'xlsx') {
				$inputFileType = 'Excel2007';
				$objReader = \PHPExcel_IOFactory::createReader($inputFileType);
			}
			else{
				//\think\Log::record('extension='.json_encode($extension));
				$inputFileType = 'Excel2007';//'Excel5';
				$objReader = \PHPExcel_IOFactory::createReader($inputFileType);
			}
			$objPHPExcel = $objReader->load($file_name, $encode = 'utf-8');
			
			//$excelArr = $objPHPExcel->getsheet(0)->toArray();

			$excelArr = $objPHPExcel->getsheet(0)->toArray();
			$excelArr1 = $objPHPExcel->getsheet(1)->toArray();
			$excelArr2 = $objPHPExcel->getsheet(2)->toArray();
			$excelArr3 = $objPHPExcel->getsheet(3)->toArray();
			$excelArr4 = $objPHPExcel->getsheet(4)->toArray();
			$excelArr5 = $objPHPExcel->getsheet(5)->toArray();
			$excelArr6 = $objPHPExcel->getsheet(6)->toArray();
			$excelArr7 = $objPHPExcel->getsheet(7)->toArray();
			$excelArr8 = $objPHPExcel->getsheet(8)->toArray();
			$excelArr9 = $objPHPExcel->getsheet(9)->toArray();



			$user_auth = session('user_auth');
			$uid = $user_auth["uid"];		 
			//$super = $user_auth["super"];


			$scenarios = array();
            $newsceneId = 0;
			foreach ($excelArr as $key => $value){
                
				if ($key == 0){
					 continue;
				}
                 
                $temp = array(); 
				foreach ($value as $k => $v) {

					if($excelArr[0][trim($k)] != "id"){
						$temp[$excelArr[0][trim($k)]] = trim($v);

						if($excelArr[0][trim($k)] == "member_id"){
							$temp[$excelArr[0][trim($k)]] = $uid;
						}

					}

				}

				$result = Db::name('tel_scenarios')->insertGetId($temp);
				$newsceneId = $result;
				//array_push($user, $temp);

			}


			$sNodeId = array();
			foreach ($excelArr1 as $key1 => $value1){
                
				if ($key1 == 0){
					 continue;
				}
                 
                $temp = array(); 
				foreach ($value1 as $k1 => $v1) {

					if($excelArr1[0][trim($k1)] != "id"){

						$temp[$excelArr1[0][trim($k1)]] = trim($v1);

						if($excelArr1[0][trim($k1)] == "scenarios_id"){
							$temp[$excelArr1[0][trim($k1)]] = $newsceneId;
						}

					}

				}

				$res = Db::name('tel_scenarios_node')->insertGetId($temp);

				$sNodeId[$excelArr1[$key1][0]] = $res;
	

			}
 


			$flowNode = array();
			foreach ($excelArr2 as $key2 => $value2){
                
				if ($key2 == 0){
					 continue;
				}
                 
                $temp = array(); 
				foreach ($value2 as $k2 => $v2) {

					if($excelArr2[0][trim($k2)] != "id"){

						$temp[$excelArr2[0][trim($k2)]] = trim($v2);

						if($excelArr2[0][trim($k2)] == "scenarios_id"){
							$temp[$excelArr2[0][trim($k2)]] = $newsceneId;
						}

						if($excelArr2[0][trim($k2)] == "scen_node_id"){

							foreach ($sNodeId as $skey => $svalue) {
								if(trim($v2) == $skey){
									$temp[$excelArr2[0][trim($k2)]] = $svalue;
								}
							}
							
						}

						if($excelArr2[0][trim($k2)] == "action_id"){
							if(trim($v2)){

								foreach ($sNodeId as $skey => $svalue) {
									if(trim($v2) == $skey){
										$temp[$excelArr2[0][trim($k2)]] = $svalue;
									}
								}
							

							}
						}

					}
					
				}


				$nodeId = Db::name('tel_flow_node')->insertGetId($temp);

				$flowNode[$excelArr2[$key2][0]] = $nodeId;

				// array_push($user, $temp);

			}

			//修改新建的记录的父节点

			foreach ($flowNode as $wkey => $eval) {

			    $data = array();


				foreach ($excelArr2 as $okey => $oval) {

					if ($okey == 0){
						continue;
					}
	                 
	               
					foreach ($oval as $ko => $vo) {

						if($excelArr2[0][trim($ko)] == "pid"){
						
						  if($excelArr2[$okey][0] == $wkey){

								if(trim($vo) > 0){
									$data['pid'] = $flowNode[$vo];//pid变了
								}else{
									$data['pid'] = 0;
								}

						  }


						}


					}	


				}

			  
			   $result = Db::name('tel_flow_node')->where('id', $eval)->update($data);

			}



			$corpus = array();
			foreach ($excelArr3 as $key3 => $value3){
                
				if ($key3 == 0){
					 continue;
				}
                 
        $temp = array(); 
				foreach ($value3 as $k3 => $v3) {

					if($excelArr3[0][trim($k3)] != "id"){

						$temp[$excelArr3[0][trim($k3)]] = trim($v3);

						if($excelArr3[0][trim($k3)] == "scenarios_id"){
							$temp[$excelArr3[0][trim($k3)]] = $newsceneId;
						}

						if($excelArr3[0][trim($k3)] == "src_id"){

							foreach ($flowNode as $nkey => $nvalue) {
								if(trim($v3) == $nkey){
									$temp[$excelArr3[0][trim($k3)]] = $nvalue;
								}
							}
							
						}

						if($excelArr3[0][trim($k3)] == "audio"){

							
							if(trim($v3)){

								$realname = substr(trim($v3),strrpos(trim($v3), "/"));
								/*以时间来命名上传的文件夹*/
				 				$datestr = date ( 'Ymd' ); 
				 				$savePath = './uploads/audio/'.$datestr;
				 				// 如果不存在则创建文件夹
				 				if (!is_dir($savePath)){
				 				  mkdir($savePath); 
				 				}  

				 				$file_name = $savePath.$realname;
				 				$file_name = ltrim($file_name,".");

								$temp[$excelArr3[0][trim($k3)]] = $file_name;
							}
							
							
						}

					}
					
				}


				$csId = Db::name('tel_corpus')->insertGetId($temp);

				$corpus[$excelArr3[$key3][0]] = $csId;

				// array_push($user, $temp);

			}


			$label = array();
			foreach ($excelArr4 as $key4 => $value4){
                
				if ($key4 == 0){
					 continue;
				}
                 
                $temp = array(); 
				foreach ($value4 as $k4 => $v4) {

					if($excelArr4[0][trim($k4)] != "id"){

						$temp[$excelArr4[0][trim($k4)]] = trim($v4);

						if($excelArr4[0][trim($k4)] == "scenarios_id"){
							$temp[$excelArr4[0][trim($k4)]] = $newsceneId;
						}

						if($excelArr4[0][trim($k4)] == "member_id"){
							$temp[$excelArr4[0][trim($k4)]] = $uid;
						}


						if($excelArr4[0][trim($k4)] == "flow_id"){

							foreach ($flowNode as $lkey => $lvalue) {
								if(trim($v4) == $lkey){
									$temp[$excelArr4[0][trim($k4)]] = $lvalue;
								}
							}
							
						}

					}
					
				}


				$lbId = Db::name('tel_label')->insertGetId($temp);

				$label[$excelArr4[$key4][0]] = $lbId;


			}



			$branch = array();
			foreach ($excelArr5 as $key5 => $value5){
                
				if ($key5 == 0){
					 continue;
				}
                 
                $temp = array(); 
				foreach ($value5 as $k5 => $v5) {

					if($excelArr5[0][trim($k5)] != "id"){

						$temp[$excelArr5[0][trim($k5)]] = trim($v5);

						if($excelArr5[0][trim($k5)] == "flow_id"){

							foreach ($flowNode as $fkey => $fvalue) {
								if(trim($v5) == $fkey){
									$temp[$excelArr5[0][trim($k5)]] = $fvalue;
								}
							}
							
						}

						if($excelArr5[0][trim($k5)] == "next_flow_id"){

							foreach ($flowNode as $xkey => $xvalue) {
								if(trim($v5) == $xkey){
									$temp[$excelArr5[0][trim($k5)]] = $xvalue;
								}
							}
							
						}

					}
					
				}


				$fbId = Db::name('tel_flow_branch')->insertGetId($temp);

				$branch[$excelArr5[$key5][0]] = $fbId;


			}

			//下面是复制知识库的
			$knowledge = array();
			foreach ($excelArr6 as $key6 => $value6){
                
				if ($key6 == 0){
					 continue;
				}
                 
        $temp = array(); 
				foreach ($value6 as $k6 => $v6) {

					if($excelArr6[0][trim($k6)] != "id"){

						$temp[$excelArr6[0][trim($k6)]] = trim($v6);

						if($excelArr6[0][trim($k6)] == "scenarios_id"){
							$temp[$excelArr6[0][trim($k6)]] = $newsceneId;
						}


						if($excelArr6[0][trim($k6)] == "action_id"){
							if(trim($v6)){

								foreach ($sNodeId as $nskey => $nsvalue) {
									if(trim($v6) == $nskey){
										$temp[$excelArr6[0][trim($k6)]] = $nsvalue;
									}
								}
							

							}
						}

					}
					
				}
				
				$knId = Db::name('tel_knowledge')->insertGetId($temp);

				$knowledge[$excelArr6[$key6][0]] = $knId;


			}

			$kncorpus = array();
			foreach ($excelArr7 as $key7 => $value7){
                
				if ($key7 == 0){
					 continue;
				}
                 
        $temp = array(); 
				foreach ($value7 as $k7 => $v7) {

					if($excelArr7[0][trim($k7)] != "id"){

						$temp[$excelArr7[0][trim($k7)]] = trim($v7);

						if($excelArr7[0][trim($k7)] == "scenarios_id"){
							$temp[$excelArr7[0][trim($k7)]] = $newsceneId;
						}

						if($excelArr7[0][trim($k7)] == "src_id"){

							foreach ($knowledge as $knkey => $knvalue) {
								if(trim($v7) == $knkey){
									$temp[$excelArr7[0][trim($k7)]] = $knvalue;
								}
							}
							
						}

						if($excelArr7[0][trim($k7)] == "audio"){

							
							if(trim($v7)){

								$realname = substr(trim($v7),strrpos(trim($v7), "/"));
								/*以时间来命名上传的文件夹*/
				 				$datestr = date( 'Ymd' ); 
				 				$savePath = './uploads/audio/'.$datestr;
				 				// 如果不存在则创建文件夹
				 				if (!is_dir($savePath)){
				 				  mkdir($savePath); 
				 				}  
				
				 				$file_name = $savePath.$realname;
				 				$file_name = ltrim($file_name,".");

								$temp[$excelArr7[0][trim($k7)]] = $file_name;
							}
							
							
						}


					}
					
				}


				$csId = Db::name('tel_corpus')->insertGetId($temp);

				$kncorpus[$excelArr7[$key7][0]] = $csId;

				// array_push($user, $temp);

			}


			 //复制意向标签
			$ruletemp = array();
			foreach ($excelArr8 as $key8 => $value8){
                
				if ($key8 == 0){
					 continue;
				}
                 
        $temp = array(); 
				foreach ($value8 as $k8 => $v8) {

					if($excelArr8[0][trim($k8)] != "id"){

						$temp[$excelArr8[0][trim($k8)]] = trim($v8);

						if($excelArr8[0][trim($k8)] == "scenarios_id"){
							$temp[$excelArr8[0][trim($k8)]] = $newsceneId;
						}

						
					}
					
				}

				array_push($ruletemp, $temp);

			}


			$knlabel = array();
			foreach ($excelArr9 as $key9 => $value9){
                
				if ($key9 == 0){
					 continue;
				}
                 
        $temp = array(); 
				foreach ($value9 as $k9 => $v9) {

					if($excelArr9[0][trim($k9)] != "id"){

						$temp[$excelArr9[0][trim($k9)]] = trim($v9);

						if($excelArr9[0][trim($k9)] == "scenarios_id"){
							$temp[$excelArr9[0][trim($k9)]] = $newsceneId;
						}

						if($excelArr9[0][trim($k9)] == "member_id"){
							$temp[$excelArr9[0][trim($k9)]] = $uid;
						}

						if($excelArr9[0][trim($k9)] == "flow_id"){

							foreach ($knowledge as $lkey => $lvalue) {
								if(trim($v9) == $lkey){
									$temp[$excelArr9[0][trim($k9)]] = $lvalue;
								}
							}
						}
					}
				}


				$lbId = Db::name('tel_label')->insertGetId($temp);

				$knlabel[$excelArr9[$key9][0]] = $lbId;


			}


			$TRresult = Db::name('tel_intention_rule')->insertAll($ruletemp);

			if($newsceneId){
			    return true;
			}else{
				return false;
			}


	}


	
    
    //获取类型为8的知识库记录
    public function getKnlgEight()
    {
    	$sceneId = input('sceneId','','trim,strip_tags');

    	if(!$sceneId){
           return returnAjax(1,'传入参数错误');
    	}

    	$result = Db::name('tel_knowledge')->field('id,name')->where('scenarios_id',$sceneId)->where('type',8)->order('id asc')->select();

    	if($result){
		    return returnAjax(0,'获取数据成功',$result);
		}else{
			return returnAjax(1,'获取数据失败');
		}

    }







}