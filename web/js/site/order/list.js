jQuery(document).ready(function () {
    if (jQuery('.orderNumber').text()== ''){
        jQuery('#orderNumber').hide();
    }
});

var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);

	if (id == "books") {
			buildNewsList(parameterString);
	}
}
function detail(id){
    location.href = path +"/order/detail/" +id;
}
