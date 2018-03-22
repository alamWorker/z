<?php
namespace app\designer\controller;

use app\common\controller\ViewBase;

use app\designer\model\DesignerModel;
use app\design\model\DesignModel;
use app\design\model\AssessModel;
use app\design\model\FavoritesModel;
use app\comment\model\CommentModel;

use think\Db;

class View extends ViewBase
{
	protected $designer = array();

	public function __construct()
	{
		parent::__construct();
		
		$this->check_login();

		$this->get_designer();
	}

	/**
	 * 初始化设计师信息
	 */
	public function get_designer()
	{
		$model_designer = new DesignerModel();

		// 设计师
		$condition = array(
			'user_id' => $this->user_info['id'],
			'is_deleted' => 0
		);
		$this->designer = $model_designer->getInfo($condition);

		if (empty($this->designer)) {
			$data = array(
				'user_id' => $this->user_info['id'],
				'name' => $this->user_info['nickname']
			);
			$this->designer['id'] = $model_designer->insert($data);
			$this->designer = array_merge($this->designer, $data);
		}
	}

	/**
	 * 设计师主页
	 */
	public function home()
	{
		$model_design = new DesignModel();
		$model_assess = new AssessModel();
		$model_favorites = new FavoritesModel();
		$model_comment = new CommentModel();

		$designer_id = empty($this->request('designer_id')) ? $this->designer['id'] : $this->request('designer_id');
		if ($designer_id == $this->designer['id']) {
			$designer = $this->designer;
			$designer['avatar'] = $this->user_info['avatar'];
		} else {
			$model_designer = new DesignerModel();

			// 设计师
			$condition = array(
				'z_designer.id' => $designer_id,
				'z_designer.is_deleted' => 0
			);
			$join = [
				['z_user u', 'z_designer.user_id = u.id', 'LEFT']
			];
			$field = 'z_designer.*, u.avatar';
			$designer = $model_designer->getInfo($condition, $field, $join);
		}

		// 设计
		$condition = array(
			'z_design.designer_id' => $designer_id,
			'z_design.status' => 1,
			'z_design.is_deleted' => 0
		);
		$field = 'z_design.*, di.src as img_src';
		$limit = '0,20';
		$join = [
			['z_design_img di', 'z_design.id = di.design_id AND di.is_deleted = 0 AND di.is_main = 1', 'LEFT']
		];
		$design = $model_design->getList($condition, $field, $limit, $join);
		foreach ($design as $key => $value) {
			$design[$key]['img_src'] = json_decode($value['img_src'], true)['ssrc'];
		}

		if ($designer_id == $designer['id']) {
			// 所有设计id
			$condition = array(
				'is_deleted' => 0,
				'status' => 1,
				'designer_id' => $designer['id']
			);
			$design_id = $model_design->setDB()->where($condition)->column('id');
			$design_id = implode($design_id, ',');

			$condition = [
				'is_read' => 0,
				'object' => 1,
				'object_id' => ['in', $design_id]
			];
			// 点赞数量
			$assess_num = $model_assess->getCount($condition);

			// 收藏数量
			$query1 = function($query) use ($design_id) {$query->where('object_id', 'in', $design_id)->where('object', 1)->where('is_read', 0);};
			$query2 = function($query) use ($designer) {$query->where('object_id', $designer['id'])->where('object', 2)->where('is_read', 0);};
			$fav_num = $model_favorites->setDb()->where($query1)->whereor($query2)->count();

			// 评价数量
			$condition = array(
				'is_read' => 0,
				'is_deleted' => 0,
				'object' => 1,
				'object_id' => array('in', $design_id)
			);
			$comment_num = $model_comment->getCount($condition);
			$hint = $assess_num + $assess_num + $fav_num;
			$this->assign('hint', $hint);
		}
		
		$this->assign('designer', $designer);
		$this->assign('design', $design);
		return $this->fetch();
	}

