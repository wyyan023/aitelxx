<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\common\controller;

class Base extends \think\Controller{

	protected $url;
	protected $request;
	protected $module;
	protected $controller;
	protected $action;
	
	
	
  protected  $timestamp = null;
  protected  $supported_algs = array(
      'HS256' => array('hash_hmac', 'SHA256'),
      'HS512' => array('hash_hmac', 'SHA512'),
      'HS384' => array('hash_hmac', 'SHA384'),
      'RS256' => array('openssl', 'SHA256'),
    );
    
    protected $userAgentType;
    
	public function _initialize(){
		if (!is_file(APP_PATH . 'database.php') || !is_file(APP_PATH . 'install/data/install.lock')) {
			return $this->redirect('install/index/index');
		}
		/* 读取数据库中的配置 */
		$config =   cache('db_config_data');
		if(!$config){
			$config =   model('Config')->lists();
			//dump($config);
			cache('db_config_data',$config);
		}
		config($config);
		//获取request信息
		$this->requestInfo();
		
		$this->userAgentType = "weixin";
		if(isset($_SERVER['HTTP_USER_AGENT']) === false){
			$agentInfo = '';
		}else{
			$agentInfo = $_SERVER['HTTP_USER_AGENT'];
		}
  	if (strstr($agentInfo, "Html5Plus")){
  		$this->userAgentType = "html5App";
  	}
  	$this->assign('userAgentType', $this->userAgentType);
    	
	}

	
	
	public function execute($mc = null, $op = '', $ac = null){
		$op = $op ? $op : $this->request->module();
		if(\think\Config::get('url_case_insensitive')){
			$mc = ucfirst(parse_name($mc, 1));
			$op = parse_name($op,1);
		}
		
		if(!empty($mc) && !empty($op) && !empty($ac)){
			$ops = ucwords($op);
			$class = "\\addons\\{$mc}\\controller\\{$ops}";
			$addons = new $class;
			$addons->$ac();
		} else {
			$this->error('没有指定插件名称，控制器或操作！');
		}
	}

	/**
	 * 解析数据库语句函数
	 * @param string $sql  sql语句   带默认前缀的
	 * @param string $tablepre  自己的前缀
	 * @return multitype:string 返回最终需要的sql语句
	 */
	public function sqlSplit($sql, $tablepre) {
		if ($tablepre != "sent_") {
			$sql = str_replace("sent_", $tablepre, $sql);
		}

		$sql = preg_replace("/TYPE=(InnoDB|MyISAM|MEMORY)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\1 DEFAULT CHARSET=utf8", $sql);

		if ($r_tablepre != $s_tablepre) {
			$sql          = str_replace($s_tablepre, $r_tablepre, $sql);
			$sql          = str_replace("\r", "\n", $sql);
			$ret          = array();
			$num          = 0;
			$queriesarray = explode(";\n", trim($sql));
			unset($sql);
			foreach ($queriesarray as $query) {
				$ret[$num] = '';
				$queries   = explode("\n", trim($query));
				$queries   = array_filter($queries);
				foreach ($queries as $query) {
					$str1 = substr($query, 0, 1);
					if ($str1 != '#' && $str1 != '-') {
						$ret[$num] .= $query;
					}

				}
				$num++;
			}
		}
		return $ret;
	}

	protected function setSeo($title = '', $keywords = '', $description = ''){
		$seo = array(
			'title'       => $title,
			'keywords'    => $keywords,
			'description' => $description,
		);
		//获取还没有经过变量替换的META信息
		$meta = model('SeoRule')->getMetaOfCurrentPage($seo);
		foreach ($seo as $key => $item) {
			if (is_array($item)) {
				$item = implode(',', $item);
			}
			$meta[$key] = str_replace("[".$key."]", $item . '|', $meta[$key]);
		}

		$data = array(
			'title'       => $meta['title'],
			'keywords'    => $meta['keywords'],
			'description' => $meta['description'],
		);
		$this->assign($data);
	}


	/**
	 * 验证码
	 * @param  integer $id 验证码ID
	 * @author 郭平平 <molong@tensent.cn>
	 */
	public function verify($id = 1){
		$verify = new \org\Verify(array('length'=>4));
		$verify->entry($id);
	}

	/**
	 * 检测验证码
	 * @param  integer $id 验证码ID
	 * @return boolean     检测结果
	 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
	 */
	public function checkVerify($code, $id = 1){
		if ($code) {
			$verify = new \org\Verify();
			$result = $verify->check($code, $id);
			if (!$result) {
				return $this->error("验证码错误！", "");
			}
		}else{
			return $this->error("验证码为空！", "");
		}
	}

	//request信息
	protected function requestInfo(){
		$this->param = $this->request->param();
		defined('MODULE_NAME') or define('MODULE_NAME', $this->request->module());
		defined('CONTROLLER_NAME') or define('CONTROLLER_NAME', $this->request->controller());
		defined('ACTION_NAME') or define('ACTION_NAME', $this->request->action());
		defined('IS_POST') or define('IS_POST', $this->request->isPost());
		defined('IS_GET') or define('IS_GET', $this->request->isGet());
		$this->url = strtolower($this->request->module() . '/' . $this->request->controller() . '/' . $this->request->action());
		$this->assign('request', $this->request);
		$this->assign('param', $this->param);
	}

