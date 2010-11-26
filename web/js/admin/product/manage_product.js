function onInvokeAction(id, action) {

	if (action == "add") {
		if($('input[type="radio"][name="topCategory"][checked]').length==0){
			alert("please select the category!");
			return;
		}
		var topCategory = $('input[type="radio"][name="topCategory"][checked]')[0].value;
		$("#productForm").attr("action", path + "/admin/product/toRelease?topCategory="+topCategory);
		$("#productForm").submit();
	} else if (action == "recommend") {
			var length = $("#productsTable input[type=checkbox]:checked").length;
			if (length < 1) {
				alert($("#productEmpty").val());
				return;
			}
			$("#productForm").attr("action", path + "/admin/product/recommend");
			$("#productForm").submit();
		}else if(action == "delete"){
			var hasChecked = false;
			$.each( $('#productsTable  input[@type=checkbox]'), function(i, n){ 
				hasChecked = hasChecked || n.checked;
			});  
			if(!hasChecked){
				alert("no checked");
				return;
			}
			if (confirm('Are you sure ?')) {
		          document.location.href = path + "/admin/product/delete";
	        } 
			
		} else {
			createHiddenInputFieldsForLimitAndSubmit(id);
		}
	}

function selectAllItems(value, name) {
	if (name == "checked") {
		if (value) {
			$("#productsTable input[type=checkbox][checked=\"\"]").trigger("click");
		} else {
			$("#productsTable input[type=checkbox]:checked").trigger("click");
		}
	}
}

function releaseProduct(operateType) {
	
	if(validateProductMsg() == false){
		document.location.href = "#top";
		return;
	}

	if(operateType == 'online'){
		$("#type").val("online");
	}else{
		$("#type").val("");
	}
	
	$("#categoriesIds").val(combineCategory());
	$("#referenceId").val(getReferenceKey());
	
	$("#releaseForm").submit();
}

function combineCategory(){
	var categoriesIds = "";
	for(var  i=0;i  <document.getElementsByName("returnProductCategory").length;i++)  
	{  
		if(document.getElementsByName("returnProductCategory")[i].checked){  
			categoriesIds = categoriesIds + document.getElementsByName("returnProductCategory")[i].value + ",";  
		}   
	}  
	if(categoriesIds.length > 0) {
		categoriesIds = categoriesIds.substring(0, categoriesIds.length-1);
	}
	return categoriesIds;
}

function goBack() {
	$("#releaseForm").attr("action", path + "/admin/product/list");
	$("#releaseForm").submit();
}
function showTips(category) {
	if (category == "relatedProductCatalogs") {
		$(".messageDiv").text($("#catalogFormat").val());
	} else {
		if (category == "applications") {
			$(".messageDiv").text($("#applicationFormat").val());
		}
	}
}

function disappearTips(category) {
	$(".messageDiv").text("");
	if (category == "relatedProductCatalogs") {
		checkCatalog();
	}
}

function checkCatalog() {
	$.post(path + "/admin/product/check", {catalogs:$("#relatedProductCatalogs").val()}, function (data) {
		if (data != "success") {
			$(".messageDiv").text(data + " catalog invalid, there is no corresponding product");
		}
	});
}

function checkCatalogForProduct(){
	
	if($("#catalog").val() == '' || $("#catalog").val() == undefined){
		$(".messageDiv").text("the catalog can't empty!");
		return;
	}

	if($("#productId").val() == '' && ($("#catalog").val().substring(0,2) == "AP" 
		|| $("#catalog").val().substring(0,2) == "ap"
		|| $("#catalog").val().substring(0,2) == "AM"
		|| $("#catalog").val().substring(0,2) == "am")){

		var strStorage = $("#catalog").val() + " can be refrigerated at 2-8&deg;C for up to 6 months. For long term storage, place the " + $("#catalog").val() + " antibody at -20&deg;C."
		var strPrecautions = "This " + $("#catalog").val() + " is for research use only and not for use in diagnostic or therapeutic procedures."
		$("#storage").val(strStorage);
		$("#precautions").val(strPrecautions);
		
	}
	
	$.post(path + "/admin/product/checkCatalog", {catalog:$("#catalog").val()}, function (data) {
		var productId = $("#productId").val();
		if (data != -1 && data != productId) {
			$(".messageDiv").text("the catalog is exist!");
		}else{
			$(".messageDiv").text("the catalog is right!");
			//for Peptides title
			if ($("#catalog").val().substring(0,2) == "BP") {
				$.post(path + "/admin/product/getAntibodyCatalog", {catalog:$("#catalog").val()}, function (data) {
					if (data == -1) {
						$(".messageDiv").text("the Antibodies catalog is not exist!");
					} else {
						$("#title").val(data + " Blocking Peptide");
					}
				});
			}
			//for kits
			if (($("#catalog").val().substring(0,2) == "CL" || $("#catalog").val().substring(0,2) == "cl") && $("input[name='returnProductCategory'][checked]").val() == 9) {
				$("#productPrice").val("130/5 mg")
			}
			if ($("#catalog").val().substring(0,2) == "KT" || $("#catalog").val().substring(0,2) == "kt") {
				$("#productPrice").val("315/10 rxn")
			}
		}
	});
}

