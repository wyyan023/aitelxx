<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\common\controller;
use Qiniu\Storage\UploadManager;
use Qiniu\Auth;
use OSS\OssClient;

class Upload {

	public function upload(){
		$upload_type = input('filename','images','trim');
	
		$config = $this->$upload_type();
		// 获取表单上传文件 例如上传了001.jpg
		$file = request()->file('file');

		$info = $file->move($config['rootPath'], true, false);

		if($info){
            $return['status'] = 1;
			      $return['info'] = $this->save($config, $upload_type, $info);
		}else{
            $return['status'] = 0;
            $return['info']   = $file->getError();
		}
		
	 // var_dump($return);exit;
	  
		echo json_encode($return);
	}

	/**
	 * 图片上传
	 * @var view
	 * @access public
	 */
	protected function images(){
		return config('picture_upload');
	}

	/**
	 * 文件上传
	 * @var view
	 * @access public
	 */
	protected function attachment(){
		return config('attachment_upload');
	}
	
	/**
	 * 私有文件上传
	 * @var view
	 * @access public
	 */
	protected function privateData(){
		return config('private_upload');
	}

	/**
	 * 百度编辑器使用
	 * @var view
	 * @access public
	 */
	public function ueditor(){
		$data = new \com\Ueditor(session('auth_user.uid'));
		echo $data->output();
	}

	public function editor() {
		$callback = request()->get('callback');
		$file = request()->file('upfile');
		$info = $file->move(config('editor_upload.rootPath'), true, false);
		if ($info) {
			$fileInfo              = $this->parseFile($info);
			
			$relativePath = $fileInfo['url'];
			//七牛
			$qiniuUpload = config('qiniu_upload');
			if ($qiniuUpload['open']){
				$accessKey = $qiniuUpload['accessKey'];
				$secretKey = $qiniuUpload['secretKey'];
				$auth = new Auth($accessKey, $secretKey);
				
				$bucket = $qiniuUpload['bucket'];
				$token = $auth->uploadToken($bucket);
				$uploadMgr = new UploadManager();
				$filePath =".".$relativePath;
				
				list($ret, $err) = $uploadMgr->putFile($token, $relativePath, $filePath);
				if ($err){
					\think\Log::record('editor qiniu upload failure='.json_encode($err));
				}
				else{
					$relativePath = $qiniuUpload['qiniuUrl'].$relativePath;
				}				
			}
			
			$data = array(
				"originalName" => $fileInfo['name'],
				"name" => $fileInfo['name'],
				"url" => $relativePath,
				"size" => $fileInfo['size'],
				"type" => $fileInfo['ext'],
				"state" => 'SUCCESS'
			);
			
		} else {
			$data['state'] = $file->getError();
		}
		/**
		* 返回数据
		*/
		if($callback) {
			return '<script>'.$callback.'('.json_encode($data).')</script>';
		} else {
			return json_encode($data);
		}
	}

	public function delete(){
		
		\think\Log::record('failure='.json_encode($_POST));
	    $id = input('id','','trim,strip_tags');
		$pic = db('picture')->field('path')->where('id', $id)->find();
		
		//file文件路径
	    $filename = './'.$pic['path'];
	
	    //删除
	    if(file_exists($filename)){
	        $info ='原头像删除成功';
	        unlink($filename);
	    }else{
	        $info ='原头像没找到:'.$filename;
	        \think\Log::record('failure='.$info);
	    }
	    
	    
	    $list = db('picture')->where('id', $id)->delete();
		
		$data = array(
			'status' => 1,
		);
		
		echo json_encode($data);
		//return json_encode($data);
		//exit();
		
	}

