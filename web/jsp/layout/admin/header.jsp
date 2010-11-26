<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	function home() {
		document.location.href = gPath;
	}
</script>
<div class="logo hand" onclick="home()"></div>

<div id="toolbar" class = "hand" >
	<c:if test="${not empty user}">
		<fmt:message key="welcome"/>${user.fullName}!&nbsp;<a href="${pageContext.request.contextPath}/user/logout">Logout</a>
	</c:if>
</div>
