
$(document).ready(function() {
	$("table").addClass("formtable");
});

function onInvokeAction(id, action) {
	if (action == "delete") {
		var length = $("#customProjectTable input[type=checkbox]:checked").length;
		if (length < 1) {
			alert($("#customProjectEmpty").val());
			return;
		}
		if (!confirm($("#confirmRemove").val())) return;
		window.location.href = path + "/admin/project/delete";
	} else {
		createHiddenInputFieldsForLimitAndSubmit(id);
	}
}


function selectAllItems(value, name) {
	if (name == "checked") {
		if (value) {
			$("#customProjectTable input[type=checkbox][checked='']").trigger("click");
		} else {
			$("#customProjectTable input[type=checkbox]:checked").trigger("click");
		}
	}
}

function goBack() {
	window.location.href = path + "/admin/project/list";
}

function order() {
	$("#customProjectForm").submit();
    //var xmlContent = $("#content").html();
    //jQuery.getJSON(customizeProjectSavePath + encodeURIComponent(xmlContent) + "&jsonCallback=?");
    
}

function jsonCallback (data) {
    var id = data.result;
    $("#projectId").val(id);
    $("#customProjectForm").submit();
    //location.href = path + "/admin/project/generate/order/"+ id +"/"+customProjectId+"/"+price;
}