<?php
namespace app\workclass\controller;

use app\common\controller\ViewBase;

use think\Db;

class View extends ViewBase
{
	public function __construct()
	{
		parent::__construct();
		$this->check_login();
	}

	// 班表功能主页
	public function index()
	{
        return 'workclass index';
	}

	// 展示班表
	public function show_schedule()
	{
		$middle_day = strtotime(date('Y-m-15'));
		for ($i = -2; $i <= 2; $i++) {
			$gap = 60 * 60 * 24 * 30 * $i;
			$time = $middle_day + $gap;
			$date_list[] = $time;
		}
		sort($date_list);
		foreach ($date_list as $key => $value) {
			$date_list[$key] = [
				'year' => date('Y', $value),
				'month' => intval(date('m', $value)) - 1
			];
		}

		$this->assign('date_list', $date_list);

	    $schedule_id = $this->request('schedule_id');

		$query1 = function($query){$query->where('s.status', 1)->where('s.creator', $this->user_info['id']);};
		$query2 = function($query){$query->where('s.status', 2);};
	    if (!empty($schedule_id)) {
			$field = 's.*,us.default';
			$schedule_info = Db::name('UserSchedule')->alias('us')
				->field($field)
				->join('__SCHEDULE__ s', 'us.schedule_id = s.id and us.deleted = 0 and us.schedule_id = '. $schedule_id . ' and us.user_id =' . $this->user_info['id'], 'LEFT')
				->where($query1)
				->whereor($query2)
				->find();
	    } else {
			$field = 's.*,us.default';
			$order = 'us.default desc, us.id desc';
			$schedule_info = Db::name('UserSchedule')->alias('us')
				->field($field)
				->join('__SCHEDULE__ s', 'us.schedule_id = s.id and us.deleted = 0 and us.user_id =' . $this->user_info['id'], 'LEFT')
				->where($query1)
				->whereor($query2)
				->order($order)
				->find();
	    }
	    if (empty($schedule_info)) {
	    	$this->redirect('/workclass/View/set_schedule');
	    }
	    $schedule_info['start_time'] = date('Y-m-d', $schedule_info['start_time']);
		$this->assign('schedule_info', $schedule_info);

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
					$sign_list[] = $v['sign'];
	                if (empty($show_class_list[$v['id']])) {
	                    $show_class_list[$v['id']] = $v;
	                }
				}
				if (empty($today_class) && $today_class_id == $v['id']) {
					$today_class = $v;
				}
			}
		}
		$this->assign('today_class', $today_class);
		$this->assign('class_list', $show_class_list);
		$this->assign('sign_list', $sign_list);

		$this->assign('schedule_list', $this->_get_schedule_list());
	    return $this->fetch();
	}
	
	/**
	 * 设置班次
	 */
	public function set_class()
	{
		$class_id = $this->request('class_id');
		if (!empty($class_id)) {
			$field = 'c.*';
			$where['c.creator'] = $this->user_info['id'];
			$where['c.id'] = $class_id;
			$where['c.deleted'] = 0;
			$class_info = Db::name('Class')->alias('c')
				->field($field)
				->where($where)
				->find();

			$this->assign('class_info', $class_info);
		}

		$field = 'c.id,c.name,c.sign,c.rank,c.status,c.creator';
        $condition['uc.user_id'] = $this->user_info['id'];
        $condition['uc.deleted'] = 0;
        $join = [['__CLASS__ c', 'uc.class_id = c.id']];
        $order = 'c.rank desc, id desc';
        $class_list = Db::name('UserClass')->alias('uc')->field($field)->join($join)->where($condition)->order($order)->select();
		$this->assign('class_list', $class_list);
	    return $this->fetch();
	}
	
	/**
	 * 设置班表
	 */
	public function set_schedule()
	{
		$condition['uc.user_id'] = $this->user_info['id'];
        $condition['uc.deleted'] = 0;
        $join = [['__CLASS__ c', 'uc.class_id = c.id']];
        $class_list = Db::name('UserClass')->alias('uc')->field('c.*')->join($join)->where($condition)->order('rank desc,id desc')->select();
		$this->assign('class_list', $class_list);

	    $schedule_id = $this->request('schedule_id');
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
			$schedule_info['start_time'] = empty($schedule_info) ? date('Y-m-d', time()) : date('Y-m-d', $schedule_info['start_time']);
			$this->assign('schedule_info', $schedule_info);

			if (!empty($schedule_info) && !empty($schedule_info['law'])) {
				$law = json_decode($schedule_info['law'], true);
				$law_result = [];
				if (!empty($law)) {
					foreach ($law as $key => $value) {
						foreach ($class_list as $k => $v) {
							if($v['id'] == $value) {
								$law_result[$key]['id'] = $v['id'];
								$law_result[$key]['name'] = $v['name'];
							}
						}
					}
				}
				$this->assign('law', $law_result);
			}
		}

		$this->assign('schedule_list', $this->_get_schedule_list());

	    return $this->fetch();
	}

	/**
	 * 获取班表列表
	 */
	public function _get_schedule_list()
	{
		$field2 = 's.id, s.name, s.creator, us.default';
		$query1 = function($query){$query->where('s.status', 1)->where('s.creator', $this->user_info['id']);};
		$query2 = function($query){$query->where('s.status', 2);};
		$schedule_list = Db::name('UserSchedule')->alias('us')
			->field($field2)
			->join('__SCHEDULE__ s', 'us.schedule_id = s.id and us.deleted = 0 and us.user_id = ' . $this->user_info['id'], 'LEFT')
			->where($query1)
			->whereor($query2)
			->order('us.default desc, id desc')
			->select();
        return $schedule_list;
	}
}