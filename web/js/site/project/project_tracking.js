
jQuery(document).ready(function() {
	var projectId = jQuery("#projectId").val();
	//TODO: need alter the path when deploy the system
	
	jQuery.getJSON(customizeProjectDetailPath + projectId + "&jsonCallback=?");
});

function jsonCallback(data) {
     
      var html = '<table id="trackProjectTable"><tr><th><span>experimentName</span></th><th><span>state</span></th></tr>';
      
      jQuery.each(data.experimentModelList, function(i, n){
	     html += '<tr onmouseover="changeto()" onmouseout="changeback()"';
	     	if ((i + 1) % 2 == 0) {
	     		html += 'bgcolor="#eeeeee"';
	     	}
	     	 
	      html += '><td>' + n.experimentName + '</td><td>' + n.state + '</td></tr>';
	  });
	  
	  html += '</table>';
	  jQuery('#trackProject').html(html);
}