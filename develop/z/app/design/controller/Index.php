<?php
namespace app\design\Controller;

use app\common\controller\ApiBase;

use app\design\model\AssessModel;
use app\design\model\DesignModel;
use app\design\model\DesignerModel;
use app\design\model\FavoritesModel;

use think\Db;

class Index extends ApiBase
{
    
    public function __construct()
    {
        parent::__construct();
        
        $this->check_login();
    }

    /**
     * 设计点评操作
     * @param int $design_id 设计图稿id
     * @param int $type 0-取消好评 1-好评
     */
    public function design_assess()
    {
        $model_assess = new AssessModel();
        $model_design = new DesignModel();

    	$design_id = $this->request('design_id');
    	$type = $this->request('type');
        $type = (empty($type) && $type != 0) ? 1 : $type;

		// 设计图稿详情
        $design = $model_design->getDesignInfo($design_id);
    	if (empty($design) || !in_array($type, array(0, 1))) {
        	return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
    	}

    	// 当前用户点评操作
    	$data = array(
    		'user_id' => $this->user_info['id'],
    		'object' => 1,
    		'object_id' => $design_id
		);
    	$assess = $model_assess->getList($data, '*');

        // 删除往期点评
        $delete_res = $model_assess->deleted($data);
        if ($type == 1) {
            // 添加一条新的
            $data['create_time'] = time();
            $insert_res = $model_assess->insert($data);
        }

        $assess = $design['assess'];
		if ($type == 1 && empty($assess)) {
            $assess ++;
		} elseif ($type == 0 && !empty($assess)) {
            $assess --;
		}
        $update = array(
            'assess' => ($assess < 0) ? 0 : $assess
        );
        $condition = array(
            'id' => $design_id
        );
    	$result = $model_design->alter($condition, $update);

        if ($result !== false) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), [], lang('COMMON_SYS_SUC'));
        } else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
    }

    /**
     * 设计收藏操作
     * @param int $design_id 设计id
     * @param int $type 0-取消收藏 1-收藏
     */
    public function design_fav()
    {
        $model_favorites = new FavoritesModel();
        $model_design = new DesignModel();

        $design_id = $this->request('design_id');
        $type = $this->request('type');
        $type = (empty($type) && $type != 0) ? 1 : $type;

        // 设计图稿详情
        $design = $model_design->getDesignInfo($design_id);
        // 收藏详情
        $data = array(
            'user_id' => $this->user_info['id'],
            'object' => 1,
            'object_id' => $design_id
        );
        $fav = $model_favorites->getInfo($data);
        if (empty($design) || !in_array($type, array(0, 1))) {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
        // 取消收藏
        if (!empty($fav) && $type == 0) {
            $delete_res = $model_favorites->deleted($data);
            if ($delete_res === false) {
                return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
            }
        }

        if ($type == 1) {
            if (empty($fav)) {
                $data['create_time'] = time();
                $insert_res = $model_favorites->insert($data);
                $fav_num = $design['fav'] + 1;
            } else {
                $fav_num = $design['fav'];
            }
        } else {
            $fav_num = $design['fav'] - 1;
        }
        $condition = array(
            'id' => $design_id
        );
        $update = array(
            'fav' => ($fav_num < 0) ? 0 : $fav_num
        );
        $update_res = $model_design->alter($condition, $update);

        if ($update_res !== false) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), [], lang('COMMON_SYS_SUC'));
        } else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
    }
}