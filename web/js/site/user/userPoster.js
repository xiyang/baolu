jQuery(document).ready( function() {

	jQuery("#posterNameHide").val(jQuery("#posterName").text());
	jQuery("#email").attr("readonly","readonly");
	
	var str = "This field is required!";
	
    jQuery("#"+jQuery(".posterFormClass").attr("id")).submit( function() {

		var canSubmit = new Boolean(true);
		
		if (jQuery("#firstName").val() == "") {
			jQuery("#firstNameError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#firstNameError").empty();	
					
		if (jQuery("#lastName").val() == "") {
			jQuery("#lastNameError").text(jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#lastNameError").empty();	
					
		//if (jQuery("#institution").val() == "") {
			//jQuery("#institutionError").text( jQuery.l10n.__(str) );
			//canSubmit = false;
		//} else
			//jQuery("#institutionError").empty();	
		
		if (jQuery("#shippingInstitution").val() == "") {
			jQuery("#shippingInstitutionError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingInstitutionError").empty();	
		
		if (jQuery("#shippingAttention").val() == "") {
			jQuery("#shippingAttentionError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingAttentionError").empty();
				
		if (jQuery("#shippingAddress").val() == "") {
			jQuery("#shippingAddressError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingAddressError").empty();
			
		if (jQuery("#shippingCity").val() == "") {
			jQuery("#shippingCityError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingCityError").empty();
		
		if (jQuery("#shippingState").val() == "") {
			jQuery("#shippingStateError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingStateError").empty();
		
		if (jQuery("#shippingZip").val() == "") {
			jQuery("#shippingZipError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingZipError").empty();
		
		if (jQuery("#shippingCountry").val() == "") {
			jQuery("#shippingCountryError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingCountryError").empty();
		
		if (jQuery("#shippingPhone").val() == "") {
			jQuery("#shippingPhoneError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#shippingPhoneError").empty();	
			
		//if (jQuery("#shippingAddress").val() != "" && jQuery("#shippingCity").val() != "" && jQuery("#shippingState").val() != "" && jQuery("#shippingZip").val() != "" && jQuery("#shippingCountry").val() != "" && jQuery("#shippingPhone").val() != "") {
			//jQuery("#shippingAddressError").empty()
		//}else {
			//jQuery("#shippingAddressError").text( jQuery.l10n.__("Completed ShippingAddress(Including 6 items) !") );
			//canSubmit = false;
		//}
		
		var returnFreePosterList = "";
		var returnFreeBrochureList = "";
		if(jQuery(".posterFormClass").attr("id") == 'freePosterForm') {
			for(var  i=0;i  <document.getElementsByName("returnFreePoster").length;i++)  
			{  
				  
				if(document.getElementsByName("returnFreePoster")[i].checked){  
				returnFreePosterList = returnFreePosterList + document.getElementsByName("returnFreePoster")[i].value + ",";  
				}   
			}  
			if(returnFreePosterList.length > 0) {
				returnFreePosterList = returnFreePosterList.substring(0, returnFreePosterList.length-1);
			}
			
			for(var  i=0;i  <document.getElementsByName("returnFreeBrochure").length;i++)  
			{  
				  
				if(document.getElementsByName("returnFreeBrochure")[i].checked){  
				returnFreeBrochureList = returnFreeBrochureList + document.getElementsByName("returnFreeBrochure")[i].value + ",";  
				}   
			}  
			if(returnFreeBrochureList.length > 0) {
				returnFreeBrochureList = returnFreeBrochureList.substring(0, returnFreeBrochureList.length-1);
			}
			
			//if(returnFreePosterList == "") {
				//jQuery("#returnFreePosterError").text( jQuery.l10n.__(str) );
			if(returnFreePosterList == "" && returnFreeBrochureList == "") {
				jQuery("#returnFreePosterError").text( jQuery.l10n.__("Select at least one, poster or brochure.") );
				canSubmit = false;
			}else{
				jQuery("#returnFreePosterError").empty();	
			}
		}
		
		return canSubmit;

		jQuery("#"+jQuery(".posterFormClass").attr("id")).submit();
		
		});
    
});

function showPoster(poster) {
	jQuery(".posterPic").hide();
	jQuery("#"+poster+"").show();
}

function showBrochure(brochure) {
	jQuery(".posterPic").hide();
	jQuery("#"+brochure+"").show();
}