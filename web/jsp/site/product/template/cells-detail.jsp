<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="country_cart.jsp"></jsp:include>
<table class="firstFourLine" cellspacing="0">
	<tr class="transverseLine">
		<td><span class="elementTitle">Catalog #</span></td>
		<td><span class="elementTitle">Size:</span></td>
		<td><span class="elementTitle">Species:</span></td>
		<td><span class="elementTitle">Source:</span></td>
		<td><span class="elementTitle">Growth Properties:</span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.catalog}</td>
		<td class="categoryTd">${product.size}</td>
		<td class="categoryTd">${product.species}</td>
		<td class="categoryTd">${product.source}</td>
		<td class="categoryTd">${product.growthProperties}</td>
	</tr>
	
	<tr class="transverseLine">			    
		<td colspan="5"><span class="elementTitle">Propagation:</span></td>
	</tr>
	<tr>			    
		<td colspan="5" class="categoryTd">${product.description}<!-- medium --></td>
	</tr>
</table>
<div class="detailPad">
<table id="product" >
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
				
				<!-- 
				<c:if test="${not empty product.experimentData}">
				    <tr class="transverseLine">
						<td colspan="4">
							<span class="elementTitle">Morphology:</span>
						</td>
					</tr>
					${product.experimentData}
				</c:if>
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