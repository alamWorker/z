<?php
namespace app\workclass\model;

use think\Db;
use app\common\model\BaseModel;

class ClassModel extends BaseModel
{

	public function __construct()
	{
		parent::__construct();
		$this->database = 'Class';
	}

}