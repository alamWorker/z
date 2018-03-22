<?php
namespace app\article\Controller;

use app\common\Controller\ApiBase;
use app\common\Controller\Upload;

use app\design\model\DesignModel;
use app\design\model\DesignImgModel;
use app\designer\model\DesignerModel;

class Index extends ApiBase
{

	CONST PUBLIC_IMG_PATH = '/upload/images/';

	CONST PRIVATE_IMG_PATH = '/../upload/images/';

	private $upload_obj = '';

	public function __construct()
	{
		parent::__construct();

		$this->check_login();

		if (empty($this->upload_obj)) {
			$this->upload_obj = new Upload();
		}
	}

	/**
	 * 初始化设计师信息
	 */
	protected function _get_designer()
	{
		$model_designer = new DesignerModel();

		// 设计师
		$condition = array(
			'user_id' => $this->user_info['id'],
			'is_deleted' => 0
		);
		return $designer = $model_designer->getInfo($condition);
	}

	/**
	 * 上传用户图片,单张
	 */
	public function upload_cover()
	{
		$upload_path = rtrim($_SERVER['DOCUMENT_ROOT'], '/') . SELF::PRIVATE_IMG_PATH . $this->user_info['id'] . '/';
		$code = lang('N_UPLOAD_IMG_ERR');
		$msg = lang('UPLOAD_IMG_ERR');

		if (empty($_FILES)) {
			$this->result_arr($code, [], $msg);
		}

		// 上传原图
		$this->upload_obj->set('path', $upload_path);
		$this->upload_obj->set('max_size', 10485760);
		$this->upload_obj->set('is_rand_name', true);

		if ($this->upload_obj->upload('image') !== true) {
			$error_msg = $this->upload_obj->get_error_msg();
			$this->result_arr($code, ['error_msg' => $error_msg], $msg);
		}

		// 复制图片
		$upload_file_name = $this->upload_obj->get_file_name();
		$copy_path = rtrim($_SERVER['DOCUMENT_ROOT'], '/') . SELF::PUBLIC_IMG_PATH . $this->user_info['id'] . '/';
		if (! file_exists($copy_path) || ! is_writable($copy_path)) {
            if (! @mkdir($copy_path, 0755, true)) {
				$this->result_arr($code, [], $msg);
            }
        }
        if (! @copy($upload_path . $upload_file_name, $copy_path . $upload_file_name)) {
			$this->result_arr($code, [], $msg);
        }
        // 生成缩略图
        $imgage_info = getimagesize($copy_path . $upload_file_name);
        $ratio = 1;
        $width = 400;
    	$ratio = $width/$imgage_info[0];
        if (! $this->upload_obj->img_create_small($copy_path . $upload_file_name, $width, $imgage_info[1] * $ratio, $copy_path . 's' . $upload_file_name)) {
			$this->result_arr($code, [], $msg);
        }

        // 添加水印
        $this->upload_obj->watermark($copy_path . $upload_file_name);
        $this->upload_obj->watermark($copy_path . 's' . $upload_file_name);

        $data = [
        	'src' => SELF::PUBLIC_IMG_PATH . $this->user_info['id'] . '/' . $upload_file_name,
        	'ssrc' => SELF::PUBLIC_IMG_PATH . $this->user_info['id'] . '/' . 's' . $upload_file_name
        ];

        $img_id = $this->_add_design_img(json_encode($data, true));
        if ($img_id === false) {
			$this->result_arr($code, [], $msg);
        }
        $data['img_id'] = $img_id;

		$this->result_arr(lang('N_COMMON_SYS_SUC'), $data, lang('COMMON_SYS_SUC'));
	}

	/**
	 * 上传文件保存图片数据
	 */
	protected function _add_design_img($src = '')
	{
		if (empty($src)) {
			return false;
		}
		$model_design_img = new DesignImgModel();

		$data = array(
			'src' => $src,
			'create_time' => time()
		);
		$insert = $model_design_img->insert($data);
		return $insert;
	}

	/**
	 * 保存文章
	 */
	public function save_article()
	{
		$model_design = new DesignModel();
		$model_designer = new DesignerModel();
		$model_design_img = new DesignImgModel();

		$design_id = $this->request('design_id');
		$title = $this->request('title');
		$intro = $this->request('intro');
		$content = $this->request('content');
		$img_ids = $this->request('img_ids');
		$img_ids = rtrim($img_ids, ',');
		$img_ids = empty($img_ids) ? array() : explode(',', $img_ids);
		$main_img_id = $this->request('main_img_id');
		$main_img_id = empty($main_img_id) ? (empty($img_ids[0]) ? 0 : $img_ids[0]) : $main_img_id;

		if ((empty($title) && (string)$title !== '0') || (empty($content) && (string)$content !== '0')) {
			$this->result_arr(lang('N_PARAM_ERR'), [], lang('PARAM_ERR'));
		}

		$designer = $this->_get_designer();

		// 文章更新
		$data = array(
			'title' => $title,
			'intro' => $intro,
			'content' => $content,
			'designer_id' => $designer['id']
		);
		if (empty($design_id)) {
			$save = $model_design->insert($data);
			$design_id = $save;
		} else {
			$data['create_time'] = time();
			$save = $model_design->alter(array('id' => $design_id), $data);
		}
		if ($save === false) {
			$this->result_arr(lang('N_COMMON_SYS_ERR'), [], lang('COMMON_SYS_ERR'));
		}

		// 文章图片更新
		$delete = $model_design_img->alter(array('design_id' => $design_id), array('is_deleted' => 1, 'is_main' => 0));
		$update_all = $model_design_img->alter(array('id' => array('in', $img_ids)), array('is_deleted' => 0, 'design_id' => $design_id));
		$update_main = $model_design_img->alter(array('id' => $main_img_id), array('is_main' => 1));
		if ($update_all === false || $update_main === false) {
			$this->result_arr(lang('N_COMMON_SYS_ERR'), [], lang('COMMON_SYS_ERR'));
		}

		// 更新设计师信息
		$model_designer->alter(array('id' => $designer['id']), array('design_num' => $designer['design_num'] + 1));

		$data = array(
			'design_id' => $design_id,
			'url' => '/designer/View/home'
		);
		$this->result_arr(lang('N_COMMON_SYS_SUC'), $data, lang('COMMON_SYS_SUC'));
	}

	/**
	 * 删除文章
	 */
	public function del_article()
	{
		$model_design = new DesignModel;

		$design_id = $this->request('design_id');
		if (empty($design_id)) {
			$this->result_arr(lang('N_PARAM_ERR'), [], lang('PARAM_ERR'));
		}
		$designer = $this->_get_designer();
		$condition = array(
			'id' => $design_id,
			'designer_id' => $designer['id']
		);
		$date = array(
			'status' => 3
		);
		$update = $model_design->alter($condition, $date);
		if ($update === false) {
			$this->result_arr(lang('N_COMMON_SYS_ERR'), [], lang('COMMON_SYS_ERR'));
		}
		$this->result_arr(lang('N_COMMON_SYS_SUC'), ['url' => '/designer/View/home'], lang('COMMON_SYS_SUC'));
	}
}

