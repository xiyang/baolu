
var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);

	if (id == "activityTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#activityTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteactivity(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/activity/detail";
		} else {
			buildActivityList(parameterString);
		}
	}
}

function deleteActivity(parameterString) {
	if (confirm('Are you sure ?')) {
		
		document.location.href = path + "/admin/activity/delete";
	}
}
function buildActivityList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/activity/list?"+parameterString;
	
}

function addOrModifyActivity() {
	
	document.location.href = path + "/admin/activity/addOrModify?id=" + $('#activityId').val() + "&title=" + $('#title').val() + "&content=" + $('#content').val();
}

function getActivityById(activityId, title) {
	document.location.href = path + "/admin/activity/detail?id=" + activityId;
}

function getActivityDetailById(activityId, title) {
	document.location.href = path + "/activity/detail?id=" + activityId + "&title=" + title;
}

function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#activityTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#activityTable input[type=checkbox]').trigger('click');
		}
	}
}

function checkTitle(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtActivityMsg").html($("#activityTitleWarn").val());
		return false;
	} 
	return true;
}

function clearMsg(){
	$("#validationtActivityMsg").text("");
}

function test(){
	alert($("content").val());
}
