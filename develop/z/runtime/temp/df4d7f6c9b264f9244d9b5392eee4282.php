<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:48:"H:\develop\z\conf/../view/member\view\login.html";i:1517905857;}*/ ?>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="keywords" content="<?php echo $seo_keywords; ?>">
<meta name="description" content="<?php echo $seo_description; ?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title><?php echo $seo_title; ?></title>
<link rel="stylesheet" href="/static/css/common.css?t=<?php echo $time; ?>">
<link rel="stylesheet" href="/static/css/member.css?t=<?php echo $time; ?>">
<script src="/static/js/jquery.min.js"></script>
</head>
<body>
	<div class="zbase zbase-content">
		<div class="zbase-block">
			<div class="z-line-operate">
				<div class="icon">
					<a href="#"><img src="/static/images/icon/account_b.png"></a>
				</div>
				<div class="link">
					<a href="register"><span>注册</span></a>
					<a><span>|</span></a>
					<a href="forgot_pass"><span>忘记密码</span></a>
				</div>
			</div>
			<div class="z-form login">
				<div class="zbase-line">
					<input type="text" value="" name="account" placeholder="账号">
				</div>
				<div class="zbase-line">
					<input type="password" value="" id="password" name="password" placeholder="密码" maxlength="16">
					<i class="show-pass" src-replace="/static/images/icon/browse_b.png" onclick="javascript:show_pass(this);"></i>
				</div>
				<a class="z-button" onclick="javascript:login_ajax(this);">登录</a>
			</div>
		</div>
	</div>
<script src="/static/js/function.js?t=<?php echo $time; ?>"></script>
<script src="/static/js/data.js?t=<?php echo $time; ?>"></script>
<script src="/static/js/member.js?t=<?php echo $time; ?>"></script>
</body>
</html>