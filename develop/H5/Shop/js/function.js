/**
 * 渲染效果js
 */

/* 密码框显示字符 */
var show_pass = function(obj){
	if (obj == undefined) {
		console.log("Obj of pass is undefined!")
		return false;
	}
	var pass_input = document.getElementById("password");
	var input_type = pass_input.getAttribute("type");
	var src_replace = obj.getAttribute("src-replace");
	var style_str = obj.getAttribute("style");
	var src = (style_str == undefined || style_str == "") ? "background-image:url('" + src_replace + "')" : "";
	obj.setAttribute("style", src);
	pass_input.setAttribute("type", (input_type == "text") ? "password" : "text");
}

/* 倒计时控件 */
var count_down = function(obj, time){
	if (obj.getAttribute("onclick") !== "") {	
		obj.setAttribute("onclick-tem", obj.getAttribute("onclick"));
		obj.setAttribute("onclick", "");
	}
	time--;
	if (obj.getAttribute("class").indexOf("action") >= 0) {
		obj.setAttribute("class", obj.getAttribute("class").replace(/action/, ""));
	}
	if (time < 0) {
		obj.innerHTML = "";
		obj.setAttribute("class", obj.getAttribute("class") + " action");		
		obj.setAttribute("onclick", obj.getAttribute("onclick-tem"));
		obj.setAttribute("onclick-tem", "");
	} else {
		obj.innerHTML = time+'s';
		setTimeout(function(){count_down(obj, time);},1000);
	}
}

/* 提示框 */
var create_prompt = function(text, icon, time)
{
	var body_obj = document.getElementsByTagName("body")[0];
	var prompt = document.createElement("div");
	prompt.setAttribute("id", "z-prompt");
	var i = document.createElement("i");
	prompt.appendChild(i);
	var span = document.createElement("span");
	if(text != undefined && text != '') {
		span.innerHTML = text;
		prompt.appendChild(span);
		prompt.setAttribute("style", "bottom: 70;");
	} else if(icon != undefined && icon != '') {
		$("#z-prompt").remove();
		i.setAttribute("class", "icon " + icon);
		prompt.setAttribute("style", "height: 40px; min-width: 0; bottom: 20;");
		prompt.appendChild(i);
	} else {
		return false;
	}
	body_obj.appendChild(prompt);
	if (time == undefined) {
		time = 1000;
	}
	setTimeout(function(){$("#z-prompt").remove();}, time);
}
/* create_prompt('test','',90000); */
/* create_prompt('','link_b',90000); */

/**
 * 提示框
 * eg: 
 * var msg_obj = new Array();
 * msg_obj[0] = new Array();
 * msg_obj[0][0] = "删除图片";
 * msg_obj[0][1] = "img_del";
 * msg_obj[1] = new Array();
 * msg_obj[1][0] = "设为封面";
 * msg_obj[1][1] = "img_main";
 * show_z_msg(msg_obj);
 */
var show_z_msg = function(msg_obj)
{
	// 创建msg对象
	var msg_cap_obj = document.createElement("div");
	var msg_content_obj = document.createElement("div");

	msg_cap_obj.setAttribute("onclick", "hide_z_msg()");
	msg_cap_obj.setAttribute("class", "z-msg-cap");
	msg_content_obj.setAttribute("class", "z-msg-content");

	for (var i = 0; i < msg_obj.length; i++) {
		if (msg_obj[i] == undefined) {
			continue;
		};
		var span_obj = document.createElement("span");
		span_obj.innerText = msg_obj[i][0];
		span_obj.setAttribute("onclick", msg_obj[i][1]);
		msg_content_obj.appendChild(span_obj);
	};
	msg_cap_obj.appendChild(msg_content_obj);
	$("body").append(msg_cap_obj);
}
var hide_z_msg = function()
{
	var msg_obj = document.getElementsByClassName("z-msg-cap")[0];
	msg_obj.remove();
}
/**
 * 单一提示操作
 */
