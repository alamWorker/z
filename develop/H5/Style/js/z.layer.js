/* z layer js */

/* 夹层 */
var z_layer = function(data){
	data = data || {};
	var selected_data = {};

	/* 选项卡选择回调 */
	var show_option = function(data) {
		if (data == undefined) {
			console.log(true);
		} else {
			console.log(data);
		};
	};
	/* 应用参数 */
	var options = {
		id : data.id || new Date().getTime(),
		title : data.title || '',
		callback : data.callback || show_option,
		select_list : data.select_list || [],
		form_id : data.form_id || ''
	};
	if (data.id == undefined) {
		options.id = 'layer-id-' + options.id;
	};
	/* 阴影 */
	var create_destroy = function() {
		var div = document.createElement('div');
		div.setAttribute('class', 'z-l-destroy');
		$(div).on('click', function(){
			$('#' + options.id).fadeOut();
		});
		return div;
	};
	/* 主体 */
	var create_content = function() {
		var div = document.createElement('div');
		div.setAttribute('class', 'z-l-content');
		return div;
	};
	/* 标题确认按钮 */
	var selected_submit = function(data){
		$('#'+options.id).hide();
		if (JSON.stringify(data) != "{}") {
			options.callback(data);
		} else {
			options.callback();
		};
	};
	/* 标题 */
	var create_title = function() {
		var title = document.createElement('div');
		title.setAttribute('class', 'z-l-title');
		var line = document.createElement('div');
		line.setAttribute('class', 'z-line');
		var icon_r = document.createElement('div');
		icon_r.setAttribute('class', 'z-line-icon-r');
		var i_selected = document.createElement('i');
		i_selected.setAttribute('class', 'z-icon z-icon-selected-r');
		$(i_selected).on('click', function(){
			$('#' + options.id).fadeOut();
		});
		if (options.callback != '') {
			$(i_selected).on('click', function(){
				selected_submit(selected_data);
			});
		}
		var i_close = document.createElement('i');
		i_close.setAttribute('class', 'z-icon z-icon-close-b');
		$(i_close).on('click', function(){
			$('#' + options.id).hide();
		});

		var span = document.createElement('span');
		span.setAttribute('class', 'z-label');
		if (options.title != '') {
			$(span).html('<i class="z-l-border"></i>' + options.title);
		};

		$(icon_r).append(i_selected);
		$(icon_r).append(i_close);
		$(line).append(icon_r);
		$(line).append(span);
		$(title).append(line);
		return title;
	};
	/* 可滑动抽屉 */
	var create_drawer = function() {
		var div = document.createElement('div');
		div.setAttribute('class', 'z-l-c-drawer');
		return div;
	};
	/* 选项卡 */
	var create_select_list = function()
	{
	 	var center = document.createElement('center');
		center.setAttribute('class', 'z-t-center');
		data = options.select_list;
		for (key in data) {
		 	var div = document.createElement('div');
			div.setAttribute('class', 'z-line');
		 	var span = document.createElement('span');
			span.setAttribute('class', 'z-label z-l-c-d-select');
			span.setAttribute('data-key', key);
			if (data[key].selected == 1) {
				$(span).removeClass('z-l-c-d-select');
				$(span).addClass('z-l-c-d-selected');
				selected_data = data[key];
			};
			for (key_c in data[key].attr) {
				span.setAttribute(data[key].attr[key_c][0], data[key].attr[key_c][1]);
			};
			$(span).html(data[key].content);
			// 选项点击事件
			$(span).on('click', function(){
				var key = $(event.target).data('key');
				selected_data = data[key];

				$('.z-l-c-d-selected').removeClass('z-l-c-d-selected');
				$(event.target).addClass('z-l-c-d-selected');
			});

			$(div).append(span);
			$(center).append(div);
		 }; 
		 return center;
	};
	/* 内容 */
	var create_layer = function() {
		layer = document.createElement('div');
		layer.setAttribute('class', 'z-layer');
		layer.setAttribute('id', options.id);

		var destroy = create_destroy();
		var content = create_content();
		var title = create_title();
		var drawer = create_drawer();
		if (options.form_id != '') {
			var form = $('#'+options.form_id);
			$(drawer).append(form);
			form.show();
		} else if (options.select_list.length != 0) {
			var select = create_select_list();
			$(drawer).append(select);
		};

		$(layer).append(destroy);
		$(content).append(title);
		$(content).append(drawer);
		$(layer).append(content);
		$('body').append(layer);
	};

	var init_layer = function() {
		var layer_obj = document.getElementById(options.id);
		if (layer_obj == null) {
			create_layer();
		} else {
			$('#'+options.id).show();
		};
	}

	init_layer();
	return options.id;
};