<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/site/product/product.js"></script>

<%
	String queryString = request.getQueryString();
	if (queryString == null) {
		queryString = "";
	} else if (queryString.indexOf("locale") != -1) {
	
		int index = queryString.indexOf("locale");
		if (index > 1) {
			queryString = queryString.substring(0, queryString.indexOf("locale") - 1);
		} else {
			queryString = "";
		}
	}
	if (!"".equals(queryString)) {
		queryString += "&";
	}	
%>

<script type="text/javascript">
	function home() {
		document.location.href = gPath;
	}
</script>
<style>
<!--
#toolbar{
	margin-right:-260px;
}
-->
</style>
	<!--[if lt IE 7]>
		<style>
			.logo{
				margin-left: 5px;
			}
		</style>
	<![endif]-->

<div class="logo hand" onclick="home()"></div>

<div id="language">
<%--
		<span>
		<img src="${pageContext.request.contextPath}/images/world.png"/>
		</span>
		<font class="world">Worldwide</font>
        &nbsp;<a href="?<%=queryString%>locale=en_US"><c:if test="${fmtLocale == 'en_US'}"><font class="afterclick">En</font></c:if><c:if test="${fmtLocale != 'en_US'}"><font class="content">En</font></c:if></a>
&nbsp;|&nbsp;<a href="#"><c:if test="${fmtLocale == 'de'}"><font class="afterclick">De</font></c:if><c:if test="${fmtLocale != 'de'}"><span class="content" style="cursor: default;">De</span></c:if></a>
		&nbsp;|&nbsp;<a href="#"><c:if test="${fmtLocale == 'es'}"><font class="afterclick">Es</font></c:if><c:if test="${fmtLocale != 'es'}"><font class="content"  style="cursor: default;">Es</font></c:if></a>
		&nbsp;|&nbsp;<a href="#"><c:if test="${fmtLocale == 'fr'}"><font class="afterclick">Fr</font></c:if><c:if test="${fmtLocale != 'fr'}"><font class="content" style="cursor: default;">Fr</font></c:if></a>
&nbsp;|&nbsp;<a href="?<%=queryString%>locale=zh_CN"><c:if test="${fmtLocale == 'zh_CN'}"><font class="afterclick">中文</font></c:if><c:if test="${fmtLocale != 'zh_CN'}"><font class="content">中文</font></c:if></a>
--%>      
</div>

<jsp:include page="/jsp/layout/common/user_info.jsp"></jsp:include>



