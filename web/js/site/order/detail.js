jQuery(document).ready(function () {
//getCustomizeDate();
	
	var str = "This field is required!";
	
	jQuery("#shippingForOrderForm").submit( function() {

		var canSubmit = new Boolean(true);
		
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
		
		return canSubmit;
		
		jQuery("#"+jQuery(".posterFormClass").attr("id")).submit();
		
		});
	
	jQuery("#billingForOrderForm").submit( function() {

		var canSubmit = new Boolean(true);
	
		if (jQuery("#billingAddress").val() == "") {
			jQuery("#billingAddressError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#billingAddressError").empty();
			
		if (jQuery("#billingCity").val() == "") {
			jQuery("#billingCityError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#billingCityError").empty();	
		
		if (jQuery("#billingState").val() == "") {
			jQuery("#billingStateError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#billingStateError").empty();	
		
		if (jQuery("#billingZip").val() == "") {
			jQuery("#billingZipError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#billingZipError").empty();	
			
		if (jQuery("#billingCountry").val() == "") {
			jQuery("#billingCountryError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#billingCountryError").empty();	
			
		if (jQuery("#billingPhone").val() == "") {
			jQuery("#billingPhoneError").text( jQuery.l10n.__(str) );
			canSubmit = false;
		} else
			jQuery("#billingPhoneError").empty();		
		
		return canSubmit;
		
		jQuery("#"+jQuery(".posterFormClass").attr("id")).submit();
		
		});
});

function checkAllAddressForPay(){
	
	var msg = "";
	
	if (jQuery("#shippingAttention").val() == "") {
		msg += "shippingAttention is empty;";
	} 
	
	if (jQuery("#shippingAddress").val() == "") {
		msg += "shippingAddress is empty;";
	} 
		
	if (jQuery("#shippingCity").val() == "") {
		msg += "shippingCity is empty;";
	} 
	
	if (jQuery("#shippingState").val() == "") {
		msg += "shippingState is empty;";
	} 
	
	if (jQuery("#shippingZip").val() == "") {
		msg += "shippingZip is empty;";
	} 
		
	if (jQuery("#shippingCountry").val() == "") {
		msg += "shippingCountry is empty;";
	} 
		
	if (jQuery("#shippingPhone").val() == "") {
		msg += "shippingPhone is empty;";
	} 
		
	
	if (jQuery("#billingAddress").val() == "") {
		msg += "billingAddress is empty;";
	} 
		
	if (jQuery("#billingCity").val() == "") {
		msg += "billingCity is empty;";
	} 
	
	if (jQuery("#billingState").val() == "") {
		msg += "billingState is empty;";
	} 
	
	if (jQuery("#billingZip").val() == "") {
		msg += "billingZip is empty;";
	}
		
	if (jQuery("#billingCountry").val() == "") {
		msg += "billingCountry is empty;";
	} 
		
	if (jQuery("#billingPhone").val() == "") {
		msg += "billingPhone is empty";
	} 
	
	return msg;
}

function paypal(id){

	if (jQuery("#po").attr("checked") == false && jQuery("#paypal").attr("checked") == false) {
		jQuery("#payWarn").text("Please select payment type!");
		//alert("Please select payment type!");
		return;
	}
	
	var isAvailable = checkAddress();

	if (!isAvailable)
		return;
	
	/*var msg = checkAllAddressForPay();
	if(msg != ''){
	    jQuery("#message").text(msg);
	    return;
	}*/
	
	var targetUrl = path +"/order/paypal/"+id;
	
	if (jQuery("#po").attr("checked")) { // payment use postal order
		if (isEmpty(jQuery("#poNumber").val())) {
			jQuery("#payWarn").text("This field is required!");
			//alert("P.O.# can't empty when select the pay method of P.O.#");
			return;
		}
		
		//jQuery("#payMentForm").attr("action", targetUrl);
		jQuery("#payMentForm").submit();
	} else {
	    location.href = targetUrl; // payment use paypal
	}
}

function deleteOrder(id){
	if (confirm("Are you sure ?")) {
		location.href = path +"/order/deleteo/"+id;
	}
}

function checkAddress() {
	//var msg = "";
	var isAvailable = true;
	
	var billingAddress = jQuery("#billingAddress").val();
	var billingCity = jQuery("#billingCity").val();
	var billingState = jQuery("#billingState").val();
	var billingZip = jQuery("#billingZip").val();
	var billingCountry = jQuery("#billingCountry").val();
	var billingPhone = jQuery("#billingPhone").val();
	var billingInstitution = jQuery("#billingInstitution").val();
	
	var shippingAddress = jQuery("#shippingAddress").val();
	var shippingCity = jQuery("#shippingCity").val();
	var shippingState = jQuery("#shippingState").val();
	var shippingZip = jQuery("#shippingZip").val();
	var shippingCountry = jQuery("#shippingCountry").val();
	var shippingPhone = jQuery("#shippingPhone").val();
	var shippingInstitution = jQuery("#shippingInstitution").val();
	var shippingAttention = jQuery("#shippingAttention").val();
	
	if (isEmpty(billingAddress) || isEmpty(billingAddress.trim()) 
			|| isEmpty(billingCity) || isEmpty(billingCity.trim()) 
			|| isEmpty(billingState) || isEmpty(billingState.trim()) 
			|| isEmpty(billingZip) || isEmpty(billingZip.trim()) 
			|| isEmpty(billingCountry) || isEmpty(billingCountry.trim()) 
			|| isEmpty(billingPhone) || isEmpty(billingPhone.trim())
			|| isEmpty(billingInstitution) || isEmpty(billingInstitution.trim()) 
	) {
		jQuery("#payWarnBilling").text("Billing information can't be empty!");
		isAvailable = false;
	}
	
	if (isEmpty(shippingAddress) || isEmpty(shippingAddress.trim()) 
			|| isEmpty(shippingCity) || isEmpty(shippingCity.trim()) 
			|| isEmpty(shippingState) || isEmpty(shippingState.trim()) 
			|| isEmpty(shippingZip) || isEmpty(shippingZip.trim()) 
			|| isEmpty(shippingCountry) || isEmpty(shippingCountry.trim()) 
			|| isEmpty(shippingPhone) || isEmpty(shippingPhone.trim())
			|| isEmpty(shippingInstitution) || isEmpty(shippingInstitution.trim())
			|| isEmpty(shippingAttention) || isEmpty(shippingAttention.trim())
	) {
		jQuery("#payWarnShipping").text("Shipping information can't be empty!");
		isAvailable = false;
	}
	
	return isAvailable;
}

function getCustomizeDate(){
    jQuery('#projectId').hide();
    var id = jQuery('#projectId').val().trim();
    if (id =='') return ;
    
    jQuery.getJSON(customizeProjectDetailPath+id+"&jsoncallback=?");
}

function jsonCallback(data) {
    jQuery.each(data.experimentModelList, function(i,item){
        if (i == 0) {
            jQuery("#customize").append("<tr><th>Experiment</th><th>Status</th></tr>");
        }
        jQuery("#customize").append("<tr><td>"+item. experimentName+"</td><td>"+item.state+"</td></tr>");
  });

}

var showShippingForOrderDialog = {
	height : '380',
	width : '630px',
	minWidth:'630px',
	modal : true,
	autoOpen : false,
	position : "top",
	open : function() {
		jQuery("#shippingAddress").attr("value", jQuery("#shippingAddressHidden").value);
		jQuery("#shippingCity").attr("value", jQuery("#shippingCityHidden").value);
		jQuery("#shippingState").attr("value", jQuery("#shippingStateHidden").value);
		jQuery("#shippingZip").attr("value", jQuery("#shippingZipHidden").value);
		jQuery("#shippingCountry").attr("value", jQuery("#shippingCountryHidden").value);
		jQuery("#shippingPhone").attr("value", jQuery("#shippingPhoneHidden").value);
		jQuery("#shippingInstitution").attr("value", jQuery("#shippingInstitutionHidden").value);
	},
	overlay : {
		backgroundColor : '#000',
		opacity : 0.5
	},
	close : function() {
		jQuery("#shippingForOrderDialog").dialog('destroy');
	}
};

function showShipping() {
	var payType = jQuery("input[type=radio][name='payType']:checked").val();
	var poNumber = jQuery('#poNumber').val();
	if (payType == 'po' && isEmpty(poNumber)) {
    	jQuery("#payWarn").text("This field is required!");
    	return false;
    }
    if (payType == "paypal") {
	    jQuery("#payTypeInShipping").val(payType);
	    jQuery("#poNumberInShipping").val("");
    }
    if (payType == "po") {
	    jQuery("#payTypeInShipping").val(payType);
	    jQuery("#poNumberInShipping").val(poNumber);
    }
    
    jQuery(".pickUpFlag").val(jQuery("#pickUp").attr("checked"));

	jQuery('#shippingForOrderDialog').dialog('destroy');
	jQuery('#shippingForOrderDialog').dialog(showShippingForOrderDialog);
	jQuery('#shippingForOrderDialog').dialog('open');
	jQuery('#shippingForOrderDialog').css('display', 'block');
}

function changeShippingFee(orderRequestId){
	
	var item=jQuery('input[type="checkbox"][name="pickUp"]'); 
	var flag = false;
	
	jQuery.each(item,function(i,n){  
        if (n.checked){  
        	flag = true;
        }  
    }); 
    
    var payType = jQuery("input[type=radio][name='payType']:checked").val();
    var poNumber = jQuery("#poNumber").val();
    if (payType == 'po' && isEmpty(poNumber)) {
    	jQuery("#payWarn").text("This field is required!");
    	return false;
    }
    
    location.href = path +"/user/isPickUpForOrder?pickup="+flag+"&orderRequestId="+orderRequestId+"&payType="+payType+"&poNumber="+poNumber;
}

var showBillingForOrderDialog = {
	height : '350',
	minHeight : '350',
	width : '630px',
	minWidth : '630px',
	modal : true,
	autoOpen : false,
	position : "top",
	open : function() {
		jQuery("#billingAddress").attr("value", jQuery("#billingAddressHidden").value);
		jQuery("#billingCity").attr("value", jQuery("#billingCityHidden").value);
		jQuery("#billingState").attr("value", jQuery("#billingStateHidden").value);
		jQuery("#billingZip").attr("value", jQuery("#billingZipHidden").value);
		jQuery("#billingCountry").attr("value", jQuery("#billingCountryHidden").value);
		jQuery("#billingPhone").attr("value", jQuery("#billingPhoneHidden").value);
		jQuery("#billingInstitution").attr("value", jQuery("#billingInstitutionHidden").value);
	},
	overlay : {
		backgroundColor : '#000',
		opacity : 0.5
	},
	close : function() {
		jQuery(this).dialog('destroy');
	}
};

function showBilling() {
	var payType = jQuery("input[type=radio][name='payType']:checked").val();
	var poNumber = jQuery('#poNumber').val();
	if (payType == 'po' && isEmpty(poNumber)) {
    	jQuery("#payWarn").text("This field is required!");
    	return false;
    }
    if (payType == "paypal") {
	    jQuery("#payTypeInBilling").val(payType);
	    jQuery("#poNumberInBilling").val("");
    }
    if (payType == "po") {
	    jQuery("#payTypeInBilling").val(payType);
	    jQuery("#poNumberInBilling").val(poNumber);
    }
    
    jQuery(".pickUpFlag").val(jQuery("#pickUp").attr("checked"));
    
	jQuery('#billingForOrderDialog').dialog('destroy');
	jQuery('#billingForOrderDialog').dialog(showBillingForOrderDialog);
	jQuery('#billingForOrderDialog').dialog('open');
	jQuery('#billingForOrderDialog').css('display', 'block');
}

function changePaymentType(oid) {
	if (oid == "paypal") {
		jQuery("#poNumber").attr("disabled", "disabled");
	} else {
		jQuery("#poNumber").attr("disabled", "");
	}
	
	// clear warn message
	jQuery("#payWarn").text("");
}

function selectRadio() {
	jQuery("#po").attr("checked", "checked");
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


function copyToBilling() {

if(jQuery("#regCopyBilling").attr("checked")==true) {

	jQuery("#billingAddress").val(jQuery("#shippingAddress").val());
	jQuery("#billingCity").val(jQuery("#shippingCity").val());
	jQuery("#billingState").val(jQuery("#shippingState").val());
	jQuery("#billingZip").val(jQuery("#shippingZip").val());
	jQuery("#billingPhone").val(jQuery("#shippingPhone").val());
	jQuery("#billingInstitution").val(jQuery("#shippingInstitution").val());
	
		var scObj = jQuery("#billingCountry")[0];
		for (var i = 0; i < scObj.length; i++) {
			if (scObj.options[i].value == jQuery("#shippingCountry").find("option:selected").val())
			scObj.options[i].selected = "selected";
		}
		           
		if (jQuery("#shippingCountry").find("option:selected").val() == 'US') {
			var bsObj = jQuery("#shippingState")[0];
			var bs = jQuery("#shippingState").find("option:selected").val();
			var sshtml = "<select id='billingState' name='billingState' style='width: 100%'>";
			for (var i = 0; i < bsObj.length; i++) {
				if (bsObj.options[i].value == bs) {
					sshtml = sshtml + "<option value='" + bsObj.options[i].value + "' selected='selected'>" + bsObj.options[i].text + "</option>"
				} else {
					sshtml = sshtml + "<option value='" + bsObj.options[i].value + "'>" + bsObj.options[i].text + "</option>"
				}
			}
			sshtml = sshtml + "</select>";
			jQuery("#billingStateField").html(sshtml);
		} else {
			var sshtml = "<input id='billingState' name='billingState' type='text' value='" + jQuery("#shippingState").val() + "' />";
			jQuery("#billingStateField").html(sshtml);
		}
	}
}
