<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<tr class="transverseLine">
	<td colspan="4">
		<span class="elementTitle">Format:</span>
	</td>
</tr>
   <tr>
	<td colspan="4" class="categoryTd">
	    ${product.format}
	</td>
</tr>

   <tr class="transverseLine">
	<td colspan="4">
		<span class="elementTitle">Storage:</span>
	</td>
</tr>
   <tr>
	<td colspan="4" class="categoryTd">
		${product.storage}
	</td>
</tr>

   <tr class="transverseLine">
	<td colspan="4">
		<span class="elementTitle">Precautions:</span>
	</td>
</tr>
   <tr>
	<td colspan="4" class="categoryTd">
		${product.precautions}
	</td>
</tr>

<c:if test="${not empty relatedProductList}">

    <tr class="transverseLine">
		<td colspan="4">
			<span class="elementTitle">Related Products:</span>
		</td>
    </tr>
    <tr>
		<td colspan="4">
		   <table class="relatedProductions">
		     <c:set var="categoryName" value=""></c:set>
			 <c:forEach items="${relatedProductList}" var="relatedProduct" varStatus="count">
			    <c:if test="${relatedProduct.rootCategoryName ne categoryName}">
			        <c:if test="${not empty categoryName}"></tr></c:if>
			        <c:set var="categoryName" value="${relatedProduct.rootCategoryName}"></c:set>
			        <c:set var="i" value="1"></c:set>
			        <tr>
			    </c:if>
			    <c:if test="${i%3==0}">
			        </tr>
			    </c:if>
			    <c:if test="${i%3==0 && relatedProduct.rootCategoryName eq categoryName}">
			        <tr>
			        <c:set var="i" value="1"></c:set>
			    </c:if>
			   
       	        <td style="padding-bottom: 1px;">
       	        <c:if test="${fn:startsWith(relatedProduct.catalog,'KT') || fn:startsWith(relatedProduct.catalog,'CL')}">
       	        	<a onclick="kitsDownNow('${relatedProduct.kitsPdfPath}')" class="hand">${relatedProduct.catalog}</a>:&nbsp;
       	        </c:if>
       	        <c:if test="${fn:startsWith(relatedProduct.catalog,'KT') == 'false' && fn:startsWith(relatedProduct.catalog,'CL') == 'false'}">
       	        	<a href="${pageContext.request.contextPath}/products/catalog/${relatedProduct.catalog}_${relatedProduct.restTitle}">${relatedProduct.catalog}</a>:&nbsp;
       	        </c:if>
       	        </td> 
       	        <td style="padding-bottom: 1px;padding-right:20px; width: 300px;">
       	        	<a href="${pageContext.request.contextPath}/products/catalog/${relatedProduct.catalog}_${relatedProduct.restTitle}">${relatedProduct.title}</a>
       	        </td>
			    <c:set var="i" value="${i+1}"></c:set>
       	    </c:forEach>
       	  </table>
	    </td> 
	</tr>
</c:if>  