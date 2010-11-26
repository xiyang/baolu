<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="msg" uri="http://www.founder.com/jsp/jstl/message"%>

<%--
<c:set var="success" value="${msg:success()}"/>  
<c:set var="error" value="${msg:error()}"/>  
<c:if test="${ not empty success}">
	<div class="success-box">${success}</div>
</c:if>
<c:if test="${ not empty error}">
	<div class="warning-box">${error}</div>
</c:if>
--%>
<%-- 
<c:set var="success" value="${msg:success()}"/>  
<c:set var="error" value="${msg:error()}"/>
--%>  
<c:if test="${ not empty success}">
	<div class="message">${success}</div>
    <c:remove var="success" scope="session" />
</c:if>
<c:if test="${ not empty error}">
	<div class="message">${error}</div>
	<c:remove var="error" scope="session" />
</c:if>