var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "usersTable") {
		if (action == "delete") {
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
			document.location.href = path + "/admin/user/detail?actionPath=listSubUsers";
		} else {
			buildDocsList(parameterString);
		}
	}
}

function deleteDocs(parameterString) {
	if (confirm('Are you sure ?')) {
		document.location.href = path + "/admin/user/removeUser?actionPath=listSubUsers";
	}
}

function buildDocsList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/user/listSubUsers?" + parameterString;
	
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