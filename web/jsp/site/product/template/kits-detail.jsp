<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="country_cart.jsp"></jsp:include>
	<table class="firstFourLine" cellspacing="0">
		<tr class="transverseLine">
			<td width="100px;"><span class="elementTitle">Catalog #</span></td>
			<td width="100px;"><span class="elementTitle">Applications:</span></td>
			<td width="100px;"><span class="elementTitle">Reactivity:</span></td>
			<td width="40px;"><span class="elementTitle">Accessions:</span></td>
		</tr>
		<tr>
			<td class="categoryTd" width="100px;">${product.catalog}</td>
			<td class="categoryTd" width="100px;">${product.application}</td>
			<td class="categoryTd" width="100px;">${product.reactivity}</td>
			<td class="categoryTd" width="130px;">
			    <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include> 
			</td>
		</tr>
		
	    <tr class="transverseLine">			   
			<td><span class="elementTitle">Concentration:</span></td>
			<td><span class="elementTitle">Size:</span></td>
			<td><span class="elementTitle">Isotype:</span></td>
			<td><span class="elementTitle">Clone Name:</span></td>
		</tr>
	    <tr>
			<td class="categoryTd">	${product.concentration}</td>
			<td class="categoryTd">${product.size}</td>
			<td class="categoryTd">${product.isotype}</td>
			<td class="categoryTd">${product.cloneName}</td>
		</tr>			    
    </table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
			    <tr class="transverseLine">
			        <td width="202px;">
						<span class="elementTitle">Application Data:</span>
					</td>
					<td colspan="4">
						<span class="elementTitle">Calculated MW: ${product.calculatedMw}</span>
					</td>
			    </tr>
				<c:if test="${not empty product.experimentData}">${product.experimentData}</c:if>
				<c:if test="${empty product.experimentData}">
				   <tr><td colspan="2" class="categoryTd"></td><td colspan="2" class="categoryTd"></td></tr>
				</c:if>
				
				<c:if test="${not empty product.citations}">
				 <tr>
					<td colspan="4">
						<span class="elementTitle">Product Citations:</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
					    <jsp:include page="../product_citation.jsp"></jsp:include>
					</td>
				</tr>
				</c:if>
				
			    <tr class="transverseLine">
					<td colspan="4">
						<span class="elementTitle">Other Names:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="categoryTd">
						${product.geneSynonyms}
					</td>
				</tr>
				 <tr class="transverseLine">
					<td colspan="4">
						<span class="elementTitle">Target/Specificity:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="categoryTd">
						${product.description}
					</td>
				</tr>
				
				 <tr class="transverseLine">
					<td colspan="4">
						<span class="elementTitle">Application Notes:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="categoryTd">
						${applicationNotes}
					</td>
				</tr>
			   <jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>