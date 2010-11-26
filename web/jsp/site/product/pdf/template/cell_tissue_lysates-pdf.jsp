<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="firstFourLine" cellspacing="0" cellpadding="0" style="width: 100%;">
	<tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Size:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Concentration:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
		<td class="cellTd">${product.size}</td>
		<td class="cellTd">${product.concentration}</td>
	</tr>
	
	<tr>			    
		<td colspan="3" class="cellTd categoryTd"><span class="elementTitle">Species:</span></td>
	</tr>
	<tr>			    
		<td colspan="3" class="cellTd">${product.species}</td>
	</tr>
</table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void" style="width: 100%;">
				
				 <tr>
					<td class="cellTd categoryTd">
						<span class="elementTitle">Application Notes:</span>
					</td>
				</tr>
			    <tr>
					<td class="cellTd">
						${applicationNotes}
					</td>
				</tr>
				 <jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>