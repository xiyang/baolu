<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<table cellspacing="0" style="width: 100%;">
		<tr>
			<td class="cellTd categoryTd" width="100px;"><span class="elementTitle">Catalog #</span></td>
			<td class="cellTd categoryTd" width="100px;"><span class="elementTitle">Applications:</span></td>
			<td class="cellTd categoryTd" width="100px;"><span class="elementTitle">Reactivity:</span></td>
			<td class="cellTd categoryTd" width="40px;"><span class="elementTitle">Accessions:</span></td>
		</tr>
		<tr>
			<td class="cellTd" width="100px;">${product.catalog}</td>
			<td class="cellTd" width="100px;">${product.application}</td>
			<td class="cellTd" width="100px;">${product.reactivity}</td>
			<td class="cellTd" width="130px;">
			    <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include> 
			</td>
		</tr>
		
	    <tr>			   
			<td class="cellTd categoryTd"><span class="elementTitle">Concentration:</span></td>
			<td class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
			<td class="cellTd categoryTd"><span class="elementTitle">Isotype:</span></td>
			<td class="cellTd categoryTd"><span class="elementTitle">Clone Name:</span></td>
		</tr>
	    <tr>
			<td class="cellTd">	${product.concentration}</td>
			<td class="cellTd">${product.size}</td>
			<td class="cellTd">${product.isotype}</td>
			<td class="cellTd">${product.cloneName}</td>
		</tr>			    
    </table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
			    <tr>
			        <td width="202px;" class="cellTd categoryTd">
						<span class="elementTitle">Application Data:</span>
					</td>
					<td colspan="4" class="cellTd categoryTd">
						<span class="elementTitle">Calculated MW: ${product.calculatedMw} Da</span>
					</td>
			    </tr>
				<c:if test="${not empty product.experimentData}">${fn:replace(product.experimentData, '<br>', '<br />')}</c:if>
				<c:if test="${empty product.experimentData}">
				   <tr><td colspan="2" class="cellTd categoryTd"></td><td colspan="2" class="cellTd categoryTd"></td></tr>
				</c:if>
			    <tr>
					<td colspan="4" class="cellTd categoryTd">
						<span class="elementTitle">Other Names:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="cellTd">
						${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}
					</td>
				</tr>
				 <tr>
					<td colspan="4" class="cellTd categoryTd">
						<span class="elementTitle">Target/Specificity:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="cellTd">
						${product.description}
					</td>
				</tr>
				
				 <tr>
					<td colspan="4" class="cellTd categoryTd">
						<span class="elementTitle">Application Notes:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="cellTd">
						${applicationNotes}
					</td>
				</tr>
			    <jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>