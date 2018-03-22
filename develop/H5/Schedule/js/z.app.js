/*!
 * =====================================================
 * Zapp common
 * =====================================================
 */

var zApp = {

	init : function(obj) {
		obj = (obj == undefined) ? {} : obj;

		this.checkWechatBrowser();
	},

	/* 判断是否微信登陆 */
	is_wechat : function isWeiXin() {
		var ua = window.navigator.userAgent.toLowerCase();

		if (ua.match(/MicroMessenger/i) == 'micromessenger') {
			return true;
		} else {
			return false;
		}
	},

	/* 根据浏览器显示模块 */
	checkWechatBrowser : function() {
		var isWechatList = document.getElementsByClassName("is_wechat");
		var isnWechatList = document.getElementsByClassName("isn_wechat");
		var showList = '';

		if (this.is_wechat()) {
			showList = isWechatList;
			deleteList = isnWechatList;
		} else {
			showList = isnWechatList;
			deleteList = isWechatList;
		}

		for (i = 0; i < showList.length; i++) {
			var displaystyle = showList[i].getAttribute('displaystyle');
			if (displaystyle == null || displaystyle == 'null'
					|| displaystyle == '') {
				displaystyle = "inline";
			}
			showList[i].style.display = displaystyle;
		}
		// 删除不必要的节点，重新排版css
		for (i = 0; i < deleteList.length; i++) {
			var deleteNode = deleteList[i];
			deleteNode.parentNode.removeChild(deleteNode);
		}
	},

	/* 基于mui的自动消失弹出框，不存在mui对象则使用alert */
	toast : function(msg, time) {
		// <div class="mui-toast-container"><div
		// class="mui-toast-message">正在...</div></div>
		this.toast_close();
		if (typeof (mui) == 'undefined' || typeof (mui) == undefined) {
			alert(msg);
			return true;
		}
		mui.toast(msg);
		if (time != undefined && time != '') {
			setTimeout("zApp.toast_close();",time);
		}
	},
	toast_close : function() {
		var toast = document.getElementsByClassName("mui-toast-container");
		if (typeof (toast) != undefined) {
			for (i = 0; i < toast.length; i++) {
				toast[i].parentNode.removeChild(toast[i]);
			}
		}
	}
};
zApp.init();


/**
 * 时间对象
 */
var zTime = {
	month : '',
	year : '',
	calendarType : 0,// 0：从周日开始周期，1：从周一开始周期
	init : function() {
		var myDate = new Date();
		if(this.month == undefined || this.month == '') {
			this.month = myDate.getMonth() + 1;
		}
		if(this.year == undefined || this.year == '') {
			this.year = myDate.getFullYear();
		}
	},
	// 获取最近的周几的具体日期
	calculateWeekByDistance : function(weekNum) {
		var myDate = new Date();
		var distance = '';
		if (weekNum >= myDate.getDay()) {
			distance = weekNum - myDate.getDay();
		} else if (weekNum < myDate.getDay()) {
			distance = 7 - myDate.getDay() + weekNum;
		}
		myDate.setFullYear(myDate.getFullYear(), myDate.getMonth(), myDate
				.getDate()
				+ distance);
		return myDate.getFullYear() + '/' + myDate.getMonth() + '/'
				+ myDate.getDate();
	},
	// 开始时间 + 间隔 计算日期,参数留空取当天
	getDateByCondition : function(date, interval) {
		var myDate = new Date();
		myDate.setHours(0);
		myDate.setMinutes(0);
		myDate.setSeconds(0);
		if (date == '' || typeof (date) == 'undefined') {
			date = Date.parse(myDate) / 1000;
		} else {
			date = Date.parse(new Date(date)) / 1000;
		}
		interval = (interval == '' || typeof (interval) == 'undefined') ? 0
				: interval;
		myDate.setTime((date + (86400 * interval)) * 1000);
		return myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-"
				+ myDate.getDate();
	},
	// 开始时间 + 间隔 计算日期
	getDateByAdd : function(date, interval) {
		var nd = new Date(date);
		nd = nd.valueOf();
		nd = nd + interval * 24 * 60 * 60 * 1000;
		nd = new Date(nd);
		var y = nd.getFullYear();
		var m = nd.getMonth() + 1;
		var d = nd.getDate();
		if (m <= 9)
			m = "0" + m;
		if (d <= 9)
			d = "0" + d;
		var result = y + "-" + m + "-" + d;
		return result;
	}
};
zTime.init();

/**
 * 封装日历
 * type : 0|1（从周日开始或从周一开始）
 * month : 0~11
 */
/*
 * 2017.8日历
 * zCalendar.month = 7;
 * zCalendar.year = 2017;
 * zCalendar.create_calendar_html();
 * 或
 * zCalendar.create_calendar_html(7,2017);
 */