//issue product
function combineHtml() {
	var html = "<table><tr><td colspan='2'>peptide</td></tr>";
	html += "<tr>";
	if (isNotEmpty("peptide-peptideSeq")) {
		html += "<td>peptide-peptideSeq: " + $("input[id='peptide-peptideSeq'][checked]").val() + "</td>";
	}
	if (isNotEmpty("peptide-picturePath")) {
		html += "<td rowspan='4'><img src='" + path + $("input[id='peptide-picturePath'][checked]").val() + "'/>";
		if (isNotEmpty("peptide-pictureDesc")) {
			html += $("#peptide-pictureDesc").val();
		}
		html += "</td>";
	}
	html += "</tr>";
	if (isNotEmpty("peptide-finalAmount")) {
		html += "<tr><td>peptide-finalAmount: " + $("input[id='peptide-finalAmount'][checked]").val() + "</td></tr>";
	}
	if (isNotEmpty("peptide-finalPurity")) {
		html += "<tr><td>peptide-finalPurity: " + $("input[id='peptide-finalPurity'][checked]").val() + "</td></tr>";
	}
	if (isNotEmpty("peptide-targetPurity")) {
		html += "<tr><td>peptide-targetPurity: " + $("input[id='peptide-targetPurity'][checked]").val() + "</td></tr>";
	}
	html += "<tr><td colspan='2'>conj</td></tr>";
	html += "<tr>";
	if (isNotEmpty("conj-concentrationForElisa")) {
		html += "<td>conj-concentrationForElisa: " + $("input[id='conj-concentrationForElisa'][checked]").val() + "</td>";
	}
	if (isNotEmpty("conj-expectedAmoun")) {
		html += "<td>conj-expectedAmoun: " + $("input[id='conj-expectedAmount'][checked]").val() + "</td></tr>";
	}
	if (isNotEmpty("conj-conjSolubility")) {
		html += "<tr><td>conj-conjSolubility: " + $("input[id='conj-conjSolubility'][checked]").val() + "</td></tr>";
	}
	if (isNotEmpty("conj-antigenConcentration")) {
		html += "<tr><td>conj-antigenConcentration: " + $("input[id='conj-antigenConcentration'][checked]").val() + "</td></tr>";
	}
	html += "<tr><td colspan='2'>protein</td></tr>";
	html += "<tr>";
	if (isNotEmpty("protein-concentration")) {
		html += "<td>protein-concentration: " + $("input[id='protein-concentration'][checked]").val() + "</td>";
	}
	if (isNotEmpty("protein-cloningScreening")) {
		html += "<td>protein-cloningScreening: " + $("input[id='protein-cloningScreening'][checked]").val() + "</td></tr>";
	}
	if (isNotEmpty("protein-templateResource")) {
		html += "<tr><td>protein-templateResource: " + $("input[id='protein-templateResource'][checked]").val() + "</td></tr>";
	}
	if (isNotEmpty("protein-geneinfo")) {
		html += "<tr><td>protein-geneinfo: " + $("input[id='protein-geneinfo'][checked]").val() + "</td></tr>";
	}
	html += "</table>";
	return html;
}

/**
   * Determine whether is null.
   */
