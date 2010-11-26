<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!--[if IE]>
<style>
.imgBorder{
  width:150px;
  height:150px;
  line-height:150px;
  border: 1px solid;
  display: table-cell; 
  vertical-align: middle
  overflow:hidden;
  position:relative;
}
.imgBorder img{
  vertical-align: middle;
  text-align:center;
  margin-top:expression(((parentElement.offsetHeight-this.offsetHeight)/2)-0.5)
}

</style>
<![endif]-->
<!--[if IE 7]>
<style>
#detail .borderBottomForEmpty {
height:20px;
}
#detail .noBorderBottomForEmpty {
height:20px;
}
</style>
<![endif]-->
<style type="text/css">
.imgBorder{
	height:150px;
	width:150px;
	text-align:center;
	vertical-align:middle;
	line-height:150px;
	border:1px solid #ccc;
	display:table-cell
}
.imgBorder img {
  vertical-align: middle;
}
</style>
<jsp:include page="country_cart.jsp"></jsp:include>
	<table class="firstFourLine" cellspacing="0">
		<tr class="transverseLine">
			<td width="100px;"><span class="elementTitle">Catalog #</span></td>
			<td width="100px;"><span class="elementTitle">Applications:</span></td>
			<td width="100px;"><span class="elementTitle">Reactivity:</span></td>
			<td width="40px;"><span class="elementTitle">Accessions:</span></td>
		</tr>
		<tr>
			<td class="categoryTd" width="100px;">${product.catalog}</td>
			<td class="categoryTd" width="100px;">${fn:replace(product.application,',,',', ')}</td>
			<td class="categoryTd" width="100px;">${product.reactivity}</td>
			<td class="categoryTd" width="130px;">
			    <jsp:include page="/jsp/site/product/product_accession.jsp"></jsp:include> 
			</td>
		</tr>
		
	    <tr class="transverseLine">			   
			<td><span class="elementTitle">Concentration:</span></td>
			<td><span class="elementTitle">Size:</span></td>
			<td><span class="elementTitle">Isotype:</span></td>
			<td><span class="elementTitle">Clone Name:</span></td>
		</tr>
	    <tr>
			<td class="categoryTd">	${product.concentration}</td>
			<td class="categoryTd">${product.size}</td>
			<td class="categoryTd">${product.isotype}</td>
			<td class="categoryTd">${product.cloneName}</td>
		</tr>			    
    </table>
<div class="detailPad">
<table id="product" >
	<tr>
		<td>
		    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
	             <tr class="transverseLine">
			       <td style="width: 35%;">
						<span class="elementTitle">Application Data:</span>
					</td>
					<td>
						<span class="elementTitle">Calculated MW: ${product.calculatedMw}</span>
					</td>
			    </tr>
				<c:if test="${not empty product.experimentData}">${product.experimentData}</c:if>
				<c:if test="${empty product.experimentData}"><tr><td class="categoryTd borderBottomForEmpty"></td><td class="categoryTd borderBottomForEmpty"></td></tr></c:if>
				<c:if test="${not empty product.citations}">
			    <tr>
					<td colspan="2">
						<span class="elementTitle">Product Citations:</span>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="borderBottomForEmpty">
					    <jsp:include page="../product_citation.jsp"></jsp:include>
					</td>
				</tr>
				</c:if>
				
				<tr class="transverseLine">			    
					<td style="border:0px;">
						<span class="elementTitle">Gene ID:</span>
					</td>
					<td style="border:0px;">
						<span class="elementTitle">Gene Symbol:</span>
					</td>
					<!--<td>
						<span class="elementTitle">Synonyms:</span>
					</td>
					<td>
						<span class="elementTitle"> </span>
					</td> -->
				</tr>
				
				<tr>			    
					<td class="categoryTd">
					   <c:forEach items="${GeneID}" var="key">
						 <a href="http://www.ncbi.nlm.nih.gov/gene/${key}" target="_blank">${key}</a>
                       </c:forEach>
					</td>
					<td class="categoryTd">
						${product.geneSymbol}
					</td>
					<!--<td class="categoryTd">
						${product.geneSynonyms}
					</td>
                    <td class="categoryTd"></td>-->
				</tr>
				
				<tr class="transverseLine">
					<td colspan="2">
						<span class="elementTitle">Other Names:</span>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="categoryTd">${product.geneSynonyms}</td>
				</tr>
				
			    <tr class="transverseLine">
					<td colspan="2">
						<span class="elementTitle">Target/Specificity:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="2" class="categoryTd noBorderBottomForEmpty">
						${product.description}
					</td>
				</tr>
				
				 <tr class="transverseLine">
					<td colspan="2">
						<span class="elementTitle">Application Notes:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="2" class="categoryTd">
						${applicationNotes}
					</td>
				</tr>
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>