<?php
namespace app\member\controller;

use app\common\controller\ApiBase;
use app\common\controller\Verify;

use app\member\model\UserModel;

use think\Db;

class Index extends ApiBase
{
    
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * 发送验证码api
	 */
	public function verify()
	{
	    $msg_type = $this->request('msg_type');
	    $msg_obj = $this->request('msg_obj');
	    $msg_code = $this->request('msg_code');

	    if (empty($msg_obj)) {
    		return $this->result_arr('201', [], '没有发送对象');
	    }
	    
	    $verify_obj = new Verify();
	    $action_obj = $verify_obj->set(['msg_type' => $msg_type, 'msg_obj' => $msg_obj]);
	    if (empty($msg_code)) {
	       $result = $action_obj->send_code();
	    } else {
	       $result = $action_obj->check_code($msg_code, time(), $msg_obj);
	    }
		return $this->result_arr($result['code'], $result['data'], $result['msg']);
	}

    /**
     * 注册api
     */
    public function register()
    {
        $model_user = new UserModel();

        $mobile = $this->request('mobile');
        $verify = $this->request('verify');
        $password = $this->request('password');
        
        if (strlen($password) < 6 || strlen($password) > 16) {
            return $this->result_arr('202', [count($password)], '密码长度应为6~16位');
        }
        
    	// 验证码
        $verify_obj = new Verify();
        $check_verify = $verify_obj->set(['msg_type' => 'register','msg_obj' => $mobile])->check_code($verify);
    	if ($check_verify['code'] != 200) {
    	    return $this->result_arr($check_verify['code'], [], $check_verify['msg']);
    	}
    	// 验证用户存在
        $user_info = $this->get_user_info($mobile);
        if ($user_info !== false) {
            return $this->result_arr('202', [], '手机号码已注册');
        }
        
        $user_id = $model_user->register($mobile, md5(md5($password)));
        if ($user_id === false) {
            return $this->result_arr('201', [], '注册失败');
        }
        return $this->result_arr('200', ['url' => '/member/view/login'], '注册成功');
    }
    
    /**
     * 登录
     */
    public function login()
    {
        if (!empty($this->user_info)) {
            return $this->result_arr('200', ['url' => '/workclass/view/index'], '登录成功');
        }
        $model_user = new UserModel();
        
        $mobile = $this->request('mobile');
        $password = $this->request('password');
        
        $user_info = $this->get_user_info($mobile);
        if ($user_info == false) {
            return $this->result_arr('201', [$mobile], '手机号码未注册');
        }
        if ($user_info['password'] !== md5(md5($password))) {
            return $this->result_arr('202', [], '密码错误');
        }
        
        // 修改登录状态
        $update_user = [
            'last_login_time' => time()
        ];
        $where = [
            'mobile' => $mobile
        ];
        $update = $model_user->alter($where, $update_user);

        session('user_id', $user_info['id']);
        session('login_time', time());

        $callback_url_param = session('callback_url_param');
        $url = empty(session('callback_url')) ? '/' : session('callback_url');
        if (!empty($callback_url_param)) {
            $url = $url . '?';
            foreach ($callback_url_param as $key => $value) {
                $url = $url . $key . '=' . $value . '&';
            }
        }
        return $this->result_arr('200', ['url' => $url], '登录成功');
    }
    
    /**
     * 忘记密码
     */
    public function forgot_pass()
    {
        $model_user = new UserModel();
        
        $mobile = $this->request('mobile');
        $verify = $this->request('verify');
        $password = $this->request('password');
        
        if (strlen($password) < 6 || strlen($password) > 16) {
            return $this->result_arr('202', [count($password)], '密码长度应为6~16位');
        }
        
        $verify_obj = new Verify();
        $check_verify = $verify_obj->set(['msg_type' => 'forgot_pass', 'msg_obj' => $mobile])->check_code($verify);
        if ($check_verify['code'] != 200) {
            return $this->result_arr($check_verify['code'], $check_verify['data'], $check_verify['msg']);
        }

        // 验证用户存在
        $user_info = $this->get_user_info($mobile);
        if ($user_info === false) {
            return $this->result_arr('202', [], '用户不存在');
        }

        // 修改登录状态
        $update_user = [
            'password' => md5(md5($password))
        ];
        $where = [
            'mobile' => $mobile
        ];
        $update = $model_user->alter($where, $update_user);
        if ($update !== false) {
            return $this->result_arr('200', ['url' => '/member/view/login'], '重置密码成功');
        }
        return $this->result_arr('999', [], '系统错误');
    }
    
    /**
     * 检查用户是否存在
     */
    public function get_user_info($mobile = 0)
    {
        $model_user = Db::name('User');
        if (empty($mobile)) {
            return false;
        }
        $user_info = $model_user->where(['mobile' => $mobile])->find();
        if (empty($user_info)) {
            return false;
        }
        return $user_info;
    }
}