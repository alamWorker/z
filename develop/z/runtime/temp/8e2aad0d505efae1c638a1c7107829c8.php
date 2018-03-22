<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:49:"H:\develop\z\conf/../view/designer\view\home.html";i:1517910240;}*/ ?>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="keywords" content="<?php echo $seo_keywords; ?>">
<meta name="description" content="<?php echo $seo_description; ?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title><?php echo $seo_title; ?></title>
<link rel="stylesheet" href="/static/css/common.css?time=<?php echo $time; ?>">
</head>
<body>
	<!-- 基本框架 -->
	<div class="zbase">
		<div class="z-cover">
			<img src="<?php if(empty($designer['avatar'])): ?><?php echo lang('DEFAULT_HEADER'); else: ?><?php echo $designer['avatar']; endif; ?>">
			<div class="zbase-line operate-line">
				<i class="icon back_b" onclick="javascript:window.history.back();"></i>
				<?php if(!empty($user_info) && $designer['user_id'] == $user_info['id']): ?>
				<a href="/designer/View/set_info"><i class="icon set_b right"></i></a>
				<?php else: ?>
				<a href="/designer/View/home"><i class="icon home_b right"></i></a>
				<?php endif; ?>
				<i class="icon QRcode right"></i>
			</div>
			<div class="zbase-line header-line">
				<img src="<?php if(empty($designer['avatar'])): ?><?php echo lang('DEFAULT_HEADER'); else: ?><?php echo $designer['avatar']; endif; ?>" class="member_header">
			</div>
			<div class="zbase-line data-line">
				<div><?php echo $designer['address']; ?>&nbsp;·&nbsp;<?php echo $designer['name']; ?></div>
				<div><?php echo $designer['idea']; ?>&nbsp;|&nbsp;<?php echo $designer['style']; ?></div>
			</div>
		</div>
		<?php if(!empty($user_info) && $designer['user_id'] == $user_info['id']): ?>
		<div class="zlink-table-base">
			<div class="zlink-table">
				<a href="/design/View/article"><i class="icon add_b"></i></a>
			</div>
			<div class="zlink-table">
				<a href="/designer/View/log_list"><i class="icon <?php if($hint > 0): ?>comments_r<?php else: ?>comments_b<?php endif; ?>"></i></a>
			</div>
		</div>
		<hr/>
		<div class="z-sink-content-m">
			<a href="/designer/View/order_list">
				<div class="zbase-line">
					<span>订单</span>
					<i class="icon more_b right"></i>
				</div>
			</a>
			<a href="/designer/View/burse">
				<div class="zbase-line">
					<span>稿费</span>
					<i class="icon more_b right"></i>
				</div>
			</a>
			<hr/>
		</div>
		<?php endif; ?>
		<div class="zbase-block">
			<?php if(empty($design)): if(!empty($user_info) && $designer['user_id'] == $user_info['id']): ?>
			<a href="/design/View/article" class="znull-msg">
				<i class="icon add_b"></i>
				<div>你的生活，有点小单调，没意思</div>
			</a>
			<?php else: ?>
			<a href="/design/View/article" class="znull-msg">
				<div>这位同学是个没点情趣的人，暂无作品。。</div>
			</a>
			<?php endif; else: if(is_array($design) || $design instanceof \think\Collection || $design instanceof \think\Paginator): $i = 0; $__LIST__ = $design;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			<div class="z-img-block">
				<i class="icon browse_b right-float z-line-operate" onclick="javascript:window.location.href='/design/View/detail?design_id=<?php echo $vo['id']; ?>'"></i>
				<a href="/design/View/article?design_id=<?php echo $vo['id']; ?>">
					<?php if(!empty($vo['img_src'])): ?>
					<img _src="<?php echo $vo['img_src']; ?>">
					<?php endif; ?>
					<span><?php echo $vo['title']; ?>&nbsp;|&nbsp;<?php echo $vo['intro']; ?></span>
				</a>
			</div>
			<?php endforeach; endif; else: echo "" ;endif; endif; ?>
		</div>

		<?php if(!empty($design)): ?>
		<!-- 底部填充 -->
		<div class="zbase-footer" id="ajax-get-more">
			<span>-&nbsp;·&nbsp;没有更多&nbsp;·&nbsp;-</span>
		</div>
		<?php endif; ?>
	</div>
<script src="/static/js/data.js?time=<?php echo $time; ?>"></script>
<script src="/static/js/function.js?time=<?php echo $time; ?>"></script>
<script>
var ajax_more = function() {
	var ajax_get_more_obj = document.getElementById("ajax-get-more");
	if (ajax_get_more_obj === undefined || ajax_get_more_obj === null) {
		return false;
	};
	if (ajax_get_more_obj.getAttribute("is_ajax") == 1) {
		return false;
	};
	ajax_get_more_obj.setAttribute("is_ajax", "1");

	// start ajax
	ajax_get_more_obj.setAttribute("is_ajax", "0");
}
</script>
</body>
</html>