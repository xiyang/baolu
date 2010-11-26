
var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "meetingTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#meetingTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteMeeting(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/meeting/detail";
		} else {
			buildMeetingList(parameterString);
		}
	}
}

function deleteMeeting(parameterString) {
	if (confirm('Are you sure ?')) {
		
		document.location.href = path + "/admin/meeting/delete";
	}
}
function buildMeetingList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/meeting/list?" + parameterString;
	
}

function addOrModifymeeting() {
	
	document.location.href = path + "/admin/meeting/addOrModify?id=" + $('#meetingId').val() + "&title=" + $('#title').val() + "&content=" + $('#content').val();
}

function getMeetingById(meetingId) {
	document.location.href = path + "/admin/meeting/detail?id=" + meetingId ;
}


function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#meetingTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#meetingTable input[type=checkbox]').trigger('click');
		}
	}
}

function checkTitle(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtMeetingsMsg").html($("#eventsTitleWarn").val());
		return false;
	} 
	return true;
}

function checkLocation(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtMeetingsMsg").html($("#eventsLocationWarn").val());
		return false;
	} 
	return true;
}

function checkDate(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtMeetingsMsg").html($("#eventsDateWarn").val());
		return false;
	} 
	return true;
}

function clearMsg(){
	$("#validationtMeetingMsg").text("");
}