var zCalendar = {
	id : 'z-calendar',
	title_class_name : 'z-calendar-title',
	content_class_name : 'z-calendar-content',
	header_class_name : 'z-calendar-header',
	icon_class_name : 'z-calendar-icon',
	border_class_name : 'z-calendar-border',
	left_btn : '',
	right_btn : '',
	month : 0,
	year : 1970,
	type : 0,
	month_eng_name : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Spt", "Oct", "Nov", "Dec" ],
	
	init : function() {
		var my_date = new Date();
		if (this.month === '' || this.month < 0 || this.month > 11 || this.month == undefined) {
			this.month = my_date.getMonth();
		}
		if (this.year == '' || this.year < 1970 || this.year == undefined) {
			this.year = my_date.getFullYear();
		}
	},
	
	/**
	 * 创建日历流
	 * @param {Object} month 0~11
	 * @param {Object} year
	 */
	create_calendar_list : function(month, year) {
		if (month == '' || month > 11 || month == undefined) {
			month = this.month;
		}
		if (year == '' || year < 1970 || year == undefined) {
			year = this.year;
		}
		
		// 当月第一天周几
		var first_date = new Date(year,month,1);
		var first_date_day = first_date.getDay();
		// 日历表第一天的日期时间戳
		var start_time = first_date.getTime()-(first_date_day-parseInt(this.type))*86400000;
		
		// 当月最后一天周几
		var last_date = new Date(year,(parseInt(month)+1),0);
		var last_date_day = last_date.getDay();
		// 日历表最后一天的时间戳
		var end_time = last_date.getTime()+(6-last_date_day+parseInt(this.type))*86400000;

		// 日历表天数
		var list_length = (end_time - start_time + 86400000)/86400000;
		
		// 创建日历流
		var date_list = new Array();
		for (var i = 0; i < list_length; i++) {
			date_list = date_list.concat(start_time+(i*86400000));
		}
		
		return date_list;
		
		var my_date = new Date();
		my_date.setTime(date_list[0]);
		console.log(my_date.getFullYear()+','+(my_date.getMonth()+1)+','+my_date.getDate()+','+my_date.getDay());
		my_date.setTime(start_time);
		console.log(my_date.getFullYear()+','+(my_date.getMonth()+1)+','+my_date.getDate()+','+my_date.getDay());
		my_date.setTime(end_time);
		console.log(my_date.getFullYear()+','+(my_date.getMonth()+1)+','+my_date.getDate()+','+my_date.getDay());
	},
	
	/**
	 * 日历流输出html
	 * @param {Object} month 0~11
	 * @param {Object} year
	 */
	create_calendar_html : function(month, year) {
		if (month === '' || month > 11 || month == undefined) {
			month = this.month;
		}
		if (year == '' || year < 1970 || year == undefined) {
			year = this.year;
		}
		if (this.id == '' || this.id == undefined) {
			return false;
		}
		
		// 创建日历对象并清空
		var calendar_table = $('#'+this.id);
		calendar_table.html('');
		
		// 输出头部
		calendar_table.append("<div class=\"mui-content-padded "+this.title_class_name+"\"></div>");
		var calendar_title = $("."+this.title_class_name);
		calendar_title.append("<ul><li><i class=\""+this.icon_class_name+"\" id=\"z-calendar-minus\">◁</i></li><li id=\"z-calendar-month\" class=\"zTime\" zFun=\"z_calendar_update_month\" data-options='{\"type\":\"month\"}'><h4>Month 1970</h4></li><li><i class=\""+this.icon_class_name+"\" id=\"z-calendar-add\">▷</i></li></ul>");
		
		// 输出表格header
		calendar_table.append("<div class=\"mui-content-padded "+this.content_class_name+"\"></div>");
		var calendar_content = $("."+this.content_class_name);
		calendar_content.append("<ul class=\""+this.header_class_name+"\"><li>Sum</li><li>Mon</li><li>Tue</li><li>Wed</li><li>Thu</li><li>Fri</li><li>Sat</li></ul>");
		
		// 输出表格content
		var date_list = this.create_calendar_list(month, year);
		for (var i = 0; i < (date_list.length / 7); i++) {
			calendar_content.append("<ul></ul>");
		}
		var list_loca = 1;
		var set_date = new Date();
		for (var i = 0; i < date_list.length; i++) {
			set_date.setTime(date_list[i]);
			calendar_content.children("ul").eq(list_loca).append("<li calendar-time=\""+date_list[i]+"\">"+set_date.getDate()+"</li>");
			if(i % 7 == 6) {
				list_loca++;
			}
		}

		// 改正表格header
		set_date.setTime(date_list[Math.ceil(date_list.length/2)]);
		calendar_title.children("ul").children("li").eq(1).children('h4').html(this.month_eng_name[set_date.getMonth()]+'|'+(set_date.getMonth()+1)+ '&nbsp;'+set_date.getFullYear());
	},
	
	/**
	 * 根据规律获取指定日期时间戳对应的标识
	 * @param {Object} sign_list 标识|规律列表
	 * @param {Object} sign_start_time 规律开始时间
	 * @param {Object} time 实际计算时间戳
	 */
	get_law_by_date : function(sign_list, sign_start_time, time) {
		var result = 0;
		var num = ((time - sign_start_time) % (86400000 * sign_list.length)) / 86400000;
		
		if (num > 0) {
			result = num;
		} else if (num < 0) {
			result = sign_list.length + num;
		} else {
			result = 0;
		}

		return sign_list[result];
	},
	
	/**
	 * 班表渲染
	 * @param {Object} sign_list
	 * @param {Object} sign_start_time
	 */
	schedule_rendering : function(sign_list, sign_start_time) {

		// 当前日历时间定位
		var now_time = $(".z-calendar-content").children("ul").eq(3).children("li").eq(3).attr("calendar-time");
		var now_date = new Date();
		now_date.setTime(now_time);
		
		// 获取日历对象
		var calendar = $(".z-calendar-content").children("ul").children("li");
		for (var i = 0; i < calendar.length; i++) {
			if (calendar.eq(i).attr("calendar-time") != undefined && calendar.eq(i).attr("calendar-time") != "") {
				var calendar_time = calendar.eq(i).attr("calendar-time");
				var calendar_date = new Date();
				calendar_date.setTime(calendar_time);
				
				if (calendar_date.getMonth() != now_date.getMonth()) {
					calendar.eq(i).addClass('z-calendar-header');
				} else {
					var className = this.get_law_by_date(sign_list, sign_start_date, calendar_time);
					calendar.eq(i).attr('class', className);
				}
			}
		}
	}
};

