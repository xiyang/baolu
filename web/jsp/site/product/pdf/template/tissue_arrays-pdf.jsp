<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Catalog #</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Layout:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Cores:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Core Diameter:</span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.catalog}</td>
		<td class="cellTd">${product.layout}</td>
		<td class="cellTd">${product.cores}</td>
		<td class="cellTd">${product.coreDiameter}</td>
	</tr>
					
    <tr>
		<td class="cellTd categoryTd"><span class="elementTitle">Cases:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Thickness:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle">Quality Control:</span></td>
		<td class="cellTd categoryTd"><span class="elementTitle"></span></td>
	</tr>
	<tr>
		<td class="cellTd">${product.casess}</td>
		<td class="cellTd">${product.thickness}&nbsp;um</td>
		<td class="cellTd">${product.qualityControl}</td>
		<td class="cellTd"></td>
	</tr>
</table>
<div class="detailPad">
<table id="product" cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td>
					    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void" style="width: 100%;">
				<c:if test="${not empty legendInfoList}">
			        <tr class="transverseLine">
						<td colspan="4">
						    <span class="elementTitle">Microarray Panel Display:</span>  
						</td>
					</tr>
			        <tr>
					   <td colspan="4" class="categoryTd">
				        <span>${tissueArrayLegendPictures}</span>
						<div align="left">
						<%--<span><b>Legend: </b>${legendInfo}</span>--%><p>
						 <img src="${pageContext.request.contextPath}/images/legend/glioblastoma_small.png" />- Glioblastoma,    
						 <img src="${pageContext.request.contextPath}/images/legend/adjacent_small.png" />- Adjacent,   
						 <img src="${pageContext.request.contextPath}/images/legend/tumor_small.png" />- Tumor,  
						 <img src="${pageContext.request.contextPath}/images/legend/normal_small.png" />- Normal
						 <img src="${pageContext.request.contextPath}/images/legend/non_small.png" />- Blank
						 </p></div>
					   </td>
					</tr>
				    <tr>
					  <td colspan="4">
					    <span class="elementTitle">Array Details:</span>
					  </td>
					</tr>
				    <tr>
					 <td colspan="4">
					    <table id="legendInfoList" cellspacing="0">
						  <thead>
							<tr class="firstTr">
								<th style="width: 50px;">
									<span class="tableColumn">No</span>
								</th>
								<th style="width: 50px;">
								    <span class="tableColumn">Pos</span>
								</th>
								<th style="width: 50px;">
									<span class="tableColumn">Se</span>
								</th>
								<th style="width: 20px;">
									<span class="tableColumn">Age</span>
								</th>
								<th style="width: 200px;">
									<span class="tableColumn">SD&L</span>
								</th>
								<th style="width: 280px;">
								   <span class="tableColumn">Pathological Diagnosis</span>
								</th>
								<th style="width: 70px;">
								    <span class="tableColumn">TNM</span>
								</th>
								<th style="width: 40px;">
								    <span class="tableColumn">Gr</span>
								</th>
								<th style="width: 50px;">
								   <span class="tableColumn">Type</span>
								</th>
							</tr>
							</thead>
							<c:forEach var="legendInfo" items="${legendInfoList}" varStatus="count">
							  <tr <c:if test="${count.count % 2 == 0}">class="evenTR"</c:if>>
							  <td>${legendInfo.num}</td>
							  <td>${legendInfo.pos}</td>
							  <td>${legendInfo.sex}</td>
							  <td>${legendInfo.age}</td>
							  <td>${legendInfo.specimenDescription}</td>
							  <td>${fn:replace(legendInfo.pathologyDiagnosis, '\'', 'asdfasdf')}</td>
							  <td>${legendInfo.tnm}</td>
							  <td>${legendInfo.grade}</td>
							  <td>${legendInfo.type}</td>
							  </tr>
							 </c:forEach>
						</table>
					 </td>
					</tr>
				</c:if>
				<tr >			   
					<td class="cellTd categoryTd"><span class="elementTitle">Description:</span></td>
				</tr>
				<tr>		
					<td  class="cellTd">${product.description}</td>
				</tr>
				
				 <tr>
					<td  class="cellTd categoryTd">
						<span class="elementTitle">Notes:</span>
					</td>
				</tr>
			    <tr>
					<td  class="cellTd">
					  ${applicationNotes}
					</td>
				</tr>
				<jsp:include page="product_common-detail.jsp"></jsp:include>
			</table>
		</td>
	</tr>
</table>
</div>