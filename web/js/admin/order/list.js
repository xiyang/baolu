var onInvokeAction = function(id, action){
	
	var parameterString = createParameterStringForLimit(id);
	if (id == "ordersTable") {
			buildNewsList(parameterString);
	}
};
function buildNewsList(parameterString) {
	
	if (typeof parameterString != "string") {
		parameterString="";
	}
		
	document.location.href = path + "/admin/order/list?"+parameterString;
	
};
function detail(id){
    location.href = path +"/admin/order/detail/" +id;
}
