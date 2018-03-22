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
	
	/**
	 * 模板文件参数初始化
	 */
	public function view_param_init()
	{
		$app_path = $this->request->module() . '_' . $this->request->controller() . '_' . $this->request->action();
		$seo_title = lang('seo_' . $app_path . '_title');
		$seo_title = (empty($seo_title) || ($seo_title == 'seo_' . $app_path . '_title')) ? lang('seo_title') : $seo_title;
		$this->assign('seo_title', $seo_title);
		
		$seo_keywords = lang('seo_' . $app_path . '_keywords');
		$seo_keywords = (empty($seo_keywords) || ($seo_keywords == 'seo_' . $app_path . '_keywords')) ? lang('seo_keywords') : $seo_keywords;
		$this->assign('seo_keywords', $seo_keywords);
		
		$seo_description = lang('seo_' . $app_path . '_description');
		$seo_description = (empty($seo_description) || ($seo_description == 'seo_' . $app_path . '_description')) ? lang('seo_description') : $seo_description;
		$this->assign('seo_description', $seo_description);

		if (defined('REFRESH_STYLE') && REFRESH_STYLE) {
			$this->assign('time', time());
		} else {
			$this->assign('time', 0);
		}
		$this->assign('date', date('Y-m-d'));
	}

    /**
     * 分页设定
     */
    public function getPage($count)
    {
        $pagesize = $this->request('pagesize');
        $curpage = $this->request('curpage');
        if (empty($pagesize) || $pagesize < 1) {
            $pagesize = 10;
        }
        if (empty($curpage) || $curpage < 1) {
            $curpage = 1;
        }
        $total_page = ceil($count / $pagesize);
        if ($curpage > $total_page && $total_page > 0) {
            $curpage = $total_page;
        }
        $limit = ($curpage - 1) * $pagesize . ',' . $pagesize;
        $res = array(
            'limit' => $limit,
            'hasmore' => $total_page > $curpage ? 1 : 0,
            'curpage' => $curpage,
            'total_page' => $total_page
        );
        return $res;
    }
}