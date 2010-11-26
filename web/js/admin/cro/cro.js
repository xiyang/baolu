
var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "CROTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#CROTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteCRO(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/cro/detail";
		} else {
			buildCROList(parameterString);
		}
	}
}

function deleteCRO(parameterString) {
	if (confirm('Are you sure ?')) {
		document.location.href = path + "/admin/cro/delete";
	}
}
function buildCROList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/cro/list?"+parameterString;
	
}

function addOrModifyCRO() {
	
	document.location.href = path + "/admin/cro/addOrModify?id=" + $('#CROId').val() + "&title=" + $('#title').val() + "&content=" + $('#content').val();
}

function getCROById(CROId, title) {
	document.location.href = path + "/admin/cro/detail?id=" + CROId;
}

function getCRODetailById(CROId, title) {
	document.location.href = path + "/cro/detail?id=" + CROId + "&title=" + title;
}

function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#CROTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#CROTable input[type=checkbox]').trigger('click');
		}
	}
}

function checkTitle(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtCROMsg").html("The title can't be null!");
		return false;
	} 
	return true;
}

function clearMsg(){
	$("#validationtCROMsg").text("");
}

