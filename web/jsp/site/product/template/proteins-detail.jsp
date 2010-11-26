<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="country_cart.jsp"></jsp:include>

<style>
<!--
#detail {
 width: 705px;
}
-->
</style>

<!--[if lt IE 7]>
	<style>
		#detail {
		 width: 98%;
		}
	</style>
<![endif]-->

<table class="firstFourLine" cellspacing="0">
	<tr class="transverseLine">
		<td width="100px"><span class="elementTitle">Catalog #</span></td>
		<td width="100px"><span class="elementTitle">Size:</span></td>
		<td width="100px"><span class="elementTitle">Concentration:</span></td>
		<td width="100px"><span class="elementTitle">Tag:</span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.catalog}</td>
        <td class="categoryTd">${product.size}</td>
		<td class="categoryTd">${product.concentration}</td>
		<td class="categoryTd">${product.tag}</td>
	</tr>			
	
    <tr class="transverseLine">			  
	    <td><span class="elementTitle">Gene ID:</span></td>
        <td colspan="3"><span class="elementTitle">Gene Symbol:</span></td>
	</tr>			
    <tr>
		<td class="categoryTd">
			<c:forEach items="${GeneID}" var="key">
			  <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank">${key}</a>
            </c:forEach>
		</td>
        <td colspan="3" class="categoryTd">${product.geneSymbol}</td>
	</tr>
</table>
<div class="detailPad">
<table id="product" style="width: 100%;">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">	
		    <tr class="transverseLine">
				<td colspan="4"><span class="elementTitle">Other Names:</span></td>
			</tr>
			<tr>
				<td colspan="4" class="categoryTd"><span class="categoryTd">${product.geneSynonyms}</span></td>
			</tr>					
	            <tr class="transverseLine">			   
					<td style="width:258px;" colspan="2"><span class="elementTitle">Accessions:</span></td>
					<td style="width:447px;" colspan="2"><span class="elementTitle">Calculated MW:</span></td>
					</tr>
				<tr>
				     <td class="categoryTd" colspan="2">
					     <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include>
					</td>								
					 <td colspan="2" class="categoryTd">${product.calculatedMw}</td>
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