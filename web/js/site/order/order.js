
jQuery(document).ready(function () {
	//calculate();
	if (jQuery('.productName').text()==''){
	    jQuery('#enquiry').hide();
	}
	jQuery('#homeL').click(function (){
	    location.href = path ;
	
	});
});
function deleteItemById(id) {
	location.href = path + "/order/delete/" + id;
}
function deleteAllItems() {
	location.href = path + "/order/deleteAll";
}
function modifyQuantity() {
	if (jQuery(".itemId").val() == null) {
		return;
	}
	jQuery("#orderForm").submit();
}
function getTotalPrice(price, quantity) {
	return (price * quantity);
}
function generateOrder() {
	location.href = jQuery("#ctx").val() + "/order/generate";
}
function calculate() {
	var totalPrice = parseFloat("0");
	jQuery(".price").each(function () {
	    var quantity = jQuery(this).parent().parent().children('.quantity').children('.quan').val();
	    var itemPrice = getTotalPrice(jQuery(this).text(), quantity);
	    jQuery(this).parent().next().children('.itemPrice').text(itemPrice);
		totalPrice = totalPrice + itemPrice;
	});
	jQuery("#totalPrice").text(totalPrice);
}

var showEnquiryDetailDialog = {
	height : '200',
	width : '400px',
	minWidth: '400px',
	modal : true,
	autoOpen : false,
	position : "top",
	open : function() {
	},
	overlay : {
		backgroundColor : '#000',
		opacity : 0.5
	},
	close : function() {
		jQuery(this).dialog('destroy');
	}
};


function showEnquiry () {
    jQuery('#enquiryDetailDialog').dialog('destroy');
	jQuery('#enquiryDetailDialog').dialog(showEnquiryDetailDialog);
	jQuery('#enquiryDetailDialog').dialog('open');
	jQuery('#enquiryDetailDialog').css('display', 'block');
}

function enquiry (id) {
    var comments = jQuery('#comments').val();
    if (comments.replace(/\s/g,"")=="" ) return ;
    if (id == undefined) {
        id  = 0 ;
    }
    jQuery('#enquiryId').val(id);
    jQuery('#enquiryComments').val(comments);
    jQuery('#enquiryForm').submit();
}
    
function product(){
     
    var str = document.referrer;
	   
    if((isContained(str, "/products/") || isContained(str, "/searches/")) && !isContained(str, "/productReview")){
    //if(isContained(str, "/products/") && !isContained(str, "/productReview")){
    	window.history.go(-1);
    }else{
    	location.href = path +"/products/home";
    }
}

function validationInputNumber(event){   
    var key =  event.keyCode ;   
    if ((event.ctrlKey || event.shiftKey)||key ==32 ||(key > 57 && key <96) ||key >106){   
        if(navigator.userAgent.indexOf("Firefox")>0) {   
           event.preventDefault();     
        }   
        else {   
             event.returnValue=false;   
             }   
    }   
}  

