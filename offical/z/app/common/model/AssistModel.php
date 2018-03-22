<?php
namespace app\common\model;

use think\Db;
use app\common\model\BaseModel;

class AssistModel extends BaseModel
{

	const ASSIST_LOG_TABLE_NAME = 'active_log';

	protected $db_config = '';

	protected $model_obj = '';

	public $postfix = '';

	public $database = '';

	public function __construct()
	{
		parent::__construct();

		$this->db_config = config('log.active_log');
	}

	// 参数初始化
	public function init_param()
	{
		if (empty($this->database)) {
			return false;
		}

		if (empty($this->postfix)) {
			$this->postfix = '_' . date('Ym');
		}

		$this->init_table();
	}

	// log表初始化
	public function init_table()
	{
		$comment = '用户操作记录表' . date('Y') . '/' . date('m') . '/' . date('d');
		$table_name = DB_PREFIX . $this->database . $this->postfix;
		$sql = "CREATE TABLE IF NOT EXISTS `{$table_name}` (
		  `id` bigint(20) NOT NULL AUTO_INCREMENT,
		  `user_id` bigint(20) NOT NULL DEFAULT '0',
		  `app_path` varchar(255) NOT NULL DEFAULT '' COMMENT '模块路径',
		  `param` varchar(255) NOT NULL COMMENT '传递参数json',
		  `create_date` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
		  `operate_ip` varbinary(16) NOT NULL DEFAULT '0.0.0.0' COMMENT '操作ip',
		  PRIMARY KEY (`id`),
		  KEY `user_id` (`user_id`) USING BTREE,
		  KEY `app_path` (`app_path`(191)) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='({$comment})';";
        Db::connect($this->db_config)->execute($sql);
        $this->model_obj = Db::connect($this->db_config)->name($this->database . $this->postfix);
	}

	// 保存日活记录
	public function save_active_log($data = [])
	{
		if (empty($data)) {
			return false;
		}

		$this->database = self::ASSIST_LOG_TABLE_NAME;

		$this->init_param();

		$this->model_obj->insertGetId($data);
	}
}