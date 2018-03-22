<?php
namespace app\workclass\controller;

use app\common\controller\ApiBase;

use app\workclass\model\ClassModel;
use app\workclass\model\UserClassModel;
use app\workclass\model\ScheduleModel;
use app\workclass\model\UserScheduleModel;

use think\Db;

class Index extends ApiBase
{

	public function __construct()
	{
		parent::__construct();
		
		$this->check_login();
	}

    /**
     * 设定班次
     */
    public function set_class_info()
	{
        $model_class = new ClassModel();
        $model_user_class = new UserClassModel();
        $time = time();

        $condition['id'] = $id = $this->request('id');
        $data['name'] = $this->request('name');
        $data['sign'] = $this->request('sign');
        $data['rank'] = $this->request('rank');
        $data['status'] = $this->request('status');
        $data['status'] = empty($data['status']) ? 1 : ($data['status'] == 0 ? 1 : 2);

        if (empty($data['name']) || !isset($data['sign']) || !isset($data['rank']) || !isset($data['status'])) {
            return $this->result_arr(lang('N_PARAM_ERR'), [], lang('PARAM_ERR'));
        }
        
        if (empty($id)) {
            $data['create_time'] = $time;
            $data['creator'] = $this->user_info['id'];
            $model_class->startTrans();
            $result = $model_class->insert($data);

            $model_user_class->startTrans();
            $data_uc['user_id'] = $this->user_info['id'];
            $data_uc['class_id'] = $result;
            $data_uc['create_time'] = $time;
            $result_uc = $model_user_class->insert($data_uc);
            if ($result === false || $result_uc === false) {
                $model_class->rollback();
                $model_user_class->rollback();
            }
            $model_class->commit();
            $model_user_class->commit();
        } else {
            $class_info = Db::name('Class')->where(['id' => $id, 'creator' => $this->user_info['id'], 'deleted' => 0])->find();
            if (empty($class_info)) {
                return $this->result_arr(lang('N_SET_CLASS_ERR'), [], lang('SET_CLASS_ERR') . '(' .lang('HAVE_NO_PERMISSION') . lang('CLASS') . ')');
            }
            $result = $model_class->alter($condition, $data);
        }

        if ($result === false) {
            return $this->result_arr(lang('N_SET_CLASS_ERR'), [], lang('SET_CLASS_ERR'));
        }
        $id = empty($id) ? $result : $id;
        return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['id' => $id], lang('SET_CLASS_SUC'));
	}

    /**
     * 班次列表
     */
    public function get_class_list()
    {
        $field = 'c.id,c.name,c.sign,c.rank,c.status,c.creator';
        $condition['uc.user_id'] = $this->user_info['id'];
        $condition['uc.deleted'] = 0;
        $join = [['__CLASS__ c', 'uc.class_id = c.id']];
        $order = 'c.rank desc, id desc';
        $class_list = Db::name('UserClass')->alias('uc')->field($field)->join($join)->where($condition)->order($order)->select();

        foreach ($class_list as $key => $value) {
            $class_list[$key]['creator'] = ($value['creator'] == $this->user_info['id']) ? '1' : '0';
        }
        
        return $this->result_arr('200', ['class_list' => $class_list]);
    }

    /**
     * 班次信息
     */
    public function get_class_info()
    {
        $class_id = $this->request('class_id');
        if (!empty($class_id)) {
            $field = 'c.id, c.name, c.sign, c.status, c.rank, c.creator';
            $where['uc.id'] = $class_id;
            $where['uc.deleted'] = 0;
            $class_info = Db::name('UserClass')->alias('uc')
                ->join('__CLASS__ c', 'uc.class_id = c.id')
                ->field($field)
                ->where($where)
                ->find();
            if (!empty($class_info)) {
                return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['class_info' => $class_info], '');
            }
        }
        return $this->result_arr(lang('N_GET_DATA_ERR'), [], lang('GET_DATA_ERR'));
    }
	
	/**
	 * 删除班次
	 */
	public function del_class_info()
	{
	    $id = $this->request('id');
	    if (empty($id)) {
	        return $this->result_arr(lang('N_PARAM_ERR'), [], lang('PARAM_ERR'));
	    }
	    $model_class = Db::name('Class');
	    $model_user_class = Db::name('UserClass');

	    $update['deleted'] = 1;

	    $where_u['id'] = $id;
	    $where_u['creator'] = $this->user_info['id'];
	    $model_class->where($where_u)->update($update);

	    $where_uc['class_id'] = $id;
	    $where_uc['user_id'] = $this->user_info['id'];
	    $model_user_class->where($where_uc)->update($update);
        return $this->result_arr(lang('N_COMMON_SYS_SUC'), [], lang('DEL_CLASS_SUC'));
	}

    /* ---------------------------------------------------------------------------------------------------- */

    /**
     * 设定班表
     */
    public function set_schedule_info()
    {
        $model_schedule = new ScheduleModel();
        $model_user_schedule = new UserScheduleModel();
        $time = time();

        $condition['id'] = $id = $this->request('id');

        $data['name'] = $this->request('name');
        $data['start_time'] = strtotime($this->request('start_time'));
        $data['period'] = $this->request('period');
        $data['law'] = $this->request('law');
        $data['status'] = $this->request('status');
        $data['status'] = empty($data['status']) ? 1 : ($data['status'] == 0 ? 1 : 2);

        if (empty($data['name']) || empty($data['start_time']) || empty($data['period']) || empty($data['law']) || !isset($data['status'])) {
            return $this->result_arr(lang('N_PARAM_ERR'), [], lang('PARAM_ERR'));
        }

        $data_us['default'] = $this->request('is_default');

        if (empty($id)) {
            $data['create_time'] = $time;
            $data['creator'] = $this->user_info['id'];
            $model_schedule->startTrans();
            $result = $model_schedule->insert($data);

            $model_user_schedule->startTrans();
            $data_us['user_id'] = $this->user_info['id'];
            $data_us['schedule_id'] = $result;
            $data_us['create_time'] = $time;
            $result_us = $model_user_schedule->insert($data_us);
            if ($result === false || $result_us === false) {
                $model_schedule->rollback();
                $model_user_schedule->rollback();
            }
            $model_schedule->commit();
            $model_user_schedule->commit();
        } else {
            if (intval($data_us['default']) === 1) {
                $model_user_schedule->alter(['user_id' => $this->user_info['id']],['default' => 0]);
                $model_user_schedule->alter(['user_id' => $this->user_info['id'], 'schedule_id' => $id], $data_us);
            }
            $schedule_info = Db::name('Schedule')->where(['id' => $id, 'creator' => $this->user_info['id'], 'deleted' => 0])->find();
            if (empty($schedule_info)) {
                return $this->result_arr(lang('N_HAVE_NO_PERMISSION'), [], lang('HAVE_NO_PERMISSION') . lang('SCHEDULE'));
            }
            $result = $model_schedule->alter($condition, $data);
        }

        if ($result === false) {
            return $this->result_arr(lang('N_SET_SCHEDULE_ERR'), [], lang('SET_SCHEDULE_ERR') . '(' .lang('HAVE_NO_PERMISSION') . lang('CLASS') . ')');
        }

        $id = empty($id) ? $result : $id;
        return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['id' => $id, 'url' => '/workclass/View/show_schedule?schedule_id=' . $id], lang('SET_SCHEDULE_SUC'));
    }

    /**
     * 班表列表
     */
    public function get_schedule_list()
    {
        $field = 's.name, s.start_time, s.period, s.law, us.default, s.status, s.creator';
        $join = [['__SCHEDULE__ s', 'us.schedule_id = s.id']];
        $condition['us.user_id'] = $this->user_info['id'];
        $condition['us.deleted'] = 0;
        $order = 'us.default desc, us.id desc';
        $schedule_list = Db::name('UserSchedule')->alias('us')->field($field)->join($join)->where($condition)->order($order)->select();

        foreach ($schedule_list as $key => $value) {
            $schedule_list[$key]['creator'] = ($value['creator'] == $this->user_info['id']) ? '1' : '0';
        }

        return $this->result_arr(lang('N_COMMON_SUC'), ['schedule_list' => array_values($schedule_list)]);
    }

    /**
     * 获取班表
     */
    public function get_schedule_info()
    {
        $schedule_id = $this->request('id');
        if (!empty($schedule_id)) {
            $field = 's.*,us.default';
            $where['us.user_id'] = $this->user_info['id'];
            $where['us.schedule_id'] = $schedule_id;
            $where['us.deleted'] = 0;
            $schedule_info = Db::name('UserSchedule')->alias('us')
                ->field($field)
                ->join('__SCHEDULE__ s', 'us.schedule_id = s.id', 'LEFT')
                ->where($where)
                ->find();
        } else {
            $field = 's.*,us.default';
            $where['us.user_id'] = $this->user_info['id'];;
            $where['us.deleted'] = 0;
            $schedule_info = Db::name('UserSchedule')->alias('us')
                ->field($field)
                ->join('__SCHEDULE__ s', 'us.schedule_id = s.id', 'LEFT')
                ->where($where)
                ->find();
        }
        if (empty($schedule_info['id'])) {
            return $this->result_arr(lang('N_GET_DATA_ERR'), [], lang('GET_DATA_ERR'));
        }
        $schedule_info['start_time'] = date('Y-m-d', $schedule_info['start_time']);

        $schedule_info['law'] = json_decode($schedule_info['law'], true);
        $law_str = implode(',', array_unique($schedule_info['law']));

        $condition['uc.user_id'] = $this->user_info['id'];
        $condition['uc.class_id'] = ['in', $law_str];
        $join = [['__CLASS__ c', 'uc.class_id = c.id']];
        $class_list = Db::name('UserClass')->alias('uc')->field('c.id, c.name, c.sign')->join($join)->where($condition)->order('rank desc,id desc')->select();
        
        $sign_list = $today_class = $show_class_list = [];
        $today_class_id = calculate_law($schedule_info);
        foreach ($schedule_info['law'] as $key => $value) {
            foreach ($class_list as $k => $v) {
                if ($value == $v['id']) {
                    $sign_list[] = 'sign-text-color'.$v['sign'].' no-border';
                    if (empty($show_class_list[$v['id']])) {
                        $show_class_list[$v['id']] = $v;
                    }
                }
                // 当天的班次
                if (empty($today_class) && $today_class_id == $v['id']) {
                    $today_class = $v;
                }
            }
        }
        $show_class_list = array_values($show_class_list);

        if (!empty($schedule_info)) {
            return $this->result_arr(lang('N_COMMON_SYS_SUC'), ['schedule_info' => $schedule_info, 'sign_list' => $sign_list, 'class_list' => $show_class_list, 'today_class' => $today_class], '');
        }
        return $this->result_arr(lang('N_GET_DATA_ERR'), [], lang('GET_DATA_ERR'));
    }


    /**
     * 删除班表
     */
    public function del_schedule_info()
    {
        $id = $this->request('schedule_id');
        if (empty($id)) {
            return $this->result_arr(lang('N_PARAM_ERR'), [], lang('PARAM_ERR'));
        }
        $model_schedule = Db::name('Schedule');
        $model_user_schedule = Db::name('UserSchedule');
    
        $update['deleted'] = 1;
    
        $where_s['id'] = $id;
        $where_s['creator'] = $this->user_info['id'];
        $model_schedule->where($where_s)->update($update);
    
        $where_sc['schedule_id'] = $id;
        $where_sc['user_id'] = $this->user_info['id'];
        $model_user_schedule->where($where_sc)->update($update);
        return $this->result_arr(lang('N_COMMON_SYS_SUC'), [], lang('DEL_SCHEDULE_SUC'));
    }
}
