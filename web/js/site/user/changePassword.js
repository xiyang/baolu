jQuery(document).ready( function() {
	
	var str = "This field is required!";
	
	if(null == jQuery("#change_message").text().trim() || jQuery("#change_message").text().trim() == "") {
		jQuery("#change_message").removeClass("changep_message");
	}else{
		jQuery("#change_message div").removeClass("message");
		jQuery("#change_message").addClass("changep_message");
	}
	
	jQuery("#requestPassword").hide();
	
	if (jQuery(".warning-box").text()=="") {
		jQuery("#requestPassword").hide();
	}else {
		jQuery("#requestPassword").show();
	}
		
	
	jQuery("#changePasswordForm").submit( function() {

		var canSubmit = new Boolean(true);
		
		if (jQuery("#oldPassword").val() == "") {
			jQuery("#oldPasswordError").text(jQuery.l10n.__(str) );
			canSubmit = false;
		} else {
			jQuery("#oldPasswordError").empty();
			
			if (jQuery("#password").val() == "") {
				jQuery("#passwordError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#passwordError").empty();
			if (jQuery("#repassword").val() == "") {
				jQuery("#repasswordError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else if (jQuery("#password").val() != jQuery("#repassword").val()) {
				jQuery("#change_message").removeClass("changep_message");
				jQuery("#change_message").html("");
				jQuery("#matchPassword").addClass("cp_message");
				jQuery("#matchPassword").text(jQuery.l10n.__("Confirm Password is not matched with New Password!") );
				jQuery("#repasswordError").empty();
				canSubmit = false;
			} else
				jQuery("#repasswordError").empty();
		} 

		return canSubmit;	

	});
	
});
