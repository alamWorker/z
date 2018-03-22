/**
 * 数据交互js
 */

/* 发送验证码 */
var send_verify = function(obj){
	var msg_type = document.getElementById('msg_type');
	var msg_obj = document.getElementById('account');
	
	$.ajax({
		type : 'POST',
		url : '/member/Index/verify',
		data : {'msg_type':msg_type.value,'msg_obj':msg_obj.value},
		dataType : 'json',
		success : function(data) {
			if (data.code == 200) {
				count_down(obj, 60);
			}
			create_prompt(data.msg);
		}
	});
}

/**
 * 数据交互通用ajax
 */
var z_ajax = function(eval_obj, url, data, obj, async, type, dataType)
{
	if (url == undefined || url == '') {
		create_prompt('网络错误');
	}
	if (obj != undefined) {
		obj.setAttribute('onclick-replace', obj.getAttribute('onclick'));
		obj.setAttribute('onclick', '');
	}
	type = (type == undefined || type == '') ? 'POST' : type;
	async = (async == undefined || async == '') ? true : async;
	data = (data == undefined || data == '') ? {} : data;
	dataType = (dataType == undefined || dataType == '') ? 'json' : dataType;
	
	$.ajax({
		type : type,
		async : async,
		url : url,
		data : data,
		dataType : dataType,
		beforeSend : function() {
			create_prompt('','nav_w',500);
		},
		success : function(data) {
			if (data.code != 200) {
				create_prompt(data.msg);
				return false;
			};
			create_prompt('', 'nav_r');
			if (eval_obj != '') {
				var func_param = '';
				if (eval_obj.param == undefined) {
					func_param = 'data';
				} else {
					for(var value in eval_obj.param){
						func_param += 'eval_obj.param.' + value + ',';
					};
					func_param += 'data';
				}
				eval(eval_obj.func_name + '(' + func_param + ')');
			}
			if (obj != undefined) {
				obj.setAttribute('onclick', obj.getAttribute('onclick-replace'));
			}
			setTimeout(function() {
				if (data.data.url != undefined) {
					if (data.data.url == 'reload') {
						location.reload();
					} else if (data.data.url == 'back') {
						window.history.back();
					} else {
						window.location.href = data.data.url;
					}
				}
			}, 1000);
			return true;
		},
		error : function() {
			create_prompt('网络错误');
			if (obj != undefined) {
				obj.setAttribute('onclick', obj.getAttribute('onclick-replace'));
			}
		}
	});
}