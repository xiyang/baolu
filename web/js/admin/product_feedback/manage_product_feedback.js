
function onInvokeAction(id, action) {
	if (action == "delete") {
		removeFeedBacks();
	} else {
		createHiddenInputFieldsForLimitAndSubmit(id);
	}
}

function removeFeedBacks() {
	var length = $("#productFeedBackTable input[type=checkbox]:checked").length;
	if (length < 1) {
		alert($("#feedBackEmpty").val());
		return;
	}
	
	if(!confirm("Are you sure to delete?")) return;
	
	window.location.href = path + "/admin/feedBack/delete";
}

function selectAllItems(value, name) {
	if (name == "checked") {
		if (value) {
			$("#productFeedBackTable input[type=checkbox][checked='']").trigger("click");
		} else {
			$("#productFeedBackTable input[type=checkbox]:checked").trigger("click");
		}
	}
}

var feedbackAuditedDialog = {
	height : '220',
	width : '430',
	maxHeight : '220',
	maxWidth : '430',
	modal : true,
	autoOpen : false,
	position : "center",
	open : function() {
		$("#feedbackDialog").attr("style", "");
	},
	overlay : {
		backgroundColor : '#000',
		opacity : 0.5
	},
	close : function() {
		jQuery(this).dialog('destroy');
	},
	buttons: {
			'Confirm' : function() {
				auditedFeedback();
			},
			'Cancel' : function() {
				$(this).dialog('close');
			}
		
	}
};

function openFeedbackAuditedDialog(id, imagePath, catalog, status) {
	$("#feedbackId").val(id);
	$("#feedbackComments").text($("#" + id).text());
	$("#productCatalog").val(catalog);
	
	// add download link if there is reference image
	if (!isEmpty(imagePath)) {
		$("#imageUpload").html('<span style="font-weight: bolder;padding-right: 10px;">Reference Image:</span><a href="'+path+'/admin/feedBack/downLoad?imagePath='+imagePath+'">DownLoad</a>');
	} else {
		$("#imageUpload").html("");
	}
	
	if (status == "UNTREATED") {
		$("#feedbackStatus [value='UNTREATED']").attr("selected", "selected");
	} else if (status == "AUDITED") {
		$("#feedbackStatus [value='AUDITED']").attr("selected", "selected");
	}
	
	$("#feedbackDialog").dialog(feedbackAuditedDialog);
	$("#feedbackDialog").dialog("open");
}


/*function auditedFeedback() {
	$.ajax({url : path + "/admin/feedBack/audited",
		   data : {
		   		feedbackId : $("#feedbackId").val(),
		   		status : $("#feedbackStatus").val()
		   },
		   error : function() {alert("occur error!");},
		   success : function(data) {
		   				if (data == "success") {
		   					alert("updated success!");
		   					window.location.href = path + "/admin/feedBack/list";
		   				} else {
		   					alert("updated failed!");
		   				}
		   			}
	});
}*/

function auditedFeedback() {
	$("#uploadImageForm").ajaxSubmit({
		error : function() {alert("failed");},
		success : function(data) {
			// firefox like '<pre>success</pre>',IE no such problem
			if (data.indexOf("success") != -1) {
				alert("edit success!");
				window.location.href = path + "/admin/feedBack/list";
			} else {
				alert("failed");
			}
		}
	});
}

function backFeedBackList() {
	window.location.href = path + "/admin/feedBack/list";
}

function submitReview() {
	if(!checkReview()) return;
	jQuery("#auditedContetForm").submit();
}

function checkReview() {

	var str = "This field is required!";
	var message = "";
	
	if (isEmpty(jQuery("#applications").val())) {
		message += "Applications content can't empty!\n";
		jQuery("#applicationsError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#applicationsError").empty();
	
	if (isEmpty(jQuery("#speciesTested").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#speciesTestedError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#speciesTestedError").empty();
		
	if (isEmpty(jQuery("#samplesTested").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#samplesTestedError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#samplesTestedError").empty();
	
	if (isEmpty(jQuery("#antibodyDilution").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#antibodyDilutionError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#antibodyDilutionError").empty();
	
	if (isEmpty(jQuery("#protocol").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#protocolError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#protocolError").empty();
	
	if (isEmpty(jQuery("#comments").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#commentsError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#commentsError").empty();
		
	if (!isEmpty(message)) {
		return false;
	}
	
	return true;
}

