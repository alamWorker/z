<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

// 手机号码检查
if (!function_exists('check_mobile')) {
	function check_mobile($mobile) {
		if (!empty($mobile) && preg_match("/^1[34578]{1}\d{9}$/",$mobile)) {
			return true;
		}
		return false;
	}
}

if (!function_exists('calculate_law')) {
	/**
	 * 计算日期班表班次
	 * @param int $date 被计算的时间戳
	 * @param obj|int 班次详细信息|班次id-自动查询班次资料
	 * @return int 班次id
	 */
	function calculate_law($schedule_info = [], $time = 0)
	{
		if (empty($time)) {
			$time = time();
		}
		if (empty($schedule_info) || is_numeric($schedule_info)) {
			$field = 's.id, s.law, s.name, s.period, s.start_time';
			$query1 = function($query){$query->where('s.status', 1)->where('s.creator', $this->user_info['id']);};
			$query2 = function($query){$query->where('s.status', 2);};
			$join_on = 'us.schedule_id = s.id and us.deleted = 0 and us.user_id = ' . $this->user_info['id'];
			$join_on = is_numeric($schedule_info) ? ($join_on . ' and schedule_id = ' . $schedule_info) : $join_on;
			$join = [['__SCHEDULE__ s', $join_on, 'LEFT']];
			$order = 'us.default desc, us.id desc';
			$schedule_info = Db::name('UserSchedule')->alias('us')->field($field)->join($join)->where($query1)->whereor($query2)->order($order)->find();
		}
		if (empty($schedule_info)) {
			return false;
		}

		// 间隔的天数
		$num = ((strtotime(date('Y-m-d')) - strtotime($schedule_info['start_time'])) % (60 * 60 * 24 * $schedule_info['period'])) / 60 / 60 / 24;
		if ($num > 0) {
			$result = $num;
		} elseif ($num < 0) {
			$result = $schedule_info['period'] + $num;
		} else {
			$result = 0;
		}
		return $schedule_info['law'][$result];
	}
}

if (!function_exists('get_client_ip')) {
	/**
	 * 获取客户端IP地址
	 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
	 * @param boolean $adv 是否进行高级模式获取（有可能被伪装） 
	 * @return mixed
	 */
	function get_client_ip($type = 0,$adv = false) {
	    $type = $type ? 1 : 0;
	    if($adv){
	        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
	            $pos = array_search('unknown',$arr);
	            if(false !== $pos) unset($arr[$pos]);
	            $ip = trim($arr[0]);
	        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
	            $ip = $_SERVER['HTTP_CLIENT_IP'];
	        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
	            $ip = $_SERVER['REMOTE_ADDR'];
	        }
	    } elseif (isset($_SERVER['REMOTE_ADDR'])) {
	        $ip = $_SERVER['REMOTE_ADDR'];
	    }
	    // IP地址合法验证
	    $long = sprintf('%u',ip2long($ip));
	    $ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
	    return $ip[$type];
	}
}