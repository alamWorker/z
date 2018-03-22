<?php
namespace app\designer\Controller;

use app\common\controller\ApiBase;

use app\design\model\AssessModel;
use app\design\model\DesignModel;
use app\designer\model\DesignerModel;
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
     * 设计师收藏操作
     * @param int $design_id 设计id
     * @param int $type 0-取消收藏 1-收藏
     */
    public function designer_fav()
    {
        $model_favorites = new FavoritesModel();
        $model_designer = new DesignerModel();

        $designer_id = $this->request('designer_id');
        $type = $this->request('type');
        $type = (empty($type) && $type != 0) ? 1 : $type;

        // 设计图稿详情
        $condition = array(
            'id' => $designer_id
        );
        $designer = $model_designer->getInfo($condition);
        // echo json_encode($designer, true);die;
        // 收藏详情
        $data = array(
            'user_id' => $this->user_info['id'],
            'object' => 2,
            'object_id' => $designer_id
        );
        $fav = $model_favorites->getInfo($data);
        if (empty($designer) || !in_array($type, array(0, 1))) {
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
                $fav_num = $designer['fav'] + 1;
            } else {
                $fav_num = $designer['fav'];
            }
        } else {
            $fav_num = $designer['fav'] - 1;
        }

        $condition = array(
            'id' => $designer_id
        );
        $update = array(
            'fav' => ($fav_num < 0) ? 0 : $fav_num
        );
        $update_res = $model_designer->alter($condition, $update);

        if ($update_res !== false) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), [], lang('COMMON_SYS_SUC'));
        } else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
    }

    /**
     * 保存资料信息
     */
    public function save_info()
    {
        $data['name'] = $this->request('name');
        if (empty($data['name'])) {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
        $data['address'] = $this->request('address');
        $data['idea'] = $this->request('idea');
        $data['style'] = $this->request('style');
        $data['sign'] = $this->request('sign');
        $data['is_public'] = $this->request('is_public');

        $model_designer = new DesignerModel();
        $update = $model_designer->alter(array('id' => $this->user_info['designer_id']), $data);

        if ($update !== false) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['url' => 'back'], lang('COMMON_SYS_SUC'));
        } else {
            return $this->result_arr(lang('N_OPERATE_ERR'), [], lang('OPERATE_ERR'));
        }
    }
    
    /**
     * 互动记录
     */
    /*public function log_get_list()
    {
        $model_designer = new DesignerModel();

        $designer_id = $this->user_info['designer_id'];
        $limit = '0,20';
        $log_list = $model_designer->get_log_list($designer_id, $limit);
    }*/
}