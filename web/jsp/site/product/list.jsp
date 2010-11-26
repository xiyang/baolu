<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/jmesa.tld" prefix="jmesa"%>
<%@ taglib uri="http://www.foundersoftware.com/founder/tags" prefix="fs"%>
<%@ taglib uri="http://www.foundersoftware.com/founder/table/tags" prefix="fst"%>
<div id="">
</div>
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base/ui.all.css"/>
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/new/product_legend.css"/>
<!--[if lt IE 8]>
			<style>
				#navigateR {float: right;margin-top:-15px;}
			</style>
<![endif]-->
<!--[if IE 6]>
	<style>
		#productList{
			width: 98%;
		}
	</style>
<![endif]-->

<script type="text/javascript"  src="${pageContext.request.contextPath}/js/jquery/ui/jquery.ui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/site/product/product.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		document.title="Abgent - " + "${category.name}";
		
		jQuery("#pagenumbertop").keyup(function(event){		
			if (event.keyCode == 13) {
				gotop();
			}
		});
		
		jQuery("#pagenumberbottom").keyup(function(event){
			if (event.keyCode == 13) {
				gobottom();
			}
		});
		
		var addToCards = jQuery(".addToCardA");
		jQuery.each(addToCards, function(i, n){
				jQuery("#"+n.id).bind('click', function(event){
					jQuery("#"+n.id+"Span").html("Loading...");
					var href = n.href;
					n.href="javascript:void(null);";
					window.location.href=href;
				});
		});
	});
</script>

<div class="trace">
 	<a href="${pageContext.request.contextPath}/">Home</a> >
	<a href="${pageContext.request.contextPath}/products/home">Products</a> > 
 	<c:forEach items="${pathCategeryNames}"  var="pathCategeryName" varStatus="count">
 	  <c:if test="${fn:length(pathCategeryNames) != (count.index+1) && specTitle != 'Stem_Cell_Marker' && specTitle != 'Flow_Cytometry'}">
 	     <a href="${pageContext.request.contextPath}/products/category/${pathCategeryName.restName}">${pathCategeryName.name}</a> > 	     
 	  </c:if>
 	  <c:if test="${fn:length(pathCategeryNames) == (count.index+1) && specTitle != 'Stem_Cell_Marker' && specTitle != 'Flow_Cytometry'}" >
 	     ${pathCategeryName.name}
 	  </c:if>
 	</c:forEach>
 	<c:if test="${specTitle == 'Flow_Cytometry'}">
 	     Flow Cytometry Antibodies
 	  </c:if>
 	 <c:if test="${specTitle == 'Stem_Cell_Marker'}">
 	     Stem Cell Marker Antibodies
 	  </c:if>
 	
</div>
<input type="hidden" name="productCategoryName" value="${category.name}" ></input>

