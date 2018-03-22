/* z image js */
/* 优先级 1 */

/* 图片元素 */

/**
 * 图片加载
 */
var img_init = function()
{
	var img = document.getElementsByTagName("img");
	for (var i = 0; i < img.length; i++) {
		var _src = img[i].dataset.src;
		var src = img[i].getAttribute('src');
		if (src == undefined || src == null) {
			if (_src != undefined) {
				img[i].setAttribute("src", _src);
				img[i].setAttribute("onerror", "img_error(this)");
			};
		};
	};
}
var cover_init = function()
{
	var cover_obj = document.getElementsByClassName("z-i-b-cover");
	for (var i = 0; i < cover_obj.length; i++) {
		var background_img_url = cover_obj[i].dataset.backgroundimgurl;
		if ((background_img_url != undefined || background_img_url != null) && background_img_url != '?') {
			var _background_img_url = cover_obj[i].getAttribute("style");
			cover_obj[i].setAttribute("style", "background-image:url('" + background_img_url+ "');"  + _background_img_url);
			$(cover_obj[i]).removeAttr("data-backgroundimgurl");
		};
	};

}
$(function(){
	img_init();
	cover_init();
});
/**
 * 图片404处理
 */
var img_error = function(obj){
    obj.style.display = 'none';
}