<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="trace">
 	    <a href="${pageContext.request.contextPath}/"><fmt:message key="menu.home"/></a> > 
 	   	<fmt:message key="menu.sitemap"/>
 </div>
<table width="90%" border="0" cellspacing="0" cellpadding="0" align="left" id="sitemap-link-table">
	<tr><td colspan="3"></td></tr>
	<tr><td colspan="3" align="left" valign="top" style="font-size:15px; padding-left:15px;"><fmt:message key="title.sitemap"/></td></tr>
	<tr valign="top">
		<td width="70%" align="left" valign="top">
		<ul>
			<li>
			   <img src="${pageContext.request.contextPath}/images/arrb.gif">
			   &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/" title="<fmt:message key="menu.home"/>" class="first-level-link"><strong><fmt:message key="menu.home"/></strong></a>
			</li>
			<li class="sitemap-link-padding"><img src="${pageContext.request.contextPath}/images/arrb.gif">
				   &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/docs/offline?orderingNode=ordering" title="<fmt:message key="sitemap.ordering"/>" class="first-level-link"><strong><fmt:message key="sitemap.ordering"/></strong></a>
		     </li>
			<ul class="sitemap-link-padding">
				<li> 					
				   <a href="${pageContext.request.contextPath}/order/online" title="<fmt:message key="sitemap.ordering.orderonline"/>" class="second-level-link"><fmt:message key="sitemap.ordering.orderonline"/></a></li>
				<li>
				    <a href="${pageContext.request.contextPath}/docs/offline" title="<fmt:message key="sitemap.ordering.orderoffline"/>"  class="second-level-link" ><fmt:message key="sitemap.ordering.orderoffline"/></a></li>
				<li>
				    <a href="${pageContext.request.contextPath}/distributor/list" title="<fmt:message key="sitemap.ordering.international"/>"  class="second-level-link" ><fmt:message key="sitemap.ordering.international"/></a></li>
				<li>
				     <a href="${pageContext.request.contextPath}/docs/terms" title="<fmt:message key="sitemap.ordering.termsandconditions"/>"  class="second-level-link" ><fmt:message key="sitemap.ordering.termsandconditions"/></a></li>
				<li>
				     <a href="${pageContext.request.contextPath}/order/list/1" title="<fmt:message key="sitemap.ordering.orderlist"/>"  class="second-level-link" ><fmt:message key="sitemap.ordering.orderlist"/></a></li>
				<li>
				     <a href="${pageContext.request.contextPath}/order/customizeList" title="<fmt:message key="sitemap.ordering.productreview"/>"  class="second-level-link" ><fmt:message key="sitemap.ordering.productreview"/></a></li>
			</ul>
			<li class="sitemap-link-padding"><img src="${pageContext.request.contextPath}/images/arrb.gif">
				   &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/docs/support?supportNode=support" title="<fmt:message key="sitemap.support"/>" class="first-level-link"><strong><fmt:message key="sitemap.support"/></strong></a></li>
			<ul class="sitemap-link-padding">
				<li>
				   <a href="${pageContext.request.contextPath}/docs/literature" title="<fmt:message key="sitemap.support.literature"/>"  class="second-level-link" ><fmt:message key="sitemap.support.literature"/></a></li>
				<li>
				   <a href="${pageContext.request.contextPath}/citation/list" title="<fmt:message key="sitemap.support.citations"/>"  class="second-level-link" ><fmt:message key="sitemap.support.citations"/></a></li>
				<li>
				   <a href="${pageContext.request.contextPath}/docs/support" title="<fmt:message key="sitemap.support.technicalsupport"/>"  class="second-level-link" ><fmt:message key="sitemap.support.technicalsupport"/></a></li>
				<li>
				   <a href="${pageContext.request.contextPath}/docs/userLink" title="<fmt:message key="sitemap.support.usefullink"/>"  class="second-level-link" ><fmt:message key="sitemap.support.usefullink"/></a></li>
			</ul>
			<li class="sitemap-link-padding"><img src="${pageContext.request.contextPath}/images/arrb.gif">
				   &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/docs/company" class="first-level-link" title="<fmt:message key="sitemap.aboutus"/>"><strong><fmt:message key="sitemap.aboutus"/></strong></a></li>
			<ul  class="sitemap-link-padding">
				<li>
				    <a href="${pageContext.request.contextPath}/docs/company" title="<fmt:message key="sitemap.aboutus.companyprofile"/>"  class="second-level-link" ><fmt:message key="sitemap.aboutus.companyprofile"/></a></li>
				<li>
				    <a href="${pageContext.request.contextPath}/docs/company_bus_dev" title="<fmt:message key="sitemap.aboutus.businessdevelopment"/>"  class="second-level-link" ><fmt:message key="sitemap.aboutus.businessdevelopment"/></a></li>
				<li>
				    <a href="${pageContext.request.contextPath}/docs/company_jobs" title="<fmt:message key="sitemap.aboutus.jobatabgent"/>"  class="second-level-link" ><fmt:message key="sitemap.aboutus.jobatabgent"/></a></li>
			</ul>			
			<li class="sitemap-link-padding"><img src="${pageContext.request.contextPath}/images/arrb.gif">
				   &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/distributor/list" class="first-level-link" title="<fmt:message key="sitemap.contactus"/>"><strong><fmt:message key="sitemap.contactus"/></strong></a></li>
			
		</ul>
		</td>
	</tr>
</table>


