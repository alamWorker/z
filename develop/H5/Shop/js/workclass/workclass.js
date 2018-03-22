/**
 * 班表效果、交互js
 */
$(document).ready(function(){
	$(".select-sign").on("click",function(){
		var sign_select_dom = $(".select-sign i");
		sign_select_dom.removeClass("sign-select");
		this.children[0].className = this.children[0].className + ' sign-select';
		$("#sign").val(this.children[0].getAttribute('value'));
	});

	$(".status-radio").on("click",function(){
		var stauts = $($(this).parent().children("input[type=hidden]")[0]);
		stauts.val((stauts.val() == 1) ? 0 : 1);

		var icon = $($(this).parent().children(".icon")[0]);
		var temp_class = icon.attr('class');
		icon.attr('class', icon.attr('class_replace'));
		icon.attr('class_replace', temp_class);
	});
});

// ajax保存班次
var class_save_ajax = function(obj)
{
	var id = $('#id').val();
	var name = $('#name').val();
	var sign = $('#sign').val();
	var status = $('#status').val();
	var rank = $('#rank').val();
	
	z_ajax({"func_name":"set_id"},'/workclass/Index/set_class_info', {'id':id,'name':name,'sign':sign,'status':status,'rank':rank}, obj);
}

// ajax删除班次
var class_del_ajax = function(id, obj)
{
	var obj_parent = $(obj).parent();
	if(id == undefined) {
		create_prompt('网络错误');
	}
	z_ajax({'func_name':'del_class_line','param':{obj_parent,id}}, '/workclass/Index/del_class_info', {'id':id});
}

// 删除一行班次
var del_class_line = function(obj, id) {
	obj.remove();

	var input_id = $('#id').val();
	if (input_id != undefined && input_id == id) {
		set_class_info();
	}
}

// 填充班次内容
var set_class_info = function(class_id) {
	// scrollTo(0,0);
	var title = $('.title');
	var name = $('#name');
	var sign = $('#sign');
	var sign_select = $('.sign-select');
	var status = $('#status');
	var show_radio = $('#show-radio');
	var rank = $('#rank');
	var id = $('#id');

	if (class_id == undefined || class_id == '') {
		sign_select.removeClass("sign-select");
		 $(".sign-color0").addClass("sign-select");
		title.attr('style', 'display:none;');
		name.val('');
		sign.val('');
		status.val(0);
		show_radio.attr('class', 'icon radio_r status-radio');
		rank.val('');
		id.val('');
	} else {
		z_ajax({'func_name':'set_param',}, '/workclass/Index/get_class_info', {'class_id':class_id});
	}
}
var set_param = function(data) {
	data = data.data.class_info;
	$('.title').attr('style', 'display:block;');
	var title = $($('.title').children()[0]);
	var name = $('#name');
	var sign = $('#sign');
	var sign_select = $('.sign-select');
	var status = $('#status');
	var show_radio = $('#show-radio');
	var rank = $('#rank');
	var id = $('#id');

	title.val(data['name']);
	name.val(data['name']);
	rank.val(parseInt(data.rank));
	if (parseInt(data.rank) == 0) {
		rank.val('');
	};
	id.val(data.id);
	if (data.status == 1) {
		status.val(0);
		show_radio.attr('class', 'icon radio_e status-radio');
	} else {
		status.val(1);
		show_radio.attr('class', 'icon radio_r status-radio');
	}

	sign.val(data.sign);
	sign_select.removeClass("sign-select");
	$(".sign-color" + data.sign).addClass("sign-select");
}

// ajax保存班表
var schedule_save_ajax = function(obj)
{
	var id = $('#id').val();
	var name = $('#name').val();
	var start_time = $('#start-time').val();
	var period = $('#period').val();
	var is_default = $('#default').val();
	var status = $('#status').val();

	var law = '[';
	var law_details = $(".control-show-details").children("input");
	var law_obj = '';
	for (var i=0; i<$(law_details).length; i++) {
		law_obj = $($(law_details)[i]);
		if (law_obj.val() != undefined && law_obj.val() != '') {
			law += law_obj.val() + ',';
		}
	}
	law = (law != "[") ? (law.substr(0, law.length-1) + ']') : '';
	var data =  {'id':id,'name':name,'start_time':start_time,'period':period,'is_default':is_default,'status':status,'law':law};
	z_ajax({"func_name":"set_id"}, '/workclass/Index/set_schedule_info', data, obj);
}

