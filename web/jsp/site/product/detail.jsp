<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.foundersoftware.com/founder/tags" prefix="fs"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui/jquery-ui-1.8.custom.css" />

<!--[if IE 8]>
	<style>
		.firstFourLine{
		margin-top:-7px;
		}
	</style>
<![endif]-->
<!--[if lt IE 8]>
	<style>
		.productToCard{
		   margin-top:-50px;
		}
	</style>
<![endif]-->
<!--[if lt IE 7]>
	<style>
		.productToCard{
		   margin-top:-10px;
		}
		.detailPad{
		  margin-top:220px;
		}
	</style>
<![endif]-->

<style>
<!--
.categoryTd {
color:#808082;
font-size:10px;
font-weight:bolder;
padding:10px 5px;
}
-->
</style>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/ui/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/site/product/product.js"></script>--%>
<script type="text/javascript">
	jQuery(function(){
		// Tabs
		jQuery('#tabs').tabs();
		
		if (jQuery("#userIdTemp").val() > 0) {
			jQuery("#feedbackPost").show();
		}
		
		// use for user submit feedback
 		if (jQuery('#reviewFlag').val() == 'review') {
 			jQuery('#reviewA').trigger("click");
 		}
 		
 		if (jQuery('#feedbackStatus').val() == 'success') {
 			jQuery("#reviewmsg").html("Review Submitted. A technical representative will review your submission and contact you shortly. Thank you.");
 		} else if (jQuery('#feedbackStatus').val() == 'failed') {
 			jQuery("#reviewmsg").html("feedback submit failed!");
 		}
 		
 		//
 		jQuery('.transverseText a').attr("target","_blank");
	});
	
	jQuery(document).ready(function() {
			//document.title="Abgent - " + "${product.title}";
			var addToCards = jQuery(".addToCardA");
			jQuery.each(addToCards, function(i, n){
					jQuery("#"+n.id).bind('click', function(event){
						var href = n.href;
						n.href="javascript:void(null);";
						jQuery("#"+n.id+"Span").html("Loading...");
						window.location.href=href;
						return false;
					});
			});
			
			var addToCardsReview = jQuery(".reviewaddToCardA");
			jQuery.each(addToCards, function(i, n){
					jQuery("#review"+n.id).bind('click', function(event){
						var href = n.href;
						n.href="javascript:void(null);";
						jQuery("#review"+n.id+"Span").html("Loading...");
						window.location.href=href;
						return false;
					});
			});
	});
</script>

<script type="text/javascript">
jQuery(document).ready(function(){
        var valueArray = eval(${legendPictures});
        if(valueArray == null){return;}
        
        var html = "<table>";
        jQuery.each(valueArray.valueList, function(i, n){
            html += "<tr>";
            for(var j=0; j <n.length;j++){
               if((n[j] == '-' || n[j] == '' || n[j] == undefined) && i!=0 & j!=0){
	               html += '<td><img src="${pageContext.request.contextPath}/images/legend/non.gif" /></td>';
	               continue;
               }
               if(i == 0 || j==0){
                  html += '<th align="center">'+n[j]+"</th>";
                }else{
                  //html += "<td><img src='${pageContext.request.contextPath}/images/legend/"+n[j]+".gif'></td>";
                  html += '<td><img src="${pageContext.request.contextPath}/images/legend/'+n[j].split('_')[0]+'.gif" /></td>';
                }
            }
            html += "</tr>";
		});
		html += "</table>";
		jQuery("#legendPictures").html(html);
		jQuery("#legendArray").val(html);
    });
</script> 

