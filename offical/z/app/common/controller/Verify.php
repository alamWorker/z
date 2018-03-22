<?php
namespace app\common\controller;

use app\common\controller\Base;
use app\common\controller\SendMsg;

class Verify extends Base
{
	protected $msg_obj;

	protected $msg_type;

	protected $msg_valid_time = 300;

	protected $result_json;

	public function __construct()
	{
		parent::__construct();
		$this->result_json = ['code' => lang('N_COMMON_SYS_ERR'), 'data' => [], 'msg' => lang('COMMON_SYS_ERR')];
	}
	
	// 参数赋值
	public function set($param)
	{
		foreach ($param as $key => $value) {
			if (isset($key)) {
				$this->$key = $value;
			}
		}
		$this->msg_type = strtoupper($this->msg_type);
		return $this;
	}

	// 检查允许发送的短信类型
	public function check_allow_type()
	{
	    $allow_type = ['LOGIN','REGISTER','FORGOT_PASS','FORGOT_PAY_PASS','MESSAGE'];
		if (in_array(strtoupper($this->msg_type), $allow_type)) {
			return true;
		}
		return false;
	}

	// 参数初始化
	public function param_init($param = [])
	{
	    foreach ($param as $key => $value) {
	        if ((isset($value) && empty($this->$value)) || !$this->check_allow_type()) {
	            $this->result_json = ['code' => lang('N_VERIFY_PARAM_ERR'), 'data' => [], 'msg' => lang('VERIFY_PARAM_ERR')];
	            return false;
	        }
	    }
	    return true;
	}

	// 发送验证码
	public function send_code()
	{
	    if (Z_DEBUG) {
            session('VERIFY_CODE_' . $this->msg_type . '_COUNT', 0);
	    }
	    if (!$this->param_init(['msg_type', 'msg_obj'])) {
	        return $this->result_json;
	    }
		$time = time();
		
	    $session_time = session('VERIFY_CODE_TIME');
	    $session_count = session('VERIFY_CODE_' . $this->msg_type . '_COUNT');
		if (!empty($session_time) && $time - $session_time < 60 || $session_count > 5) {
			return $this->result_json = ['code' => lang('N_VERIFY_FREQUENCY_HIGH'), 'data' => ['count' => $session_count, 'time' => date('H:i:s', $session_time)], 'msg' => lang('VERIFY_FREQUENCY_HIGH')];
		}
		$this->result_json['code'] = lang('N_VERIFY_SUC');
		$this->result_json['msg'] = lang('VERIFY_SEND_SUC');
		if (Z_DEBUG) {
			$code = '098765';
			$result = true;
		} else {
            $code = rand(100000, 999999);
			$aliyun_obj = new SendMsg();
			$aliyun_msg = config('aliyun.aliyun_msg');
			$result = $aliyun_obj->init(['sms_templateCode' => $aliyun_msg['sms_templateCode_verify'], 'rec_num' => $this->msg_obj, 'sms_param' => json_encode(['code' => (string)$code])])->send_msg();
		}
		if (!empty($result['code'])) {
			$this->result_json['code'] = lang('N_VERIFY_SEND_ERR');
			$this->result_json['data'] = [];
			$this->result_json['msg'] = lang('VERIFY_SEND_ERR');
		} else {
    		session('VERIFY_CODE_' . $this->msg_type . '_CODE', $code);
    		session('VERIFY_CODE_' . $this->msg_type . '_TIME', $time);
    		session('VERIFY_CODE_' . $this->msg_type . '_OBJ', $this->msg_obj);
    		session('VERIFY_CODE_' . $this->msg_type . '_COUNT', empty($session_count) ? 1 : $session_count+1);
    		session('VERIFY_CODE_TIME', $time);
		}

		return $this->result_json;
	}

	// 检查验证码
	public function check_code($code = 0)
	{
	    if (!$this->param_init(['msg_type', 'msg_obj']) || empty($code)) {
	        return $this->result_json;
	    }
	    $this->result_json = ['code' => lang('N_VERIFY_SUC'), 'data' => [], 'msg' => lang('VERIFY_CHECK_SUC')];

		$session_code = session('VERIFY_CODE_' . $this->msg_type . '_CODE');
		$session_time = session('VERIFY_CODE_' . $this->msg_type . '_TIME');
		$session_obj = session('VERIFY_CODE_' . $this->msg_type . '_OBJ');

		if (empty($session_code) || $code != $session_code) {
		    return $this->result_json = ['code' => lang('N_VERIFY_CODE_ERR'), 'data' => $session_code, 'msg' => lang('VERIFY_CODE_ERR')];
		}
		if (time() > $session_time + $this->msg_valid_time) {
			return $this->result_json = ['code' => lang('N_VERIFY_CODE_TIME_OUT'), 'data' => [], 'msg' => lang('VERIFY_CODE_TIME_OUT')];
		}
		if ($this->msg_obj != $session_obj) {
			return $this->result_json = ['code' => lang('N_VERIFY_OBJ_ERR'), 'data' => [], 'msg' => lang('VERIFY_OBJ_ERR')];
		}

		session('VERIFY_CODE_' . $this->msg_type . '_COUNT', 0);
		return $this->result_json;
	}
}