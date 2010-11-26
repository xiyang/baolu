jQuery(document).ready(function() {
	/*jQuery("#productList tbody tr").mouseover(function() {
			jQuery(this).addClass("highLight");
		}).mouseout(function() {
			jQuery(this).removeClass("highLight");
		})*/
		
	jQuery("#productList tr:even").addClass("evenTR");
	jQuery("#productAdvanceList tr:even").addClass("evenTR");
	
	//jQuery(".tableList tr:even").addClass("evenTR");
	
	/*jQuery("#searchProduct input").keyup(function () {
	if (event.keyCode == 13) {
		searchProduct();
	}
});*/

 jQuery('#legendDialog').hide();
 
}
);

function kitsDownNow(cate) {
	window.open(path + cate);
}

function searchProduct() {
	jQuery("#searchProduct").submit();
}


function addToCart(id) {
	location = path + "/order/add/" + id + "/" + 1;
}

function addCartByCatalog() {

	if (jQuery("#catalog").val() == '' || jQuery("#catalog").val() == null) {
		jQuery("#addWarn").text(jQuery("#catalogEmpty").val());
		//alert(jQuery("#catalogEmpty").val());
		return;
	}else {
		jQuery("#addWarn").empty();
	}
	
	/**
	 * Here is a hack. Because the spring url mapping assumes the catalog have no special character ,such as '/',' '.
	 * But the user can input these character. So we remove these characters.
	 */
	var catalog = "" + (jQuery("#catalog").val()) + "";
	
	location.href = path + "/order/catalog/" +catalog.replace(/\//g,'') + "/" + 1;
}

function addCartByCatalogOnline() {

	if (jQuery("#catalog").val() == '' || jQuery("#catalog").val() == null) {
		jQuery("#addWarn").text(jQuery("#catalogEmpty").val());
		return;
	}else {
		jQuery("#addWarn").empty();
	}
	
	/**
	 * Here is a hack. Because the spring url mapping assumes the catalog have no special character ,such as '/',' '.
	 * But the user can input these character. So we remove these characters.
	 */
	var catalog = "" + (jQuery("#catalog").val()) + "";
	
	location.href = path + "/order/catalog/" +catalog.replace(/\//g,'') + "/" + 1+"?from=online";
}

function clearWarnMsg(o) {
	jQuery("#validateWarn").text("");
	jQuery("#"+o).text("");
}

function cart() {
	location = path + "/order/cart";
}

function printByCatalog(catalog) {
	window.open(path + "/products/techsheet/" + catalog);
}

function openUrl(url){
	window.open(url);
}

function msds() {
	var msdsPath = jQuery("#msdsPath").val();
	if(msdsPath == '' || msdsPath == null){
		alert("no file to open!");
		return;
	}
	window.open(path + msdsPath);
}

function showLegend() {
    jQuery('#legendDialog').show();
}
function hideLegend() {
    jQuery('#legendDialog').hide();
}

/*function submitFeedBack() {
	var flag = true;
	if (isEmpty(jQuery("#email").val())) {
		jQuery("#emailTips").text("Email can't empty");
		flag = false;
	}
	
	if (isEmpty(jQuery("#firstName").val())) {
		jQuery("#firstNameTips").text("First Name can't empty");
		flag = false;
	}
	
	if (isEmpty(jQuery("#lastName").val())) {
		jQuery("#lastNameTips").text("Last Name can't empty");
		flag = false;
	}
	
	if (isEmpty(jQuery("#comments").val())) {
		jQuery("#commentsTips").text("Description can't empty");
		flag = false;
	}
	
	if (!verifyEmail()) {
		flag = false;
	}
	
	return flag;
}*/

function verifyEmail() {
	if (!isEmail(jQuery("#email").val())) {
		jQuery("#emailTips").text("Email is invalid");
		return false;
	}
	return true;
}

function clearTips(category) {
	if (category == "email") {
		jQuery("#emailTips").text("");
	} else if (category == "firstName") {
		jQuery("#firstNameTips").text("");
	} else if (category == "lastName") {
		jQuery("#lastNameTips").text("");
	} else if (category == "comments") {
		jQuery("#commentsTips").text("");
	}
}
	
var ifLoginDialogTemp = {
	height : '150',
	width : '400',
	modal : true,
	autoOpen : false,
	position : "center",
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
	
function ifLogin() {
	jQuery('#ggDialog').dialog('destroy');
	jQuery('#ggDialog').dialog(ifLoginDialogTemp);
	jQuery('#ggDialog').dialog('open');
	jQuery('#ggDialog').css('display', 'block');
	
}

function loginWarn(iflonginvar,catalog,title){
	clearMsg();
	jQuery("#catalogTitle").val(catalog + "_" + title);
	jQuery("#catalog").val(catalog);
	jQuery("#titleName").val(title);
	if (iflonginvar == 1) {
		ifLogin();
	} else {
		goOn();
	}
	
	
}

function goOn() {
	document.location.href = path + "/products/catalog/" + jQuery("#catalog").val() + "_" + jQuery("#titleName").val();
}

function checkEmail(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
	   // alert(jQuery('#userNameEmpty').val());
		jQuery("#validationUserMsg").html(jQuery('#userNameEmpty').val());
		return false;
	} 
	var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	if (!emailReg.test(content)) {
		jQuery("#validationUserMsg").html(jQuery('#emailFormatWarn').val());
		return false;
	}
	return true;
}

function checkPassword(content) {
	
	clearMsg();
	if (isEmpty(content) || isBlank(content)) {
		jQuery("#validationUserMsg").html(jQuery('#userPasswordEmpty').val());
		return false;
	} 
	return true;
}

function clearMsg(){
	jQuery("#validationUserMsg").text("");
}

function loginOrReg(){
	jQuery.post(path + "/user/loginOrReg", 
	{            catalogTitle:jQuery("#catalogTitle").val(),
				 email:jQuery("#loginEmail").val(),
				 password:jQuery("#loginPassword").val()
	}, function (data) {
		if (data == "emailEmpty") {
			jQuery("#validationUserMsg").text(jQuery('#userNameEmpty').val());
		}
		if (data == "passwordEmpty") {
			jQuery("#validationUserMsg").text(jQuery('#userPasswordEmpty').val());
		}
		if (data == "passwordError") {
			jQuery("#validationUserMsg").text(jQuery('#passwordError').val());
		} else {
			document.location.href = path + "/products/catalog/" + jQuery("#catalog").val() + "_" + jQuery("#titleName").val();
		}
	});
	return true;
}

/**
 * sort the data for legend
 */
 
 function sortTable(lnk,clid){
 	
 	var span;
    for (var ci=0;ci<lnk.childNodes.length;ci++) {
        if (lnk.childNodes[ci].tagName && lnk.childNodes[ci].tagName.toLowerCase() == 'span') {
            span = lnk.childNodes[ci];
        }
     }
     
     var td = lnk.parentNode;
     var column = clid || td.cellIndex;
     var table = getParent(td,'table');
     if (table.rows.length <= 1) return;
     
     var itm = ts_getInnerText(table.rows[1].cells[column]);
     var sortfn = ts_sort_caseinsensitive;

	 if (itm.match(/^[&$]/)) sortfn = ts_sort_currency;
	 else if (itm.match(/^[\d\.]+$/)) sortfn = ts_sort_numeric;
	 else if (itm.match(/^(-)?[\d\.]+$/)) sortfn = ts_sort_numeric;
	 else if (itm.match(/^(-)?(\d{1,3}\,)*(\d{1,3})+\.?\d*$/)) sortfn = ts_sort_numeric;
	 
	 SORT_COLUMN_INDEX = column;// control the view 
   
	 var tbodies = table.getElementsByTagName("tbody");
	 for (var h = 0; h < tbodies.length; h++) {
		 var tableBody = tbodies[h];
		 var newRows = new Array();
		
		 var trs = tableBody.getElementsByTagName("tr");
	
		 for (var i = 0; i < trs.length; i++) {
		    newRows[i] = trs[i];
		 }
		 newRows.sort(sortfn);
		 
		 if (span.getAttribute("sortdir") == 'down') {
		    newRows.reverse();
		 }
		 
		 //combine all row that already exist by newRows sort again.
		 for (var i=0;i<newRows.length;i++) {
		     if (!newRows[i].className || (newRows[i].className && (newRows[i].className.indexOf('sortbottom') == -1))) {
		     	  if(i%2 == 0){
		     	  	newRows[i].setAttribute('class','TrSingle');
		     	  }else{
		     	  	newRows[i].setAttribute('class','TrDouble');
		     	  }
		          tableBody.appendChild(newRows[i]);
		      }
		  }
		  
		  // do sortbottom rows only
		 for (var i=0;i<newRows.length;i++) {
		     if (newRows[i].className && (newRows[i].className.indexOf('sortbottom') != -1)) {
		     	if(i%2 == 0){
		     	  	newRows[i].setAttribute('class','TrSingle');
		     	  }else{
		     	  	newRows[i].setAttribute('class','TrDouble');
		     	  }
		         tableBody.appendChild(newRows[i]);
		     }
		 }
	  }
	  
	  if (span.getAttribute("sortdir") == 'down') {
		   ARROW = '&uarr;';
		   span.setAttribute('sortdir','up');
		 } else {
		    ARROW = '&darr;';
		    span.setAttribute('sortdir','down');
	   }

	 // Delete any other arrows there may be showing
	 var allspans = document.getElementsByTagName("span");
	 for (var ci=0;ci<allspans.length;ci++) {
	    if (allspans[ci].className == 'sortarrow') {
		    if (getParent(allspans[ci],"table") == getParent(lnk,"table")) { // in the same table as us?
		      allspans[ci].innerHTML = '';
		    }
	    }
	 }

     span.innerHTML = ARROW;
}
 
function ts_getInnerText(el) {
 if (typeof el == "string") return el;
 if (typeof el == "undefined") { return el };
 if (el.innerText) return el.innerText; //Not needed but it is faster
 var str = "";

var cs = el.childNodes;
 var l = cs.length;
 for (var i = 0; i < l; i++) {
 switch (cs[i].nodeType) {
 case 1: //ELEMENT_NODE
 str += ts_getInnerText(cs[i]);
 break;
 case 3: //TEXT_NODE
 str += cs[i].nodeValue;
 break;
 }
 }
 return trim(str);
}


/**
* Gets nearest parent (grandparent, etc.) with tagname pTagName
*/
function getParent(el, pTagName) {
 if (el == null) return null;
 else if (el.nodeType == 1 && el.tagName.toLowerCase() == pTagName.toLowerCase()) // Gecko bug, supposed to be uppercase
 return el;
 else
 return getParent(el.parentNode, pTagName);
}

/**
* Sorts strings case insensitively.
*/
function ts_sort_caseinsensitive(a,b) {
  aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).toLowerCase();
  bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).toLowerCase();
 if (aa==bb) return 0;
 if (aa<bb) return -1;
 return 1;
}