<div class="trace">
 	<a href="${pageContext.request.contextPath}/">Home</a> >
 	<c:if test="${not empty pathCategeryNames}">
 	    <a href="${pageContext.request.contextPath}/products/home">Products</a> > 
	 	<c:forEach items="${pathCategeryNames}"  var="pathCategeryName" varStatus="count">
	 	   <c:if test="${fn:length(pathCategeryNames) != (count.index+1)}">
	 	      <a href="${pageContext.request.contextPath}/products/category/${pathCategeryName.restName}">${pathCategeryName.name}</a> >
	 	   </c:if>
	 	    <c:if test="${fn:length(pathCategeryNames) == (count.index+1)}">
	 	       <a href="${pageContext.request.contextPath}/products/category/${categoryUrl}"> ${pathCategeryName.name}</a>
	 	    </c:if>
	 	</c:forEach>
 	</c:if>
 	> ${product.title}
 	<%-- 2010-8-19
 	<c:if test="${not empty searchUrl}">
 	   <a href="${pageContext.request.contextPath}/${searchUrl}">Search</a>
 	</c:if>
 	<c:if test="${not empty newRelease}">
 	   <a href="${pageContext.request.contextPath}/${newRelease}">NewRelease</a>
 	</c:if>
 	--%>
 	<!-- ${product.catalog}  -->
</div>

<form action="${pageContext.request.contextPath}/products/downLoad" id="download" method="post">
	<input type="hidden" name="pdftitle" id="pdftitle" value="${product.catalog}_${product.restTitle}">
	<input type="hidden" id="content" name="content" value='<jsp:include page="pdf/pdf.jsp"></jsp:include>'>
	<input type="hidden" id="legendArray" name="legendArray" value='<img src="${pageContext.request.contextPath}/images/legend/tumor.gif" />'>
</form>

