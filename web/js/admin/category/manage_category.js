
function onInvokeAction(id, action) {
	if (action == "add") {
		$("#categoryForm").attr("action", path + "/admin/category/toCreate");
		$("#categoryForm").submit();
	} else if (action == "recommend") {
		var length = $("#productCategoriesTable input[type=checkbox]:checked").length;
		if (length < 1) {
			alert($("#categoryEmpty").val());
			return;
		}
		if (!confirm("Are you sure?")) return;
		$("#categoryForm").attr("action", path + "/admin/category/recommend");
		$("#categoryForm").submit();
	} else if (action == "delete") {
		var length = $("#productCategoriesTable input[type=checkbox]:checked").length;
		if (length < 1) {
			alert($("#productCategoryEmpty").val());
			return;
		}
		if (!confirm("Are you sure?")) return;
		window.location.href = path + "/admin/category/disabled";
	} else {
		createHiddenInputFieldsForLimitAndSubmit(id);
	}
}


function selectAllItems(value, name) {
	if (name == "checked") {
		if (value) {
			$("#productCategoriesTable input[type=checkbox][checked='']").trigger("click");
		} else {
			$("#productCategoriesTable input[type=checkbox]:checked").trigger("click");
		}
	}
}


function showCurrentCategory(id) {
	$("#categoryForm").attr("action", path + "/admin/category/" + id);
	$("#categoryForm").submit();
}


function goBack() {
	$("#categoryDetail").attr("action", path + "/admin/category/list");
	$("#categoryDetail").submit();
}

function saveOrUpdateCategory() {
	var categoryName = $("#categoryName").val().replace(/(^\s*)|(\s*$)/g, "");
	var categoryStatus = $("#categoryStatus").val().replace(/(^\s*)|(\s*$)/g, "");
	var categoryId = $("#categoryId").val().replace(/(^\s*)|(\s*$)/g, "");
	var message = "";
	
	if (isEmpty(categoryName)) {
		message += $("#categoryNameBlank").val() + "\n";
	}
	
	if (isEmpty(categoryStatus)) {
		message += $("#categoryStatusBlank").val()+ "\n";
	}
	
	if(!isNumber($("#ordering").val())){
		message += $("#categoryOrdering").val();
	}
	
	if (!isEmpty(message)) {
		$("#message").html(message);
		return false;
	}
	
	if (!isEmpty(categoryId)) {
		if (!confirm($("#categoryUpdateConfirm").val())) {
			return;
		}
	}
	
	$("#categoryDetail").submit();
}

function isEmpty(source){
	
	if(undefined == source){
		return true;
	}
	
	if(null == source){
		return true;
	}
	
	if("" == source){
		return true;
	}
	
}

function deleteCategory(id) {
	if (!confirm("Are you sure to delete?")) return;
	
	window.location.href = path + "/admin/delete/" + id;
}
