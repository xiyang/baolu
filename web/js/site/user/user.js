jQuery(document).ready( function() {

	if(null == jQuery("#login_message").text().trim() || jQuery("#login_message").text().trim() == "") {
		jQuery("#login_message").removeClass("login_message");
	}else{
		jQuery("#login_message").addClass("login_message");
	}
	
	if(null == jQuery("#noEmail").text().trim() || jQuery("#noEmail").text().trim() == "") {
		jQuery("#noEmail").removeClass("fpwd_message");
	}else{
		jQuery("#noEmail").addClass("fpwd_message");
	}
	
	if(null == jQuery("#emailError").text().trim() || jQuery("#noEmail").text().trim() == "") {
		jQuery("#emailError").removeClass("fpwd_message");
	}else{
		jQuery("#emailError").addClass("fpwd_message");
	}
	
	var str = "This field is required!";
	
    jQuery("#loginForm").submit( function() {
		var canSubmit = new Boolean(true);
		var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (jQuery("#loginEmail").val() == "") {
			jQuery("#emailErrorLogin").text(jQuery.l10n.__(str) );
			canSubmit = false;
		}else if (!emailReg.test(jQuery("#loginEmail").val())) {
			jQuery("#emailErrorLogin").text(jQuery.l10n.__("Your Email Address format is incorrect.") );
			canSubmit = false;
		}else
			jQuery("#emailErrorLogin").empty();
		if (jQuery("#loginPassword").val() == "") {
			jQuery("#passwordErrorLogin").text(jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#passwordErrorLogin").empty();
			return canSubmit;
		});

	 jQuery("#sumoplotLoginForm").submit( function() {
		var canSubmit = new Boolean(true);
			return canSubmit;
		});
		
	jQuery("#registerForm").submit( function() {
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
		
		//if (jQuery("#institution").val() == "") {
			//jQuery("#institutionError").text( jQuery.l10n.__(str) );
			//canSubmit = false;
		//} else
			//jQuery("#institutionError").empty();	
		
		var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (jQuery("#email").val() == "") {
			jQuery("#emailError").text(jQuery.l10n.__(str) );
			canSubmit = false;
		} else if (!emailReg.test(jQuery("#email").val())) {
			jQuery("#emailError").text(jQuery.l10n.__("Please input correct Email Address!") );
			canSubmit = false;
		} else
			jQuery("#emailError").empty();
			
		// poster or quotation
		var registerRedirectUrl = jQuery("#registerRedirectUrl").val();
		if (registerRedirectUrl.indexOf("toCustomize") != -1 || registerRedirectUrl.indexOf("poster") != -1) {
			if (jQuery("#titleName").val() == "") {
				jQuery("#titleNameError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#titleNameError").empty();
			
			if (jQuery("#shippingAttention").val() == "") {
				jQuery("#shippingAttentionError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingAttentionError").empty();
			
			if (jQuery("#shippingAddress").val() == "") {
				jQuery("#shippingAddressError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingAddressError").empty();
			
			if (jQuery("#shippingCity").val() == "") {
				jQuery("#shippingCityError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCityError").empty();
			
			if (jQuery("#shippingCountry").val() == "") {
				jQuery("#shippingCountryError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCountryError").empty();
			
			if (jQuery("#shippingState").val() == "") {
				jQuery("#shippingStateError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCountryError").empty();
			
			if (jQuery("#shippingZip").val() == "") {
				jQuery("#shippingZipError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingZipError").empty();
			
			
			if (jQuery("#shippingInstitution").val() == "") {
				jQuery("#shippingInstitutionError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingInstitutionError").empty();
			
			if (jQuery("#shippingPhone").val() == "") {
				jQuery("#shippingPhoneError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingPhoneError").empty();
		}
		
		// generate order
		if (registerRedirectUrl.indexOf("generate") != -1) {
			if (jQuery("#billingAddress").val() == "") {
				jQuery("#billingAddressError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#billingAddressError").empty();
			
			if (jQuery("#billingCity").val() == "") {
				jQuery("#billingCityError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#billingCityError").empty();
			
			if (jQuery("#billingCountry").val() == "") {
				jQuery("#billingCountryError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#billingCountryError").empty();
			
			if (jQuery("#billingZip").val() == "") {
				jQuery("#billingZipError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#billingZipError").empty();
			
			
			if (jQuery("#billingInstitution").val() == "") {
				jQuery("#billingInstitutionError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#billingInstitutionError").empty();
			
			if (jQuery("#billingPhone").val() == "") {
				jQuery("#billingPhoneError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#billingPhoneError").empty();
			
			if (jQuery("#shippingAttention").val() == "") {
				jQuery("#shippingAttentionError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingAttentionError").empty();
			
			if (jQuery("#shippingAddress").val() == "") {
				jQuery("#shippingAddressError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingAddressError").empty();
			
			if (jQuery("#shippingCity").val() == "") {
				jQuery("#shippingCityError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCityError").empty();
			
			if (jQuery("#shippingCountry").val() == "") {
				jQuery("#shippingCountryError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCountryError").empty();
			
			if (jQuery("#shippingState").val() == "") {
				jQuery("#shippingStateError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCountryError").empty();
				
			if (jQuery("#shippingZip").val() == "") {
				jQuery("#shippingZipError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingZipError").empty();
			
			if (jQuery("#shippingState").val() == "") {
				jQuery("#shippingStateError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingStateError").empty();
			
			if (jQuery("#shippingInstitution").val() == "") {
				jQuery("#shippingInstitutionError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingInstitutionError").empty();
			
			if (jQuery("#shippingPhone").val() == "") {
				jQuery("#shippingPhoneError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingPhoneError").empty();
			
		}
		
		if (trim(jQuery(".show_info").text()) != "") {
			window.scroll(0,0);
		}
		return canSubmit;
		
		
	});
	
	 jQuery("#forgetPasswordForm").submit( function() {
	 	jQuery("#noEmail").empty();
		var canSubmit = new Boolean(true);
		var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (jQuery("#email").val() == "") {
			jQuery("#emailError").addClass("fpwd_message");
			jQuery("#emailError").text(jQuery.l10n.__("Email Address field is required.") );
			canSubmit = false;
		}else if (!emailReg.test(jQuery("#email").val())) {
			jQuery("#emailError").addClass("fpwd_message");
			jQuery("#emailError").text(jQuery.l10n.__("Your Email Address format is incorrect.") );
			canSubmit = false;
		}else
			jQuery("#emailError").empty();
		
		if(canSubmit) {
			jQuery("#concon_top").addClass("fpwd_message");
		}
		return canSubmit;
	
    });
    
    
});

function toRegister() {
		document.location.href = path + "/user/toReg";
}

function toLogin(){
    
    jQuery("#fromUrl").val(jQuery("#url").val());
    jQuery("#loginForm").submit();
}

function register(){
     jQuery("#registerUrl").val(jQuery("#url").val());     
     jQuery("#registerform").attr("action",path + "/user/toReg");
     jQuery("#registerform").attr("method","get");
     jQuery("#registerform").submit();
}

function copyToShipping() {

	if(jQuery("#regCopy").attr("checked")==true) {

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
			var sshtml = "<select id='shippingState' name='shippingState' class='widthForThis'>";
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
}
