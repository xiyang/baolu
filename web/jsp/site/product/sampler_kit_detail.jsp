<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.foundersoftware.com/founder/tags" prefix="fs"%> 
 
<script type="text/javascript">
     jQuery(document).ready(function() {
     	document.title="Abgent - " + "${caption}";
	});

</script>

<!--[if IE 6]>
	<style>
	#containerDiv .captionDiv{
	   padding-bottom: 10px;
	   height: 20px;
    }
	#containerDiv .samplerKitsProducts{
	   width: 99%;
    }
	</style>
<![endif]-->

<html>
  <head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sampler_kits.css" type="text/css" />
	
	<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/site/sampler_kits/sampler_kits.js" ></script>
  </head>
  
  <body>
   		<div class="trace navigator" style="margin-bottom: 8px;">
	 		<a href="${pageContext.request.contextPath}/">Home</a> >
	 		<a href="${pageContext.request.contextPath}/products/home">Products</a> > Kits
		</div>
	   <div id="containerDiv" style="margin-top: 0px; padding-top: 0px;">
	   		<div class="captionDiv" style="margin-top: 0px; padding-top: 0px;"><span class="caption">${caption}</span></div>
	   		<div style="min-height: 50px;">
	   			<div id="selectItemDiv">
	   				<div id="itemDivDes">Please browse the selection of antibodies below or search for the product of choice. <span id="itemDivWarn"><i>A minimum of 5 antibodies is required.</i></span></div>
	   				<table>
		   				<tr>
		   					<td><input type="text" id="item1" class="item" value="<c:if test="${not empty samplerKitsItem1}">${samplerKitsItem1}</c:if>" /></td>
                            <td><input type="text" id="item2" class="item" value="<c:if test="${not empty samplerKitsItem2}">${samplerKitsItem2}</c:if>" /></td>
                            <td><input type="text" id="item3" class="item" value="<c:if test="${not empty samplerKitsItem3}">${samplerKitsItem3}</c:if>" /></td>
                            <td><input type="text" id="item4" class="item" value="<c:if test="${not empty samplerKitsItem4}">${samplerKitsItem4}</c:if>" /></td>
                            <td><input type="text" id="item5" class="item" value="<c:if test="${not empty samplerKitsItem5}">${samplerKitsItem5}</c:if>" /></td>
		   					<td style="padding-left: 30px;">#/Ab</td>
		   					<td>
		   					<%--<input type="button" alt="<fmt:message key='sampler.kit.clear.tips' />" 
		   					title="<fmt:message key='sampler.kit.clear.tips' />" 
		   					style="width: 80px;" 
		   					value="<fmt:message key='sampler.kit.clear' />" 
		   					id="samplerKitClear" 
		   					onclick="clearSelectedSamplerKit()" /> --%>
		   					
		   					</td>
		   				</tr>
		   				<tr>
		   					<td><input type="text" id="item6" class="item" value="<c:if test="${not empty samplerKitsItem6}">${samplerKitsItem6}</c:if>" /></td>
                            <td><input type="text" id="item7" class="item" value="<c:if test="${not empty samplerKitsItem7}">${samplerKitsItem7}</c:if>" /></td>
                            <td><input type="text" id="item8" class="item" value="<c:if test="${not empty samplerKitsItem8}">${samplerKitsItem8}</c:if>" /></td>
                            <td><input type="text" id="item9" class="item" value="<c:if test="${not empty samplerKitsItem9}">${samplerKitsItem9}</c:if>" /></td>
                            <td><input type="text" id="item10" class="item" value="<c:if test="${not empty samplerKitsItem10}">${samplerKitsItem10}</c:if>" /></td>
		   					<td style="padding-left: 30px;"><input type="text" id="Ab" class="item" style="width: 35px" /></td>
		   					<td><a href="javascript:clearSelectedSamplerKit();" ><fmt:message key='sampler.kit.clear' /></a></td>
		   				</tr>
	   				</table>
	   				<span class="message" id="selectItemWarn"></span>	   				
	   				<input type="hidden" id="samplerKitCategoryName" value="${categoryName}">
	   			</div>
	   			
		   		<div class="productToCard" style="margin-top:0px; min-height: 200px">
				   <c:if test="${1 eq countryLevel}">
				   <%--<a href="${pageContext.request.contextPath}/order/add/${product.id}/1"><div class="addToCard hand"></div></a> --%>
				   	<!--<img src="${pageContext.request.contextPath}/images/addtobasket.gif" title="<fmt:message key="mycart.addtocart" />" alt="<fmt:message key="mycart.addtocart" />" class="hand" onclick="addSamplerKitToCart();" />
				   -->
				   <div class="addToCard hand" onclick="addSamplerKitToCart();" title="<fmt:message key="mycart.addtocart" />">&nbsp;</div>
				   </c:if>
				   <c:if test="${1 ne countryLevel}">
			     		<a href='${pageContext.request.contextPath}/distributor/list'><div class="hand orderButton enquiry"> <fmt:message key="navigator.enquiry" /></div></a>
				   </c:if>
				    <div class="productNational" >
					   <div class="productNationalFlag">
					   	<c:if test="${not empty defaultArea.countryLogo}">
					       <img alt="${defaultArea.countryName}" src="${pageContext.request.contextPath}${defaultArea.countryLogo}">
					    </c:if>
					   </div>
						   <select onchange="changeCountry(this)" class="productNationalSelect">
							   <c:forEach items="${countries}" var="countryOne">
							   		<option <c:if test="${defaultArea.countryCode eq countryOne.countryCode}">selected="selected"</c:if> value="${countryOne.countryCode}">${countryOne.countryName}</option>
							   </c:forEach>
						   </select>
					   </div>
					   <script type="text/javascript">
					   	function changeCountry(selectobj){
					   		window.location.href="${pageContext.request.contextPath}/products/samplerKit/${catalog}?country="+selectobj.value;
					   	}
					   </script>
				    <ul>
				        <li style="font-weight: bold; font-size: 11px;">Price:<span class="redTxt" id="totalPrice"></span></li>
				        <li>Email:<a href="mailto:sales@abgent.com"><span class="productToCardB">sales@abgent.com</span></a></li>
				        <li>Phone:<span class="productToCardB">858-622-0099</span></li>
				        <li><span class="productToCardB">888-735-7227&nbsp;</span>(US toll free)</li>
				        <li>Fax:<span class="productToCardB">858-622-0609&nbsp;</span>(US toll free)</li>
				        <li>Other countries:locate <a href="${pageContext.request.contextPath}/distributor/list"><span class="productToCardB">distributor</span></a></li>
				        <li><a href="${pageContext.request.contextPath}/products/antibodySampleSizePromotion"><span class="productToCardB" style="text-decoration: underline;">Free Antibody Sample</span></a>
				        
				        <form action="${pageContext.request.contextPath}/order/add/samplerKit" id="addToCartForm" >
		   				<input type="hidden" name="productCatalogStr" id="productCatalogStr" value="" />
		   				<input type="hidden" name="samplerKitCatalog" id="samplerKitCatalog" value="${catalog}" />
		   				<input type="hidden" name="samplerKitsTotalPrice" id="samplerKitsTotalPrice" value="" />
		   				</form>
		   				
				        </li>
				    </ul>	
				  </div>	
	   		</div>
	   		
	   		<table id="searchAreaDiv" cellspacing="0" width="99%">
	   		   <tr>
		   		   <td> 		
		   			<div class="kiteProductSearch">
					    <div class="index_title" style="font-weight: bolder;">Search</div>
						<div class="productContentSearch" style="margin-bottom: 2px;">
						    <div class="searchImage">
								<div><input type="text" id="searchText"  value="${searchValue}" onfocus="setSearchTextOnfocus()" onblur="setSearchTextOnblur()"></div>
								<input onclick="searchResults()" class="search" ></input>
						    </div>
						</div>
						<div style="float: left; font-size: 10px;">Find your antibody samples</div>
					</div>
					</td>
					<td>		
		   			<div id="searchDes">
		   				<i>Click the "Add to Kit" button to add the item to your sampler kit.  Clicking on the product link will provide you a new window to view the product details. Once you added the product to your kit, samples number and the total price will be updated automatically.</i>
		   			</div>
		   			</td>
	   		</table>
	   		
	   		<!-- search products table  -->
	   		<c:if test="${isSearch eq true}">
	   		<div>
	   			<div class="captionDiv"><span class="caption">Search Result <c:if test="${not empty searchValue}">for "${searchValue}"</c:if></span>
	   			<c:if test="${fn:length(searchProducts)!=0 && multiCategory ne true}">
	   			    <fs:page action="products/samplerKit/${catalog}" param="position=top&searchValue=${searchValue}&source=page"/>
	   			</c:if>
	   			</div>
	   			<div>
	   				<table class="samplerKitsProducts" cellpadding="0" cellspacing="0">
	   					<tr>
			   				<th style="width:100px;"><span>Catalog#</span></th>
	   						<th style="width:200px;"><span>Product Name</span></th>
	   						<th style="width:160px;"><span>Application</span></th>
	   						<th style="width:100px;"><span>Specificity</span></th>
	   						<th style="width:70px;"><span><fmt:message key="citation" /></span></th>
	   						<th style="width:70px;"><span>Reviews</span></th>
	   						<th style="width:70px;"><span>
	   						<c:if test="${1 eq countryLevel}">Add to Kit</c:if>
	   						</span></th>
	   					</tr>
	   					<c:if test="${multiCategory eq true}">
	   					  <tr>
	   					  <td colspan="10">Your sample of interest is not listed in ${fn:substringAfter(catalog,'_')}. please go to <a href="${pageContext.request.contextPath}/products/samplerKit/AS1009a_Antibody Sampler Kit?searchValue=${searchValue}&source=search">AS1009a Antibody Sampler Kit</a>.</td>
	   					  </tr>
	   					</c:if>
	   					<c:if test="${fn:length(searchProducts)==0 && multiCategory ne true}">
	   					 <tr>
	   					  <td colspan="10">No results were found in this search. please try other keywords.</td>
	   					  </tr>
	   					</c:if>
	   					<c:if test="${fn:length(searchProducts)!=0 && multiCategory ne true}">
		   					<c:forEach items="${searchProducts}" var="productOne" varStatus="status">
		   					  <tr <c:if test="${status.count % 2 == 0}">class="evenTR"</c:if>>
		   					    <td><a href="${pageContext.request.contextPath}/products/catalog/${productOne.catalog}_${productOne.restTitle}">${productOne.catalog}</a></td>
		   					    <td><a href="${pageContext.request.contextPath}/products/catalog/${productOne.catalog}_${productOne.restTitle}">${productOne.title}</a></td>
		   					    <td>${productOne.application}</td>
		   					    <td>${productOne.reactivity}</td>
		   					    <td>${productOne.citationCount}</td>
		   					    <td>${productOne.feedbacksCount}</td>
		   					    <td>
		   					     <c:if test="${1 eq countryLevel}">
		   						   <img title="Add to Kit" alt="Add to Kit" class="hand" src="${pageContext.request.contextPath}/images/<c:if test="${status.count % 2 == 0}">add_to_kit_even.gif</c:if><c:if test="${status.count % 2 != 0}">add_to_kit.gif</c:if>" onclick="addToKit('${productOne.catalog}', '${productOne.actualPrice}', '${productOne.actualUnit}')" />
		   						 </c:if>
		   						</td>
		   					  </tr>
		   					</c:forEach>
		   					<tr class="page">
			                   <td colspan="10"><fs:page action="products/samplerKit/${catalog}" param="position=bottom&searchValue=${searchValue}&source=page"/></td>
			                </tr>
			           </c:if>
	   				</table>
	   			</div>
	   		</div>
	   		</c:if>
	   		
	   		<!-- products table according to category -->
	   		<c:if test="${isSearch ne true}">
		   		<div>
		   			<div class="captionDiv">
		   			      <div style="text-align: left;margin-bottom: -15px;">
		   			      <span class="caption">${fn:replace(caption, 'Sampler Kit', 'Listing')}</span>
		   			      </div>
		   			        </div>
		   			<div>
		   				<table class="samplerKitsProducts" cellpadding="0" cellspacing="0">
		   					<tr>
		   						<th style="width:100px;"><span>Catalog#</span><br><br></th>
		   						<th style="width:200px;"><span>Product Name</span><br><br></th>
		   						<th style="width:160px;"><span>Application</span><br><br></th>
		   						<th style="width:100px;"><span>Specificity</span><br><br></th>
		   						<th style="width:70px;"><span></span><br><br></th>
		   						<th style="width:70px;"><span>Reviews</span><br><br></th>
		   						<th style="width:70px;"><span>
		   						   <c:if test="${1 eq countryLevel}">Add to Kit</c:if>
		   						</span><br><br></th>
		   					</tr>
		   					<c:forEach items="${products}" var="product" varStatus="status">
		   					<tr <c:if test="${status.count % 2 == 0}">class="evenTR"</c:if>>
		   						<td><a href="${pageContext.request.contextPath}/products/catalog/${product.catalog}_${product.restTitle}">${product.catalog}</a><br><br></td>
		   						<td><a href="${pageContext.request.contextPath}/products/catalog/${product.catalog}_${product.restTitle}">${product.title}</a><br><br></td>
		   						<td>${product.application}<br><br></td>
		   						<td>${product.reactivity}<br><br></td>
		   						<td>${product.citationCount}<br><br></td>
		   						 <td>${product.feedbacksCount}<br><br></td>
		   						<td>
		   						<c:if test="${1 eq countryLevel}">
		   						<img title="Add to Kit" alt="Add to Kit" class="hand" src="${pageContext.request.contextPath}/images/<c:if test="${status.count % 2 == 0}">add_to_kit_even.gif</c:if><c:if test="${status.count % 2 != 0}">add_to_kit.gif</c:if>" onclick="addToKit('${product.catalog}', '${product.actualPrice}', '${product.actualUnit}')" />
		   						</c:if>
		   						<br><br></td>
		   					</tr>
		   					</c:forEach>
		   					<tr>
		   						<td colspan="7" class="pageArea">on<fs:page action="products/samplerKit/${catalog}" param="source=page"/></td>
		   					</tr>
		   				</table>
		   			</div>
		   		</div>
	   		</c:if>
	   	</div>
	   </div>
	   
	   <input type="hidden" id="defaultUnit" name="defaultUnit" value="${defaultUnit}">
	   <input type="hidden" id="defaultPrice" name="defaultPrice" value="${defaultPrice}">
	   
  </body>
</html>
