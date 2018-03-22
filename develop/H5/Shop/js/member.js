/**
 * 用户控制相关js
 */

var login_ajax = function(obj)
{
	var mobile = $('input[name=account]').val();
	var password = $('input[name=password]').val();
	
	obj.setAttribute('onclick-replace', obj.getAttribute('onclick'));
	
	$.ajax({
		type : 'POST',
		async : false,
		url : '/member/Index/login',
		data : {'mobile':mobile,'password':password},
		dataType : 'json',
		success : function(data) {
			create_prompt(data.msg);
			if (data.code != 200) {
				obj.setAttribute('onclick', obj.getAttribute('onclick-replace'));
				if (data.data.url != undefined) {
					window.location.href = data.data.url;
				}
				return false;
			}
			if (data.data.url != undefined) {
				window.location.href = data.data.url;
			} else {
				window.location.href = '/';
			}
			return true;
		},
		error : function() {
			obj.setAttribute('onclick', obj.getAttribute('onclick-replace'));
		}
	});
}

var submit_ajax = function(obj)
{
	var mobile = $('#account').val();
	var password = $('#password').val();
	var verify = $('#verify').val();
	var msg_type = $('#msg_type').val();
	var type_str = (msg_type == 'register') ? '注册' : '提交';
	
	if (mobile == '' || password == '' || verify == '') {
		create_prompt(type_str + '资料不完整');
		return false;
	}

	obj.setAttribute('onclick-replace', obj.getAttribute('onclick'));
	
	$.ajax({
		type : 'POST',
		async : false,
		url : '/member/Index/' + msg_type,
		data : {'mobile':mobile,'password':password,'verify':verify},
		dataType : 'json',
		success : function(data) {
			create_prompt(data.msg);
			if (data.code != 200) {
				obj.setAttribute('onclick', obj.getAttribute('onclick-replace'));
				if (data.data.url != undefined) {
					window.location.href = data.data.url;
				}
				return false;
			}
			setTimeout(function() {
				if (data.data.url != undefined) {
					window.location.href = data.data.url;
				} else {
					window.location.href = '/';
				}
			},2000);
			
			return true;
		},
		error : function() {
			obj.setAttribute('onclick', obj.getAttribute('onclick-replace'));
		}
	});
}