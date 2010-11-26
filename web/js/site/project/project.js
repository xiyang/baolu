
/*function customProject() {
	document.location.href = path + "/project/toCustomize";
}*/

jQuery(document).ready(function() {
		var str = "This field is required!";
	
	    jQuery("#quotationForm").submit( function() {
			var canSubmit = new Boolean(true);
			var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			
			if (jQuery("#firstName").val() == "") {
				jQuery("#firstNameError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} 
			
			if (jQuery("#lastName").val() == "") {
				jQuery("#lastNameError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (!emailReg.test(jQuery("#emailAddress").val())) {
				jQuery("#emailAddressError").text(jQuery.l10n.__("Your Email Address format is incorrect.") );
				canSubmit = false;
			}
			
			if (jQuery("#titleName").val() == "") {
				jQuery("#titleNameError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingAttention").val() == "") {
				jQuery("#shippingAddressError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingAddress").val() == "") {
				jQuery("#shippingAddressError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingCity").val() == "") {
				jQuery("#shippingCityError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingCountry").val() == "") {
				jQuery("#shippingCountryError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingZip").val() == "") {
				jQuery("#shippingZipError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingState").val() == "") {
				jQuery("#shippingStateError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingInstitution").val() == "") {
				jQuery("#shippingInstitutionError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			if (jQuery("#shippingPhone").val() == "") {
				jQuery("#shippingPhoneError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			}
			
			return canSubmit;
			});
});

function checkedAll(value) {
	if (value) {
		jQuery("input[type=checkbox]").attr("checked", true);
	} else {
		jQuery("input[type=checkbox]").attr("checked", "");
	}
}

function activeOrDisabledPeptide() {
	if (jQuery("#antibody_purification_proteing").attr("checked")) {
		jQuery("#antibody_purification_type_peptide").attr("disabled", "");
	} else {
		jQuery("#antibody_purification_type_peptide").attr("checked", "");
		jQuery("#antibody_purification_type_peptide").attr("disabled", "disabled");
	}
	calcPrice();
}

function clearExtraPeptideOtherInfo() {
	jQuery("#extra_other_info").val("");
	calcPrice();
}

function checkedExtraPeptideOterInfo() {
	jQuery("#extra_other").attr("checked", "checked");
}

function calcPrice() {
	var totalPrice = 0.0000;
	jQuery(":radio:checked").each(function() {
		totalPrice = totalPrice.add(jQuery(this).next().val());
	});
	
	jQuery(":checkbox:checked").each(function() {
		totalPrice = totalPrice.add(jQuery(this).next().val());
	});
	
	jQuery("#totalPrice").val(totalPrice);	
}


function accAdd(arg1, arg2) {
    var r1, r2, m;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    m = Math.pow(10, Math.max(r1, r2))
    return (arg1 * m + arg2 * m) / m
}

Number.prototype.add = function(arg) {
    return accAdd(arg, this);
}

function checkValue() {
	
	
	
	var isValid = validateUserInfo();
	
	if (!isValid)
		return false;
		
	var shippingAddress = jQuery("#shippingAddress").val();
	var shippingCity = jQuery("#shippingCity").val();
	var shippingState = jQuery("#shippingState").val();
	var shippingZip = jQuery("#shippingZip").val();
	var shippingPhone = jQuery("#shippingPhone").val();
	var shippingInstitution = jQuery("#shippingInstitution").val();
	var shippingCountry = jQuery("#shippingCountry").val();
	var shippingAttention = jQuery("#shippingAttention").val();
	
	/*var billAddress = jQuery("#billingAddress").val();
	var billingCity = jQuery("#billingCity").val();
	var billingState = jQuery("#billingState").val();
	var billingZip = jQuery("#billingZip").val();
	var billingPhone = jQuery("#billingPhone").val();
	var billingInstitution = jQuery("#billingInstitution").val();
	var billingCountry = jQuery("#billingCountry").val();
	
	if( isEmpty(billAddress) 
		|| isEmpty(billingCity) 
		|| isEmpty(billingState) 
		|| isEmpty(billingZip) 
		|| isEmpty(billingPhone) 
		|| isEmpty(billingInstitution) 
		|| isEmpty(billingCountry) ){
		scroller('msg', 8);
		jQuery("#quotation-msg").html("<font color=\"red\">Billing address is required.</font>");
		return false;
	}*/
	
	

	/*if(billingCountry!=shippingCountry){
		scroller('msg', 8);
		jQuery("#quotation-msg").html("<font color=\"red\">Please input matched Shipping Country with Order Country.</font>");
		return false;
	}*/
	
	
	
	
	/*jQuery.get(path+'/user/validate?city='+billingCity+'&zip='+billingZip+'&state='+billingState+'&country='+billingCountry, function(json){
		if(json == 'success'){*/
			jQuery.get(path+'/user/validate?city='+shippingCity+'&zip='+shippingZip+'&state='+shippingState+'&country='+shippingCountry, function(json){
				if(json == 'success'){
					jQuery("#quotationForm").attr("action", path + "/services/project/customize");
					document.getElementById("quotationForm").submit();
				}else{
					scroller('msg', 8);
					jQuery("#quotation-msg").html("<font color=\"red\">Shipping address is incorrect!</font>");
					return false;
				}
			});
		/*}else{
			scroller('msg', 8);
			jQuery("#quotation-msg").html("<font color=\"red\">Billing address is incorrect!</font>");
			return false;
		}
	});*/

}

function customProject() {
	var isValid = checkValue();
	if (!isValid) return;
	alert(jQuery("#quotationForm").attr("action"));
	jQuery("#quotationForm").submit();
}

function addMore() {
	
	var isValid = validateQuotationInfo();
	if (!isValid)
		return false;
		
 	jQuery("#quotationForm").attr("action", path + "/services/project/addMore");
	jQuery("#quotationForm").ajaxSubmit({
		error : function() {setWarnMessage("Sorry, occur error.");},
		success : function(data) {
			// firefox like '<pre>success</pre>',IE no such problem
			if (data.indexOf("NotTemplate") != -1) {
				setWarnMessage("No corresponding XML template, please contant abgent customer service.");
			} else if (data.indexOf("SessionExpired") != -1) { // session may be expired
				if (!confirm("The session expired,the page will be refresh,continue?")) return;
				window.location.reload();
			} else if (data.indexOf("failed") != -1) {
				setWarnMessage("Sorry, occur error.");;
			} else {
				combineHtml(data);
				setWarnMessage("Add quotation success.");
			}
			
			window.scroll(0, 0);
		}
	});
}

function combineHtml(data) {
	var data = eval("(" + data + ")");
	var html = "";
	jQuery.each(data, function(i, n) {
			html += n + '<a href="javascript:void(0)" onclick="deleteQuotation(' + i + ')" title="delete this quotation">Delete</a><br/><div style="height: 20px;border-top: 1px dotted;"></div>'
		})
	jQuery("#quotationDetail").html(html);
}

function deleteQuotation(key) {
	if (!confirm("Are you sure to delete?")) return;
	jQuery.post(path + "/services/project/deleteQuotation",
		{key : key},
		function(data) {
			combineHtml(data);
		}
	);
}

function slideToggle(){
	
	// no customized quotation, not expand
	if (isEmpty(jQuery("#quotationDetail").text().replace(/\s/g,""))) {
		setWarnMessage("No customized quotation!")
		window.scroll(0, 0);
		return;
	}
	
	jQuery("#quotationDiv").slideToggle(500);
}

function setWarnMessage(msg) {
	jQuery("#quotation-msg").html('<span style="color:red;">' + msg + '</span>');
}

function validateQuotationInfo() {
	if (jQuery(":radio:checked").length < 1 && jQuery(":checkbox:checked").length < 1) {
		scroller('msg', 8);
		jQuery("#quotation-msg").html("<font color=\"red\">Please select customize information</font>");
		
		return false;
	}
	
	if (jQuery("#mod_others").attr("checked")) {
		if (isEmpty(jQuery("#mod_others_info").val())) {
			scroller('msg', 8);
			jQuery("#quotation-msg").html("<font color=\"red\">Modification other info can't empty when checked the other checkbox</font>");
			return false;
		}
	}
	
	if (jQuery("#extra_other").attr("checked")) {
		if (isEmpty(jQuery("#extra_other_info").val())) {
			scroller('msg', 8);
			jQuery("#quotation-msg").html("<font color=\"red\">Need extra peptide other info can't empty when checked the other radio</font>");
			return false;
		}
	}
	
	return true;
}

function register(){
     jQuery("#registerUrl").val(jQuery("#url").val());     
     jQuery("#registerform").attr("action",path + "/user/toReg");
     jQuery("#registerform").attr("method","get");
     jQuery("#registerform").submit();
}

function validateUserInfo() {
	var str = "This field is required!";
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
		
		var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (jQuery("#emailAddress").val() == "") {
			jQuery("#emailAddressError").text(jQuery.l10n.__(str) );
			canSubmit = false;
		} else if (!emailReg.test(jQuery("#emailAddress").val())) {
			jQuery("#emailAddressError").text(jQuery.l10n.__("Please input correct Email Address!") );
			canSubmit = false;
		} else
			jQuery("#emailAddressError").empty();
		
		if (jQuery("#titleName").val() == "") {
				jQuery("#titleNameError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#titleNameError").empty();
				
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
				
		if (jQuery("#shippingCountry").val() == "") {
				jQuery("#shippingCountryError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingCountryError").empty();
				
		if (jQuery("#shippingPhone").val() == "") {
				jQuery("#shippingPhoneError").text(jQuery.l10n.__(str) );
				canSubmit = false;
			} else
				jQuery("#shippingPhoneError").empty();
		
		if (trim(jQuery(".show_info").text()) != "") {
			window.scroll(0,300);
		}
		
		if (!canSubmit) {
			document.getElementById("quotation-msg").style.display="none";
		} else {
			document.getElementById("quotation-msg").style.display="block";
		}
		
		return canSubmit;
}