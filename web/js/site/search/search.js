jQuery(document).ready(function () {
	
	jQuery("#defaultFourse").focus();
	
	var searchType = getValueForTextOrRadioSelected('radio', 'searchType');
	
	if(searchType == 'products'){
		changeCheckboxState('returnTypeProducts', '');
		changeCheckboxState('returnTypeSite', 'disabled');
		
	}else if(searchType == 'site'){
		changeCheckboxState('returnTypeProducts', 'disabled');
		changeCheckboxState('returnTypeSite', '');
	}
	
});

function selectReturnTypeBySearchType(searchType){

	if(searchType == 'products'){
		changeCheckboxState('returnTypeProducts', '');
		changeCheckboxState('returnTypeSite', 'disabled');
	}
	if(searchType == 'site'){
		changeCheckboxState('returnTypeProducts', 'disabled');
		changeCheckboxState('returnTypeSite', '');
	}
}

function changeCheckboxState(id, state){
	
	var array = jQuery('input[type="checkbox"][name="'+id+'"]');
	for(var i=0; i<array.length; i++){
	    array[i].disabled=state;
	}
}
	
function advancedSearchResult(){
	
	if(getValueForTextOrRadioSelected('radio','searchType') == ''){
		jQuery("#advancedSearchError").text(jQuery("#searchTypeEmpty").val());
		return;
	}
	
	//getValueForTextOrRadioSelected('radio','dataSearchType')=='' || 
	
//	var dataSearchType = getValueForTextOrRadioSelected('radio', 'dataSearchType');
//	var searchValue = getValueForTextOrRadioSelected('text', dataSearchType);

    var anywordValue = getValueForTextOrRadioSelected('text', 'anywordValue');
    var onlywordValue = getValueForTextOrRadioSelected('text', 'onlywordValue');
    var nonewordValue = getValueForTextOrRadioSelected('text', 'nonewordValue');
    
	if((anywordValue == '' || anywordValue == undefined) && (onlywordValue == '' || onlywordValue == undefined) && (nonewordValue == '' || nonewordValue == undefined)){
		jQuery("#advancedSearchError").html(jQuery("#searchValueEmptyForAdvanced").val());
		return;
	}
	
	if((anywordValue == '' || anywordValue == undefined) && (onlywordValue == '' || onlywordValue == undefined) && (nonewordValue != '')){
		jQuery("#advancedSearchError").html(jQuery("#searchValueEmptyForAdvanced").val());
		return;
	}
	
//	if(searchValue == '' || searchValue == undefined){
//		alert(jQuery("#searchValueEmpty").val());
//		return;
//	}
	
	anywordValue = encodeURI(anywordValue);
	onlywordValue = encodeURI(onlywordValue);
	nonewordValue = encodeURI(nonewordValue);
	
//	searchValue = encodeURI(searchValue);
	var searchType = getValueForTextOrRadioSelected('radio', 'searchType');
	var selectReturytypeValues = '';
	
	if(searchType=='products'){
		selectReturytypeValues = getValuesForCheckboxSelected('returnTypeProducts');
	}
	if(searchType=='site'){
		selectReturytypeValues = getValuesForCheckboxSelected('returnTypeSite');
	}

    document.location.href = path + "/searches/advanced/ss?searchType="+searchType+"&selectReturytype="+selectReturytypeValues+"&anywordValue="+anywordValue+"&onlywordValue="+onlywordValue+"&nonewordValue="+nonewordValue;
//	jQuery("#advancedSearchForm").attr("action", path + "/searches/advanced/"+dataSearchType+"?searchValue="+searchValue);
//    jQuery("#advancedSearchForm").submit();
}

function searchFulltext(){
	
	var fulltext = jQuery("#fulltext").val();
	if(fulltext == undefined || fulltext == ''){
		//alert(jQuery("#searchValueEmpty").val());
		jQuery("#searchQueryMessage").html("<div class='message'>" + jQuery("#searchValueEmpty").val() +"</div>");
		return;
	}
	if(getValueForTextOrRadioSelected('radio', 'search') == ''){
		jQuery("#searchQueryMessage").html("<div class='message'>" + jQuery("#searchValueEmpty").val() +"</div>");
		//alert(jQuery("#searchTypeEmpty").val());
		return;
	}
	
	fulltext = encodeURI(fulltext);
	document.location.href = path + "/searches/"+getValueForTextOrRadioSelected('radio', 'search')+"?fulltext=" + fulltext;
}

/**
 * get value for the text or radio selected in the 'input' tag.
 */
function getValueForTextOrRadioSelected(type, name){
	
	var flag = '';
	var item=jQuery('input[type="'+type+'"][name="'+name+'"]'); 
	if(type == 'text'){
		flag = item.val();
	}else{
		jQuery.each(item,function(i,n){  
	        if (n.checked){  
	        	flag = n.value;
	        }  
	    }); 
	}       
    
    return flag;
}

/**
 * get value for the checkbox selected in the 'input' tag.
 */
function getValuesForCheckboxSelected(name){
	
	var resultArr = new Array();
	var item=jQuery('input[type="checkbox"][name="'+name+'"]'); 
	var j = 0;
	
	jQuery.each(item,function(i,n){  
        if (n.checked){  
        	resultArr[j] = n.value;
        	j++;
        }  
    }); 
    
    return resultArr.join(',');
}