var alone_msg_operate = function(msg_content, eval_function)
{
	var msg_obj = new Array();
	msg_obj[0] = new Array();
	msg_obj[0][0] = msg_content;
	msg_obj[0][1] = eval_function;
	show_z_msg(msg_obj);
}

/**
 * 广告滚屏长度计算
 */
var ad_slide_reckon = function(id) {
	var ad_slide_obj = document.getElementById(id);
	if (ad_slide_obj == undefined || ad_slide_obj == null) {
		return false;
	};

	ad_slide_obj.setAttribute("style","width:2000px");
	var li_arr = ad_slide_obj.children;
	var add_width = -5;
	for (var i=0;i<li_arr.length;i++){
		add_width += ad_slide_obj.offsetHeight/li_arr[i].children[0].naturalHeight * li_arr[i].children[0].naturalWidth;
		add_width += 5;
	}
	ad_slide_obj.setAttribute("style", "width:" + add_width + "px");
}
/**
 * 图片加载
 */
var img_init = function()
{
	var img = document.getElementsByTagName("img");
	for (var i = 0; i < img.length; i++) {
		var _src = img[i].getAttribute('_src');
		var src = img[i].getAttribute('src');
		if (src == undefined || src == null) {
			if (_src != undefined) {
				img[i].setAttribute("src", _src);
				img[i].removeAttribute("_src");
			};
		};
	};
}
img_init();

// 图片404处理
var img_error = function(image){
    image.style.display = 'none';
    // document.getElementById("img").setAttribute("src", "images/demo.png");
}
/**
 * 获取当前滚动条位置
 */
var ScollPostion = function() {
    var top, left, width, height;
    if (document.documentElement && document.documentElement.scrollTop) {
        top = document.documentElement.scrollTop;
        left = document.documentElement.scrollLeft;
        width = document.documentElement.scrollWidth;
        height = document.documentElement.scrollHeight;
    } else if (document.body) {
        top = document.body.scrollTop;
        left = document.body.scrollLeft;
        width = document.body.scrollWidth;
        height = document.body.scrollHeight;
    }
    return {
        top: top,
        left: left,
        width: width,
        height: height
    };
}

/**
 * 获取滚动条当前位置
 */
var getScrollTop = function() {
	var scrollTop = 0;
	if (document.documentElement && document.documentElement.scrollTop) {
		scrollTop = document.documentElement.scrollTop;
	}
	else if (document.body) {
		scrollTop = document.body.scrollTop;
	}
	return scrollTop;
}

/**
 * 获取当前可视范围的高度
 */
var getClientHeight = function() {
	var clientHeight = 0;
	if (document.body.clientHeight && document.documentElement.clientHeight) {
		clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
	}
	else {
		clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
	}
	return clientHeight;
}

/**
 * 获取文档完整的高度
 **/
var getScrollHeight = function() {
	return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
}

window.onscroll = function () {
	if (getScrollTop() + getClientHeight() == getScrollHeight()) {
	}
};

/**
 * 顶部隐藏导航
 */
var nav_manage = function(){
	var nav_obj = document.getElementsByClassName('z-base-nav')[0];
	var zbase_obj = document.getElementsByClassName('zbase')[0];
	if (nav_obj.style.display === 'none') {
		zbase_obj.style.top = "60px";
		nav_obj.setAttribute("style", "display: block;");
	} else {
		zbase_obj.style.top = "0";
		nav_obj.setAttribute("style", "display: none;");
	}
}

var select_radio = function(input_id, radio_id) {
	var input_obj = document.getElementById(input_id);
	var radio_obj = document.getElementById(radio_id);
	if (input_obj.value == undefined || input_obj.value == 0) {
		input_obj.value = 1;
		radio_obj.setAttribute("class", radio_obj.getAttribute("class").replace(/radio_e/, "radio_r"));
	} else {
		input_obj.value = 0;
		radio_obj.setAttribute("class", radio_obj.getAttribute("class").replace(/radio_r/, "radio_e"));
	};
}