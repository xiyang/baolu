<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
<!--
#detail .transverseText td{
	border-bottom: 0px solid #BCBCBC;
	padding-bottom: 15px;
	padding-top: 15px;
	padding-right: 15px;
}
-->
</style>
<jsp:include page="country_cart.jsp"></jsp:include>
<table class="firstFourLine" cellspacing="0">
	<tr class="transverseLine">
		<td><span class="elementTitle">Catalog #</span></td>
		<td><span class="elementTitle">Size:</span></td>
		<td style="width: 70px;"><span class="elementTitle">Tag:</span></td>
		<td><span class="elementTitle">Expression cell line:</span></td>
		<td><span class="elementTitle">Accessions:</span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.catalog}</td>
		<td class="categoryTd">${product.size}</td>
		<td class="categoryTd">${product.tag}</td>
        <td class="categoryTd">${product.expressionCellLine}</td>
        <td class="categoryTd">
		   <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include>
		</td>
	</tr>			
	
    <tr class="transverseLine">			   
		<td colspan="2"><span class="elementTitle">GeneID:</span></td>					
		<td colspan="3"><span class="elementTitle">Gene Symbol:</span></td>
	</tr>
	
    <tr>
        <td class="categoryTd" colspan="2">
           <c:forEach items="${GeneID}" var="key">
		      <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank">${key}</a>
            </c:forEach>
         </td>
		<td class="categoryTd" colspan="3">${product.geneSymbol}</td>
	</tr>
</table>
<div class="detailPad">
<table id="product" cellspacing="0">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
				<tr class="transverseLine">
					<td colspan="4"><span class="elementTitle">Other Names:</span></td>
				</tr>
				<tr>
					<td colspan="4" class="categoryTd">${product.geneSynonyms}</td>
				</tr>
				 <tr class="transverseLine">			   
					<td colspan="2"><span class="elementTitle">Application Data:</span></td>
					<td colspan="2"><span class="elementTitle">Calculated MW: ${product.calculatedMw}</span></td>
				</tr>
				
				<c:if test="${not empty product.experimentData}">${product.experimentData}</c:if>
				<c:if test="${empty product.experimentData}">
				<tr>
				<td colspan="2" class="categoryTd"></td>
				<td colspan="2" class="categoryTd"></td>
				</tr>
				</c:if>
				
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
