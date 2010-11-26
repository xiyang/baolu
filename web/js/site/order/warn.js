jQuery(document).ready( function() {
	jQuery("#registerForm").submit( function() {
		var canSubmit = new Boolean(true);
		
		if (jQuery("#firstName").val() == "") {
			jQuery("#firstNameError").text( jQuery.l10n.__("First Name is a requested field!") );
			canSubmit = false;
		} else
			jQuery("#firstNameError").empty();
		if (jQuery("#lastName").val() == "") {
			jQuery("#lastNameError").text(jQuery.l10n.__("Last Name is a requested field!") );
			canSubmit = false;
		} else
			jQuery("#lastNameError").empty();
		if (jQuery("#password").val() == "") {
			jQuery("#passwordError").text(jQuery.l10n.__("Password is a requested field!") );
			canSubmit = false;
		} else
			jQuery("#passwordError").empty();
		if (jQuery("#repassword").val() == "") {
			jQuery("#repasswordError").text(jQuery.l10n.__("Re-password is a requested field!") );
			canSubmit = false;
		} else if (jQuery("#password").val() != jQuery("#repassword").val()) {
			jQuery("#passwordError").text(jQuery.l10n.__("Password and Re-password cannot match!") );
			jQuery("#repasswordError").empty();
			canSubmit = false;
		} else
			jQuery("#repasswordError").empty();
		var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (jQuery("#email").val() == "") {
			jQuery("#emailError").text(jQuery.l10n.__("E-Mail is a requested field!") );
			canSubmit = false;
		} else if (!emailReg.test(jQuery("#email").val())) {
			jQuery("#emailError").text(jQuery.l10n.__("Please input correct Email Address!") );
			canSubmit = false;
		} else
			jQuery("#emailError").empty();
		if (jQuery("#subscription").attr("checked") && jQuery("#address1").val() == "" && jQuery("#address1").val() == "") {
			jQuery("#addressError").text(jQuery.l10n.__("Address is requested if you want to subscribe!") );
			canSubmit = false;
		} else
			jQuery("#addressError").empty();
		return canSubmit;
		
	});
});
