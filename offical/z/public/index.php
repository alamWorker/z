<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// Z 定义常量
define('Z_DEBUG', FALSE);

if ($_SERVER['HTTP_HOST'] == 'alam.s1.natapp.cc' && empty($_POST)) {
    define('Z_API_DEBUG', true);
} else {
    define('Z_API_DEBUG', false);
}

// 定义配置文件
define('CONF_PATH', __DIR__ . '/../conf/');

// 定义应用目录
define('APP_PATH', __DIR__ . '/../app/');

// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
