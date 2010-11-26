<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/new/order.css"/>
<div class="productToCard">
   <c:if test="${1 eq countryLevel && not empty product.actualPrice && product.actualPrice ne '0'}">
     <span id="reviewaddToCardIdSpan"><a class="reviewaddToCardA" id="reviewaddToCardId" href="${pageContext.request.contextPath}/order/add/${product.id}/1"><div class="addToCard hand">&nbsp;</div></a></span>
   </c:if>
   <c:if test="${1 ne countryLevel || empty product.actualPrice || product.actualPrice eq '0'}">
     <a href='${pageContext.request.contextPath}/distributor/list'><div class="hand orderButton enquiry"> <fmt:message key="navigator.enquiry" /></div></a>
     
   </c:if>
   <div class="productNational">
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
   		window.location.href="${pageContext.request.contextPath}/products/catalog/${product.catalog}?country="+selectobj.value;
   	}
   </script>
    <ul>
    <c:if test="${1 eq countryLevel or 2 eq countryLevel}">
    	<c:if test="${(not empty product.actualPrice) and (not (product.actualPrice eq '0')) }">
	        <li style="font-weight: bold; font-size: 11px;">Price :<span class="productToCardR">
	        <%-- ${product.actualUnit} <fmt:formatNumber value="${product.actualPrice}" type="number" pattern="#,#0" />--%>
	         ${product.actualUnit} ${product.actualPrice}
	        </span></li>
        </c:if>
    </c:if>
    	<li>Availability:  <span class="productToCardB">${product.stock}</span></li>
        <li>Email:<a href="mailto:sales@abgent.com"><span class="productToCardB">sales@abgent.com</span></a></li>
        <li>Phone:<span class="productToCardB">858-622-0099</span></li>
        <li><span class="productToCardB">888-735-7227&nbsp;</span>(US toll free)</li>
        <li>Fax:<span class="productToCardB">858-622-0609</span>&nbsp;(US toll free)</li>
        <li>Other countries:locate<a href="${pageContext.request.contextPath}/distributor/list"><span class="productToCardB">distributor</span></a></li>
        <li><a href="${pageContext.request.contextPath}/products/antibodySampleSizePromotion"><span class="productToCardB" style="text-decoration: underline;">Free Antibody Sample</span></a></li>
    </ul>				     
</div>