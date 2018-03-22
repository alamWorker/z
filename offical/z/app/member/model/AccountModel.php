<?php
namespace app\member\model;

use think\Db;
use app\common\model\BaseModel;

class AccountModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
	}

	public function get_info($condition = [])
	{
        return Db::name('user')->where($condition)->find();
	}
}