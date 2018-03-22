<?php
namespace app\common\controller;

use app\common\controller\Base;

class ViewBase extends Base
{
	public function __construct()
	{
		parent::__construct();
		
		$this->view_param_init();
		
		$this->fetch_action();
	}
	
	/**
	 * 自动加载没有方法的模版
	 */
	public function fetch_action(){
	    if (!in_array($this->request->action(), get_class_methods($this))) {
	        die($this->fetch($this->request->action()));
	    }
	}

	/**
	 * 检查登录，留下记录，跳转登录
	 */
	public function check_login()
	{
        if (empty($this->user_info)) {
        	// 记录当前的URL
        	session('callback_url', '/' . $this->request->module() . '/' . $this->request->controller() . '/' . $this->request->action());
        	session('callback_url_param', $_GET);
        	// 跳转登录
            $this->redirect('/member/view/login');
        }
        $this->assign('user_info', $this->user_info);
		return true;
	}
	
	public function view_param_init()
	{
		$this->assign('time', time());
		$this->assign('date', date('Y-m-d'));
	}
}