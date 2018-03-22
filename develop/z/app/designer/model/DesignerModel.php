<?php
namespace app\designer\model;

use think\Db;
use app\common\model\BaseModel;

class DesignerModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
		
		$this->database = 'Designer';
	}
}