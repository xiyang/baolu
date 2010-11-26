jQuery(document).ready( function() {
	jQuery("#cancel").click(function(){
		location.href = path + "/admin/user/listUsers";
	});
	
	jQuery("#detailForm").submit( function() {
		var canSubmit = new Boolean(true);
		
		if (jQuery("#firstName").val() == "") {
			jQuery("#firstNameError").text( jQuery.l10n.__("First Name is a requested field!") );
			canSubmit = false;
		} else if ((jQuery("#firstName").val() != "") && (jQuery("#firstName").val().length > 20)) {
			jQuery("#firstNameError").text( jQuery.l10n.__("First Name is too long") );
			canSubmit = false;
		} else {
			jQuery("#firstNameError").empty();
		}
		if (jQuery("#lastName").val() == "") {
			jQuery("#lastNameError").text(jQuery.l10n.__("Last Name is a requested field!") );
			canSubmit = false;
		} else if ((jQuery("#lastName").val() == "") && (jQuery("#lastName").val().length > 30)) {
			jQuery("#lastNameError").text(jQuery.l10n.__("Last Name is too long") );
			canSubmit = false;
		} else {
			jQuery("#lastNameError").empty();
		}
		if (jQuery("#password").val() == "") {
			jQuery("#passwordError").text(jQuery.l10n.__("Password is a requested field!") );
			canSubmit = false;
		} else {
			jQuery("#passwordError").empty();
		}
		if (jQuery("#repassword").val() == "") {
			jQuery("#repasswordError").text(jQuery.l10n.__("Re-password is a requested field!") );
			canSubmit = false;
		} else if (jQuery("#password").val() != jQuery("#repassword").val()) {
			jQuery("#passwordError").text(jQuery.l10n.__("Password and Re-password cannot match!") );
			jQuery("#repasswordError").empty();
			canSubmit = false;
		} else {
			jQuery("#repasswordError").empty();
		}
		var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (jQuery("#email").val() == "") {
			jQuery("#emailError").text(jQuery.l10n.__("E-Mail is a requested field!") );
			canSubmit = false;
		} else if (!emailReg.test(jQuery("#email").val())) {
			jQuery("#emailError").text(jQuery.l10n.__("Please input correct Email Address!") );
			canSubmit = false;
		} else {
			jQuery("#emailError").empty();
		}

		return canSubmit;
	});
	
});

function copyToShipping() {
	jQuery("#shippingAddress").val(jQuery("#billingAddress").val());
	jQuery("#shippingCity").val(jQuery("#billingCity").val());
	jQuery("#shippingState").val(jQuery("#billingState").val());
	jQuery("#shippingZip").val(jQuery("#billingZip").val());
	jQuery("#shippingPhone").val(jQuery("#billingPhone").val());
	jQuery("#shippingInstitution").val(jQuery("#billingInstitution").val());
	
	var scObj = jQuery("#shippingCountry")[0];
		for (var i = 0; i < scObj.length; i++) {
			if (scObj.options[i].value == jQuery("#billingCountry").find("option:selected").val())
			scObj.options[i].selected = "selected";
		}
		           
		if (jQuery("#billingCountry").find("option:selected").val() == 'US') {
			var bsObj = jQuery("#billingState")[0];
			var bs = jQuery("#billingState").find("option:selected").val();
			var sshtml = "<select id='shippingState' name='shippingState' style='width: 100%'>";
			for (var i = 0; i < bsObj.length; i++) {
				if (bsObj.options[i].value == bs) {
					sshtml = sshtml + "<option value='" + bsObj.options[i].value + "' selected='selected'>" + bsObj.options[i].text + "</option>"
				} else {
					sshtml = sshtml + "<option value='" + bsObj.options[i].value + "'>" + bsObj.options[i].text + "</option>"
				}
			}
			sshtml = sshtml + "</select>";
			jQuery("#shippingStateField").html(sshtml);
		} else {
			var sshtml = "<input id='shippingState' name='shippingState' type='text' value='" + jQuery("#billingState").val() + "' />";
			jQuery("#shippingStateField").html(sshtml);
		}
}

function changeForState(selectO){
	
	if(isEmpty(selectO))
		return;
	
	var defaultState = !isEmpty(jQuery("#"+selectO+"StateHidden").val())? jQuery("#"+selectO+"StateHidden").val() : "";
	
	var country = jQuery("#"+selectO+"Country").val();
	var state = jQuery("#"+selectO+"StateField");
	if(isEmpty(country) || isEmpty(state))
		return;
	if(country != "US"){
		state.html("<input id=\""+selectO+"State\" name=\""+selectO+"State\" type=\"text\" value=\""+defaultState+"\" />");
		return;
	}
	state.html("");
	//get state
	var options = "";
	jQuery.getJSON(path+'/products/states', function(json){
		options += "<select class=\"widthForThis\" id=\""+selectO+"State\" name=\""+selectO+"State\"><option value=\"\">--</option>";
		jQuery.each(json.states, function(i, n){
			var selected = !isEmpty(defaultState) && n == defaultState ? "selected=\"selected\"" : "";
			options += "<option "+selected+" value=\""+n+"\">"+n+"</option>";
		});
		options += "</select>";
		state.html(options);
	});
	
}