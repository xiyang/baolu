var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "usersTable") {
		if (action == "delete") {
		
			if(role != "MANAGER"){
				alert("No permision!");
				return;
			}
			
			var hasChecked = false;
			$.each( $('#usersTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteDocs(parameterString);
		} else if (action == "add") {
			if(role != "MANAGER"){
				alert("No permision!");
				return;
			}
			document.location.href = path + "/admin/user/detail?actionPath=listUsers";
		} else {
			buildDocsList(parameterString);
		}
	}
}

function deleteDocs(parameterString) {
	if (confirm('Are you sure ?')) {
		document.location.href = path + "/admin/user/removeUser?actionPath=listUsers";
	}
}

function buildDocsList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/user/listUsers?" + parameterString;
	
}

function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#usersTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#usersTable input[type=checkbox]').trigger('click');
		}
	}
}

function resetPassword(email){
	
	if (confirm("Reset Password ?")) {
	jQuery.getJSON(path+'/user/resetPassword?email='+email,function(json){
		if(json.result == 'success'){
			alert($("#passwordResetSuccess").val());
		}else{
			alert($("#user.reset.fail").val());
		}
	});
	}
	
}