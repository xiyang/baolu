<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table cellspacing="0" style="width: 100%;">
	<tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Species:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Source:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Growth Properties:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
		<td class="cellTd">${product.size}</td>
		<td class="cellTd">${product.species}</td>
		<td class="cellTd">${product.source}</td>
		<td class="cellTd">${product.growthProperties}</td>
	</tr>
	
	<tr>			    
		<td colspan="5" class="cellTd categoryTd"><span class="elementTitle">Propagation:</span></td>
	</tr>
	<tr>			    
		<td colspan="5" class="cellTd">${product.description}</td>
	</tr>
</table>
<div class="detailPad">
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