	/**
	 * 获取单个参数的数组形式
	 */
	protected function getArrayParam($param){
		if (isset($this->param['id'])) {
			return array_unique((array)$this->param[$param]);
		}else{
			return array();
		}
	}
	
	public function tokenDecode($jwt, $key, $allowed_algs = array())
  {
      $timestamp = time();

      if (empty($key)) {
          \think\Log::record('Key may not be empty');
          return null;
      }
      if (!is_array($allowed_algs)) {
          \think\Log::record('Algorithm not allowed');
          return null;
      }
      $tks = explode('.', $jwt);
      if (count($tks) != 2) {
          \think\Log::record('Wrong number of segments');
          return null;
      }
      
      list($bodyb64, $cryptob64) = $tks;
     
      
      $payload = json_decode(urlsafeB64Decode($bodyb64), true);
      if (null === $payload) {
          \think\Log::record('Invalid claims encoding');
          return null;
      }
      $sig = urlsafeB64Decode($cryptob64);
      /*
      if (empty($header->alg)) {         
          \think\Log::record('Empty algorithm');
          return null;
      }
      if (empty($this->supported_algs[$header->alg])) {
          \think\Log::record('Algorithm not supported');
          return null;
      }
      if (!in_array($header->alg, $allowed_algs)) {
          \think\Log::record('Algorithm not allowed');
          return null;
      }
      if (is_array($key) || $key instanceof \ArrayAccess) {
          if (isset($header->kid)) {
              $key = $key[$header->kid];
          } else {
              \think\Log::record('"kid" empty, unable to lookup correct key');
              return null;
          }
      }
			*/
      // Check the signature
      if (!$this->tokenVerify("$bodyb64", $sig, $key, 'HS256')) {
          \think\Log::record('Signature verification failed');
          return null;
      }
			
			/*
      // Check if the nbf if it is defined. This is the time that the
      // token can actually be used. If it's not yet that time, abort.
      if (isset($payload->nbf) && $payload->nbf > ($timestamp + $this->leeway)) {
          
          \think\Log::record('Cannot handle token prior to ' . date(DateTime::ISO8601, $payload->nbf));
          return null;
      }

      // Check that this token has been created before 'now'. This prevents
      // using tokens that have been created for later use (and haven't
      // correctly used the nbf claim).
      if (isset($payload->iat) && $payload->iat > ($timestamp + $this->leeway)) {          
           \think\Log::record('Cannot handle token prior to ' . date(DateTime::ISO8601, $payload->iat));
          return null;
      }
			*/
     

      return $payload;
  }
  
  public function tokenEncode($payload, $key, $alg = 'HS256')
  {
  		$segments = array();
  		 
      $payload['exp'] = time();
     
      $segments[] = urlsafeB64Encode(json_encode($payload));
      $signing_input = implode('.', $segments);

      $signature = $this->tokenSign($signing_input, $key, $alg);
      $segments[] = urlsafeB64Encode($signature);

      return implode('.', $segments);
  }
  
 	public  function tokenSign($msg, $key, $alg = 'HS256')
  {
     
      if (empty($this->supported_algs[$alg])) {
          \think\Log::record('Algorithm not supported');
          return null;
      }
      list($function, $algorithm) = $this->supported_algs[$alg];
      switch($function) {
          case 'hash_hmac':
              return hash_hmac($algorithm, $msg, $key, true);
          case 'openssl':
              $signature = '';
              $success = openssl_sign($msg, $signature, $key, $algorithm);
              if (!$success) {
                  \think\Log::record('OpenSSL unable to sign data');
                  return null;
              } else {
                  return $signature;
              }
      }
  }
  
  private  function tokenVerify($msg, $signature, $key, $alg)
  {
      if (empty($this->supported_algs[$alg])) {
          \think\Log::record('Algorithm not supported');
          return null;
      }

      list($function, $algorithm) = $this->supported_algs[$alg];
      switch($function) {
          case 'openssl':
              $success = openssl_verify($msg, $signature, $key, $algorithm);
              if (!$success) {
                  \think\Log::record("OpenSSL unable to verify data: " . openssl_error_string());
                  return null;
              } else {
                  return $signature;
              }
          case 'hash_hmac':
          default:
              $hash = hash_hmac($algorithm, $msg, $key, true);
              if (function_exists('hash_equals')) {
                  return hash_equals($signature, $hash);
              }
              $len = min(safeStrlen($signature), safeStrlen($hash));

              $status = 0;
              for ($i = 0; $i < $len; $i++) {
                  $status |= (ord($signature[$i]) ^ ord($hash[$i]));
              }
              $status |= (safeStrlen($signature) ^ safeStrlen($hash));

              return ($status === 0);
      }
  }   
    
}
