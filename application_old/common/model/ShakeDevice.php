<?php
namespace app\common\model;
use think\Model;

class ShakeDevice extends Model
{

	// 设置完整的数据表（包含前缀）
	protected $table = 'ruike_device';
	// 设置数据表主键
	protected $pk    = 'id';
	// 设置当前数据表的字段信息
	protected $field = [
			'id'          => 'int',
			'device_id' => 'int',
			'comment' => 'varchar',
			'last_active_time' => 'int',
			'major'    => 'varchar',
			'minor'    => 'varchar',
			'uuid'    => 'varchar',
			'poi_id' => 'varchar',
			'total_count' => 'int',
			'poi_appid' => 'varchar',
			'status'      => 'tinyint',
	
	];
}