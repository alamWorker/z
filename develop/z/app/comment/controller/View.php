<?php
namespace app\comment\controller;

use app\common\controller\ViewBase;

use app\design\model\AssessModel;
use app\comment\model\CommentModel;
use app\member\model\UserModel;

use think\Db;

class View extends ViewBase
{
	public function __construct()
	{
		parent::__construct();
		
		$this->check_login();
	}

	/**
	 * 评价列表
	 */
	public function home()
	{
		$model_comment = new CommentModel();
		$model_user = new UserModel();

		$object = $this->request('object');
		$object = empty($object) ? 1 : $object;
		$object_id = $this->request('object_id');
		$parent_id = $this->request('parent_id');
		if (!empty($parent_id)) {
			$condition = array(
				'c.id' => $parent_id
			);
			$field = 'z_user.id, z_user.nickname';
			$join = [
				['comment c', 'z_user.id = c.user_id', 'RIGHT']
			];
			$parent = $model_user->getInfo($condition, $field, $join);
			if ($parent['id'] == $this->user_info['id']) {
				unset($parent);
			}
		}

		$condition = array(
			'z_comment.object' => $object,
			'z_comment.object_id' => $object_id,
			'z_comment.is_deleted' => 0,
			'z_comment.status' => 1
		);
		$field = 'u.avatar, u.nickname, z_comment.*, a.id as assess_id';
		$join = [
			['user u', 'u.id = z_comment.user_id', 'LEFT'],
			['assess a', 'a.object_id = z_comment.id AND a.object = 3', 'LEFT']
		];
		$order = 'z_comment.create_time DESC';
		$limit = '0,20';
		$comment = $model_comment->getList($condition, $field, $limit, $join, $order);
		foreach ($comment as $key => $value) {
		 	if (!empty($value['parent_id'])) {
				$condition = array(
					'z_comment.is_deleted' => 0,
					'z_comment.id' => $value['parent_id']
				);
				$field = 'z_comment.content, u.nickname as parent_nickname,z_comment.status';
				$join = [
					['z_user u', 'u.id = z_comment.user_id', 'LEFT']
				];
				$comment[$key]['parent'] = $model_comment->getInfo($condition, $field, $join);
				if (!empty($comment[$key]['parent']['status'])) {
					if ($comment[$key]['parent']['status'] == 2) {
						$comment[$key]['parent']['content'] = '内容已被原作者删除';
					} elseif ($comment[$key]['parent']['status'] == 3) {
						$comment[$key]['parent']['content'] = '内容存在违规系统自动屏蔽';
					}
				}
		 	}
		}

		$this->assign('object', $object);
		$this->assign('object_id', $object_id);
		$this->assign('parent', empty($parent) ? array() : $parent);
		$this->assign('comment', $comment);
		return $this->fetch();
	}
}