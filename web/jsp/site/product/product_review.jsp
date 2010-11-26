<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.foundersoftware.com/founder/tags" prefix="fs"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui/jquery-ui-1.8.custom.css" />


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/ui/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/site/product/product.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
			document.title="Abgent - Product Review";
			if (jQuery('#feedbackStatus').val() == 'success') {
	 			jQuery("#reviewmsg").html("Review Submitted. A technical representative will review your submission and contact you shortly. Thank you.");
	 		} else if (jQuery('#feedbackStatus').val() == 'failed') {
	 			jQuery("#reviewmsg").html("feedback submit failed!");
	 		}
	});
	
</script>

<style>
<!--
.tableList td {
border-bottom:0px solid #BCBCBC;
line-height:13px;
padding:10px 0 10px 4px;
}
#review {
	margin-top: -8px;
}
-->
</style>
<!--[if lt IE 7]>
	<style>
	#review {
		margin-top: 0px;
	}
	#productDiv {
		margin-top: -30px;
	}
	</style>
<![endif]-->
	<div class="trace">
 	    <a href="${pageContext.request.contextPath}/"><fmt:message key="navigator.home" /></a> > 
 	    <a href="${pageContext.request.contextPath}/docs/offline"><fmt:message key="navigator.ordering"/></a> > 
 	    <fmt:message key="product.review"/>	
    </div>