// ajax保存数据 suc 填充id
var set_id = function(data)
{
	var id = data.data.id;
	$('#id').val(id);
}

// ajax删除班表
var schedule_del_ajax = function(id, obj)
{
	var obj_parent = $(obj).parent();
	if(id == undefined) {
		create_prompt('网络错误');
	}
	z_ajax({'func_name':'del_schedule_line', 'param':{obj_parent,id}}, '/workclass/Index/del_schedule_info', {'schedule_id':id});
}

// 删除一行班表
var del_schedule_line = function(obj, id) {
	obj.remove();

	var input_id = $('#id').val();
	if (input_id != undefined && input_id == id) {
		// set_schedule_info();
	}
}

// 添加周期选择
var add_tab_control = function()
{
	if ($(".control-show-details").length >= 14) {
		create_prompt('周期过长');
		return false;
	}
	var select_obj_id = parseInt($(".control-show-details").length);
	$("#period").val(select_obj_id+1);
	show_select(select_obj_id);
	$('#control-show').append('<a class="control-show-details" onclick="javascript:show_select(' + $(".control-show-details").length + ')"><input type="hidden" value=""><span>选择班次</span></a>');
}

// 删除周期选择
var del_tab_control = function()
{
	$("#details-disable").addClass("disable");
	$("#details-disable").attr("style","z-index:666");
	$($(".control-show-details")[parseInt($(".control-show-details").length)-1]).remove();
	var select_obj_id = parseInt($(".control-show-details").length);
	$("#period").val(select_obj_id);
}

// 打开周期选择框
var show_select = function(action_id) 
{
	$("#details-obj").val(action_id);
	$("#control-select").attr("style", "border:1px solid #EAEAEF;border-bottom:0px;");
	$("#details-disable").removeClass("disable");
	$("#details-disable").attr("style","z-index:-1");
}

// 周期选择内容填充
var set_select = function(obj)
{
	$("#details-disable").addClass("disable");
	$("#details-disable").attr("style","z-index:666");
	var set_input = $($('#control-show').children()[$("#details-obj").val()]).children("input")[0];
	var show_span = $($('#control-show').children()[$("#details-obj").val()]).children("span")[0];
	$(set_input).val($($(obj).children("input")[0]).val());
	$(show_span).text($($(obj).children("span")[0]).text());
}

// 更换展示班表
var alter_schedule = function(id)
{
	var data = {'id':id};
	z_ajax({"func_name":"action_alter_schedule"}, '/workclass/Index/get_schedule_info', data);
}

// 更换班表效果实现
var action_alter_schedule = function(data)
{
	$($('.zbase-line.title').children('input')[0]).val(data.data.schedule_info.name);
	$($('.zbase-line.title').children('i')[0]).attr("onclick","javascript:window.location.href='/workclass/View/set_schedule?schedule_id=" + data.data.schedule_info.id + "';");
	sign_list = [];
	for (var i = 0; i < data.data.sign_list.length; i++) {
		sign_list[i] = data.data.sign_list[i];
	};
	sign_start_date = new Date(data.data.schedule_info.start_time);
	zCalendar_com.init_calendar();
	zCalendar({start:true, drawing:true});

	var class_list = $("#class-list");
	class_list.children().remove();
	for (var i=0; i<data.data.class_list.length; i++) {
		var a_obj = document.createElement('a');
		a_obj.setAttribute("href", "/workclass/view/set_class?class_id=" + data.data.class_list[i].id);
		a_obj.setAttribute("class", "control-show-details sign-text-color" + data.data.class_list[i].sign);
		a_obj.innerHTML = data.data.class_list[i].name;
		class_list.append(a_obj);
	}

	$('#today_class').text(data.data.today_class.name);
	$('#today_class').attr('class', 'zline-title sign-text-color' + data.data.today_class.sign + ' no-border');
	scrollTo(0,0);
}