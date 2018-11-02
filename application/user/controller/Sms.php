<?php
namespace app\user\controller;
use app\common\controller\User;
use think\Db;
use think\Session;
use app\common\controller\Log;

//会员用户数据处理类
use app\common\controller\AdminData;
//线路数据处理类
use app\common\controller\LinesData;
//机器人分配处理
use app\common\controller\RobotDistribution;

class Sms extends User{
	
	/**
	 * 短信通道
	*/
	public function channel()
	{
		return $this->fetch();
	}
	
	/**
	 * 短信签名
	*/
	public function autograph()
	{
		return $this->fetch();
	}
	
	
	/**
	 * 短信模版
	*/
	public function template()
	{
		return $this->fetch();
	}
	
	/**
	 * 发送短信
	*/
	public function send_sms()
	{
		return $this->fetch();
	}
	/**
	 * 发送记录
	*/
	public function send_record()
	{
		return $this->fetch();
	}
	/**
	 * 统计
	*/
	public function statistics()
	{
		return $this->fetch();
	}
	/**
	 * 审核记录
	 * 
	*/
	public function audit_record()
	{
		return $this->fetch();
	}
}