function isNotEmpty(fieldId) {
	var item = $("input[id='" + fieldId + "'][checked]");
	if (item.length > 0) {
		return true;
	}
	return false;
}

function issueAddProduct(operateType, url) {
	
	if(validateProductMsg() == false){
		document.location.href = "#top";
		return;
	}
	
	var taskId = $("#taskId").val();
	$("#type").val(operateType);
	
	if($("#price").val() == null || $("#price").val() == ''){
		$("#price").val("0")
	}
	
//	var categoryId = $("#categories").val();
//    if(categoryId == '' || categoryId == null){
//     //	alert("please select one category at least!");
//     	$("#message").html($("#categorySelect").val());
//     //	$("#message").html($("#productCategoryEmpty").val());
//     	return;
//     }
    
    $("#referenceId").val(getReferenceKey());
    $("#categoriesIds").val(combineCategory());
    
	$.getJSON(url + taskId +"&type=issueAdd"+ "&jsoncallback=?");
}

function issueProduct(taskId, url, operateType) {
	
	$("#type").val(operateType);
	if($("#price").val() == null || $("#price").val() == ''){
		$("#price").val("0")
	}
	
	if(validateProductMsg() == false){
		document.location.href = "#top";
		return;
	}
	
//	var categoryId = $("#categories").val();
//	
//    if(categoryId == '' || categoryId == null){
//     	$("#message").html($("#categorySelect").val());
//     	return;
//     }
     $("#referenceId").val(getReferenceKey());
    $("#categoriesIds").val(combineCategory());
    
	$.getJSON(url + taskId +"&type=issueAdd"+ "&jsoncallback=?");
}

function issueCallback(data) {
	if (data.result == "true") {
		$("#productForm").submit();
	} else {
		alert("issue failed!");
	}
}

function obtainBackgroundByReferenceKey(){
	
	var referenceKeyArray = new Array();
	
	var references = $("input[name='referenceIds']");
    var j = 0;
    for(var i = 0; i < references.length; i ++){
    	if($("#referenceKey_"+references[i].value).val() == "") continue;
    	referenceKeyArray = $("#referenceKey_"+references[i].value).val().split(',');
    	if(referenceKeyArray.length == 0) continue;
    	alert(remoteBackgroundUrl+"reference_key="+referenceKeyArray[0]+"&category="+$("#referenceCategory_"+references[i].value).val());
    	break;
    }
}

function getReferenceKey(){
	
	var referenceArray = new Array();
    
    var references = $("input[name='referenceIds']");
    var j = 0;
    for(var i = 0; i < references.length; i ++){
    	if($("#referenceKey_"+references[i].value).val() == "") continue;
    	referenceArray[j++] = references[i].value + ":" + $("#referenceKey_"+references[i].value).val();
    }
    
    if(referenceArray.length == 0){
    	return "";
    }
    return referenceArray.join('#');
}


function validateProductMsg(){
	$("#message").html('');
	
	//var length = $("#categories :selected").length;
	//if (length < 1) {
		//$("#message").html($("#productCategoryEmpty").val());
		//return false;
	//}
	if (combineCategory().length <= 0) {
		$("#message").html($("#productCategoryEmpty").val());
		return false;
	}
	
	if($("#catalog").val() == '' || $("#catalog").val() == undefined){
		$(".messageDiv").text("the catalog can't empty!");
		return false;
	}

	if($("#title").val() == '' || $("#title").val() == undefined){
		$(".messageDiv").text("the title can't empty!");
		return false;
	}

	if($("#cores").val()!=undefined && !isNumber($("#cores").val())){
		$(".messageDiv").text("the Cores field must number!");
		return false;
	}

	//if($("#thickness").val()!=undefined &&  !isFloat($("#thickness").val())){
		//$(".messageDiv").text("the Thickness field must number or float!");
		//return false;
	//}

	if($("#coreDiameter").val()!=undefined &&  !isFloat($("#coreDiameter").val())){
		$(".messageDiv").text("the Core Diameter field must number or float!");
		return false;
	}

	if($("#refseqSize").val()!=undefined &&  !isNumber($("#refseqSize").val())){
		$(".messageDiv").text("the Refseq Size field must number!");
		return false;
	}

	if($("#orfSize").val()!=undefined &&  !isNumber($("#orfSize").val())){
		$(".messageDiv").text("the ORF Size field must number!");
		return false;
	}

	if($("#cases").val()!=undefined &&  !isNumber($("#cases").val())){
		$(".messageDiv").text("the cases Size field must number!");
		return false;
	}
	
	if (($("#catalog").val().substring(0,2) == "CL" || $("#catalog").val().substring(0,2) == "cl") && $("input[name='returnProductCategory'][checked]").val() == 9) {
		$("#productPrice").val("130")
	}
	if ($("#catalog").val().substring(0,2) == "KT" || $("#catalog").val().substring(0,2) == "kt") {
		$("#productPrice").val("315")
	}
	/**
  	if($("#calculatedMw").val()!=undefined){
		var lengthStr = $("#calculatedMw").val().length;
		if(lengthStr < 2 || ((lengthStr > 2) && ($("#calculatedMw").val().substring(lengthStr-2,lengthStr) != 'Da'))){
			$(".messageDiv").text("Calculated Mw's unit can not be empty, and is 'Da'!");
			return false;
		}   
		if (lengthStr == 2 && $("#calculatedMw").val() == 'Da') {
			$("#calculatedMw").val("");
		}  
	 }  
	 **/
	return true;
}

