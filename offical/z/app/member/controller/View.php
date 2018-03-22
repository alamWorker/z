<?php
namespace app\member\controller;

use app\common\controller\ViewBase;

class View extends ViewBase
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function set_fetch($action)
	{
		die($this->fetch($action));
	}

	public function login()
	{
        if (!empty($this->user_info)) {
            $this->redirect('/index/Index/index');
        }
		return $this->fetch();
	}

	public function forgot_pass()
	{
		session('user_id','');
		return $this->fetch();
	}
}