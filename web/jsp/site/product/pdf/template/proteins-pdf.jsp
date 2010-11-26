<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table cellspacing="0" cellpadding="0" style="width: 100%;" >
	<tr>
		<td  class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td  class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td  class="cellTd categoryTd"><span class="elementTitle">Concentration:</span></td>
		<td  class="cellTd categoryTd"><span class="elementTitle">Tag:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
        <td class="cellTd">${product.size}</td>
		<td class="cellTd">${product.concentration}</td>
		<td class="cellTd">${product.tag}</td>
	</tr>			
	
    <tr>			  
	    <td class="cellTd categoryTd" colspan="2"><span class="elementTitle">Gene ID:</span></td>
        <td class="cellTd categoryTd" colspan="2"><span class="elementTitle">Gene Symbol:</span></td>
        <!-- <td class="cellTd categoryTd"><span class="elementTitle">Synonyms:</span></td> -->
	</tr>			
    <tr>
		<td class="cellTd" colspan="2">
			<c:forEach items="${GeneID}" var="key">
			  <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank" class="notUnderline">${key}</a>
            </c:forEach>
		</td>
        <td class="cellTd" colspan="2">${product.geneSymbol}</td>
		<!--<td class="cellTd">${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}</td>  -->
	</tr>
	<tr>
		<td colspan="4" class="cellTd categoryTd">
			<span class="elementTitle">Other Names:</span>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="cellTd">${product.geneSynonyms}</td>
	</tr>				
</table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void" style="width: 100%;">				
	            <tr>			   
					<td colspan="2" width="45%" class="cellTd categoryTd"><span class="elementTitle">Accessions:</span></td>
					<td colspan="2" width="55%" class="cellTd categoryTd"><span class="elementTitle">Calculated MW:</span></td>
				</tr>
				<tr>
				     <td colspan="2"  class="cellTd" width="200px;">
					     <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include>
					</td>								
					 <td colspan="2"  class="cellTd">${product.calculatedMw} Da</td>
				</tr>
				
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>