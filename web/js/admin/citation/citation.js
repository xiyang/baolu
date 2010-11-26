var onInvokeAction = function(id, action){
	
	/*var parameterString = createParameterStringForLimit(id);
	if (id == "citationTable") {
		if (action == "delete") {
			var hasChecked = false;
			$.each( $('#citationTable input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			deleteCitation(parameterString);
		} else if (action == "add") {
			document.location.href = path + "/admin/citation/detail";
		} else {
			buildCitationList(parameterString);
		}
	}*/
	
	if (id == "citationTable") {
		if (action == "add") {
			$("#citationForm").attr("action", path + "/admin/citation/detail");
			$("#citationForm").submit();
		} else if (action == "delete") {
			var length = $("#citationTable input[type=checkbox]:checked").length;
			if (length < 1) {
				alert("no checked");
				return;
			}
			//if (!confirm("Are you sure?")) return;
			deleteCitation();
		} else {
			createHiddenInputFieldsForLimitAndSubmit(id);
		}
	}
	
}

function deleteCitation() {
	if (confirm('Are you sure ?')) {
		document.location.href = path + "/admin/citation/delete";
	}
}
function buildCitationList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
	document.location.href = path + "/admin/citation/list?"+parameterString;
	
}

function addOrModifyCitation() {
	document.location.href = path + "/admin/citation/addOrModify?id=" + $('#citationId').val() + "&title=" + $('#title').val() + "&content=" + $('#content').val();
}

function getCitationById(citationId) {
	document.location.href = path + "/admin/citation/detail?id=" + citationId;
}

function selectAllItems(value, name) {
	if (name == 'checked') {
		if (value) {
			$('#citationTable input[type=checkbox][checked=""]').trigger('click');
		} else {
			$('#citationTable input[type=checkbox]').trigger('click');
		}
	}
}

function clearMsg(){
	$("#validationtCitationMsg").text("");
}

function isUrlFormat(content) {
	clearMsg();
	if(!isEmpty(content) && !isUrl(content)) {
		$("#validationtCitationMsg").text($("#urlValidate").val());
		return false;
	}
}

function checkCatalog() {
	if (!isEmpty($("#catalogs").val())) {
		clearMsg();
		$.post(path + "/admin/product/check", {catalogs:$("#catalogs").val()}, function (data) {
			if (data != "success") {
				$("#validationtCitationMsg").text(data + $("#catalogValidate").val());
			}
		});
	}
}

function insertInToUrl(id) {
	if (!isEmpty($("#abstractId").val())) {
		$("#title").val("http://www.ncbi.nlm.nih.gov/pubmed/" + $("#abstractId").val());
	}
}

function deleteCitation(id) {
	if (!confirm("Are you sure to delete?")) return;
	
	window.location.href = path + "/admin/citation/deleteCitation/" + id;
}


function submitDetailForm() {
	
	var canSubmit = new Boolean(true);
		
	if (jQuery("#firstAuthor").val() == "") {
		jQuery("#firstAuthorError").text( jQuery.l10n.__("First Authoris a requested field!") );
		canSubmit = false;
	} else {
		jQuery("#firstAuthorError").empty();
	}
	
	if (jQuery("#paperTitle").val() == "") {
		jQuery("#paperTitleError").text( jQuery.l10n.__("Paper Title a requested field!") );
		canSubmit = false;
	} else {
		jQuery("#paperTitleError").empty();
	}
	
	if (jQuery("#journal").val() == "") {
		jQuery("#journalError").text( jQuery.l10n.__("Journal a requested field!") );
		canSubmit = false;
	} else {
		jQuery("#journalError").empty();
	}
	
	forSplice();
	
	if (canSubmit == true) {
		$("#citationDetailForm").submit();
	}
	
}

function forSplice() {
	
	var paperTitle = jQuery("#paperTitle").val();
	var journal = jQuery("#journal").val();
	
	if (!isEmpty(jQuery("#paperTitle").val())) {
		if (paperTitle.substring(paperTitle.length-1,paperTitle.length) != ".") {
			jQuery("#paperTitle").val(paperTitle + ".")
		}
	}
	if (!isEmpty(jQuery("#journal").val())) {
		if (journal.substring(journal.length-1,journal.length) != ".") {
			jQuery("#journal").val(journal + ".")
		}
	}
}
