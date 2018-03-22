<?php
namespace app\common\controller;

use think\Controller;

use think\Db;

class Base extends Controller
{
    
    protected $allow_request = ['post', 'get'];

	public $user_info = [];
	
	public function __construct()
	{
		parent::__construct();
		
		header("Content-type: text/html; charset=utf-8");

		$this->set_user_info();
	}

	public function _initialize()
	{
	    
	}
	
	/**
	 * 参数统一入口
	 */
	public function request($param = '', $type = '')
	{
	    if (empty($param)) {
	        return '';
	    }
	    
	    if (empty($type)) {
    	    $request = $this->request->post();
    	    if (!isset($request[$param])) {
                $request = $this->request->get();
    	    }
	    } else {
    	    $type = strtolower($type);
    	    if (!in_array($type, $this->allow_request)) {
    	        return '';
    	    }
	        $request = $this->request->$type();
	    }
	    
        return isset($request[$param]) ? $request[$param] : '';
	}
	
	/**
	 * 记录用户资料
	 */
	public function set_user_info()
	{
	    if (!empty(session('user_id'))) {
    		$field = '*';
    		$where = ['id' => session('user_id')];
    		$this->user_info = Db::name('User')->field($field)->where($where)->find();
    		
    		// 日活记录
	    	$assist_controller = new Assist();
	    	@$assist_controller->save_active_log(session('user_id'));
	    }
	}
}
