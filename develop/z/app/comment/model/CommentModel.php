<?php
namespace app\comment\model;

use think\Db;
use app\common\model\BaseModel;

class CommentModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
		
		$this->database = 'Comment';
	}

	/**
	 * 获取评价列表最新三条以及其父评论
	 * @param int $object_id	评价对象id
	 * @param int $object 		评价对象类型
	 * @return array $comment 	评价数组
	 */
	public function getNewComment($object_id, $object = 1)
	{
		$condition = array(
			'z_comment.object' => $object,
			'z_comment.object_id' => $object_id,
			'z_comment.is_deleted' => 0,
			'z_comment.status' => 1
		);
		$field = 'z_comment.*, u.nickname as user_nickname, u.avatar, a.id as assess_id';
		$limit = '0,3';
		$order = 'create_time DESC, id DESC';
		$join = [
			['z_user u', 'u.id = z_comment.user_id', 'LEFT'],
			['assess a', 'a.object_id = z_comment.id AND a.object = 3', 'LEFT']
		];
		$comment = $this->getList($condition, $field, $limit, $join, $order);
		foreach ($comment as $key => $value) {
			$condition = array(
				'z_comment.object' => $object,
				'z_comment.object_id' => $object_id,
				'z_comment.is_deleted' => 0,
				'z_comment.id' => $value['parent_id']
			);
			$field = 'z_comment.content, u.nickname as user_nickname';
			$join = [
				['z_user u', 'u.id = z_comment.user_id', 'LEFT']
			];
			$comment[$key]['parent'] = $this->getInfo($condition, $field, $join);
		}
		return $comment;
	}
}