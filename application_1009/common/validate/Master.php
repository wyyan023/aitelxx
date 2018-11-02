<?php
namespace app\common\validate;

/**
* 设置模型
*/
class Master extends Base{

	protected $rule = array(
		'username'   => 'require|unique:master|/^[a-zA-Z]\w{0,39}$/',
		'email'      => 'require|unique:master|email',
		'mobile'     => 'unique:master',
		'password'   => 'require',
		'repassword' => 'confirm:password'
	);
	protected $message = array(
		'username.require'    => '用户名必须',
		'username.unique'    => '用户名已存在',
		'email.require'    => '邮箱必须',
		'email.unique'    => '邮箱已存在',
		'mobile.unique'    => '手机号已存在',
		'password.require' => '密码必须',
		'repassword.require'    => '确认密码和密码必须一致',
	);
	protected $scene = array(
		'edit'     => 'email,mobile',
		'password' => 'password,repassword'
	);

}