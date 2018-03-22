/**
 * 数据交互js
 */

 /**
  * 回复选择
  */
var operate_parent = function(parent_id, parent_user)
{
	parent_id = (parent_id == undefined) ? 0 : parent_id;
	var comment_parent = document.getElementsByClassName("comment_parent")[0];
	var parent_id_obj = document.getElementById("parent_id");
	if (parent_id == 0) {
		comment_parent.setAttribute("style", "display:none;");
		parent_id_obj.setAttribute("value", "0");
	} else {
		var parent_object = document.getElementById("parent_object");
		parent_object.innerText = "回复：" + parent_user;
		comment_parent.setAttribute("style", "display:block;");
		parent_id_obj.setAttribute("value", parent_id);
	};
}
/**
 * 评论提交
 */
var comment_save = function(object_id) {
	var content = document.getElementById("comment_content").value;
	var object = document.getElementById("object").value;
	var object_id = document.getElementById("object_id").value;
	var parent_id = document.getElementById("parent_id").value;

	z_ajax({"func_name":"comment_save_add_line"}, "/comment/Index/comment_save", {"content":content,"object_id":object_id,"object":object,"parent_id":parent_id});
}
/**
 * 评论成功添加新行
 */
var comment_save_add_line = function(data) {
	var copy_block = document.getElementById("copy-block");
	var clone_node = copy_block.cloneNode(true);
	var main_block = document.getElementsByClassName("z-sink-content-p")[0];
	clone_node.removeAttribute("id");
	clone_node.removeAttribute("style");

	var set_html = clone_node.innerHTML;
	set_html = set_html.replace(/{comment_id}/g, data.data.comment_id);
	set_html = set_html.replace(/{comment_time}/, data.data.comment_time);
	set_html = set_html.replace(/{comment_content}/, data.data.comment_content);
	set_html = set_html.replace(/{user_avatar}/, 'src="' + data.data.user_avatar + '"');
	set_html = set_html.replace(/{user_nickname}/, data.data.user_nickname);
	set_html = set_html.replace(/{parent_comment}/, data.data.parent_comment);
	set_html = set_html.replace(/{parent_nickname}/, data.data.parent_nickname);
	set_html = set_html.replace(/{msg_content}/, "删除评论");
	set_html = set_html.replace(/{eval_function}/, "comment_del("+data.data.comment_id+")");
	if (data.data.parent_comment != '') {
		set_html = set_html.replace(/{parent_show}/, "block");
	} else {
		set_html = set_html.replace(/{parent_show}/, "none");
	};

	clone_node.innerHTML = set_html;
	main_block.insertBefore(clone_node, copy_block.nextSibling);

	document.getElementById("comment_content").value = '';
	if (document.getElementById("have-no-comment") != undefined) {
		document.getElementById("have-no-comment").remove();
	};
}
/**
 * 评论删除
 */
var comment_del = function(comment_id) {
	z_ajax({"func_name":"comment_del_del_line"}, "/comment/Index/comment_del", {"comment_id":comment_id});
}
/**
 * 删除成功移除行
 */
var comment_del_del_line = function(data) {
	document.getElementById("comment_" + data.data.comment_id).parentNode.remove();
}
/**
 * 评论点评操作
 */
var comment_assess = function(comment_id, type) {
	type = (type == undefined) ? 0 :type;
	z_ajax({"func_name":"comment_assess_set_icon"}, "/comment/Index/comment_assess", {"comment_id":comment_id, "type":type});
}
/**
 * 点评成功修改icon
 */
var comment_assess_set_icon = function(data) {
	var comment_assess_obj = document.getElementById("comment_assess_" + data.data.comment_id);
	if (data.data.type == 1) {
		comment_assess_obj.setAttribute("onclick", "comment_assess("+data.data.comment_id+", 0)");
		comment_assess_obj.setAttribute("class", comment_assess_obj.getAttribute("class").replace(/good_b/, "good_r"));
	} else {
		comment_assess_obj.setAttribute("onclick", "comment_assess("+data.data.comment_id+", 1)");
		comment_assess_obj.setAttribute("class", comment_assess_obj.getAttribute("class").replace(/good_r/, "good_b"));
	};
}