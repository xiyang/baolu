/**
*	color
*/
var  highlightcolor='#f5af40';
var  clickcolor='#51b2f6';

/**
* change the color
*/
function  changeto(event){
	source=event.srcElement || event.target;
	
	if  (source.tagName=="TR"||source.tagName=="TABLE")	return;
	
	while(source.tagName!="TD")
		source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
		
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor){
	
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=highlightcolor;
		}
		
	}
}

/**
* change back
*/
function  changeback(event){

	if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc") return
	
	if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor){
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
	}
}

/**
* change the color when clicking
*/
function  clickto(event){
	source=event.srcElement || event.target;
	
	if  (source.tagName=="TR"||source.tagName=="TABLE")	return;
	
	while(source.tagName!="TD"){
		source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
	}
		
	if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc"){
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=clickcolor;
		}
	}
	else{
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
	}
}