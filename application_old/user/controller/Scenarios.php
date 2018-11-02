<?php
namespace extend\PHPExcel;
namespace extend\PHPExcel\PHPExcel;
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use Overtrue\Pinyin\Pinyin;
use Qiniu\json_decode;

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
			$data['status'] = 0;
			//当前话术是否审核
			$data['auditing'] = 0;
			if ($memberInfo['examine']){
				$data['auditing'] = 1;
			}
			
			$data['break'] = input('break','','trim,strip_tags');
				
			$result = Db::name('tel_scenarios')->insertGetId($data);
			
			if($isTpl){
				//这个逻辑是复制的，循环复制
				$tList =  Db::name('tel_flow')->where('scenarios_id', $isTpl)->select();				 
				foreach ($tList as $k=>$val){
						 $teldata = array();
						 $teldata['scenarios_id'] = $result;
						 $teldata['content'] = $val["content"];
						 $teldata['path'] = $val["path"];
						 $teldata['keyword'] = $val["keyword"];
						 $teldata['classify'] = $val["classify"];
						 $teldata['bridge'] = $val["bridge"];
						 $teldata['type'] = $val["type"];
						
			
						 Db::name('tel_flow')->insertGetId($teldata);
				}
				
				$keywords =  Db::name('tel_keyword')->where('scenarios_id', $isTpl)->select();				
			}
			else{
				$keywords =  Db::name('tel_keyword')->where('scenarios_id', 11)->select();
			}
			
			foreach ($keywords as $k=>$val){
					 $teldata = array();
					 $teldata['scenarios_id'] = $result;
					 $teldata['priority'] = 0;
					 $teldata['type'] = $val["type"];
					 $teldata['keyword'] = $val["keyword"];
					 $teldata['pinyin'] = $val["pinyin"];
					 Db::name('tel_keyword')->insertGetId($teldata);
			}
			
			if ($result >= 0){
				 $back = array();
				 $back["url"] = Url("User/Scenarios/index");
				 return returnAjax(0,'success!',$back);		
			}
			else{
				 return returnAjax(1,'failure!');
			}

		}
		else{
			    $this->assign('current', "添加");
				return $this->fetch();
		}
		
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
		
		$ids= input('id/a','','trim,strip_tags');
		$list = Db::name('tel_scenarios')->where('id','in', $ids)->delete();

		$flist = Db::name('tel_flow')->where('scenarios_id','in', $ids)->delete();

    	if(!$list){
    		echo "删除失败。";
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
				$data['keyword_py'] = str_replace(' ', '', $py);
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
						$data['pinyin'] = str_replace(' ', '', $py);
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


	    	if($status != ""){
	    		 $where["status"] = $status;
	    	}   

	
		
			$list = Db::name('tel_learning')
			->order('id desc')
			->where($where)
			->page($page,$Page_size)
			->select();
			
			foreach($list as &$item){
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

	
			$count =  Db::name('tel_learning')->where($cwhere)->count('id');
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
				->field('mobile,nickname,status,level,sex,duration,last_dial_time,record_path,uuid,call_rotation,originating_call')
				->where('uid',$uid)->find();
				
				$num = Db::name('tel_bills')->where('status',1)->where('call_id',$uid)->count("id");

				if ($memberInfo['uuid']){
					
					$bills = Db::name('tel_bills')->where('call_id',$memberInfo['uuid'])->order('id asc')->select();
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
									$user['keyword_py'] = str_replace(' ', '', $py);
								}

							}
						
							array_push($data,$user);

					}
				
				
		        //	\think\Log::record('$i='.$i);
			    \think\Log::record('data='.json_encode($data));
		        
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



	
}