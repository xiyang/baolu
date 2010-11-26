<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="toolbar">

	<c:if test="${empty user}">
			<span>
			<img src="${pageContext.request.contextPath}/images/login.png"/>
			</span>
			<a href="${pageContext.request.contextPath}/user/toLogin"><fmt:message key="user.login"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	<c:if test="${not empty user}">
		<font style="font-size: 9px;"><fmt:message key="welcome" />&nbsp;${user.firstName}!&nbsp;</font>
		<a href="${pageContext.request.contextPath}/user/logout"><fmt:message key="logout"/></a>
		&nbsp;
		<a href="${pageContext.request.contextPath}/user/toUpdateAccountInfo"><fmt:message key="update.account.info"/></a>
		<c:if test="${user.type != 'WEBSITE' && not empty user.type}">
			&nbsp;<a href="${pageContext.request.contextPath}/admin/product/list"><fmt:message key="user.manager"></fmt:message> </a>
		</c:if>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	<c:if test="${1 eq countryLevel}">
		<span>
		<img src="${pageContext.request.contextPath}/css/images/F_Chart.gif"/>
		</span>
		<a href="${pageContext.request.contextPath}/order/cart"><fmt:message key="shopping.cart"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
		<span>
		<img src="${pageContext.request.contextPath}/css/images/F_Falg.gif"/>
		</span>
		<a href="http://www.abgent.com.cn/custom_project_tracking" target="_blank"><fmt:message key="custom.project.tracking"/></a>
</div>
