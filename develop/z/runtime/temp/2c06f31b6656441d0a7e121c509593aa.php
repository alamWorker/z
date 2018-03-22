<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"H:\develop\z\conf/../view/workclass\view\set_schedule.html";i:1517235773;}*/ ?>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>设置班表</title>

<link rel="stylesheet" href="/static/css/common.css?t=<?php echo $time; ?>">
<link rel="stylesheet" href="/static/css/workclass.css?t=<?php echo $time; ?>">
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/common.js?t=<?php echo $time; ?>"></script>
<script src="/static/js/function.js?t=<?php echo $time; ?>"></script>
<script src="/static/js/workclass/workclass.js?t=<?php echo $time; ?>"></script>

</head>
<body>
	<div class="zbase zbase-content">
		<div class="zbase-block">
			<div class="z-form">
				<div class="zbase-line title" <?php if(empty($schedule_info['name'])): ?>hidden<?php endif; ?>>
					<input type="text" value="<?php echo isset($schedule_info['name'])?$schedule_info['name']: ''; ?>" disabled="disabled">
					<i class="icon look_r" onclick="javascript:window.location.href='/workclass/View/show_schedule?schedule_id=<?php echo isset($schedule_info['id'])?$schedule_info['id']: ''; ?>';"></i>
				</div>
				<div class="zbase-line">
					<input type="text" value="<?php echo isset($schedule_info['name'])?$schedule_info['name']: ''; ?>" id="name" placeholder="班表">
				</div>
				<div class="zbase-line">
					<label class="z-select" for="start-time"></label>
					<input type="text" placeholder="周期开始时间" disabled="disabled">
					<input type="date" value="<?php echo isset($schedule_info['start_time'])?$schedule_info['start_time']: $date; ?>" id="start-time">
				</div>
				<div class="zbase-line bottom-border">
					<input type="text" class="no-border" disabled="disabled" placeholder="班表规律">
					<i class="icon subtract_b" onclick="javascript:del_tab_control()"></i>
					<i class="icon add_b" onclick="javascript:add_tab_control()"></i>
					<input type="hidden" value="<?php echo isset($schedule_info['law'])?$schedule_info['law']: ''; ?>" id="law">
					<div class="z-tab-control" id="control-show">
						<?php if(empty($law)): ?>
						<a class="control-show-details" onclick="javascript:show_select(0)"><input type="hidden" value=""><span>选择班次</span></a>
						<?php else: if(is_array($law) || $law instanceof \think\Collection || $law instanceof \think\Paginator): $i = 0; $__LIST__ = $law;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						<a class="control-show-details" onclick="javascript:show_select(<?php echo $key; ?>)"><input type="hidden" value="<?php echo $vo['id']; ?>"><span><?php echo $vo['name']; ?></span></a>
						<?php endforeach; endif; else: echo "" ;endif; endif; ?>
					</div>
					<div class="z-tab-control" id="control-select">
						<a href="/workclass/View/set_class">设置班次</a>
						<?php if(is_array($class_list) || $class_list instanceof \think\Collection || $class_list instanceof \think\Paginator): $i = 0; $__LIST__ = $class_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						<a <?php if($key == 0): ?>class="left-border"<?php endif; ?> onclick="javascript:set_select(this)"><input type="hidden" value="<?php echo $vo['id']; ?>"><span><?php echo $vo['name']; ?></span></a>
						<?php endforeach; endif; else: echo "" ;endif; ?>
						<input type="hidden" value="0" id="details-obj" readonly>
						<span class="z-select disable" id="details-disable" onclick="create_prompt('未选择班表规律');"></span>
					</div>
				</div>
				<div class="zbase-line" hidden>
					<input type="text" value="<?php echo isset($schedule_info['period'])?$schedule_info['period']: '1'; ?>" id="period" placeholder="周期长度" readonly>
				</div>
				<div class="zbase-line">
					<a class="z-select status-radio"></a>
					<input type="text" disabled="disabled" placeholder="默认班表？">
					<?php if(!isset($schedule_info['default'])): ?>
					<i class="icon radio_r status-radio" class_replace="icon radio_e status-radio" id="show-radio"></i>
					<?php else: ?>
					<i class="icon <?php echo $schedule_info['default']==1?'radio_r' : 'radio_e'; ?> status-radio" class_replace="icon <?php echo $schedule_info['default']==1?'radio_e' : 'radio_r'; ?> status-radio" id="show-radio"></i>
					<?php endif; ?>
					<input type="hidden" value="<?php echo isset($schedule_info['default'])?$schedule_info['default']: 1; ?>" id="default">
				</div>
				<div class="zbase-line" hidden>
					<a class="z-select status-radio"></a>
					<input type="text" disabled="disabled" placeholder="班表共享？">
					<?php if(empty($schedule_info['status'])): ?>
					<i class="icon radio_e status-radio" class_replace="icon radio_r status-radio" id="show-radio"></i>
					<?php else: ?>
					<i class="icon <?php echo $schedule_info['status']==2?'radio_r' : 'radio_e'; ?> status-radio" class_replace="icon <?php echo $schedule_info['status']==2?'radio_e' : 'radio_r'; ?> status-radio" id="show-radio"></i>
					<?php endif; ?>
					<input type="hidden" value="<?php if(isset($schedule_info['status']) && $schedule_info['status'] == 2): ?>1<?php else: ?>0<?php endif; ?>" id="status">
				</div>
				<input type="hidden" id="id" value="<?php echo isset($schedule_info['id'])?$schedule_info['id']: ''; ?>">
				<a class="z-button" onclick="javascript:schedule_save_ajax(this)">保存</a>
				<?php if(!empty($schedule_info['id'])): ?>
				<a class="z-button delete" onclick="javascript:schedule_del_ajax(<?php echo $schedule_info['id']; ?>)">删除</a>
				<?php endif; ?>
			</div>
		</div>
		<div class="zbase-block">
			<div class="zbase-line">
				<span class="zline-title">添加新的班表</span>
				<i class="icon add_b right" onclick="javascript:window.location.href='/workclass/view/set_schedule';"></i>
			</div>
			<?php if(!empty($schedule_list)): if(is_array($schedule_list) || $schedule_list instanceof \think\Collection || $schedule_list instanceof \think\Paginator): $i = 0; $__LIST__ = $schedule_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			<div class="zbase-line">
				<span class="zline-title"><?php echo $vo['name']; ?></span>
				<a class="z-select status-radio" style="right: 25%;" <?php if(empty($schedule_info) || (!empty($schedule_info) && $vo['id'] != $schedule_info['id'])): ?>onclick="javascript:window.location.href='/workclass/view/set_schedule?schedule_id=<?php echo $vo['id']; ?>';"<?php endif; ?>></a>
				<i class="icon set_b right" <?php if(empty($schedule_info) || (!empty($schedule_info) && $vo['id'] != $schedule_info['id'])): ?>onclick="javascript:window.location.href='/workclass/view/set_schedule?schedule_id=<?php echo $vo['id']; ?>';"<?php endif; ?>></i>
			</div>
			<?php endforeach; endif; else: echo "" ;endif; endif; ?>
		</div>
	</div>
</body>
</html>