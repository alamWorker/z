<?php
namespace app\workclass\model;

use think\Db;
use app\common\model\BaseModel;

class UserClassModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
		$this->database = 'UserClass';
	}
}