<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table cellspacing="0" cellpadding="0" style="width: 100%;">
	<tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
	    <td class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Calculated MW:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
        <td class="cellTd">${product.size}</td>
		<td class="cellTd">${product.calculatedMw}&nbsp;Da</td>
	</tr>
	
	<tr>
		<td colspan="3" class="cellTd categoryTd"><span class="elementTitle">Sequence:</span></td>
	</tr>				
    <tr>
		<td colspan="3" class="cellTd">
		 <c:if test="${fn:startsWith(product.catalog, 'BP')}">
		     Inquire
		 </c:if>
		 <c:if test="${!fn:startsWith(product.catalog, 'BP')}">
		     ${product.sequence}
		 </c:if>
		</td>
	</tr>				
</table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">				
	            <tr>				    			    
					<td colspan="4" class="cellTd categoryTd"><span class="elementTitle">Application Notes:</span></td>
				</tr>
				<tr>			  
					<td colspan="4" class="cellTd">${applicationNotes}</td>
				</tr>
				
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>