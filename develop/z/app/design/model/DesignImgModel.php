<?php
namespace app\design\model;

use think\Db;
use app\common\model\BaseModel;

class DesignImgModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
		
		$this->database = 'DesignImg';
	}

	/**
	 * 获取设计轮播相册
	 * @param int $design_id	设计图稿id
	 * @return array $img 		相册数组
	 */
	public function getDesignMainImg($design_id = 0)
	{
		$condition = array(
			'design_id' => $design_id,
			'is_deleted' => 0,
			'src' => array('neq', '')
		);
		$order = 'is_main DESC,id ASC';
		$img = $this->getList($condition, '*', '', '', $order);
		return $img;
	}
}