	/**
	 * 互动记录
	 */
	public function log_list()
	{
		$model_design = new DesignModel();
		$model_favorites = new FavoritesModel();
		$model_assess = new AssessModel();
		$model_comment = new CommentModel();

		// 所有设计id
		$condition = array(
			'z_design.is_deleted' => 0,
			'z_design.status' => 1,
			'z_design.designer_id' => $this->designer['id']
		);
		$design_id = $model_design->setDB()->where($condition)->column('id');
		$design_id = implode($design_id, ',');

		// 未读改为已读
		$data = array(
			'is_read' => 1
		);
		// 收藏设计
		$condition = array(
			'z_favorites.is_read' => 0,
			'z_favorites.object' => 1,
			'z_favorites.object_id' => array('in', $design_id)
		);
		$join = [
			['z_user u', 'z_favorites.user_id = u.id', 'LEFT'],
			['z_design_img di', 'z_favorites.object_id = di.design_id AND di.is_main = 1 AND di.is_deleted = 0', 'LEFT']
		];
		$field = 'z_favorites.*, u.avatar, u.nickname, di.src';
		$fav_design = $model_favorites->getList($condition, $field, '', $join);
		$this->_log_set_type($fav_design, 1);
		$update_fav = $model_favorites->alter($condition, $data);

		// 收藏设计师
		$condition = array(
			'z_favorites.is_read' => 0,
			'z_favorites.object' => 2,
			'z_favorites.object_id' => $this->designer['id']
		);
		$join = [
			['z_user u', 'z_favorites.user_id = u.id', 'LEFT']
		];
		$field = 'z_favorites.*, u.avatar, u.nickname';
		$fav_designer = $model_favorites->getList($condition, $field, '', $join);
		$this->_log_set_type($fav_designer, 2);
		$update_fav_er = $model_favorites->alter($condition, $data);

		// 点赞
		$condition = array(
			'z_assess.is_read' => 0,
			'z_assess.object' => 1,
			'z_assess.object_id' => array('in', $design_id)
		);
		$join = [
			['z_user u', 'z_assess.user_id = u.id', 'LEFT'],
			['z_design_img di', 'z_assess.object_id = di.design_id AND di.is_main = 1 AND di.is_deleted = 0', 'LEFT']
		];
		$field = 'z_assess.*, u.avatar, u.nickname, di.src';
		$assess = $model_assess->getList($condition, $field, '', $join);
		$this->_log_set_type($assess, 3);
		$update_assess = $model_assess->alter($condition, $data);

		// 评论
		$condition = array(
			'z_comment.is_read' => 0,
			'z_comment.is_deleted' => 0,
			'z_comment.object' => 1,
			'z_comment.object_id' => array('in', $design_id),
			'z_comment.user_id' => array('neq', $this->user_info['id'])
		);
		$join = [
			['z_user u', 'z_comment.user_id = u.id', 'LEFT'],
			['z_design_img di', 'z_comment.object_id = di.design_id AND di.is_main = 1 AND di.is_deleted = 0', 'LEFT']
		];
		$field = 'z_comment.*, u.avatar, u.nickname, di.src';
		$comment = $model_comment->getList($condition, $field, '', $join);
		$this->_log_set_type($comment, 4);
		$update_comment = $model_comment->alter($condition, $data);

		$log_list = array_merge($fav_design, $fav_designer, $assess, $comment);
		$this->_log_order_by_time($log_list);

		foreach ($log_list as $key => $value) {
			if (isset($value['src'])) {
				$log_list[$key]['src'] = json_decode($value['src'], true)['ssrc'];
			}
		}

		$this->assign('log_list', $log_list);
		$this->assign('fav_design', $fav_design);
		return $this->fetch('log_list');
	}

	/**
	 * 按时间对记录进行排序
	 */
	protected function _log_order_by_time(&$sort_list)
	{
		$datetime = array();
		foreach ($sort_list as $key) {
			$datetime[] = $key['create_time'];
		}
		array_multisort($datetime, SORT_DESC, $sort_list);
	}

	/**
	 * 对记录添加标识
	 */
	protected function _log_set_type(&$data, $sign)
	{
		foreach ($data as $key => $value) {
			$data[$key]['log_sign_type'] = $sign;
		}
	}

	/**
	 * 设计师资料设置
	 */
	public function set_info()
	{
		$this->assign('designer', $this->designer);	
		return $this->fetch('set_info');
	}
}