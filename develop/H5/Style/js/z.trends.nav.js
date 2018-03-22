
/**
 * 动态导航
 */
$(".z-base").scroll(function() {
	var show_trends = $('.z-t-n-tb');
	if (show_trends !== undefined) {
		var header_nav_height = $('.z-header-nav').height();
		header_nav_height = (header_nav_height == null) ? 0 : header_nav_height;
		var show_from = show_trends.data('showfrom');

		var top_scroll = $(event.target).scrollTop();
		var set_height = $(show_from).height() - show_trends.height() + header_nav_height;
		if (top_scroll >= set_height && top_scroll != 0) {
			show_trends.fadeIn();
		} else if (top_scroll < set_height || top_scroll == 0) {
			show_trends.fadeOut();
		};
	};
});