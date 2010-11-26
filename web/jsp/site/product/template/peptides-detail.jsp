<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="country_cart.jsp"></jsp:include>

<table class="firstFourLine" cellspacing="0">
	<tr class="transverseLine">
		<td><span class="elementTitle">Catalog #</span></td>
	    <td><span class="elementTitle">Size:</span></td>
		<td><span class="elementTitle">Calculated MW:</span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.catalog}</td>
                 <td class="categoryTd">${product.size}</td>
		<td class="categoryTd">${product.calculatedMw}</td>
	</tr>
	
	<tr class="transverseLine">
		<td colspan="4"><span class="elementTitle">Sequence:</span></td>
	</tr>				
    <tr>
    	
		<td colspan="4" class="categoryTd">
		 <c:if test="${fn:startsWith(product.catalog, 'BP')}">
		     Inquire
		 </c:if>
		 <c:if test="${!fn:startsWith(product.catalog, 'BP')}">
		     ${product.sequence}
		 </c:if>
		</td>
		<%--
		<td colspan="4" class="categoryTd">Inquiry</td>
		--%>
	</tr>				
</table>
<div class="detailPad">
<table id="product" >
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">				
	            <tr class="transverseLine">				    			    
					<td colspan="4"><span class="elementTitle">Application Notes:</span></td>
				</tr>
				<tr>			  
					<td colspan="4" class="categoryTd">${applicationNotes}</td>
				</tr>
				
				<c:if test="${not empty product.citations}">
				<tr class="transverseLine">
					<td colspan="4">
						<span class="elementTitle">Product Citations:</span>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;" class="categoryTd" valign="top">
					    <jsp:include page="../product_citation.jsp"></jsp:include>
					</td>
				</tr>
				</c:if>
				
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>