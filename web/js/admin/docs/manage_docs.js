
var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "docsTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#docsTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteDocs(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/docs/detail";
		} else {
			buildDocsList(parameterString);
		}
	}
}

function deleteDocs(parameterString) {
	if (confirm('Are you sure ?')) {
		document.location.href = path + "/admin/docs/delete";
	}
}

function deleteDoc(id) {
	if (!confirm("Are you sure to delete?")) return;
	
	window.location.href = path + "/admin/docs/deleteDoc/" + id;
}

function buildDocsList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/docs/list?"+parameterString;
	
}

function addOrModifyDocs() {
	
	document.location.href = path + "/admin/docs/addOrModify?id=" + $('#docsId').val();
}

function getDocsById(docsId, title) {
	document.location.href = path + "/admin/docs/detail?id=" + docsId;
}

function getDocsDetailById(docsId, title) {
	document.location.href = path + "/docs/detail?id=" + docsId;
}

function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#docsTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#docsTable input[type=checkbox]').trigger('click');
		}
	}
}

function checkTitle(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtDocsMsg").html($("#titleWarn").val());
		return false;
	} 
	return true;
}

function clearMsg(){
	$("#validationtDocsMsg").text("");
}

function checkCategory() {
	if (isEmpty($("#serviceCategoryId").val())) {
		$("#categoryWarn").text("Please select service category!");
		return false;
	}
	return true;
}

function clearCategoryWarnMsg() {
	$("#categoryWarn").text("");
}
