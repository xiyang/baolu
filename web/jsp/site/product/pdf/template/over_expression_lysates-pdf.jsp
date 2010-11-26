<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table cellspacing="0" style="width: 100%;">
	<tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td class="cellTd categoryTd" style="width: 100px;"><span class="elementTitle">Tag:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Expression cell line:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Accessions:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
		<td class="cellTd">${product.size}</td>
		<td class="cellTd">${product.tag}</td>
        <td class="cellTd">${product.expressionCellLine}</td>
        <td class="cellTd">
		   <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include>
		</td>
	</tr>			
	
    <tr>			   
		<td colspan="2" class="cellTd categoryTd"><span class="elementTitle">GeneID:</span></td>					
		<td colspan="3" class="cellTd categoryTd"><span class="elementTitle">Gene Symbol:</span></td>
		<!--<td class="cellTd categoryTd"><span class="elementTitle">Synonyms:</span></td>-->
	</tr>
	
    <tr>
        <td class="cellTd" colspan="2">
            <c:forEach items="${GeneID}" var="key">
			 <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank" class="notUnderline">${key}</a>
              </c:forEach>
        </td>
		<td class="cellTd" colspan="3">${product.geneSymbol}</td>
		<!--<td class="cellTd">${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}</td>  -->
			
	</tr>
	<tr>
		<td colspan="5" class="cellTd categoryTd">
			<span class="elementTitle">Other Names:</span>
		</td>
	</tr>
	<tr>
		<td colspan="5">${product.geneSynonyms}</td>
	</tr>
</table>
<div class="detailPad">
<table id="product" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
				
				 <tr>			   
					<td colspan="2" class="cellTd"><span class="elementTitle">Application Data:</span></td>
					<td colspan="2" class="cellTd"><span class="elementTitle">Calculated MW: ${product.calculatedMw} Da</span></td>
				</tr>
				
				<c:if test="${not empty product.experimentData}">${fn:replace(product.experimentData, '<br>', '<br />')}</c:if>
				<c:if test="${empty product.experimentData}"><tr><td colspan="2" class="categoryTd"></td><td colspan="2" class="categoryTd"></td></tr></c:if>
				
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>
