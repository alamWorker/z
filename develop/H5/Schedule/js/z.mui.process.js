/*!
 * =====================================================
 * Zapp process
 * =====================================================
 */

mui.init({
	swipeBack : false,
});

/* 侧滑 start */
// 侧滑容器父节点
var offCanvasWrapper = mui('#offCanvasWrapper');
// 监听开关侧滑
var offCanvasToggle = document.getElementById('offCanvasToggle');
var offCanvasShow = document.getElementById('offCanvasShow');
var offCanvasHide = document.getElementById('offCanvasHide');
if (offCanvasToggle != null) {
	offCanvasToggle.addEventListener('tap', function() {
		offCanvasWrapper.offCanvas('toggle');
	});
}
if (offCanvasShow != null) {
	document.getElementById('offCanvasShow').addEventListener('tap',
			function() {
				offCanvasWrapper.offCanvas('show');
			});
}
if (offCanvasHide != null) {
	document.getElementById('offCanvasHide').addEventListener('tap',
			function() {
				offCanvasWrapper.offCanvas('close');
			});
}
// 主界面和侧滑菜单界面均支持区域滚动；
mui('#offCanvasSideScroll').scroll();
mui('#offCanvasContentScroll').scroll();
/* 侧滑 end */

/* 时间选择控件 start */
(function($) {
	$.init();
	var btns = $('.ztime');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var optionsJson = this.getAttribute('data-options') || '{}';
			var options = JSON.parse(optionsJson);
			var id = this.getAttribute('id');
			var picker = new $.DtPicker(options);
			picker.show(function(rs) {
				$("#" + id)[0].value = rs.text;
				picker.dispose();
			});
		}, false);
	});
})(mui);
/* 时间选择控件 end */

/* 列表左划控件 start */
(function($) {
	var btnArray = [ '确认', '取消' ];

	$('#common_list').on('slideright', '.mui-table-view-cell', function(event) {
		var elem = this;
		console.log(elem);
		var url = elem.getAttribute('zLeft');
		window.location.href = url;
	});

	$('#common_list').on(
			'slideleft',
			'.mui-table-view-cell',
			function(event) {
				var elem = this;
				console.log(elem);
				var fun_name = elem.getAttribute('zRight');
				mui.confirm('确认操作？', 'Z·series', btnArray, function(e) {
					if (e.index == 0) {
						if (fun_name != undefined && fun_name != 'undefined'
								&& fun_name != '') {
							if (eval(fun_name)) {
								elem.parentNode.removeChild(elem);
							}
						}
					}
					$.swipeoutClose(elem);
				});
			});
})(mui);
/* 列表左划控件 start */