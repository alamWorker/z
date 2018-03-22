/*!
 * =====================================================
 * Zapp 颜色选择控件
 * =====================================================
 */

(function($, doc) {
	$.init();
	$.ready(function() {
		var colorPicker = new $.PopPicker();
		colorPicker.setData([{
			value: 'mui-badge-primary',
			text: '<span class="mui-badge mui-badge-primary mui-badge-inverted">colour</span>'
		},{
			value: 'mui-badge-success',
			text: '<span class="mui-badge mui-badge-success mui-badge-inverted">colour</span>'
		},{
			value: 'mui-badge-warnin',
			text: '<span class="mui-badge mui-badge-warnin mui-badge-inverted">colour</span>'
		},{
			value: 'mui-badge-danger',
			text: '<span class="mui-badge mui-badge-danger mui-badge-inverted">colour</span>'
		},{
			value: 'mui-badge-royal',
			text: '<span class="mui-badge mui-badge-royal mui-badge-inverted">colour</span>'
		}]);
		var showUserPickerButton = doc.getElementById('showUserPicker');
		var checkMuiColor = doc.getElementById('checkMuiColor');
		var identify = doc.getElementById('identify');
		showUserPickerButton.addEventListener('tap', function(event) {
			colorPicker.show(function(items) {
				checkMuiColor.setAttribute('class', 'mui-badge '+items[0].value);
				identify.setAttribute('value', items[0].value);
			});
		}, false);
	});
})(mui, document);
