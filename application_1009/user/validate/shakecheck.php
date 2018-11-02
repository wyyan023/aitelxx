<?php
namespace app\user\validate;
use think\Validate;

class shakecheck extends Validate
{
	protected $rule = [
			'MainTitle'  =>  'require|max:6',
			'Subtitle'  =>  'require|max:7',
			'JumpURL'  =>  'require|url',
			'Remarkinfo'  =>  'require|max:15',
	];

}