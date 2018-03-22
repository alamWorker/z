<?php
namespace app\design\controller;

use app\common\controller\ViewBase;

use app\design\model\AdModel;
use app\design\model\AssessModel;
use app\design\model\DesignModel;
use app\designer\model\DesignerModel;
use app\design\model\DesignImgModel;
use app\comment\model\CommentModel;
use app\design\model\FavoritesModel;

use think\Db;

class View extends ViewBase
{
	public function __construct()
	{
		parent::__construct();
		
		$check_login_arr = array(
			'article'
		);
		if (in_array($this->request->action(), $check_login_arr)) {
			$this->check_login();
		}
	}

	/**
	 * 设计图稿列表
	 */
	public function home()
	{
		$model_design = new DesignModel();
		$model_ad = new AdModel();

		// 轮播图
		$condition = [
			'type' => 0,
			'is_deleted' => 0
		];
		$slide = $model_ad->getList($condition);

		// 设计列表
		$search_content = $this->request('search_content');
		$order_type = $this->request('order_type');
		$order_type = empty($order_type) ? 1 : $order_type;

		$condition = [
			'z_design.status' => 1
		];
		if (!empty($search_content)) {
			$condition['de.name|title|intro'] = array('like', '%' . $search_content . '%');
		}
		if ($order_type == 1) {
			$order = 'fav DESC';
		} elseif ($order_type == 2) {
			$order = 'create_time DESC';
		} elseif ($order_type == 3) {
			$order = 'is_recommend DESC';
		}
		$field = 'z_design.*, de.name, de.user_id, u.avatar, di.src as main_src';
		if (!empty($this->user_info['id'])) {
			$field .= ',f.id as fav_id';
		}
		$join = [
			['z_designer de', 'de.id = z_design.designer_id AND de.is_deleted = 0', 'LEFT'],
			['z_user u', 'u.id = z_designer.user_id', 'LEFT'],
			['z_design_img di', 'di.design_id = z_design.id AND di.is_main = 1 AND di.is_deleted = 0', 'LEFT']
		];
		if (!empty($this->user_info['id'])) {
			$join[] = ['z_favorites f', 'f.object_id = de.id AND f.object = 2 AND f.user_id = ' . $this->user_info['id'], 'LEFT'];
		}
		$count = $model_design->getCount($condition, $field, $join, '', $group = '');
		$page = $this->getPage($count);
		$design = $model_design->getList($condition, $field, $page['limit'], $join, $order, $group = '');

		foreach ($design as $key => $value) {
			$design[$key]['avatar'] = empty($value['avatar']) ? lang('DEFAULT_HEADER') : $value['avatar'];
			$design[$key]['main_src'] = empty($value['main_src']) ? lang('DEFAULT_IMG') : json_decode($value['main_src'], true)['ssrc'];
			$design[$key]['content'] = strip_tags(htmlspecialchars_decode($value['content']),'<br>');
			$design[$key]['content'] = str_replace('<br/>', ' ', $design[$key]['content']);
			$design[$key]['content'] = str_replace('<br>', ' ', $design[$key]['content']);
		}

		if (!empty($this->user_info)) {
			$this->assign('user_info', $this->user_info);
		}
		$this->assign('search_content', $search_content);
		$this->assign('order_type', $order_type);
		$this->assign('slide', $slide);
		$this->assign('design', $design);
		return $this->fetch();
	}

	/**
	 * 设计图稿详情
	 */
	public function detail()
	{
		$design_id = $this->request('design_id');
		if (empty($design_id)) {
			$this->redirect('/design/View/home');
		}

		$model_assess = new AssessModel();
		$model_design = new DesignModel();
		$model_design_img = new DesignImgModel();
		$model_comment = new CommentModel();
		$model_favorites = new FavoritesModel();
		
		// 设计
		$design = $model_design->getDesignInfo($design_id);
		if (empty($design)) {
			$this->redirect('/design/View/home');
		}

		if (!empty($this->user_info)) {
			// 设计收藏
			$condition = array(
				'object_id' => $design_id,
				'object' => 1,
				'user_id' => $this->user_info['id']
			);
			$fav_d = $model_favorites->getInfo($condition);
			$this->assign('fav_d', $fav_d);

			// 设计师收藏
			$condition = array(
				'object_id' => $design['designer_id'],
				'object' => 2,
				'user_id' => $this->user_info['id']
			);
			$fav_de = $model_favorites->getInfo($condition);
			$this->assign('fav_de', $fav_de);

			// 点评
			$condition = array(
				'object_id' => $design_id,
				'object' => 1,
				'user_id' => $this->user_info['id']
			);
			$assess = $model_assess->getInfo($condition);
			$this->assign('assess',$assess);
		}

		// 图片
		$img = $model_design_img->getDesignMainImg($design_id);
		foreach ($img as $key => $value) {
			$img[$key]['src'] = json_decode($value['src'], true)['ssrc'];
		}

		// 评价
		$comment = $model_comment->getNewComment($design_id);
		$this->assign('design',$design);
		$this->assign('img',$img);
		$this->assign('comment',$comment);
		return $this->fetch();
	}

	/**
	 * 文章编辑发布页面
	 */
	public function article()
	{
		$model_design = new DesignModel();
		$model_design_img = new DesignImgModel();

		$design_id = $this->request('design_id');
		$condition = array(
			'designer_id' => $this->user_info['designer_id'],
			'id' => $design_id,
			'is_deleted' => 0
		);
		$design = $model_design->getInfo($condition);

		if (!empty($design)) {
			$condition = array(
				'design_id' => $design_id,
				'is_deleted' => 0
			);
			$design['img'] = $model_design_img->getList($condition);
			$design['img_ids'] = '';
			foreach ($design['img'] as $key => $value) {
				$design['img'][$key]['src'] = json_decode($value['src'], true)['ssrc'];
				$design['img_ids'] .= $value['id'] . ',';
				if ($value['is_main'] == 1) {
					$design['main_img_id'] = $value['id'];
				}
			}
		}

		$this->assign('design',$design);
		return $this->fetch();
	}
}