function experimentDataFile(){
	gOrder++;
	var title = jQuery("#title").val();
   	var htmlText = "<tr><th><input type=\"checkbox\" checked=\"checked\" name=\"figureIds\" value=\"add\">Upload File<input type=\"hidden\" name=\"oldPaths\" value=\"\"><input type=\"hidden\" name=\"figureIdAll\" value=\"add\"></th><td><table><tr><td><input type=\"file\" name=\"productFigureUpload\" id=\"productFigureUpload\" ></td><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order</th><td><input type=\"text\" name=\"orders\" value=\""+gOrder+"\" size=\"3\" ></td></tr></table></td></tr><tr><th>Picture Alt</th><td><input type=\"text\" name=\"alts\" id=\"alts\"  value='"+jQuery("#title").val()+"'></td></tr><tr><th>Description</th><td><textarea cols=\"48\" rows=\"5\" id=\"depicts\" name=\"depicts\" ></textarea></td></tr>";
   	jQuery("#experimentData").append(htmlText);
}
//for Applications:start
$(document).ready(function () {
	//for add
     $("#otherVal").click(function(){ 
        if ($("#otherVal").attr("checked")==true) { 
            jQuery("#otherValInput").show();
            jQuery("#hiddenDiv").show();
            if (jQuery("#applications").val() != "" && jQuery("#otherValInput").val() != "") {
            	jQuery("#applications").val(removeComma(jQuery("#applications").val() + ",," + jQuery("#otherValInput").val())); 
            }
            if (jQuery("#applications").val() == "" && jQuery("#otherValInput").val() != "") {
            	jQuery("#applications").val(removeComma(jQuery("#otherValInput").val())); 
            }
        } else {
        	jQuery("#otherValInput").hide();
        	jQuery("#hiddenDiv").hide();
        	var appStr = jQuery("#applications").val();
	        if (appStr.indexOf(",,") > 0) {
				appStr = appStr.substring(0,appStr.indexOf(",,"));
			}
			if (appStr == jQuery("#otherValInput").val()) {
				appStr = "";
			}
			jQuery("#applications").val(removeComma(appStr)); 
		}
    })
	//for modify
	if (jQuery("#catalog").val() != null && jQuery("#catalog").val() != "") {
		var appStr = jQuery("#applications").val();
		
	    if (isNotEmpty(appStr) && appStr.indexOf(",,") > 0) {
			appStr = appStr.substring(appStr.indexOf(",,")+2,appStr.length);
			jQuery("#otherVal").attr("checked","checked");
			jQuery("#otherValInput").show();
			jQuery("#hiddenDiv").show();
			jQuery("#otherValInput").val(appStr);
		}
		
	}
});

