<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="country_cart.jsp"></jsp:include>

<table class="firstFourLine" cellspacing="0">
	<tr class="transverseLine">
		<td style="width: 200px;"><span class="elementTitle">Catalog #</span></td>
		<td><span class="elementTitle">Size:</span></td>
		<td><span class="elementTitle">Purification:</span></td>
		<td><span class="elementTitle"></span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.catalog}</td>
        <td class="categoryTd">${product.size}</td>
		<td class="categoryTd">${product.purification}</td>
		<td class="categoryTd"></td>
	</tr>							
	
	<tr class="transverseLine">				    
		<td><span class="elementTitle">Gene ID:</span></td>
	    <td><span class="elementTitle">Gene Symbol:</span></td>
	    <td><span class="elementTitle">&nbsp;</span></td>
		<td></td>
	</tr>				
	<tr>
		<td class="categoryTd">
		   <c:forEach items="${GeneID}" var="key">
			  <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank">${key}</a>
                    </c:forEach>
		</td>
	    <td class="categoryTd">${product.geneSymbol}</td>
		<td class="categoryTd"></td>
		<td class="categoryTd"></td>
	</tr>				
</table>
<div class="detailPad">
<table id="product" >
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">	
			    <tr class="transverseLine">
					<td colspan="4"><span class="elementTitle">Other Names:</span></td>
				</tr>
				<tr>
					<td colspan="4" class="categoryTd"><span class="categoryTd">${product.geneSynonyms}</span></td>
				</tr>								
				<!-- 
				<tr>
					<td colspan="4"><span class="elementTitle">Description:</span></td>
				</tr>
				<tr>
					<td colspan="4" class="categoryTd">${product.description}</td>
				</tr>
				 -->
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