<div class="productDisplay">
	 <div id="productTitle">
	 	<div class="productTitleOne"><span class="title" style="margin-right: 20px;">${product.title}</span><span style="white-space: nowrap; "><img src="${pageContext.request.contextPath}/images/download.gif" title="download pdf" style="margin-right: 5px;"/><a style="color: #6d88fa;text-decoration: underline;" href="javascript:void(0);" onclick="downLoadPDF()">DownLoad PDF</a></span></div>
	 	<div class="productTitleTwo" ><span class="subtitle">${product.subTitle}</span>
		 	<c:if test="${targetView eq 'kits' && not empty product.kitsPdfPath}">
		 	  <a style="color: #6d88fa;" href="${pageContext.request.contextPath}${product.kitsPdfPath}" target="_blank">Pdf Download</a>
		 	</c:if>
	 	</div>
	</div>
	<div id="productDiv">
	    <div id="tabs" >
			<ul style=" width: 550px;">
				<li style="border-right: 1px solid #ffffff;"><a href="#specification"><span>SPECIFICATION</span></a></li>
				<li style="border-right: 1px solid #ffffff;"><a href="#background"><span>BACKGROUND</span></a></li>
				<c:if test="${reviewStatus}">
				<li style="border-right: 1px solid #ffffff;"><a href="#review" id="reviewA"><span>REVIEW(${size})</span></a></li>
				</c:if>
				<li style="border-right: 1px solid #ffffff;"><a href="#protocols"><span>PROTOCOLS</span></a></li>
				<li id="printTab" style="border-right: 1px solid #ffffff;"><a><span onclick="printByCatalog('${product.catalog}');">PRINT</span></a></li>
				<li id="msdsTab"><a onclick="msds()" class="hand"><span>MSDS</span></a></li>
			</ul>
			
			<div id="specification">
		        <jsp:include page="./template/${targetView}-detail.jsp"></jsp:include>			
		    </div>
			<div id="background" style="padding-left:10px;">
				<table id="backgroundTable" cellpadding="0" cellspacing="0" style="width: 100%;">
					<tr>
						<td style="border-top: 1px solid #BCBCBC;padding-top:10px;"><span class="elementTitle">Background</span></td>
					</tr>
					<tr>
						<td class="categoryTd"><div id="backgroundContent">${product.background}</div></td>
					</tr>
					<tr>
						<td style="border-top: 1px solid #BCBCBC;padding-top:10px;"><span class="elementTitle">References</span></td>
					</tr>					
					<tr>
						<td class="categoryTd"><div id="backgroundContent">${references}&nbsp;</div></td>
					</tr>
				</table>
			</div>
			
			
		
			<!-- only antibody display -->
			<c:if test="${reviewStatus}">
			<div id="review"  style="padding-left:10px;padding-top:12px;">
			<jsp:include page="template/country_cart_review.jsp"></jsp:include>
				<div style="border-bottom:  #cfcfcf 1px solid; width: 550px; padding-bottom: 6px;">
					<div class="elementTitle">Product Review</div>
					<div class="categoryTd">Abgent wishes to reward its customers that provide product reviews.&nbsp;If you provide a review you will receive a free sample size of 20ug of any antibody starting with catalog # AM/AP.&nbsp;If you submit a review with positive data,&nbsp;you will receive a full vial of 100ug of any antibody starting with catalog # AM/AP.</div>
				</div>
				
				<c:if test="${not empty feedbacks}">
				<div style="margin-top: 10px; margin-bottom: 0px;color:#221815;font-size:12px;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;${size} Reviews
				
				</div><br/>
				
				<div style="margin-bottom: 20px;"><!-- <span class="title">Latest Comments</span> -->
					<c:if test="${page.totalPages > 1}">
				       <fs:page action="products/feedback/show/${product.catalog}" param="position=top&"/>
				    </c:if>
				
				</div>
				
				<div id="feedbackList">
					<table cellpadding="0" cellspacing="0" style="margin-right:10px;margin-left:0px;" cellpadding="0" class="tableList">
						<tr class="evenTR">
							<th class="tableColumn" style="width:100px;">
								<fmt:message key="feedback.reviewed.by"/>
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
							<th class="tableColumn" style="border-left: white 1px solid; width: 200px;">
								<fmt:message key="feedback.comments"/>
							</th>
						</tr>
						<c:forEach items="${feedbacks}" var="fd">
							<tr>
								<td>
									${fd.lastName}&nbsp;${fd.firstName}
								</td>
								<td>${fd.applications}&nbsp;</td>
								<td>${fd.speciesTested}&nbsp;</td>
								<td>${fd.samplesTested}&nbsp;</td>
								<td>
									<c:if test="${not empty fd.abgentImage && not empty fd.userImage}">
										<a target="_blank" href="${pageContext.request.contextPath}${fd.abgentImage}"><img class="review" src="${pageContext.request.contextPath}${fd.miniImageName}"/></a>
									</c:if>
									<c:if test="${empty fd.abgentImage && not empty fd.userImage}">
										<a target="_blank" href="${pageContext.request.contextPath}${fd.userImage}"><img class="review" src="${pageContext.request.contextPath}${fd.miniUserImageName}"/></a>
									</c:if>
									<c:if test="${not empty fd.abgentImage && empty fd.userImage}">
										<a target="_blank" href="${pageContext.request.contextPath}${fd.abgentImage}"><img class="review" src="${pageContext.request.contextPath}${fd.miniImageName}"/></a>
									</c:if>
									&nbsp;
								</td>
								<td style="background-color: #F8F8F8;">${fd.comments}&nbsp;</td>
							</tr>
						</c:forEach>
						<tr style="background: none;"><td colspan="6" style="border-bottom: none;">
							<c:if test="${page.totalPages > 1}">
						     <div style="display: block;">
							 </c:if>
							 <c:if test="${page.totalPages <= 1}">
							     <div style="display: none;">
							 </c:if>
		                     <fs:page action="products/feedback/show/${product.catalog}" param="position=bottom&"/>
		                    </div>
						
						</td></tr>
					</table>
				</div>
				</c:if>	
				<div style="padding-top: 10px;">
				<c:if test="${empty user}">
				&nbsp;&nbsp;&nbsp;&nbsp;<a class="hand" onclick="showSubmitForm('${currentUseId}','${product.catalog}', '${categoryUrl}')" ><u style="color:#2B478D;font-size:12px;font-weight:bold;">Submit a review now!</u></a>
				<br/>
				</c:if>
				<div class="message" id="reviewmsg"></div>
				<br/>
				</div>	
				<div id="feedbackPost">
				<form action="${pageContext.request.contextPath}/products/feedback" id="feedbackForm"  method="post" enctype="multipart/form-data" >
					<input type="hidden" name="email" value="${currentUser.email}">
					<input type="hidden" name="firstName" value="${currentUser.firstName}">
					<input type="hidden" name="lastName" value="${currentUser.lastName}">
					<input type="hidden" name="userId" value="${currentUser.id}">
					<input type="hidden" name="productId" value="${product.id}">
					<input type="hidden" id="reviewFlag" name="reviewFlag" value="${review}">
					<input type="hidden" id="feedbackStatus" name="feedbackStatus" value="${feedbackStatus}">
					<input type="hidden" id="userIdTemp" value="${currentUseId}">
					<input type="hidden" name="categoryName" id="categoryName" value="${categoryUrl}" />
					
					<table>
						<tr>
							<th style="font-weight: bold;"><fmt:message key="product.catalog"/>:</th>
							<td style="font-weight: bold;"><input type="hidden" name="catalogNo" id="catalogNo" value="${product.catalog}">${product.catalog}</td>
							<td class="show_info"></td>
						</tr>
						<tr>
							<th style="font-weight: bold;"><fmt:message key="product.name"/>:</th>
							<td style="font-weight: bold;"><input type="hidden" name="productName" id="productName" value="${product.title}">${product.title}</td>
							<td class="show_info"></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.order.number"/>:</th>
							<td><input type="text" name="orderNo" id="orderNo" /></td>
							<td></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.applications"/>:</th>
							<td><input type="text" name="applications" id="applications" /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="applicationsError"></span></td>
							<td ></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.species.tested"/>:</th>
							<td><input type="text" name="speciesTested" id="speciesTested" /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="speciesTestedError"></span></td>
							<td></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.samples.tested"/>:</th>
							<td><input type="text" name="samplesTested" id="samplesTested" /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="samplesTestedError"></span></td>
							<td ></td>
						</tr>
						<tr>
							<th><fmt:message key="feedback.antibody.dilution"/>:</th>
							<td><input type="text" name="antibodyDilution" id="antibodyDilution" /><font color="red">*</font>&nbsp;&nbsp;<span class="show_info" id="antibodyDilutionError"></span></td>
							<td ></td>
						</tr>
						<tr>
							<td colspan="3"><a onclick="showUploadArea()"><u class="hand" style="color:#2B478D;">Upload Your Applications Data</u></a></td>
						</tr>
						<tr class="uploadHidden">
							<td colspan="3"><input type="file" name="attachment" id="attachment" style="width: 400px;" size="50px;"/><%--<input style="width: 60px;" type="button" value="Upload" onclick="uploadApplicationsData()">--%></td>
						</tr>
						<tr>
							<td><fmt:message key="feedback.protocol"/>:&nbsp;<font color="red">*</font></td>
							<td  colspan="2" class="show_info" id="feedbackProtocolError"></td>
						</tr>
						<tr>
							<td colspan="3">
								<textarea id="feedbackProtocol" class="priviewtextarea"  name="protocol"></textarea>
							</td>
						</tr>
						<tr>
							<td><fmt:message key="feedback.comments"/>:&nbsp;<font color="red">*</font></td>
							<td  colspan="2" class="show_info" id="feedbackCommentsError"></td>
						</tr>
						<tr>
							<td colspan="3">
								<textarea id="feedbackComments" class="priviewtextarea"  name="comments"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left;">
								<input type="button" id="feedback" class="submit_btn" value=<fmt:message key="feedback.submit" /> onclick="submitFeedBack()" style="font-weight: bold;color: #FFF;" />&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
			</c:if>
			<div id="protocols" style="padding-left:10px;padding-top:12px;">
			   ${protocols}
			</div>
			<div>
			   <input type="hidden" id="msdsPath" value="${msds}">
			</div>
		</div>
	</div>
</div>

