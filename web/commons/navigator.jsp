<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- navigater -->
	<c:set var="subnav_value"><%=request.getParameter("subnav")%></c:set>
	<div class="trace">
		<div>
			<div>
				<a href="${pageContext.request.contextPath}/"><fmt:message key="home"/></a>
				<fmt:message key="${subnav_value}"/>
			</div>
		</div>
	</div>
	<!-- navigatoer end -->