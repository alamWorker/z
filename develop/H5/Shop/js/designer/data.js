
var save_info = function() {
	var name = document.getElementById("name").value;
	if (name == '') {
		create_prompt('Name');
	}
	var address = document.getElementById("address").value;
	var idea = document.getElementById("idea").value;
	var style = document.getElementById("style").value;
	var sign = document.getElementById("sign").value;
	var is_public = document.getElementById("is-public").value;

	z_ajax("", "/designer/Index/save_info", {"name":name,"address":address,"idea":idea,"style":style,"sign":sign,"is_public":is_public});
}