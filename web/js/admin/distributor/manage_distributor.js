
var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "distributorTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#distributorTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteDistributor(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/distributor/detail";
		} else {
			buildDistributorList(parameterString);
		}
	}
}

function deleteDistributor(parameterString) {
	if (confirm('Are you sure ?')) {
		
		document.location.href = path + "/admin/distributor/delete";
	}
}
function buildDistributorList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/distributor/list?" + parameterString;
	
}

function addOrModifyNews() {
	
	document.location.href = path + "/admin/distributor/addOrModify?id=" + $('#distributorId').val() + "&title=" + $('#title').val() + "&content=" + $('#content').val();
}

function getDistributor(id) {
	document.location.href = path + "/admin/distributor/detail?id=" + id ;
}


function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#distributorTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#distributorTable input[type=checkbox]').trigger('click');
		}
	}
}

function checkCompanyName(content) {
	
	clearMsg();
	var companyName = $("#company").val();
	if (isEmpty(companyName) || isBlank(companyName)) {
		$("#validationtDistributorMsg").html($("#companyNameWarn").val);
		return false;
	} 
	return true;
}

function checkCountryName(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		$("#validationtDistributorMsg").html($("#countryNameWarn").val());
		return false;
	} 
	return true;
}

function isEmailForDistributor() {
	
	clearMsg();
	var email = $("#email").val();
	if(!isEmpty(email) && !isEmail(email)) {
		$("#validationtDistributorMsg").html($("#emailFormatWarn").val());
		return false;
	}
}

function isUrlForDistributor() {
	
	clearMsg();
	var website = $("#website").val();
	if(!isEmpty(website) && !isUrl(website)) {
		$("#validationtDistributorMsg").html($("#urlFormatWarn").val());
		return false;
	}
}

function clearMsg(){
	$("#validationtDistributorMsg").text("");
}

function deleteDistributor(id) {
	if (!confirm("Are you sure to delete?")) return;
	
	window.location.href = path + "/admin/distributor/deleteDistributor/" + id;
}