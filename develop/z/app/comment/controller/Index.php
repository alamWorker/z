<?php
namespace app\comment\Controller;

use app\common\controller\ApiBase;

use app\comment\model\CommentModel;
use app\design\model\AssessModel;
use app\design\model\DesignModel;

use think\Db;

class Index extends ApiBase
{

	public function __construct()
	{
		parent::__construct();

		$this->check_login();
	}

	/**
	 * 发表评论操作
	 */
	public function comment_save()
	{
		$model_comment = new CommentModel();

		$object = $this->request('object');
		$object_id = $this->request('object_id');
		$parent_id = $this->request('parent_id');
		$content = $this->request('content');

    	if (empty($object_id) || empty($content) || !in_array($object, array(1, 2))) {
        	return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
    	}

    	$parent_user_id = 0;
		if (!empty($parent_id)) {
			$condition = array(
				'z_comment.id' => $parent_id,
				'z_comment.is_deleted' => 0
			);
			$field = 'z_comment.*, u.nickname as parent_nickname';
			$join = [
				['user u', 'z_comment.user_id = u.id', 'LEFT']
			];
			$parent_comment = $model_comment->getInfo($condition, $field, $join);
			$parent_user_id = empty($parent_comment['user_id']) ? 0 : $parent_comment['user_id'];
		}

    	$data = array(
    		'user_id' => $this->user_info['id'],
    		'object' => $object,
    		'object_id' => $object_id,
    		'parent_id' => $parent_id,
    		'parent_user_id' => $parent_user_id,
    		'content' => strip_tags(htmlspecialchars_decode($content)),
    		'create_time' => time()
		);
		$insert = $model_comment->insert($data);

		$result = array(
			'comment_id' => $insert,
			'comment_time' => date('m月d日 H:i', time()),
			'comment_content' => $content,
			'user_avatar' => $this->user_info['avatar'],
			'user_nickname' => $this->user_info['nickname'],
			'parent_comment' => empty($parent_comment) ? '' : $parent_comment['content'],
			'parent_nickname' => empty($parent_comment['parent_nickname']) ? '' : $parent_comment['parent_nickname']
		);

        if ($insert !== false) {
        	if ($object == 1) {
	        	$this->_comment_num_operate($object_id, 1);
        	}
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), $result, lang('COMMON_SYS_SUC'));
        } else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
	}

	/**
	 * 删除评论操作
	 */
	public function comment_del()
	{
		$model_comment = new CommentModel();
		$comment_id = $this->request('comment_id');

		$condition = array(
			'user_id' => $this->user_info['id'],
			'id' => $comment_id
		);
		$data = array(
			'status' => 2
		);
		$del = $model_comment->alter($condition, $data);
		if ($del !== false) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['comment_id' => $comment_id], lang('COMMON_SYS_SUC'));
		} else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
	}

	/**
	 * 设计评价数量处理
	 * @param int $num 评论数量
	 */
	private function _comment_num_operate($design_id = 0, $num = 1)
	{
		$model_design = new DesignModel();

		$condition = array(
			'id' => empty($design_id) ? 0 : $design_id
		);
		$design = $model_design->getInfo($condition);
		$data = array(
			'comment' => $design['comment'] + $num
		);
		return $model_design->alter($condition, $data);
	}

	/**
	 * 评论点评操作
	 */
	public function comment_assess()
	{
		$model_assess = new AssessModel();
		$model_comment = new CommentModel();

		$comment_id = $this->request('comment_id');
		$type = $this->request('type');
		$type = (empty($type) && $type != 0) ? 1 : $type;

		// 评价详情
		$condition = array(
			'is_deleted' => 0,
			'id' => $comment_id
		);
		$comment = $model_comment->getInfo($condition);
    	if (empty($comment) || !in_array($type, array(0, 1))) {
        	return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
    	}

    	$data = array(
    		'user_id' => $this->user_info['id'],
    		'object' => 3,
    		'object_id' => $comment['id']
		);
    	$assess = $model_assess->getInfo($data);
    	if($type == 1 && empty($assess)) {
            $data['create_time'] = time();
            $insert_res = $model_assess->insert($data);
    	} else {
        	$delete_res = $model_assess->deleted($data);
    	}

        $assess = $comment['assess'];
		if ($type == 1 && empty($assess)) {
            $assess ++;
		} elseif ($type == 0 && !empty($assess)) {
            $assess --;
		}
        $update = array(
            'assess' => ($assess < 0) ? 0 : $assess
        );
        $condition = array(
            'id' => $comment_id
        );
    	$result = $model_comment->alter($condition, $update);

        if ($result !== false) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['comment_id' => $comment_id, 'type' => $type], lang('COMMON_SYS_SUC'));
        } else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
	}
}