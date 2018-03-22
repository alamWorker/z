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
		parent::_initialize();
	}

	public function index()
	{
		die("DIE");
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
     * 登出
     */
    public function logout()
    {
        session('user_id', '0');
        if (!$this->request->instance()->isAjax()) {
            $this->redirect('/member/View/login');
        }
        return $this->result_arr('200', ['url' => '/member/view/login'], '');
    }
	
	/**
	 * 记录用户资料
	 */
	public function set_user_info()
	{
	    if (!empty(session('user_id'))) {
    		$field = 'z_user.*,de.id as designer_id';
    		$join = [
    			['z_designer de', 'de.user_id = z_user.id AND de.is_deleted = 0', 'LEFT']
    		];
    		$where = ['z_user.id' => session('user_id')];
    		$this->user_info = Db::name('User')->join($join)->field($field)->where($where)->find();

    		// 日活记录
	    	$assist_controller = new Assist();
	    	@$assist_controller->save_active_log(session('user_id'));
	    }
	}
}
