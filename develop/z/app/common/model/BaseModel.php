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

	// 初始化DB
    public function setDb()
    {
		return Db::name($this->database);
    }

	// 插入数据
	public function insert($data)
	{
		$result = $this->setDb()->insertGetId($data);
		return $result;
	}

	// 修改数据
	public function alter($condition = array(), $data)
	{
		if (empty($condition)) {
			return false;
		}
		$result = $this->setDb()->where($condition)->update($data);
		return $result;
	}

	public function deleted($condition)
	{
		$result = $this->setDb()->where($condition)->delete();
		return $result;
	}

	// 获取单行数据
	public function getInfo($condition = array(), $field = '*', $join = '')
	{
		$model = $this->setDb();
		if (!empty($join)) {
			$model->join($join);
		}
		return $model->where($condition)->field($field)->find();
	}

	// 获取数据行数
	public function getCount($condition = array(), $field = '', $join = '', $order = '')
	{
		$model = $this->setDb();
		if (!empty($join)) {
			$model->join($join);
		}
        return $model->where($condition)->field($field)->order($order)->count();
    }

	// 获取多行数据
	public function getList($condition = array(), $field = '*', $limit = '', $join = '', $order = '', $group = '')
	{
		$model = $this->setDb();
		if (!empty($join)) {
			$model->join($join);
		}
        return $model->where($condition)->field($field)->limit($limit)->order($order)->group($group)->select();
    }
}