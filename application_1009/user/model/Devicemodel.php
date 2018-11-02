<?php
namespace app\user\model;
use think\Model;
	
class Devicemodel extends Model
{

	// 设置完整的数据表（包含前缀）
	protected $table = 'ruike_apply_device';
	// 设置数据表主键
	protected $pk    = 'applyId';
	// 设置当前数据表的字段信息
	protected $field = [
			'applyId'          => 'int',
			'apply_id'    => 'varchar',
			'audit_status'      => 'tinyint',
			'apply_time' => 'int',
			'device_id' => 'int',
			'audit_comment' => 'varchar',
			'audit_time' => 'int',
	];
}
