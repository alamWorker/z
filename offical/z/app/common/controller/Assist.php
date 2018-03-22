<?php
namespace app\common\controller;

use think\Controller;

use think\Db;

use app\common\model\AssistModel;

class Assist extends Controller
{
	
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * 记录日活
	 * 
	 * @param string $user_id
	 */
	public function save_active_log($user_id = 0)
	{
		$model_assist = new AssistModel();

		$data = [
			'user_id' => $user_id,
			'app_path' => $this->request->module() . '/' . $this->request->controller() . '/' . $this->request->action(),
			'param' => json_encode(array_merge($this->request->post(), $this->request->get())),
			'create_date' => date('Y-m-d H:i:s'),
			'operate_ip' => get_client_ip(0, true),
		];
		$model_assist->save_active_log($data);
	}
}