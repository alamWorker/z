<?php
namespace app\design\model;

use think\Db;
use app\common\model\BaseModel;

class FavoritesModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();

		$this->database = 'Favorites';
	}
}