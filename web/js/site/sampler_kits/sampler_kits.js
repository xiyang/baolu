
jQuery(document).ready(function () {
	//jQuery(".samplerKitsProducts tr:even").addClass("evenTR");
	
	// remove the blank at beginning or end for filled content
	jQuery(".item").bind("keyup", function() {
			jQuery(this).val(trim(jQuery(this).val()));
	});
	
	jQuery("#searchText").bind("keyup", function() {
			jQuery(this).val(trim(jQuery(this).val()));
	});
	
	// disabled Item input text
	jQuery(".item").attr("disabled", "disabled");
	
	// control search area font color
	controlSearchAreaFontColor();
	
	//automatic fill the selected sampler kits
	jQuery("#Ab").val(calcSelectionCount());
	calcSelectionPrice();
	
	jQuery("#pagenumberbottom").keyup(function(event){		
			if (event.keyCode == 13) {			
				gobottom();
			}
		});
		
	jQuery("#pagenumbertop").keyup(function(event){
		if (event.keyCode == 13) {
			gotop();
		}
	});
	
	jQuery("#searchText").keyup(function(event){
		if (event.keyCode == 13) {
			searchResults();
		}
	});
});

function searchResults(){
	var searchValue = jQuery("#searchText").val();
	var samplerKitCatalog = jQuery("#samplerKitCatalog").val();
	
	if(samplerKitCatalog == ''){
		return;
	}
	
	/*var selectedCatalog = "";
	for(var i = 1; i<=10 ; i++){
		var selectedCatalogOneValue = jQuery("#item"+i).val();
		if(!isEmpty(selectedCatalogOneValue)){
			selectedCatalog += selectedCatalogOneValue+",";
		}
	}*/
	document.location.href = path + "/products/samplerKit/"+samplerKitCatalog+"?searchValue="+searchValue+"&source=search";
}



function controlSearchAreaFontColor() {
	if (jQuery("#searchText").val() == "") {
		jQuery("#searchText").css("color", "#cfcfcf");
		jQuery("#searchText").val("Enter Keywords");
	} else if (jQuery("#searchText").val() == "Enter Keywords") {
		jQuery("#searchText").css("color", "#cfcfcf");
	} else {
		jQuery("#searchText").css("color", "#000");
	}
}

function setSearchTextOnfocus() {
	if (jQuery("#searchText").val() == "Enter Keywords") {
		jQuery("#searchText").css("color", "#000");
		jQuery("#searchText").val("");
	}
}

function setSearchTextOnblur() {
	if (jQuery("#searchText").val() == "") {
		jQuery("#searchText").css("color", "#cfcfcf");
		jQuery("#searchText").val("Enter Keywords");
	}
}

function addToKit(catalog, price, unit) {
	var count = calcSelectionCount();
	
	if (count == 10) {
		jQuery("#selectItemWarn").text("You can select only 10 antibody samples to one kit.");
		//alert("Max 10 antibodies per time!");
		return;
	}
	
	jQuery(".item").each(function () {
		if (jQuery(this).val() == "" && jQuery(this).attr("id") != "Ab") {
			jQuery(this).val(catalog);
			return false;
		}
	});
	
	// view current total price
	calculateCurrentTotalPrice(price, unit);
	
	// view current count
	jQuery("#Ab").val(calcSelectionCount());
	
	//proccess session
	jQuery.ajax({url:path + "/products/addSamlerKitForSession?time="+ (new Date()).getTime(),
				 type : 'POST',
				 data : {
				 	catalog : catalog
				 },
				 error : function() {},
				 success : function(data) {}
	});
	
}

function calculateCurrentTotalPrice(price, unit) {
	var currentPrice = jQuery("#totalPrice").text().replace(unit, "");
	var totalPrice = accAdd(price, currentPrice);
	//Here just for work now.
	/*var reg = /\./;
	if(!reg.test(totalPrice)) {
		totalPrice += ".00";
	}
	*/
	jQuery("#totalPrice").text(unit +"  "+ totalPrice);
}

function addSamplerKitToCart() {
	var count = calcSelectionCount();
	if (count < 5) {
		jQuery("#selectItemWarn").text("A minimum of 5 antibodies is required.");
		//alert("A minimum of 5 antibodies is required.");
		return;
	}
	var productCatalogStr = collectCatalogs();
	jQuery("#productCatalogStr").val(productCatalogStr);
	//@TODO
	var samplerKitsTotalPrice = jQuery("#totalPrice").text().replace("$", "");
	jQuery("#samplerKitsTotalPrice").val(samplerKitsTotalPrice);
	jQuery("#addToCartForm").submit();
	
}

function clearSelectedSamplerKit() {
	jQuery(".item").val("");
	jQuery("#totalPrice").text("");
}

function completeSelection() {
	var count = calcSelectionCount();
	if (count < 5) {
		jQuery("#selectItemWarn").text("A minimum of 5 antibodies is required.");
		//alert("A minimum of 5 antibodies is required.");
		return;
	}
	
	var category = jQuery("#samplerKitCategoryName").val();
	validateCatalogs(category);
}

function calcSelectionCount() {
	var count = 0;
	jQuery(".item").each(function () {
		if (jQuery(this).val() != "" && jQuery(this).attr("id") != "Ab") {
			count++;
		}
	});
	return count;
}

function calcSelectionPrice() {
	var defaultUnit = jQuery("#defaultUnit").val();
	var defaultPrice = jQuery("#defaultPrice").val();
	if(isEmpty(defaultUnit) || isEmpty(defaultPrice))
		return;
	
	var count = calcSelectionCount();
	if(isEmpty(count) || count<=0 )
		return;
	
	var totalPrice = count*defaultPrice;
	jQuery("#totalPrice").text(defaultUnit +"  "+ totalPrice);
}

/**
* collect the selected catalog
*/
function collectCatalogs() {
	var catalogStr = "";
	jQuery(".item").each(function () {
		if (!isEmpty(jQuery(this).val()) && !isBlank(jQuery(this).val()) && jQuery(this).attr("id") != "Ab") {
			catalogStr += jQuery(this).val() + ",";
		}
	});
	return catalogStr;
}

/**
* validate the catalog if valid that belongs speicified category
*/
function validateCatalogs(category) {
	var catalogStr = collectCatalogs();
	jQuery.ajax({url:path + "/products/validate?time="+ (new Date()).getTime(),
				 type : 'POST',
				 data : {
				 	category : category,
				 	catalogStr : catalogStr
				 },
				 error : function() { alert("occur error!") },
				 success : function(data) {
				 	if (data != "valid") {
				 		alert("Invalid catalog: " + data);
				 		return;
				 	} else {
				 		calcTotalPrice();
				 	}
				 		
				 }
	});
}

/**
* calculate the selected product total price
*/
function calcTotalPrice() {
	var catalogStr = collectCatalogs();
	jQuery.ajax({url:path + "/products/calcPrice?time="+ (new Date()).getTime(),
				 type : 'POST',
				 data : {
				 	catalogStr : catalogStr
				 },
				 error : function() { alert("occur error!") },
				 success : function(data) {
				 		jQuery("#totalPrice").text("$" + data);
				 }
	});
	
}


function accAdd(arg1, arg2) {
    var r1, r2, m;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    m = Math.pow(10, Math.max(r1, r2))
    return (arg1 * m + arg2 * m) / m
}