	/**
	 * 保存上传的信息到数据库
	 * @var view
	 * @access public
	 */
	public function save($config, $type, $file) {
		if ($type == 'images'){
			 $file           = $this->parsePicureFile($file);
		}
		else{
			$file           = $this->parseFile($file);
		}
		$file['status'] = 1;
		$dbname = ($type == 'images') ? 'picture' : 'file';
		
		$id = db($dbname)->insertGetId($file);
		$relativePath= $file['url'];
		$baseUrl = "";
		//阿里云oss
		$aliyunUpload = config('aliyun_upload');
		if ($aliyunUpload['open']){
			$filePath =".".$relativePath;
			$objectName = substr($relativePath,1);
			try {
				$ossClient = new OssClient($aliyunUpload['accessKey'], $aliyunUpload['secretKey'], $aliyunUpload['endpoint']);
				$ossClient->uploadFile($aliyunUpload['bucket'], $objectName, $filePath);
				$baseUrl = $aliyunUpload['aliYunOssUrl'];
				\think\Log::record('aliyun_upload success='.json_encode($ossClient));
			} catch (OssException $e) {
				\think\Log::record('aliyun_upload failure='.json_encode($e->getMessage()));
			}
		}
		
		//七牛
		$qiniuUpload = config('qiniu_upload');
		if ($qiniuUpload['open'] && $type != "privateData"){
			$accessKey = $qiniuUpload['accessKey'];
			$secretKey = $qiniuUpload['secretKey'];
			$auth = new Auth($accessKey, $secretKey);
			
			$bucket = $qiniuUpload['bucket'];
			$token = $auth->uploadToken($bucket);
			$uploadMgr = new UploadManager();
			$filePath =".".$relativePath;
		
			list($ret, $err) = $uploadMgr->putFile($token, $relativePath, $filePath);
			if ($err){
				\think\Log::record('qiniu upload failure='.json_encode($err));
			}
			else{
				$baseUrl = $qiniuUpload['qiniuUrl'];
			}	
		}
		
		if ($id) {
			$data = db($dbname)->where(array('id'=>$id))->find();
			
			
			if ($dbname == 'picture'){
				$data['path'] = $baseUrl.$relativePath;
			}
			else{
				$data['url'] = $baseUrl.$relativePath;
			}
		
			return $data;
		}else{
			return false;
		}
	}

	/**
	 * 下载本地文件
	 * @param  array    $file     文件信息数组
	 * @param  callable $callback 下载回调函数，一般用于增加下载次数
	 * @param  string   $args     回调函数参数
	 * @return boolean            下载失败返回false
	 */
	public function downLocalFile($file, $callback = null, $args = null){
		if(is_file($file['rootpath'].$file['savepath'].$file['savename'])){
			/* 调用回调函数新增下载数 */
			is_callable($callback) && call_user_func($callback, $args);

			/* 执行下载 */ //TODO: 大文件断点续传
			header("Content-Description: File Transfer");
			header('Content-type: ' . $file['type']);
			header('Content-Length:' . $file['size']);
			if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) {
				//for IE
				header('Content-Disposition: attachment; filename="' . rawurlencode($file['name']) . '"');
			} else {
				header('Content-Disposition: attachment; filename="' . $file['name'] . '"');
			}
			readfile($file['rootpath'].$file['savepath'].$file['savename']);
			exit;
		} else {
			$this->error = '文件已被删除！';
			return false;
		}
	}
	
	protected function parsePicureFile($info) {
		$data['create_time'] = $info->getATime(); //最后访问时间
		
		$data['url']         = $data['path']         = str_replace("\\", '/', substr($info->getPathname(), 1)); //全路径
		
		$data['md5']         = md5_file($info->getPathname());
		$data['sha1']        = sha1_file($info->getPathname());
		return $data;
	}
	
	protected function parseFile($info) {
		$data['create_time'] = $info->getATime(); //最后访问时间
		$data['savename']    = $info->getBasename(); //获取无路径的basename
		//$data['c_time']      = $info->getCTime(); //获取inode修改时间
		$data['ext']         = $info->getExtension(); //文件扩展名
		$data['name']        = $info->getFilename(); //获取文件名
		//$data['m_time']      = $info->getMTime(); //获取最后修改时间
		//$data['owner']       = $info->getOwner(); //文件拥有者
		$data['savepath']    = $info->getPath(); //不带文件名的文件路径
		$data['url']         = $data['savepath']         = str_replace("\\", '/', substr($info->getPathname(), 1)); //全路径
		$data['size']        = $info->getSize(); //文件大小，单位字节
		//$data['is_file']     = $info->isFile(); //是否是文件
		//$data['is_execut']   = $info->isExecutable(); //是否可执行
		//$data['is_readable'] = $info->isReadable(); //是否可读
		//$data['is_writable'] = $info->isWritable(); //是否可写
		$data['md5']         = md5_file($info->getPathname());
		$data['sha1']        = sha1_file($info->getPathname());
		return $data;
	}
}