/* z import js */

/* 表单元素 */

/**
 * 整型输入框
 */
$('.z-input-int').on('input', function(event){
	event.target.value = event.target.value.replace(/[^0-9]/ig,"");
});
/**
 * 浮点型输入框
 */
$('.z-input-float').on('input', function(event){
	event.target.value = event.target.value.replace(/[^0-9.]/ig,"");
	event.target.value = event.target.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');
});
/**
 * 行抽屉开关
 * init 是否为初始化抽屉, 非空-初始化，元素value意为抽屉初始化效果
 */
var drawer_action = function(obj, init)
{
	var status = obj.attr('value');
	var parent_obj = obj.parent();
	if (parent_obj.children('.z-l-drawer').length == 0) {
		parent_obj = $(parent_obj).parent();
	};
	if (init != undefined) {
		status = (status == 0) ? 1 : 0;
	};
	if (parent_obj.children('.z-l-drawer').length > 0) {
		if (status == 0) {
			parent_obj.children('.z-l-drawer').show();
		} else if (status == 1) {
			parent_obj.children('.z-l-drawer').hide();
		};
	};
}
/**
 * 抽屉点击控制开关
 */
$('.z-drawer').on('click', function(event){
	drawer_action($(event.target));
});
/**
 * 单选按钮渲染
 * @param string id 当id存在时仅渲染该id对应单选按钮
 */
var radio_init = function(id) {
	var radio = document.getElementsByClassName('z-radio');
	if (id != undefined) {
		var radio = document.getElementById(id);
		radio = [radio];
	};
	for (var i = 0; i < radio.length; i++) {
		if (radio[i] != undefined && radio[i] != null) {
			var radio_value = radio[i].getAttribute('value');
			var radio_wrong = radio[i].dataset.wrong;
			var radio_selected = radio[i].dataset.selected;

			if (radio_value != undefined && radio_value == 1) {
				$(radio[i]).removeClass(radio_wrong);
				$(radio[i]).addClass(radio_selected);
			} else if (radio_value != undefined && radio_value == 0) {
				$(radio[i]).removeClass(radio_selected);
				$(radio[i]).addClass(radio_wrong);
			};
			drawer_action($(radio[i]), 1);
		};
	}
}
$(function() {
	radio_init();
});
/**
 * 悬浮抽屉
 */
$('.z-float-process i').on('click', function(event){
	var action_type = $(event.target).attr('value');
	if (action_type == 0) {
		$(event.target).parent().children('.z-f-p-drawer').fadeIn();
	} else if (action_type == 1) {
		$(event.target).parent().children('.z-f-p-drawer').fadeOut();
	};
});
/**
 * 单选按钮切换
 */
$('.z-radio').on('click', function(event){
	// 赋值ID，用于渲染程序
	var id = $(event.target).attr('id');
	id = (id == undefined) ? new Date().getTime() : id;
	$(event.target).attr('id', id);

	var value = $(event.target).attr('value');
	value = (value == undefined || value == 0) ? 1 : 0;
	$(event.target).attr('value', value);
	radio_init(id);
});
/**
 * 密码框显示切换
 */
$('.z-controller-password').on('click', function(){
	var obj = this;
	for (var i = 0; i < 2; i++)
	{
		obj = $($(obj).parent());
		if (obj.find(".z-input-password").length > 0) {
			var type = obj.find(".z-input-password")[0].getAttribute('type');
			type = (type == 'text') ? 'password' : 'text';
			obj.find(".z-input-password").attr('type', type);
			return;
		};
	}
});
/**
 * 发送短信验证码按钮
 */
var opacity_action = function(function_name, obj, time, time_out, action_name) {
	if (obj == undefined) {
		if (function_name != undefined) {
			var function_res = eval(function_name);
			if (function_res != true) {
				return false;
			};
		};
		var obj = $(event.target);
		var time = (obj.data('actiontime') == undefined) ? 60 : obj.data('actiontime');
		var click_action = obj.attr('onclick');

		obj.attr('onclick', '');
		obj.attr('class', obj.attr('class').replace(/-r/, '-b'));
		opacity_action(undefined, obj, time, 0, click_action);	
	} else {
		var opacity_residue = time_out / time;
		obj.css('opacity', opacity_residue);

		if (opacity_residue >= 1) {
			obj.attr('class', obj.attr('class').replace(/-b/, '-r'));
			obj.attr('onclick', action_name);
		} else {
			time_out += 1;
			setTimeout(function(){
				opacity_action(undefined, obj, time, time_out, action_name);
			}, 1000);
		};
	};
};
var send_code_ajax_debug = function ()
{
	console.log('该方法待填充');
	return true;
}