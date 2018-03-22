<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:59:"H:\develop\z\conf/../view/workclass\view\show_schedule.html";i:1517235873;}*/ ?>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>班表</title>
<link rel="stylesheet" href="/static/css/common.css?t=<?php echo $time; ?>">
<link rel="stylesheet" href="/static/css/workclass.css?t=<?php echo $time; ?>">
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/TouchSlide.1.1.js"></script>
<script src="/static/js/common.js?t=<?php echo $time; ?>"></script>
<script src="/static/js/function.js?t=<?php echo $time; ?>"></script>
<body>
	<div class="zbase-block">
		<div class="z-form">
			<div class="zbase-line title">
				<input type="text" value="<?php echo $schedule_info['name']; ?>" disabled="disabled">
				<i class="icon set_e" onclick="javascript:window.location.href='/workclass/View/set_schedule?schedule_id=<?php echo $schedule_info['id']; ?>';"></i>
			</div>
			<div id="slide-a" class="slide-a">
				<div class="slide-content">
					<ul>
						<?php if(is_array($date_list) || $date_list instanceof \think\Collection || $date_list instanceof \think\Paginator): $i = 0; $__LIST__ = $date_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						<li>
							<div class="z-calendar" date-year="<?php echo $vo['year']; ?>" date-month="<?php echo $vo['month']; ?>"></div>
						</li>
						<?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
				<div class="slide-controls" hidden>
					<ul></ul>
				</div>
				<input type="hidden" id="last_page" value="1"/>
			</div>
		</div>
		<div class="zbase-line">
			<span class="zline-title"><?php echo date("Y/m/d", $time); ?></span>&nbsp;&nbsp;
			<span class="zline-title sign-text-color<?php echo $today_class['sign']; ?> no-border" id="today_class"><?php echo $today_class['name']; ?></span>
			<div class="right" id="controller">
				(<span class="zline-title"><?php echo $date_list[2]['year']; ?></span>
				/
				<span class="zline-title"><?php echo $date_list[2]['month'] + 1; ?></span>)
			</div>
		</div>
	</div>
	<div class="zbase-block">
		<div class="zbase-line">
			<span class="zline-title">添加新的班次</span>
			<i class="icon add_b right" onclick="javascript:window.location.href='/workclass/view/set_class';"></i>
		</div>
		<?php if(!empty($class_list)): ?>
		<div class="zbase-line z-tab-control" id="class-list">
			<?php if(is_array($class_list) || $class_list instanceof \think\Collection || $class_list instanceof \think\Paginator): $i = 0; $__LIST__ = $class_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			<a href="/workclass/view/set_class?class_id=<?php echo $vo['id']; ?>" class="control-show-details sign-text-color<?php echo $vo['sign']; ?>"><?php echo $vo['name']; ?></a>
			<?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
		<?php endif; ?>
	</div>
	<div class="zbase-block">
		<div class="zbase-line">
			<span class="zline-title">添加新的班表</span>
			<i class="icon add_b right" onclick="javascript:window.location.href='/workclass/view/set_schedule';"></i>
		</div>
		<?php if(!empty($schedule_list)): if(is_array($schedule_list) || $schedule_list instanceof \think\Collection || $schedule_list instanceof \think\Paginator): $i = 0; $__LIST__ = $schedule_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
		<div class="zbase-line">
			<a class="z-select status-radio" style="right: 25%;" onclick="javascript:alter_schedule(<?php echo $vo['id']; ?>);"></a>
			<span class="zline-title"><?php echo $vo['name']; ?></span>
			<i class="icon set_b right" onclick="javascript:window.location.href='/workclass/view/set_schedule?schedule_id=<?php echo $vo['id']; ?>';"></i>
		</div>
		<?php endforeach; endif; else: echo "" ;endif; endif; ?>
	</div>
</body>
<script src="/static/js/z.calendar.js?t=<?php echo $time; ?>"></script>
<script src="/static/js/workclass/workclass.js?t=<?php echo $time; ?>"></script>
<script>
	sign_list = [
		<?php if(is_array($sign_list) || $sign_list instanceof \think\Collection || $sign_list instanceof \think\Paginator): $i = 0; $__LIST__ = $sign_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
		"sign-text-color<?php echo $vo; ?> no-border",
		<?php endforeach; endif; else: echo "" ;endif; ?>
	];
	sign_start_date = new Date('<?php echo isset($schedule_info['start_time'])?$schedule_info['start_time']: $date; ?>');
</script>
<script type="text/javascript">
	TouchSlide({
		slideCell:"#slide-a",
		titCell:".slide-controls ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
		mainCell:".slide-content ul", 
		effect:"leftLoop", 
		autoPage:true,//自动分页
		autoPlay:false,//自动播放
		defaultIndex:2,//默认索引位置
		endFun:function(i,c){
			var my_date = new Date();
			var last_page = document.getElementById("last_page").value;
			document.getElementById("last_page").value = i;
			
			var slide_content = document.getElementsByClassName("slide-content")[0];
			var ul_obj = slide_content.children[0].children[0];


			if ( parseInt(i) == 1 || parseInt(last_page) == 1 || parseInt(i) == 2 || parseInt(last_page) == 2 || parseInt(i) == 3 || parseInt(last_page) == 3 || parseInt(i) ==   parseInt(last_page)) {
				zCalendar_com.set_calendar_controller(i);
				return true;
			}

			if ( i == 0 && last_page == 4){
				var action_num = ul_obj.children.length-2;
			} else if ( i == 4 && last_page == 0) {
				var action_num = -(ul_obj.children.length-2);
			}
			for (var n=1;n<ul_obj.children.length-1;n++) {
				var year = ul_obj.children[n].children[0].getAttribute("date-year");
				var month = ul_obj.children[n].children[0].getAttribute("date-month");
				var date = zCalendar_com.get_month_by_condition(year, month, '', action_num);
				my_date.setTime(date);
				ul_obj.children[n].children[0].setAttribute("date-year", my_date.getFullYear());
				ul_obj.children[n].children[0].setAttribute("date-month", my_date.getMonth());
			}
			zCalendar_com.init_calendar();
			zCalendar_com.set_calendar_controller(i);
			zCalendar({start:true, drawing:true});
		}
	});
	zCalendar_com.init_calendar();
	zCalendar({drawing:true});
</script>
</html>