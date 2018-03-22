/*!
 * =====================================================
 * Zapp 被调用js辅助库
 * =====================================================
 */
mui.init();
(function($) {
	$.init();
	var btns = $('.zTime');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var optionsJson = this.getAttribute('data-options') || '{}';
			var options = JSON.parse(optionsJson);
			var id = this.getAttribute('id');
			var fun_name = this.getAttribute('zFun');
			var picker = new $.DtPicker(options);
			picker.show(function(rs) {
				if (fun_name == '' || fun_name == undefined) {
					$("#" + id)[0].value = rs.text;
				} else {
					eval(fun_name+'(rs)');
				}
				picker.dispose();
			});
		}, false);
	});
})(mui);