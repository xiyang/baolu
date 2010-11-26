
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.foundersoftware.com/founder/tags" prefix="fs"%>

<script type="text/javascript">
	jQuery(document).ready(function() {
		document.title="Abgent - Worldwide News";
	});
</script>
<!--[if lt IE 7]>
	<style>
	.imgIE6{width:738px;}
	</style>
<![endif]-->

<div>
	<div><img src="${pageContext.request.contextPath}/images/news-title.png" width="741px;" class="imgIE6"/></div>
	<jsp:include page="../../../commons/navigator.jsp" flush="true">
		<jsp:param name="subnav" value="news.list" />
	</jsp:include>
</div>

<div id="tabel" style="margin-top:25px;" class="tabel">
<c:if test="${not empty newsList}">
	<table class="newsList">
	     <c:forEach items="${newsList}" var="news" >
	         <tr>
	         	<td class="date"><fmt:formatDate value="${news.addTime}" pattern="yyyy-MM-dd" /></td>
	            <td style="border-bottom:1px solid #939393;border-bottom-style:dotted; height:40px; font-size:12px;width:619px;text-align:left; padding-left:10px;"><a href="${pageContext.request.contextPath}/news/detail/${news.id}" class="hand underLine">${news.title}</a></td>
	         </tr>          
	     </c:forEach>
	     <tr class="page">
			<td colspan="2">
				<fs:page action="news/list"/>
			</td>
		</tr>
	</table>
	</c:if>
</div>