<div class="productDisplay" style="margin-bottom: 50px;padding:50px 0px 0px 5px;">
	<div id="productDiv">
			<div id="review">
				<div style="border-bottom:  #cfcfcf 1px solid; width: 100%; padding-bottom: 10px;color: #221815;">
					<div style=" font-size: 15px; font-weight: bold; margin-bottom: 15px; height:15px;"><fmt:message key="product.review"/></div>
					<div style=" font-size: 10px;">Abgent wishes to reward its customers that provide product reviews.&nbsp;If you provide a review you will receive a free sample size of 20ug of any antibody starting with catalog # AM/AP.&nbsp;If you submit a review with positive data,&nbsp;you will receive a full vial of 100ug of any antibody starting with catalog # AM/AP.</div>
				</div>
				<div id="reviewPost">
				<c:if test="${messageFrom == 'top'}">
					<DIV id="reviewmsg" class="message_fixed_height">
					</DIV>
				</c:if>
				<form action="${pageContext.request.contextPath}/products/feedback" id="reviewForm"  method="post" enctype="multipart/form-data" >
				
					<input type="hidden" name="email" value="${currentUser.email}">
					<input type="hidden" name="firstName" value="${currentUser.firstName}">
					<input type="hidden" name="lastName" value="${currentUser.lastName}">
					<input type="hidden" name="userId" value="${currentUser.id}">
					<input type="hidden" name="productId" value="${product.id}">
					<input type="hidden" id="feedbackStatus" name="feedbackStatus" value="${feedbackStatus}">
					<table>
						<tr>
							<td colspan="3">
							<%--<div class="message" id="reviewmsg"></div>
							<br/> --%>
							<font style=" font-size: 12px; font-weight: bold;color: #221815;"><fmt:message key="feedback.submit.now"/></font>
							</td>
						</tr>	
						<tr>
							<th><fmt:message key="feedback.order.number"/>:</th>
							<td><input type="text" name="orderNo" id="orderNo" <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.orderNo }" </c:if> /></td>
							<td></td>
						</tr>
						<tr>
							<th ><fmt:message key="feedback.catalog.no"/>:</th>
							<td style="width: 500px;"><input type="text" name="catalogNo" id="catalogNo" <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.catalogNo }" </c:if> /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="catalogNoError">
							<c:if test="${messageFrom == 'catalog'}">
								<jsp:include page="../../../commons/message_inner.jsp"></jsp:include>
							</c:if>
							</span></td>
							<td ></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.product.name"/>:</th>
							<td><input type="text" name="productName" id="productName" <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.productName }" </c:if>  /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="productNameError"></span></td>
							<td></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.applications"/>:</th>
							<td><input type="text" name="applications" id="applications"  <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.applications }" </c:if> /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="applicationsError"></span></td>
							<td ></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.species.tested"/>:</th>
							<td><input type="text" name="speciesTested" id="speciesTested"   <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.speciesTested }" </c:if> /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="speciesTestedError"></span></td>
							<td></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.samples.tested"/>:</th>
							<td><input type="text" name="samplesTested" id="samplesTested" <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.samplesTested }" </c:if> /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="samplesTestedError"></span></td>
							<td ></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.antibody.dilution"/>:</th>
							<td><input type="text" name="antibodyDilution" id="antibodyDilution" <c:if test="${feedbackStatus eq 'failed' }"> value="${feedbackReview.antibodyDilution }" </c:if> /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="antibodyDilutionError"></span></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3"><a onclick="showReviewUploadArea()" class="hand" style="color: #1B3E8C;font-size: 10px;"><u><fmt:message key="feedback.upload.app.data"/></u></a></td>
						</tr>
						<tr class="uploadHidden">
							<td colspan="3"><input type="file" name="attachment" id="attachment" style="width: 400px;" size="50px;"/><%--<input style="width: 60px;" type="button" value="Upload" onclick="uploadApplicationsData()">--%></td>
						</tr>
						<tr>
							<td><font style="font-weight: bold"><fmt:message key="feedback.protocol"/>:&nbsp;<font color="red">*</font></td>
							<td  colspan="2" class="show_info" id="feedbackProtocolError"></td>
						</tr>
						<tr>
							<td colspan="3">
								<textarea id="feedbackProtocol" class="priviewtextarea" name="protocol"><c:if test="${feedbackStatus eq 'failed' }"> ${feedbackReview.protocol }</c:if></textarea>
							</td>
						</tr>
						<tr>
							<td><font style="font-weight: bold"><fmt:message key="feedback.comments"/>:&nbsp;<font color="red">*</font></td>
							<td  colspan="2" class="show_info" id="feedbackCommentsError"></td>
						</tr>
						<tr>
							<td colspan="3">
								<textarea id="feedbackComments" class="priviewtextarea" name="comments" ><c:if test="${feedbackStatus eq 'failed' }">${feedbackReview.comments }</c:if></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left;">
								<input type="button" id="feedback" class="submit_btn" value=<fmt:message key="feedback.submit" /> onclick="submitReview()" style="font-weight: lighter;color: #FFF;" />&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
				</div>
				<c:if test="${not empty feedbacks}">
				<div style="color:#2B478D;margin-top: 10px; margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;${size} Reviews</div>
				<div id="reviewList">
					<table cellpadding="0" cellspacing="0" style="margin-right:10px;margin-left:0px;" cellpadding="0" class="tableList">
						<tr class="evenTR">
							<th class="tableColumn" style="width:100px;">
								<fmt:message key="feedback.catalog.no"/>
							</th>
							<th class="tableColumn" style="width:200px;">
								<fmt:message key="feedback.product.name"/>
							</th>
							<th class="tableColumn" style="width:100px;">
								<fmt:message key="feedback.applications"/>
							</th>
							<th class="tableColumn" style="width:100px;">
								<fmt:message key="feedback.species.tested"/>
							</th>
							<th class="tableColumn" style="width:100px;">
								<fmt:message key="feedback.samples.tested"/>
							</th>
							<th class="tableColumn" style="width:100px;">
								<fmt:message key="feedback.data.flg"/>
							</th>
						</tr>
						<c:forEach items="${feedbacks}" var="fd">
							<tr>
								<td>${fd.catalogNo}&nbsp;</td>
								<td>${fd.productName}&nbsp;</td>
								<td>${fd.applications}&nbsp;</td>
								<td>${fd.speciesTested}&nbsp;</td>
								<td>${fd.samplesTested}&nbsp;</td>
								<td>
									<c:if test="${not empty fd.abgentImage && not empty fd.userImage}">
										<a target="_blank" href="${pageContext.request.contextPath}${fd.abgentImage}"><img class="review" src="${pageContext.request.contextPath}${fd.miniImageName}" /></a>
									</c:if>
									<c:if test="${empty fd.abgentImage && not empty fd.userImage}">
										<a target="_blank"  href="${pageContext.request.contextPath}${fd.userImage}"><img class="review" src="${pageContext.request.contextPath}${fd.miniUserImageName}"  /></a>
									</c:if>
									<c:if test="${not empty fd.abgentImage && empty fd.userImage}">
										<a target="_blank"  href="${pageContext.request.contextPath}${fd.abgentImage}"><img class="review" src="${pageContext.request.contextPath}${fd.miniImageName}" /></a>
									</c:if>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="6" valign="top" style="text-align:left;background-color: #F8F8F8;border-bottom: #cfcfcf 1px solid;">${fd.comments}&nbsp;</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				</c:if>	
			</div>
			<div>
			   <input type="hidden" id="msdsPath" value="${msds}">
			</div>
	</div>
</div>