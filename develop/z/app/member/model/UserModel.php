<?php
namespace app\member\model;

use think\Db;
use app\common\model\BaseModel;

class UserModel extends BaseModel
{
	public function __construct()
	{
		parent::__construct();
		$this->database = 'User';
	}

	public function get_info($condition = [])
	{
        return Db::name('user')->where($condition)->find();
	}
	
	/**
	 * 注册用户
	 * @param string $mobile
	 * @param string $password
	 * @return boolean|int 用户id
	 */
	public function register($mobile = '', $password = '')
	{
	    Db::name('User')->startTrans();
	    Db::name('Account')->startTrans();
	    
	    $insert_user = [
	        'username' => $mobile,
	        'mobile' => $mobile,
	        'password' => $password,
	        'create_time' => time()
	    ];
	    $user_id = Db::name('User')->insertGetId($insert_user);
	    $insert_account = [
	        'user_id' => empty($user_id) ? 0 : $user_id
	    ];
	    $account_id = Db::name('Account')->insert($insert_account);
	    
	    if ($user_id === false || $account_id === false) {
	        Db::name('User')->rollback();
	        Db::name('Account')->rollback();
	        return false;
	    }
	    Db::name('User')->commit();
	    Db::name('Account')->commit();
	    return $user_id;
	}
}