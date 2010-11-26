<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table cellspacing="0" cellpadding="0" style="width: 100%;">
	<tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Vector:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Tag:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
		<td class="cellTd">${product.size}</td>
		<td class="cellTd">
		 <c:if test="${fn:startsWith(product.catalog, 'DC')}"></c:if>
		 <c:if test="${!fn:startsWith(product.catalog, 'DC')}">
		     ${product.vector}
		 </c:if>		
		</td>
		<td class="cellTd">${product.tag}</td>
	</tr>				     
	
	<tr>
	   <td class="cellTd categoryTd"><span class="elementTitle">Gene ID:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Gene Symbol:</span></td>		   
		<!--<td class="cellTd categoryTd"><span class="elementTitle">Synonyms:</span></td>-->
		<td class="cellTd categoryTd">&nbsp;</td>
		<td class="cellTd categoryTd">&nbsp;</td>
	</tr>				
    <tr>
       <td class="cellTd">
	      <c:forEach items="${GeneID}" var="key">
			 <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank" class="notUnderline">${key}</a>
          </c:forEach>
	    </td>
	    <td class="cellTd">${product.geneSymbol}</td>		   
		<!--<td class="cellTd">${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}</td>-->
		<td class="cellTd">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" class="cellTd categoryTd">
			<span class="elementTitle">Other Names:</span>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="cellTd">${fn:replace(product.geneSynonyms, '\'', 'asdfasdf')}</td>
	</tr>           
</table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void" style="width: 100%;">			
				
			    <tr>		
			        <td class="cellTd categoryTd"><span class="elementTitle">UniGene Cluster:</span></td>			
					<td class="cellTd categoryTd"><span class="elementTitle">Accessions:</span></td>
				</tr>				
			    <tr>	
			         <td class="cellTd">
					    <c:forEach items="${UniGene_Cluster}" var="key">
						  ${key}
                        </c:forEach>
					</td>			   
					<td class="cellTd">
					     <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include> 
					</td>
				</tr>   
				
				<tr>		
					<td class="cellTd categoryTd">
						<span class="elementTitle">Refseq Size:</span>
					</td>
					<td class="cellTd categoryTd">
						<span class="elementTitle">ORF Size:</span>
					</td>
				</tr>
			    <tr>
					<td class="cellTd">
						${product.refseqSize}&nbsp;bp
					</td>

					<td class="cellTd">
						${product.orfSize}&nbsp;bp
					</td>
				</tr>

				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>