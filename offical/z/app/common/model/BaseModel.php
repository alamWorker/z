<?php
namespace app\common\model;

use think\Db;
use think\Model;

class BaseModel extends Model
{
    public $database;

	public function __construct()
	{
		parent::__construct();

		$this->init_defined();
	}

	// 初始化常量
	public function init_defined()
	{
		// 数据库前缀
		if (!defined('DB_PREFIX')) {
			define('DB_PREFIX', config('database.prefix'));
		}
	}

	// 插入数据
	public function insert($data)
	{
		$result = Db::name($this->database)->insertGetId($data);
		return $result;
	}

	// 修改数据
	public function alter($condition, $data)
	{
		$result = Db::name($this->database)->where($condition)->update($data);
		return $result;
	}

	// 获取数据
	public function getList($condition, $field = '*', $limit = '',$join = '', $order = '', $group = '')
	{
        return Db::name($this->database)->join($join)->where($condition)->field($field)->limit($limit)->order($order)->group($group)->select();
    }
}