function show(obj) {
	
	var standardStr = "f_WB,f_IHC,f_IF,f_FC,f_IP,f_DB,f_E,f_ICC";
	if (jQuery("#otherVal").attr("checked")==true) {
		standardStr = standardStr + "," +jQuery("#otherValInput").val();
	}
	var oldStr = jQuery("#applications").val();
	var newStr = "";

	//do with old string
	if (oldStr == "") {
		oldStr = standardStr;
	} else {
		var splitS = oldStr.split(",");
		for (var i=0; i<splitS.length; i++) {
			if (splitS[i] == "WB" || splitS[i] == "IHC" || splitS[i] == "E" || splitS[i] == "IF" || splitS[i] == "FC" || splitS[i] == "IP" || splitS[i] == "DB" || splitS[i] == "ICC") {
				standardStr = standardStr.replace("f_" + splitS[i],splitS[i]);
			}
		}
		oldStr = standardStr;
	}
	//do with change
	if($("#applicationsSelect"+obj.value).attr("checked")==true){
		oldStr = oldStr.replace("f_" + obj.value,obj.value);
	}else{
		oldStr = oldStr.replace(obj.value,"f_" + obj.value);
	}
	//do with new string
	newStr = standardStrToOldStr(oldStr)
	
    jQuery("#applications").val(removeComma(newStr));

}

function mergeVal(obj) {

	var otherValStr = jQuery("#otherValInput").val();
	var checkStr = jQuery("#applications").val();
	if (checkStr.indexOf(",,") > 0) {
		checkStr = checkStr.substring(0,checkStr.indexOf(",,"));
	}
	
	jQuery("#otherValInput").val(removeComma(otherValStr)); 
	jQuery("#applications").val(removeComma(checkStr+",,"+obj.value));    
   
}
function importedData(){
  if(jQuery("#productCsv").val()==''){
      alert("The product csv is empty!");
      return false;
  }
}
function exportedData() {
	var status = "";
	status = document.getElementById("status").value;  
	if (isEmpty(jQuery("#catalogs").val()) && isEmpty(jQuery("#startDate").val()) && isEmpty(jQuery("#endDate").val()) && isEmpty(status)) {
		alert("The conditions can't be blank!");
		return false;
	}
}

function clearImportData(){
 location.href = path + "/admin/product/clearImportData";
}
function clearExportData(){
  location.href = path + "/admin/product/clearExportData";
}
//for Applications:end

function addForSEO() {
	jQuery("#seoKeywords").val(jQuery("#title").val());
	var str = jQuery("#title").val() + " is a reagent originally manufactured or offered by Abgent. The " + jQuery("#title").val() + " is a part of the vast portfolio of products supplied by Abgent, which includes antibodies, peptides, RNAi, proteins, plus many more. Visit the Abgent website to view the " + jQuery("#title").val() + " and to explore our products.";
	jQuery("#seoDescription").val(str);
	jQuery("#alts").val(jQuery("#title").val());
}

function newProducts() {
	document.location.href = path + "/admin/product/toRelease?topCategory="+jQuery("#categoryId").val();
}

function standardStrToOldStr(str){
	if (str.indexOf("f_WB") >= 0 ) {
		str = str.replace("f_WB,", "");
	}
	if (str.indexOf("f_IHC") >= 0 ) {
		str = str.replace("f_IHC,", "");
	}
	if (str.indexOf("f_E") >= 0 ) {
		str = str.replace("f_E,", "");
	}
	if (str.indexOf("f_IF") >= 0 ) {
		str = str.replace("f_IF,", "");
	}
	if (str.indexOf("f_FC") >= 0 ) {
		str = str.replace("f_FC,", "");
	}
	if (str.indexOf("f_IP") >= 0 ) {
		str = str.replace("f_IP,", "");
	}
	if (str.indexOf("f_DB") >= 0 ) {
		str = str.replace("f_DB,", "");
	}
	if (str.indexOf("f_ICC") >= 0 ) {
		str = str.replace("f_ICC", "");
	}
	return str;
}

function removeComma(strTmp) {
	var str = strTmp;
	if (str.substring(str.length-1,str.length) == ",") {
    	str = str.substring(0,str.length-1); 
    }
    if (str.substring(0,1) == ",") {
    	str = str.substring(1,str.length); 
    }
    return str;
}

function updateProductRealeaseStatus(id, status) {
	if (confirm('Are you sure ?')) {
		window.location.href = path + "/admin/product/update?id=" + id + "&status=" + status;
	}
}