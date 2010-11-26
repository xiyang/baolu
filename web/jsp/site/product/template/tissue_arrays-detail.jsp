<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="country_cart.jsp"></jsp:include>

<table class="firstFourLine" cellspacing="0">
	<tr class="transverseLine">
		<td><span class="elementTitle">Catalog #</span></td>
		<td><span class="elementTitle">Layout:</span></td>
		<td><span class="elementTitle">Cores:</span></td>
		<td><span class="elementTitle">Core Diameter:</span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.catalog}</td>
		<td class="categoryTd">${product.layout}</td>
		<td class="categoryTd">${product.cores}</td>
		<td class="categoryTd">${product.coreDiameter}&nbsp;mm</td>
	</tr>
					
    <tr class="transverseLine">
		<td><span class="elementTitle">Cases:</span></td>
		<td><span class="elementTitle">Thickness:</span></td>
		<td><span class="elementTitle">Quality Control:</span></td>
		<td><span class="elementTitle">&nbsp;</span></td>
	</tr>
	<tr>
		<td class="categoryTd">${product.casess}</td>
		<td class="categoryTd">${product.thickness}&nbsp;um</td>
		<td class="categoryTd">${product.qualityControl}</td>
		<td class="categoryTd">&nbsp;</td>
	</tr>
</table>
<div class="detailPad">
<table id="product" >
	<tr>
		<td>
					    
		    <table id="detail" cellpadding="0" cellspacing="0" rules="none" frame="void">
				
				
				<c:if test="${not empty legendInfoList}">
			        <tr class="transverseLine">
						<td colspan="4">
						    <span class="elementTitle">Microarray Panel Display:</span>  
						</td>
					</tr>
			        <tr>
					   <td colspan="4" class="categoryTd">
				        <span id="legendPictures"></span>
						<div align="left">
						<%--<span><b>Legend: </b>${legendInfo}</span>--%><p>
						 <img src="${pageContext.request.contextPath}/images/legend/glioblastoma_small.png">- Glioblastoma,    
						 <img src="${pageContext.request.contextPath}/images/legend/adjacent_small.png">- Adjacent,   
						 <img src="${pageContext.request.contextPath}/images/legend/tumor_small.png">- Tumor,  
						 <img src="${pageContext.request.contextPath}/images/legend/normal_small.png">- Normal
						 <img src="${pageContext.request.contextPath}/images/legend/non_small.png">- Blank
						 </div>
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
									<a href="#" onclick="sortTable(this, 0);return false;"><span class="tableColumn">No</span>
									<span class="sortarrow"></span></a>
								</th>
								<th style="width: 50px;">
								    <a href="#"onclick="sortTable(this, 1);return false;"><span class="tableColumn">Pos</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 50px;">
									<a href="#" onclick="sortTable(this, 2);return false;"><span class="tableColumn">Se</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 20px;">
									<a href="#" onclick="sortTable(this, 3);return false;"><span class="tableColumn">Age</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 130px;">
									<a href="#" onclick="sortTable(this, 4);return false;"><span class="tableColumn">SD&L</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 280px;">
								    <a href="#" onclick="sortTable(this, 5);return false;"><span class="tableColumn">Pathological Diagnosis</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 70px;">
								    <a href="#" onclick="sortTable(this, 5);return false;"><span class="tableColumn">TNM</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 40px;">
								    <a href="#" onclick="sortTable(this, 5);return false;"><span class="tableColumn">Gr</span>
								    <span class="sortarrow"></span></a>
								</th>
								<th style="width: 50px;">
								    <a href="#" onclick="sortTable(this, 6);return false;"><span class="tableColumn">Type</span>
								    <span class="sortarrow"></span></a>
								</th>
							</tr>
							</thead>
							<c:forEach var="legendInfo" items="${legendInfoList}" varStatus="count">
							   <c:if test="${count.index%2 == 0}">
								<tr class = "TrDouble">
								</c:if>
								<c:if test="${count.index%2 != 0}">
								<tr class = "TrSingle">
								</c:if>
							  <td>${legendInfo.num}</td>
							  <td>${legendInfo.pos}</td>
							  <td>${legendInfo.sex}</td>
							  <td>${legendInfo.age}</td>
							  <td>${legendInfo.specimenDescription}</td>
							  <td>${legendInfo.pathologyDiagnosis}</td>
							  <td>${legendInfo.tnm}</td>
							  <td>${legendInfo.grade}</td>
							  <td>${legendInfo.type}</td>
							  </tr>
							 </c:forEach>
						</table>
					 </td>
					</tr>
				</c:if>
				
				<tr class="transverseLine">			   
					<td colspan="4"><span class="elementTitle">Description:</span></td>
				</tr>
				<tr>		
					<td colspan="4" class="categoryTd">${product.description}</td>
				</tr>
				
				 <tr class="transverseLine">
					<td colspan="4">
						<span class="elementTitle">Notes:</span>
					</td>
				</tr>
			    <tr>
					<td colspan="4" class="categoryTd">
					  ${applicationNotes}
					</td>
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