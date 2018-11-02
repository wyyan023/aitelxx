<?php
// +----------------------------------------------------------------------
// | RuiKeCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.ruikesoft.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Wayne <wayne@ruikesoft.com> <http://www.ruikesoft.com>
// +----------------------------------------------------------------------

namespace app\common\controller;
use app\common\model\AuthRule;
use app\common\model\AuthGroup;

class Log extends Base{
	
	
	// public function __construct()
	// {
		
	// }
	public static function info($content)
	{
		$url = '/www/wwwroot/120.79.142.199/public/thinkphp.log';
		//创建日志文件
    $logFile = fopen($url , "a+");
    // echo $this->logFileUrl;
    $date = date("Y-m-d H:i:s");
    $txt = $date . " - " . $content . "\n";
    fwrite($logFile , $txt);
	}
	// public static function error($content)
	// {
	// 	$url = '/www/wwwroot/120.79.142.199/public/error.log';
	// 	//创建日志文件
 //   $logFile = fopen($url , "a+");
 //   // echo $this->logFileUrl;
 //   $date = date("Y-m-d H:i:s");
 //   $txt = $date . " - " . $content . "\n";
 //   fwrite($logFile , $txt);
	// }
}