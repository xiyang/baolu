<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td style="width: 250px;" class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td style="width: 150px;" class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td style="width: 300px;padding-left:80px;" class="cellTd categoryTd"><span class="elementTitle">Purification:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
        <td class="cellTd">${product.size}</td>
		<td class="cellTd" style="padding-left:80px;">${product.purification}</td>
	</tr>							
	
	<tr>				    
		<td class="cellTd categoryTd"><span class="elementTitle">Gene ID:</span></td>
	    <td class="cellTd categoryTd"><span class="elementTitle">Gene Symbol:</span></td>
	    <td class="cellTd categoryTd"><span class="elementTitle">&nbsp;</span></td>
	    <!--<td class="cellTd categoryTd"><span class="elementTitle">Synonyms:</span></td>  -->
	</tr>				
	<tr>
		<td class="cellTd">
		   <c:forEach items="${GeneID}" var="key">
			  <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank" class="notUnderline">${key}</a>
           </c:forEach>
		</td>
	    <td class="cellTd">${product.geneSymbol}</td>
	    <td class="cellTd">&nbsp;</td>
		<!-- <td class="cellTd">${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}</td> -->
	</tr>
	<tr>
		<td colspan="3" class="cellTd categoryTd">
			<span class="elementTitle">Other Names:</span>
		</td>
	</tr>
	<tr>
		<td colspan="3" class="cellTd">${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}</td>
	</tr>				
</table>
<div class="detailPad categoryTd">
<table id="product" cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void" style="width: 100%;">				
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>