<?php
namespace app\common\controller;

use app\common\controller\Base;

class ApiBase extends Base
{
    
    protected $result_rule;

	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * 统一出口
	 * @param number $code
	 * @param unknown $data
	 * @param string $msg
	 */
	public function result_arr($code = '', $data = [], $msg = '')
	{
	    $this->result_rule = ['code' => empty($code) ? lang('N_COMMON_SYS_SUC') : $code, 'data' => $data, 'msg' => empty($msg) ? lang('COMMON_SYS_SUC') : $msg];
	    die(json_encode($this->result_rule, true));
	}

	/**
	 * 检查登录，留下记录，跳转登录
	 */
	public function check_login()
	{
	    if (empty($this->user_info['id'])) {
	        return $this->result_arr(lang('N_PLEASE_LOGIN'), ['url' => '/member/view/login'], lang('PLEASE_LOGIN'));
	    }
	    return true;
	}
	
	/**
	 * API 分页程序
	 * @param int $page_size 行数
	 * @param int $cur_page 页码
	 */
	public function get_page($count)
	{
		$post_data = $this->request('page_size');
		$page_size = (empty($this->request('page_size')) || $this->request('page_size') < 1) ? 20 : $this->request('page_size');
		$cur_page = (empty($this->request('cur_page')) || $this->request('cur_page') < 1) ? 1 : $this->request('cur_page');

		$total_page = ceil($count/$page_size);
		$cur_page = ($cur_page > $total_page && $total_page > 0) ? $total_page : $cur_page;
		$limit = ($cur_page - 1) * $page_size . ',' . $page_size;
		return $result = array(
			'limit' => $limit, 
			'has_more' => $total_page > $cur_page ? 1 : 0,
			'cur_page' => $cur_page,
			'total_page' => $total_page
		);
	}
}