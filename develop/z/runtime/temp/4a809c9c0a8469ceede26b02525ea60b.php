<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:47:"H:\develop\z\conf/../view/design\view\home.html";i:1517906176;}*/ ?>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="keywords" content="<?php echo $seo_keywords; ?>">
<meta name="description" content="<?php echo $seo_description; ?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title><?php echo $seo_title; ?></title>
<link rel="stylesheet" href="/static/css/common.css?time=<?php echo $time; ?>">
<link rel="stylesheet" href="/static/css/comment.css?time=<?php echo $time; ?>">
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/TouchSlide.1.1.js"></script>
</head>
<body>
	<!-- 基本框架 -->
	<div class="zbase">
		<!-- 头部导航 -->
		<div class="zbase-title">
			<div class="zbase-title-a">
				<a href="#"><span class="text-icon left logo">Z</span></a> <!-- 首页 -->
				<!-- 搜索 -->
				<form name="form" method="post" action="/design/View/home">
					<a><span class="text-search" id="text-search">
						<input type="submit" value=""/>
						<input type="text" placeholder="Search" value="<?php echo isset($search_content)?$search_content: ''; ?>" name="search_content"/>
					</span></a>
				</form>
				<!-- 卖场 -->
				<a href="/shop/View/home"><img _src="/static/images/icon/shop_w.png" class="text-icon right shop"></a>
				<!-- 社区 -->
				<a href="/designer/View/home"><img _src="/static/images/icon/home_w.png" class="text-icon right community"></a>
				<!-- 更多 0:收缩 1：展开 -->
				<a href="javascript:show_more();"><img _src="/static/images/icon/back_w.png" src-replace="/static/images/icon/more_w.png" class="text-icon right more" id="more" action-type="1"></a>
				<?php if(empty($user_info['avatar'])): ?>
				<a href="/member/View/home"><img _src="/static/images/icon/account_w.png" class="text-icon right account"></a> <!-- 个人中心 -->
				<?php else: ?>
				<a href="/member/View/home"><img _src="<?php echo $user_info['avatar']; ?>" class="text-icon right header"></a> <!-- 个人中心 -->
				<?php endif; ?>
			</div>
			<div class="zbase-title-b">
				<div class="label">
					<span <?php if($order_type==1): ?>class="on"<?php endif; ?>><a href="?order_type=1">热门</a></span>
					<span <?php if($order_type==2): ?>class="on"<?php endif; ?>><a href="?order_type=2">时间</a></span>
					<span <?php if($order_type==3): ?>class="on"<?php endif; ?>><a href="?order_type=3">推荐</a></span>
				</div>
			</div>
		</div>
		<!-- 内容模块 -->
		<div class="zbase-content">
			<!-- slide-a 多页画廊 -->
			<?php if(!empty($slide)): ?>
			<div class="zbase-block">
				<div id="ad" class="slide-a">
					<div class="slide-content">
						<ul class="image">
							<?php if(is_array($slide) || $slide instanceof \think\Collection || $slide instanceof \think\Paginator): $i = 0; $__LIST__ = $slide;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
							<li>
								<a class="pic" href="<?php echo $vo['href']; ?>"><img _src="<?php echo $vo['src']; ?>" onerror="img_error(this)"></a>
							</li>
							<?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</div>
					<div class="slide-controls" hidden>
						<ul></ul>
					</div>
					<div class="slide-a-pageState">
					</div>
				</div>
			</div>
			<?php endif; ?>
			
			<!-- article-a 单封面文章 -->
			<?php if(is_array($design) || $design instanceof \think\Collection || $design instanceof \think\Paginator): $i = 0; $__LIST__ = $design;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			<div class="zbase-block">
				<div class="article-a">
					<div class="content-link">
						<i class="icon <?php if(empty($vo['fav_id'])): ?>add_b<?php else: ?>add_r<?php endif; ?> right-float fav_designer_<?php echo $vo['designer_id']; ?>" onclick="designer_fav(<?php echo $vo['user_id']; ?>, <?php if(empty($vo['fav_id'])): ?>1<?php else: ?>0<?php endif; ?>)"></i>
						<a href="/designer/View/home?designer_id=<?php echo $vo['designer_id']; ?>">
							<div class="commenter-info">
								<img _src="<?php echo $vo['avatar']; ?>" onerror="img_error(this)">
								<div><?php echo $vo['name']; ?></div>
								<div class="gay"><?php echo date("Y/m/d H:i", $vo['create_time']); ?></div>
							</div>
						</a>
					</div>
					<div class="article-img">
						<a href="/design/View/detail?design_id=<?php echo $vo['id']; ?>"><img _src="<?php echo $vo['main_src']; ?>" onerror="img_error(this)"></a>
					</div>
					<div class="article-action">
						<span class="left"><a><img _src="/static/images/icon/favorites_fill.png"><?php echo $vo['fav']; ?></a></span>
						<span class="left"><a href="/comment/View/index?design_id=<?php echo $vo['id']; ?>"><img _src="/static/images/icon/comments_e.png"><?php echo $vo['comment']; ?></a></span>
						<span class="right"><a><img _src="/static/images/icon/good_e.png"><?php echo $vo['assess']; ?>&nbsp;&nbsp;</a></span>
					</div>
					<div class="article-content">
						<a href="/design/View/detail?design_id=<?php echo $vo['id']; ?>" style="display:block;">
							<span class="article-details-title"><?php echo $vo['title']; ?>&nbsp;|&nbsp;<?php echo $vo['intro']; ?></span>
							<span class="article-details-content"><?php echo $vo['content']; ?></span>
						</a>
					</div>
				</div>
			</div>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			
			<!-- 底部填充 -->
			<div class="zbase-footer">
				<span>-&nbsp;·&nbsp;no more&nbsp;·&nbsp;-</span>
			</div>
		</div>
	</div>
<script src="/static/js/data.js?time=<?php echo $time; ?>"></script>
<script src="/static/js/function.js?time=<?php echo $time; ?>"></script>
<script src="/static/js/design/function.js?time=<?php echo $time; ?>"></script>
<script src="/static/js/design/data.js?time=<?php echo $time; ?>"></script>
<script>
window.onload = function(){  
	TouchSlide({ 
		slideCell:"#ad",
		titCell:".slide-controls ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
		mainCell:".slide-content ul", 
		effect:"leftLoop", 
		autoPage:true,//自动分页
		autoPlay:true, //自动播放
		pageStateCell:".slide-a-pageState"
	});
}
</script>
</body>
</html>