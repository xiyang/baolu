jQuery(document).ready( function() {
	
	var str = "This field is required!";
	
	jQuery("#updateInfoForm").submit( function() {
		var canSubmit = new Boolean(true);
		
		if (jQuery("#firstName").val() == "") {
			jQuery("#firstNameError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else if ((jQuery("#firstName").val() != "") && (jQuery("#firstName").val().length > 20)) {
			jQuery("#firstNameError").text( jQuery.l10n.__("First Name is too long") );
			canSubmit = false;
		} else
			jQuery("#firstNameError").empty();
			
		if (jQuery("#lastName").val() == "") {
			jQuery("#lastNameError").text(jQuery.l10n.__(str) );
			canSubmit = false;
		} else if ((jQuery("#lastName").val() == "") && (jQuery("#lastName").val().length > 30)) {
			jQuery("#lastNameError").text(jQuery.l10n.__("Last Name is too long") );
			canSubmit = false;
		} else
			jQuery("#lastNameError").empty();
				
		//if (jQuery("#institution").val() == "") {
			//jQuery("#institutionError").text( jQuery.l10n.__(str) );
			//canSubmit = false;
		//} else
			//jQuery("#institutionError").empty();
			
		if(jQuery("#oldPassword").val()!=""){
			if (jQuery("#password").val() == "") {
				jQuery("#passwordError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#passwordError").empty();
			if (jQuery("#repassword").val() == "") {
				jQuery("#repasswordError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else if (jQuery("#password").val() != jQuery("#repassword").val()) {
				jQuery("#passwordError").text(jQuery.l10n.__("Confirm Password is not matched with New Password!") );
				jQuery("#repasswordError").empty();
				canSubmit = false;
			} else
				jQuery("#repasswordError").empty();
		} else
			jQuery("#oldPasswordError").empty();
		
		return canSubmit;	
	});
	
});

function toChangePassword() {
		document.location.href = path + "/user/toChange/password";
}