<div class="productDisplay">
<%-- 
  <c:if test="${category.description != '' && category.description != null}">
	 <div id="description">
		 ${category.description}
	 </div>
  </c:if>
  
 --%>
  <table width="99%">
  <tr>
  <td style="padding-left: 5px;font-weight: bolder;padding-top: 5px;font-size:15px; width: 500px;">
   		<c:if test="${specTitle == 'Stem_Cell_Marker'}">
	 	    Stem Cell Marker Antibodies
	 	</c:if>
	 	<c:if test="${specTitle == 'Flow_Cytometry'}">
 	     	Flow Cytometry Antibodies
 		</c:if>
	 	
	 	<c:if test="${specTitle != 'Stem_Cell_Marker' && specTitle != 'Flow_Cytometry'}">
	 	     ${category.name}
	 	</c:if>	  
	 	
	 	<c:if test="${group == 'cells'}">
		 	<c:if test="${category.name eq 'Cells'}">
			 	<ul id="title-line">
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Arrays?group=cells"><font style="text-decoration: none;">Tissue Arrays</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Sections?group=cells"><font style="text-decoration: none;">Tissue Sections</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cell_Tissue_Lysates?group=cells"><font style="text-decoration: none;">Cell&Tissue Lysates</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Over_expression_Lysates?group=cells"><font style="text-decoration: none;">Over-Expression Lysates</font></a></li>
			 	</ul>
		 	</c:if>
	
			<c:if test="${category.name eq 'Tissue Arrays'}">
			 	<ul id="title-line">
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cells?group=cells"><font style="text-decoration: none;">Cells</a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Sections?group=cells"><font style="text-decoration: none;">Tissue Sections</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cell_Tissue_Lysates?group=cells"><font style="text-decoration: none;">Cell&Tissue Lysates</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Over_expression_Lysates?group=cells"><font style="text-decoration: none;">Over-Expression Lysates</font></a></li>
			 	</ul>
		 	</c:if>
		 	
		 	<c:if test="${category.name eq 'Tissue Sections'}">
			 	<ul id="title-line">
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cells?group=cells"><font style="text-decoration: none;">Cells</a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Arrays?group=cells"><font style="text-decoration: none;">Tissue Arrays</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cell_Tissue_Lysates?group=cells"><font style="text-decoration: none;">Cell&Tissue Lysates</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Over_expression_Lysates?group=cells"><font style="text-decoration: none;">Over-Expression Lysates</font></a></li>
			 	</ul>
		 	</c:if>
		 	
		 	<c:if test="${category.name eq 'Cell&Tissue Lysates'}">
			 	<ul id="title-line">
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cells?group=cells"><font style="text-decoration: none;">Cells</a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Arrays?group=cells"><font style="text-decoration: none;">Tissue Arrays</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Sections?group=cells"><font style="text-decoration: none;">Tissue Sections</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Over_expression_Lysates?group=cells"><font style="text-decoration: none;">Over-Expression Lysates</font></a></li>
			 	</ul>
		 	</c:if>
		 	
		 	<c:if test="${category.name eq 'Over-Expression Lysates'}">
			 	<ul id="title-line">
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cells?group=cells"><font style="text-decoration: none;">Cells</a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Arrays?group=cells"><font style="text-decoration: none;">Tissue Arrays</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Tissue_Sections?group=cells"><font style="text-decoration: none;">Tissue Sections</font></a></li>
			 	<li class="title-line-con"><a href="${pageContext.request.contextPath}/products/category/Cell_Tissue_Lysates?group=cells"><font style="text-decoration: none;">Cell&Tissue Lysates</font></a></li>
			 	</ul>
		 	</c:if>
	 	</c:if>
  </td>
  <td align="right">
   <c:if test="${page.totalPages > 1 && specTitle != 'Flow_Cytometry' && specTitle != 'Stem_Cell_Marker'}">
     <fs:page action="products/category/${category.restName}" param="position=top&letterPrefix=${letterPrefix}"/>
   </c:if>
   <c:if test="${page.totalPages > 1 && specTitle == 'Flow_Cytometry'}">
     <fs:page action="products/category/Flow_Cytometry" param="position=top&letterPrefix=${letterPrefix}"/>
   </c:if>
   <c:if test="${page.totalPages > 1 && specTitle == 'Stem_Cell_Marker'}">
     <fs:page action="products/category/Stem_Cell_Marker" param="position=top&letterPrefix=${letterPrefix}"/>
   </c:if>
  </td>
  </tr>
  </table>
  <div align="right" style="margin:10px 15px">
  <c:if test="${user.type eq 'MANAGER' || user.type eq 'MARKETER'}">
     <span id="msg" style="color: #CC3300; font: italic"></span>
    <input type="button" value="Exported " name="export" id="export" onclick="exportByCategory('${category.name}','${specTitle}','${letterPrefix}')">

  </c:if>
  <fmt:message key="page.list.info">
    	<fmt:param value="${page.startRow+1}"></fmt:param>
		<c:if test="${page.startRow+page.pageSize > page.totalRows}">
		   <fmt:param value="${page.totalRows}"></fmt:param>
		</c:if>
		<c:if test="${page.startRow+page.pageSize <= page.totalRows}">
		   <fmt:param value="${page.startRow+page.pageSize}"></fmt:param>
		</c:if>
	  <fmt:param value="${page.totalRows}"></fmt:param>
	  <fmt:param value="${category.name}"></fmt:param>
  </fmt:message>
  </div>
  <div align="right" style="margin-right: 15px">
	   <c:forEach items="${letterIndexList}" var="letter">
		    <c:if test="${specTitle == 'Stem_Cell_Marker'}">
		 	    <a class="productListLetter" href="${pageContext.request.contextPath}/products/category/Stem_Cell_Marker?letterPrefix=${letter}">${letter}</a>
		 	</c:if>
		 	<c:if test="${specTitle == 'Flow_Cytometry'}">
	 	     	<a class="productListLetter" href="${pageContext.request.contextPath}/products/category/Flow_Cytometry?letterPrefix=${letter}">${letter}</a>
	 		</c:if>
		 	
		 	<c:if test="${specTitle != 'Stem_Cell_Marker' && specTitle != 'Flow_Cytometry'}">
		 	  <a class="productListLetter" href="${pageContext.request.contextPath}/products/category/${categoryName}?letterPrefix=${letter}">${letter}</a>
		 	</c:if>	  
	   </c:forEach>
   </div>	
  <div id="productCount">
	 <div class="count">
	   <c:if test="${specTitle == 'Flow_Cytometry'}">
	 	     Flow Cytometry Antibodies
	 	</c:if>
	 	<c:if test="${specTitle == 'Stem_Cell_Marker'}">
	 		Stem Cell Marker Antibodies
	 	</c:if>
	 	<c:if test="${pagePath != 'indexFeatured' && specTitle != 'Flow_Cytometry' && specTitle != 'Stem_Cell_Marker'}">
	 	     ${category.name}
	 	</c:if>
	 
	 &nbsp;(<c:out value="${size}"></c:out>&nbsp;Products)</div>
	 <c:if test="${not empty category.legend}">
	    <div class="leg"><span style="color: #A5A5A7;">>> </span><span class="hand" onmouseout="hideLegend()" onmouseover="showLegend()">LEGEND</span></div>
     </c:if>
  </div>
 
  <c:if test="${not empty products}">
  	<c:if test="${1 eq countryLevel}">
  		<c:set var="nameWidth" value="290px;"/>
  		<c:set var="priceWidth" value="width:62px; padding-left: 4px; padding-right: 4px;"/>
  		<c:set var="cartWidth" value="width:88px;text-align:right; padding-right: 5px; padding-left:0px;"/>
  	</c:if>
	<c:if test="${2 eq countryLevel}">
		<c:set var="nameWidth" value="310px;"/>
		<c:set var="priceWidth" value="width:62px; padding-left: 4px; padding-right: 4px;"/>
  		<c:set var="cartWidth" value="width:1px;text-align:right; padding-right: 1px; padding-left:0px;"/>
	</c:if>
	<c:if test="${3 eq countryLevel}">
		<c:set var="nameWidth" value="360px;"/>
		<c:set var="priceWidth" value="width:1px; padding-left: 1px; padding-right: 1px;"/>
  		<c:set var="cartWidth" value="width:1px;text-align:right; padding-right: 1px; padding-left:0px;"/>
	</c:if>
    <div></div>
		<table id="productList" class="tableList" cellpadding="0" cellspacing="0">
		       <c:if test="${targetView == 'antibodies'}">
		           <fst:table 
			       	param="catalog,title,application,reactivity,citationCount,feedbacksCount,price,Add to Cart" 
			       	objectList="${products}" 
			       	headerStyle="
			       	style='width: 68px;text-align:left;padding-left:5px;' class='tableColumn',
			       	style='width: ${nameWidth}' class='tableColumn',
			       	style='width: 50px;' class='tableColumn',
			       	style='width: 45px;' class='tableColumn',
			       	style='width: 45px;' class='tableColumn',
			       	style='width: 60px;' class='tableColumn',
			       	style='${priceWidth }' class='tableColumn',
			       	style='${cartWidth } ' class='tableColumn'" 
			       	columnStyle="style='text-align:left;padding-left:5px;',,style='table-layout: fixed;width: 120px;',,,,style='text-align: left;padding-left: 4px; padding-right: 4px;',style='text-align: center;'"/>
			   </c:if>
		       <c:if test="${targetView == 'cells'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 120px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'fl_cdna_clones'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		             headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 120px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		             columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'kits'}"><fst:table param="catalog,title,price,Add to Cart" objectList="${products}" catalog="kits" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px;' class='tableColumn',style='width: 180px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'over_expression_lysates'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px; padding-left: 40px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 120px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',style='padding-left: 40px;',,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'peptides'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		             headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 530px;' class='tableColumn',style='width: 100px;' class='tableColumn',style='width: 80px;' class='tableColumn',style='width: 85px;text-align: right;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		             columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'proteins'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 420px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 80px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'rnai'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 120px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'tissue_arrays'}"><fst:table param="catalog,title,layout,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 90px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 470px;' class='tableColumn',style='width: 155px;' class='tableColumn',style='width: 80px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',style='padding-right: 20px;',,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'tissue_sections'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 120px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       <c:if test="${targetView == 'cell_tissue_lysates'}"><fst:table param="catalog,title,size,price,Add to Cart" objectList="${products}" 
		              headerStyle="style='width: 130px;text-align:left;padding-left:5px;' class='tableColumn',style='width: 400px;' class='tableColumn',style='width: 150px;' class='tableColumn',style='width: 120px;' class='tableColumn',style='width: 85px;text-align: center;padding-right: 5px;white-space:pre;word-break: keep-all;' class='tableColumn'" 
		              columnStyle="style='text-align:left;padding-left:5px;',,,style='text-align: left;',style='text-align: center;'" />
		       </c:if>
		       
		       <tr style="background: none;"><td colspan="10" ><hr color="#BDBDBD" ></td></tr>
               <tr class="page" style="background: none;">
                  <td colspan="10">
                     <c:if test="${page.totalPages > 1}">
				     <div style="display: block;">
					 </c:if>
					 <c:if test="${page.totalPages <= 1}">
					     <div style="display: none;">
					 </c:if>
					   <c:if test="${page.totalPages > 1 && specTitle != 'Flow_Cytometry' && specTitle != 'Stem_Cell_Marker'}">
					      <fs:page action="products/category/${category.restName}" param="position=bottom&letterPrefix=${letterPrefix}"/>
					   </c:if>
					   <c:if test="${page.totalPages > 1 && specTitle == 'Flow_Cytometry'}">
					      <fs:page action="products/category/Flow_Cytometry" param="position=bottom&letterPrefix=${letterPrefix}"/>
					   </c:if>
					   <c:if test="${page.totalPages > 1 && specTitle == 'Stem_Cell_Marker'}">
					      <fs:page action="products/category/Stem_Cell_Marker" param="position=bottom&letterPrefix=${letterPrefix}"/>
					   </c:if>
                     
                    </div>
                   </td>
               </tr>
		</table>
        
      <div align="right" style="margin-right: 15px;margin-bottom: 30px;">
		   <c:forEach items="${letterIndexList}" var="letter">
			    <c:if test="${specTitle == 'Stem_Cell_Marker'}">
			 	    <a class="productListLetter" href="${pageContext.request.contextPath}/products/category/Stem_Cell_Marker?letterPrefix=${letter}">${letter}</a>
			 	</c:if>
			 	<c:if test="${specTitle == 'Flow_Cytometry'}">
		 	     	<a class="productListLetter" href="${pageContext.request.contextPath}/products/category/Flow_Cytometry?letterPrefix=${letter}">${letter}</a>
		 		</c:if>
			 	
			 	<c:if test="${specTitle != 'Stem_Cell_Marker' && specTitle != 'Flow_Cytometry'}">
			 	  <a class="productListLetter" href="${pageContext.request.contextPath}/products/category/${categoryName}?letterPrefix=${letter}">${letter}</a>
			 	</c:if>	  
		   </c:forEach>
	  </div> 
  </c:if>
</div>				
<div id = "legendDialog" style="display:none;">
    ${category.legend}
</div>
