

/**
 * 设计点评操作 type 0-差 1-好
 */
var design_assess = function(id, type) 
{
	z_ajax({"func_name":"prompt_design_assess", "param":{id, type}}, "/design/Index/design_assess", {"design_id":id,"type":type});
}
/**
 * 渲染点评（改变两个手的颜色）
 */
var prompt_design_assess = function(id, type)
{
	var assess_obj = document.getElementById("assess_design_" + id);

	var good_r_obj = document.getElementsByClassName("good_r");
	var is_assess = good_r_obj.length > 0 ? 1 : 0;

	if (type == 1) {
		assess_obj.setAttribute("class", assess_obj.getAttribute("class").replace(/good_b/, "good_r"));
		if (is_assess == 0) {
			assess_obj.childNodes[0].innerHTML = parseInt(assess_obj.childNodes[0].innerHTML) + 1;
		};
		assess_obj.setAttribute("onclick", "design_assess(" + id + ", 0)");
	} else {
		assess_obj.setAttribute("class", assess_obj.getAttribute("class").replace(/good_r/, "good_b"));
		if (is_assess == 1) {
			assess_obj.childNodes[0].innerHTML = parseInt(assess_obj.childNodes[0].innerHTML) - 1;
		};
		assess_obj.setAttribute("onclick", "design_assess(" + id + ", 1)");
	}
}

/**
 * 设计收藏操作
 */
var design_fav = function(id, type) 
{
	z_ajax({"func_name":"prompt_design_fav", "param":{id, type}}, "/design/Index/design_fav", {"design_id":id, "type":type});
}
/**
 * 设计收藏效果渲染
 */
var prompt_design_fav = function(id, type) 
{
	var fav_obj = document.getElementById("fav_design_" + id);

	var fav_fill_obj = document.getElementsByClassName("favorites_fill");
	var is_fav = fav_fill_obj.length > 0 ? 1 : 0;

	if (type == 1) {
		fav_obj.setAttribute("class", fav_obj.getAttribute("class").replace(/favorites_b/, "favorites_fill"));
		if (is_fav == 0) {
			fav_obj.childNodes[0].innerHTML = parseInt(fav_obj.childNodes[0].innerHTML) + 1;
		};
		fav_obj.setAttribute("onclick", "design_fav(" + id + ", 0)");
	} else {
		fav_obj.setAttribute("class", fav_obj.getAttribute("class").replace(/favorites_fill/, "favorites_b"));
		if (is_fav == 1) {
			fav_obj.childNodes[0].innerHTML = parseInt(fav_obj.childNodes[0].innerHTML) - 1;
		};
		fav_obj.setAttribute("onclick", "design_fav(" + id + ", 1)");
	}
}

/**
 * 设计师收藏操作
 */
var designer_fav = function(id, type) 
{
	z_ajax({"func_name":"prompt_designer_fav", "param":{id, type}},"/designer/Index/designer_fav", {"designer_id":id, "type":type});
}

/**
 * 设计师收藏效果渲染
 */
var prompt_designer_fav = function(id, type)
{
	var designer_obj = document.getElementsByClassName("fav_designer_" + id);
	if (type == 1) {
		for (var i = 0; i < designer_obj.length; i++) {
			var class_str = designer_obj[i].getAttribute("class");
			designer_obj[i].setAttribute("class", class_str.replace(/add_b/, "add_r"));
			designer_obj[i].setAttribute("onclick", "designer_fav("+id+", 0)");
		};
	} else {
		for (var i = 0; i < designer_obj.length; i++) {
			var class_str = designer_obj[i].getAttribute("class");
			designer_obj[i].setAttribute("class", class_str.replace(/add_r/, "add_b"));
			designer_obj[i].setAttribute("onclick", "designer_fav("+id+", 1)");
		};
	}
}

/**
 * 文章页面上传图片
 */
