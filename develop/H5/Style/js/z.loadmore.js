/* z loadmore js */
/* 优先级 2 */

/* 加载更多 */
var z_load_more = function() {
	this.copy_obj = '{}';
	this.copy_data = '{}';
	this.append_obj = '{}';
	this.submit_note = '';
	this.is_submit = 0;
	this.end_func = [];
	// 提交初始化
	this.init_post = function(submit_note) {
		this.submit_obj = submit_note || '';
		if (this.is_submit == 1) {
			return false;
		};
		this.is_submit = 1;
		if (this.submit_obj != '') {
			if (this.submit_obj.tagName == 'SPAN') {
				this.submit_obj = $(this.submit_obj).parent();
			} else {
				this.submit_obj = $(this.submit_obj);
			};
			this.submit_obj.find('i').removeClass('z-icon-down-b');
			this.submit_obj.find('i').addClass('z-icon-refresh-r');
			this.submit_obj.find('span').html('正在加载...');
		};
		return true;
	};
	// 提交初始化回滚
	this.restore = function() {
		if (this.submit_obj != '') {
			this.is_submit = 0;
			this.submit_obj.find('i').addClass('z-icon-down-b');
			this.submit_obj.find('i').removeClass('z-icon-refresh-r');
			this.submit_obj.find('span').html('点击加载更多');
		}
	};
	// 渲染初始化
	this.init_render = function() {
		if (this.copy_obj == '{}' || this.copy_data == '{}' || this.append_obj == '{}') {
			return false;
		};
		return true
	};
	// 数据渲染
	this.render = function(data) {
		var clone_obj = this.copy_obj.clone();
		// 渲染内容
		for (var key in data) {
			var data_obj = clone_obj.find('.copy-data-' + key);
			if (data_obj.length != 0) {
				if (data_obj.html() == '?') {
					data_obj.html(data[key]);
				} else if (data_obj.attr('href') == '?') {
					data_obj.attr('href', data[key]);
				} else if (data_obj.attr('src') == '?') {
					data_obj.attr('src', data[key]);
					data_obj.attr("onerror", "img_error(this)");
				} else if (data[key][0] != undefined) {
					// 附加节点参数
					data_obj.attr('data-' + data[key][0], data[key][1]);
				}
				data_obj.removeClass('copy-data-' + key);
			};
		};
		return clone_obj;
	};
	// 数据填充
	this.padding = function() {
		if (this.init_render()) {
			for (key in this.copy_data) {
				var clone = this.render(this.copy_data[key]);
				$(this.append_obj).append(clone);
			}
		};
		this.restore();
	};
	this.end_action = function() {
		if (this.end_func.length != 0) {
			for (key in this.end_func) {
				eval(this.end_func[key]);
			}
		};
	};
	// 行动
	this.action = function(data, copy_obj, append_obj) {
		this.copy_data = data;
		this.copy_obj = copy_obj;
		this.append_obj = append_obj;
		this.padding();
		this.end_action();
	};
};