/**
* Sorts strings as dates.
*/
function ts_sort_date(a,b) {
 // y2k notes: two digit years less than 50 are treated as 20XX, greater than 50 are treated as 19XX
 aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]);
 bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]);
 if (aa.length == 10) {
 dt1 = aa.substr(6,4)+aa.substr(3,2)+aa.substr(0,2);
 } else {
 yr = aa.substr(6,2);
 if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
 dt1 = yr+aa.substr(3,2)+aa.substr(0,2);
 }
 if (bb.length == 10) {
 dt2 = bb.substr(6,4)+bb.substr(3,2)+bb.substr(0,2);
 } else {
 yr = bb.substr(6,2);
 if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
 dt2 = yr+bb.substr(3,2)+bb.substr(0,2);
 }
 if (dt1==dt2) return 0;
 if (dt1<dt2) return -1;
 return 1;
}

/**
 * * Sorts strings as an amount of currency.
*/
function ts_sort_currency(a,b) {
 aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,'');
 bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,'');
 return parseFloat(aa) - parseFloat(bb);
}

/**
* Sorts strings numerically.
*/
function ts_sort_numeric(a,b) {
 aa = parseFloat(ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).replace(/\,/g,''));
 if (isNaN(aa)) aa = 0;
 bb = parseFloat(ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).replace(/\,/g,''));
 if (isNaN(bb)) bb = 0;
 return aa-bb;
}

