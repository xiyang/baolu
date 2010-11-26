
function isEmpty(source){
	
	if(undefined == source){
		return true;
	}
	
	if(null == source){
		return true;
	}
	
	if("" == source){
		return true;
	}
	
}

//verify string is blank
function isBlank(val){
	if(!val) return false; 
    var strP=/^\s*$/; 
    if(!strP.test(val)) return false; 
   
    return true; 
}

function trim(val) {
	return val.replace(/(^\s*)|(\s*$)/g, "");
}

//verify positive integer, above zero\s
function isNumber(oNum){ 
	if(oNum == 0){return true;}
    if(!oNum) return false; 
    var strP=/^[1-9]\d*$/; 
    if(!strP.test(oNum)) return false; 
    try{ 
        if(parseFloat(oNum)!=oNum) return false; 
    } 
    catch(ex){ 
        return false; 
    } 
    return true; 
}

function isEmail(str){
       var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
       return reg.test(str);
}

function isUrl(str){
       var reg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^\"\"])*$/;
       return reg.test(str);
}

function selectAllItemsForMultiTable(tableId, value, name) {
		if (name == 'checked') {
			if (value) {
				$('#'+tableId+' input[@type=checkbox][@checked=""]').trigger('click');
			} else {
				$('#'+tableId+' input[@type=checkbox]').trigger('click');
			}
		}
}

function isFloat(theFloat){
	
	var len=theFloat.length;
	var dotNum=0;
	if (len==0) return true;
	 var oneNum = '';
	 
	for(var i=0;i<len;i++){
	   oneNum=theFloat.substring(i,i+1);
	   if (oneNum==".") dotNum++;
	   
	   if (((oneNum<'0' || oneNum>'9') && oneNum!=".") || dotNum>1)
	     return false;
	}
   if (len>1 && theFloat.substring(0,1)=="0"){
        if (theFloat.substring(1,2)!=".")
            return false;
   }
	return true;
}

function isContained(source, target){
	if(source.indexOf(target) != -1){
		return true;
	}
	
	return false;

}