/**
 * 简单的增删改Ajax对象
 */
var zAjax = {
	type : 'POST',
	async : false,
	url : '',
	data : {},
	dataType : 'JSON',
	fun_name : '',
	sign : '',
	init : function() {
		type = 'POST';
		async = false;
		url = '';
		data = {};
		dataType = 'JSON';
		fun_name = '';
		sign = ''; // 回调
	},
	action : function() {
		if (this.url == '') {
			zApp.toast('System error.');
		}
		$.ajax({
			type : this.type,
			async : this.async,
			url : this.url,
			data : this.data,
			dataType : this.dataType,
			beforeSend : function() {
				zApp.toast('正在...',1000);
			},
			success : function(data) {
				console.log(data);
				zApp.toast(data.msg);
				if (data.href != '' && typeof (data.href) != 'undefined') {
					setTimeout(function() {
						window.location.href = data.href;
					}, 2000);
				}
				if (typeof (zAjax.fun_name) != undefined && typeof (zAjax.fun_name) != 'undefined') {
					var eval_str = zAjax.fun_name + '(data';
					if (typeof (zAjax.sign) != undefined && typeof (zAjax.sign) != 'undefined' && zAjax.sign != '') {
						eval_str += ',"' + zAjax.sign + '"';
					}
					eval_str += ')';
					eval(eval_str);
				}
			},
			error : function() {
				zApp.toast('Network Error');
			}
		});
	}
}

/**
 * 监听控件
 */
/* 自动消失的弹出框 start */
$(document).on('tap', '.showmsg', function(event) {
	var msg = $(event.target).attr("msg");
	if (msg != '' && msg != undefined) {
		zApp.toast(msg);
	}
})
/* 自动消失的弹出框 end */

/* 链接地址跳转 start */
$(document).on('tap', '.zlink', function(event) {
	var url = $(event.target).attr("zlink");
	console.log($(event.target));
	location.href = (url == undefined) ? "#" : url;
})
/* 链接地址跳转 end */

/* 链接地址跳转 start */
$(document).on('tap', '.zAjax', function(event) {
	var url = $(event.target).attr("zAjax");
	if (url == '' || url == undefined) {
		return false;
	}

	zAjax.init();
	zAjax.url = url;
	zAjax.action();
})
/* 链接地址跳转 end */

/* 导航按钮点击闪烁 start */
$(document).on('tap', '.zTwinkle', function(event) {
	$(event.target).attr("style", "color:#87CEFA !important");
	setTimeout(function(event) {
		$('.zTwinkle').attr("style", "color:#929292");
	}, 1000);
});
/* 导航按钮点击闪烁 end */

/* 预加载提示文本 start */
$(document).ready(function() { 
	var zLoad = $('.zLoad').val();
	if (zLoad != undefined && zLoad != 'undefined' && zLoad != '') {
		zApp.toast(zLoad);
	}
}); 
/* 预加载提示文本 end */