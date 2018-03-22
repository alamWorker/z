<?php
namespace app\design\model;

use think\Db;
use app\common\model\BaseModel;

class DesignModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
		
		$this->database = 'Design';
	}

	public function getDesignInfo($design_id = 0)
	{
		$condition = array(
			'z_design.id' => $design_id,
			'z_design.status' => 1,
			'z_design.is_deleted' => 0
		);
		$field = 'z_design.*, de.name, de.user_id, u.avatar';
		$join = [
			['z_designer de', 'de.id = z_design.designer_id', 'LEFT'],
			['z_user u', 'u.id = de.user_id', 'LEFT']
		];
		$design = $this->getInfo($condition, $field, $join);

		return $design;
	}
}