function downLoadPDF(catalog) {
	jQuery("#download").submit();
	//window.location.href = path + "/products/downLoad?html="+html;
	//jQuery.post(path + "/products/downLoad",{html : html})
}

function submitFeedBack() {
	if(!checkFeedBack()) return;
	jQuery("#feedbackForm").submit();
}

function submitReview() {
	if(!checkFeedBack()) return;
	jQuery("#reviewForm").submit();
}

function checkFeedBack() {

	var str = "This field is required!";
	var message = "";
	
	if (isEmpty(jQuery("#catalogNo").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#catalogNoError").text( jQuery.l10n.__(str) );
	}/*else
		jQuery("#catalogNoError").empty();
		*/
	if (isEmpty(jQuery("#productName").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#productNameError").text( jQuery.l10n.__(str) );
	}/*else
		jQuery("#productNameError").empty();
		*/
	
	if (isEmpty(jQuery("#applications").val())) {
		message += "Applications content can't empty!\n";
		jQuery("#applicationsError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#applicationsError").empty();
	
	if (isEmpty(jQuery("#speciesTested").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#speciesTestedError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#speciesTestedError").empty();
		
	if (isEmpty(jQuery("#samplesTested").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#samplesTestedError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#samplesTestedError").empty();
	
	if (isEmpty(jQuery("#antibodyDilution").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#antibodyDilutionError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#antibodyDilutionError").empty();
	
	if (isEmpty(jQuery("#feedbackProtocol").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#feedbackProtocolError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#feedbackProtocolError").empty();
	
	if (isEmpty(jQuery("#feedbackComments").val())) {
		message += "FeedBack content can't empty!\n";
		jQuery("#feedbackCommentsError").text( jQuery.l10n.__(str) );
	}else
		jQuery("#feedbackCommentsError").empty();
		
	if (!isEmpty(message)) {
		return false;
	}
	
	return true;
}

function showSubmitForm(currentUseId, catalog, categoryName) {

	//if login
	if(currentUseId > 0) {
		jQuery("#feedbackPost").show();
	}else{
		window.location.href = path + "/products/reviewInProduct/" + catalog + "?categoryName=" + categoryName;
	}
}

function showUploadArea() {
	jQuery("#feedbackPost .uploadHidden").show();
}

function showReviewUploadArea() {
	jQuery("#reviewPost .uploadHidden").show();
}

function uploadApplicationsData() {
	var path = feedbackForm.attachment.value
}


function addCartForFreeCatalog(){
		if (jQuery("#catalogFree").val() == '' || jQuery("#catalogFree").val() == null) {
			jQuery("#chooseWarn").text(jQuery("#catalogEmpty").val());

			return;
		}else {
			jQuery("#chooseWarn").empty();
		}
		/**
		 * Here is a hack. Because the spring url mapping assumes the catalog have no special character ,such as '/',' '.
		 * But the user can input these character. So we remove these characters.
		 */
		var catalogFree = "" + (jQuery("#catalogFree").val()) + "";
		
	    location.href = path + "/order/catalog/" +catalogFree.replace(/\//g,'') + "/" + 1+"?status=free";
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
		state.html("<input id=\""+selectO+"State\" name=\""+selectO+"State\" type=\"text\" value=\""+defaultState+"\" /><font color=\"red\" style=\"padding-left:5px;\">*</font>");
		return;
	}
	state.html("");
	//get state
	var options = "";
	jQuery.getJSON(path+'/products/states', function(json){
		options += "<select  class=\"widthForThis\" id=\""+selectO+"State\" name=\""+selectO+"State\"><option value=\"\">--</option>";
		jQuery.each(json.states, function(i, n){
			var selected = !isEmpty(defaultState) && n == defaultState ? "selected=\"selected\"" : "";
			options += "<option "+selected+" value=\""+n+"\">"+n+"</option>";
		});
		options += "</select>";
		state.html(options);
	});
	
}
function exportByCategory(categoryName,specTitle,letterPrefix){
   setButtonState();
   if (categoryName == "Cell&Tissue Lysates") {
   	categoryName = categoryName.replace("&","_");
   }
   document.location.href = path + "/export/exportByCategory?name="+categoryName+"&letterPrefix="+letterPrefix+"&specTitle="+specTitle;
}
 
function exportByFulltext(searchValue){
   setButtonState();
   document.location.href = path + "/export/exportByFullSearch?fulltext="+searchValue;
 
 
}
function exportByAdvancedSearch(dataSearchType,searchType,anywordValue,onlywordValue,nonewordValue,selectReturytype){
  setButtonState();
  document.location.href = path + "/export/exportByAdvancedSearch?dataSearchType="+dataSearchType+"&searchType="+searchType+"&anywordValue="+anywordValue+"&onlywordValue="+onlywordValue+"&nonewordValue="+nonewordValue+"&selectReturytype="+selectReturytype;
}

function setButtonState() {
   jQuery("#msg").html("Please waiting...");
}
 