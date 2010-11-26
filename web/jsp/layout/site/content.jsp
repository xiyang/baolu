<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.cycle.all.2.72.js"></script>

<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/js/jquery/jqueryplayer.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#fulltextw").keyup(function(event){
			if (event.keyCode == 13) {
				search();
			}
		});
	
		//document.location.href = path + "/docs/offer";
		jQuery("#contentSpe").html(jQuery("#play_link_img_1").children().next().val());
			
		//document.location.href = path + "/docs/offer";
		jQuery.get(path + "/docs/index/feature", function(data) {
			jQuery("#contentLink").html(data);
		});
	
	//background: none transparent scroll repeat 0% 0%;
		jQuery.fn.cycle.defaults.timeout = 6000;
		jQuery(function() {
			var i = 0;
			
		    // run the code in the markup!
		    jQuery('#news').cycle({
				fx:     'fade', //'scrollUp'
				timeout: 6000,
				delay:  -2000,
				//cleartype: true,
				cleartypeNoBg: true,
				before:function onAfter() {
					if (i > ${fn:length(productsRelease)}) {
						i = 0;
					}
					getNewReleaseProduct(i);
					i = i + 7;
				}
			});
		});
		
		controlSearchAreaFontColor();
	
	});

	function getNewReleaseProduct(index) {
		jQuery.post(path + "/products/fetchNewRelease",
			{index : index},
			function(data) {
				jQuery("#news").html(data);
			}
		);
	}
	
	function search() {
		var eless = document.getElementsByName("search"); 
		var searchType;
		for(var i=0;i<eless.length;i++) { 
			if(eless[i].checked) { 
				searchType=eless[i].value; 
				break; 
			} 
		} 
		var searchValue = jQuery('#fulltextw').val();
		if(searchValue == "Enter Keywords"){
		    searchValue = "";
        }
		
		document.location.href = path + "/searches/"+searchType+"/?fulltext=" + encodeURI(searchValue);
	}
	function getAllNews(){
		document.location.href = path + "/news/list"
	}
	function getAllRelease(){
		document.location.href = path + "/products/newRelease"
	}
	
//Enter Keywords
function controlSearchAreaFontColor() {
   
	if (jQuery("#fulltextw").val() == "" ) {
		jQuery("#fulltextw").val("Enter Keywords");
		jQuery("#fulltextw").css("color", "#cfcfcf");
	} else if (jQuery("#fulltextw").val() == "Enter Keywords") {
		jQuery("#fulltextw").css("color", "#cfcfcf");
	} else {
		jQuery("#fulltextw").css("color", "#000000");
	}
}
function setSearchTextOnfocus() {
	if (jQuery("#fulltextw").val() == "Enter Keywords") {
		jQuery("#fulltextw").css("color", "#000");
		jQuery("#fulltextw").val("");
	}
}

function setSearchTextOnblur() {
	if (jQuery("#fulltextw").val() == "") {
		jQuery("#fulltextw").css("color", "#cfcfcf");
		jQuery("#fulltextw").val("Enter Keywords");
	}
}
	
</script>
<!--[if lte IE 8]>
	<style>
	/*#playerNavAndTitle {
	margin-left:65px;
	}*/
	</style>
<![endif]-->
<!--[if lt IE 7]>
	<style>
	/*.IE6{width:98%;}
	#playerNavAndTitle {
	margin-left:60px;
	}*/
	#playerNavAndTitle #playerNav{ 
		margin-left:330px;
	}
	</style>
<![endif]-->
<!--[if IE 8]>
	<style>
	/*.rightboxB .content{margin-top:20px;}
	.rightboxB .content .release .target{
	height: 150px;	
	}*/
	.release .target {
		line-height:10px;
	}
	</style>
<![endif]-->

<style>
<!--

#main {
	margin:0px 2px 0px 190px;
	padding:0 0 0 0;
	text-align:left;
	vertical-align:top;
	min-height: 560px;
	background-image: url("");
	background-color: transparent;
	border: 0px dashed transparent;
}
#footer {
	margin-top:0px;
    padding-top:0px;
}

-->
</style>
<div class="themeL" id="playerBox">
	<div id="playerImage">
    	<ul>
        	<li><a href="products/antibodySampleSizePromotion"><img src="${pageContext.request.contextPath}/images/new/scoll-img1.jpg" /></a></li>
            <li><a href="docs/service/basic_biology_services"><img src="${pageContext.request.contextPath}/images/new/scoll-img2.jpg" /></li>
            <li><a href="products/showSamplerProductsForKits/Kits"><img src="${pageContext.request.contextPath}/images/new/scoll-img3.jpg" /></li>
        </ul>
    </div>
    
    <div id="playerNavAndTitle">
    	<div id="playerTitle">
        	<a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>          
        </div>        
        <div id="playerNav"></div>
    </div>
</div> 
<div class="centerL">
     <div class="centerboxL">
         <div class="index_title underline" style="margin-left: 8px; margin-bottom: 10px; font-weight: bold;">Featured Links</div>
         <div id="contentLink">
         </div>
     </div>
</div>
<div class="centerR">
     <div class="rightboxTop">
         <div class="index_title underline" style="font-weight: bold;"><fmt:message key="search.title"></fmt:message></div>
         <div class="content">
         	<div class="searchImage">
				<input type="text" id="fulltextw" value="${fulltext}" onfocus="setSearchTextOnfocus()" onblur="setSearchTextOnblur()"/>
				<input onclick="search();" class="search"></input>
         	</div>
         	<div class="searchRadio">
         		<div class="radio"><input type=radio name="search" value="products" checked="checked"><span><fmt:message key="search.products.title"></fmt:message></span></div>
         		<div class="radio"><input type=radio name="search" value="site"><span><fmt:message key="search.sites.title"></fmt:message></span></div>
         	</div>
         	 
		 </div>
     </div>     
     
     <div class="rightboxB">
          <div class="title hand" onclick="getAllRelease()"><fmt:message key="release.new.title"><fmt:param value="${productsReleaseSize}"></fmt:param></fmt:message></div>
          <div class="content" >
         	<div class="release" id = "news">
         		<div class="target"></div>
				<div class="target"></div>
         	</div>
		 </div>
     </div>
     
</div>
<div class="centerM">
     <div class="centerboxMid">
     	<ul>
	        <c:forEach var="doc" items="${docsMap}">
				
					<c:if test="${fn:startsWith(doc.key,'offer')}">
						<li>
							<div class="index_title underline" id="id_${doc.key}" style="font-weight: bold;"><c:out value="${doc.value.title}" /></div>
							<input  type="hidden" value="<c:out value='${doc.value.content}' />">
						</li>
					</c:if>
			</c:forEach>
         </ul>
         <div id="contentSpe">
        	
        </div>
     </div>
</div>
