

/**
 * more 按钮操作
 */
var show_more = function() {
	var more_obj = document.getElementById("more");
	var type = more_obj.getAttribute("action-type");
	var src = more_obj.getAttribute("src");
	var replace = more_obj.getAttribute("src-replace");
	var search_obj = document.getElementById("text-search");
	if (type == "1") {
		more_obj.setAttribute("action-type", "0");
		search_obj.setAttribute("style", "right: 142px;");
	} else {
		more_obj.setAttribute("action-type", "1");
		search_obj.setAttribute("style", "right: 74px;");
	}
	more_obj.setAttribute("src", replace);
	more_obj.setAttribute("src-replace", src);
}

/**
 * 滚屏长度计算
 */
window.onload = function(){
	ad_slide_reckon('trolley-slide');
}