var auto_upload_cover = function() {
    $.ajax({
        url: "/article/Index/upload_cover",
        type: 'POST',
        cache: false,
        data: new FormData($('#upload_form')[0]),
        dataType:"json",
        processData: false,
        contentType: false,
        beforeSend : function(){
        	create_prompt("", "nav_w");
        },
        success : function(data) {
            if (data.code != 200) {
            	create_prompt(data.msg);
            	return false;
            }

			var cover_obj = document.getElementsByClassName("z-upload-cover")[0];
			if (cover_obj == undefined || cover_obj == null) {
				var upload_controller_obj = document.getElementsByClassName("z-upload");
				var edit_area = document.getElementsByClassName("edit-area")[0];
				var div_obj = document.createElement("div");
				div_obj.setAttribute("class", "z-upload-cover z-trolley");
				div_obj.innerHTML = '<div><div class="clean-float" id="end_obj"></div></div>';
				edit_area.parentNode.insertBefore(div_obj, edit_area);
			};

			var end_obj = document.getElementById("end_obj");
        	var div_obj = document.createElement("div");
        	div_obj.setAttribute("id", "img_" + data.data.img_id);
        	div_obj.setAttribute("onclick", "img_operate(" + data.data.img_id + ");");
            div_obj.innerHTML = "<img src='"+data.data.ssrc+"' class='img_line'>";
            end_obj.parentNode.insertBefore(div_obj, end_obj);
        	create_prompt("", "nav_r");

        	var img_input_obj = document.getElementById("img_ids");
        	var id_str = img_input_obj.getAttribute("value");
        	img_input_obj.setAttribute("value", id_str + data.data.img_id + ",");
        },
        error : function()
        {
        	create_prompt("图片上传失败");
        }
    });

    // 清除文件域value
    var file_obj = document.getElementById("upload_cover_file");
    file_obj.outerHTML = file_obj.outerHTML.replace(/(value=\").+\"/i,"$1\"");
}

/**
 * 保存文章
 */
var save_article = function() 
{
	var design_id = document.getElementById("design_id").value;
	var title = document.getElementById("title").value;
	var intro = document.getElementById("intro").value;
	var content = document.getElementById("content").value;
	var img_ids = document.getElementById("img_ids").value;
	var main_img_id = document.getElementById("main_img_id").value;
	z_ajax({"func_name":"save_article_set_design_id"}, "/article/Index/save_article", {"design_id":design_id,"title":title,"intro":intro,"content":content,"img_ids":img_ids,"main_img_id":main_img_id});
}
/**
 * 保存文章成功渲染id
 */
var save_article_set_design_id = function(data)
{
	var design_id = document.getElementById("design_id");
	design_id.setAttribute("value", data.data.design_id);
}

/**
 * 删除文章
 */
var del_operate = function(design_id)
{
	var msg_obj = new Array();
	msg_obj[0] = new Array();
	msg_obj[0][0] = "确认删除文章?";
	msg_obj[0][1] = "del_article("+design_id+");";
	show_z_msg(msg_obj);
}
var del_article = function(design_id)
{
	z_ajax("", "/article/Index/del_article", {'design_id':design_id});
}

/**
 * 图片的操作
 */
var img_operate = function(img_id){
	var msg_obj = new Array();
	msg_obj[0] = new Array();
	msg_obj[0][0] = "删除图片";
	msg_obj[0][1] = "img_del("+img_id+");";
	msg_obj[1] = new Array();
	msg_obj[1][0] = "设为封面";
	msg_obj[1][1] = "img_main("+img_id+");";
	show_z_msg(msg_obj);
}
/**
 * 移除图片
 */
var img_del = function(img_id)
{
	var img_obj = document.getElementById("img_" + img_id);
	// 移除主图记录
	var main_img_id = document.getElementById("main_img_id");
	main_img_id.setAttribute("value", main_img_id.value.replace(img_id, ""));
	// 移除图片框
	img_obj.remove();
	// 移除图片域
	var img_line = document.getElementsByClassName("img_line");
	if (img_line == undefined || img_line.length == 0) {
		var trolley = document.getElementsByClassName("z-trolley")[0];
		trolley.remove();
	};
	// 删除img_ids
	var img_ids = document.getElementById("img_ids");
	img_ids.setAttribute("value", img_ids.value.replace(img_id + ",", ""));
}
/**
 * 设为封面操作
 */
var img_main = function(img_id)
{
	var main_img_id = document.getElementById("main_img_id");
	main_img_id.setAttribute("value", img_id);
	var main_img_span = document.getElementById("main-img-span");
	if (main_img_span != undefined) {
		main_img_span.remove();
	};

	var img_obj = document.getElementById("img_" + img_id);
	var span_obj = document.createElement("span");
	span_obj.innerText = "封面";
	span_obj.setAttribute("id", "main-img-span");
	img_obj.appendChild(span_obj);
}