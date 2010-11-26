<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	jQuery(document).ready(function() {
		document.title="Abgent - " + "${news.title}";
	});
</script>
<div class="trace">
	 	<a href="${pageContext.request.contextPath}/">Home</a> >
	 	<a href="${pageContext.request.contextPath}/news/list}">News</a> 	
</div>
<div id="list">
	<div class="titleNews">
		<div class="newsTile">${news.title}</div><br/>
		<div class="newsDate"><fmt:formatDate value="${news.addTime}" pattern="yyyy-MM-dd HH:mm" /></div>
	</div>
	<div class="contentNews">
		${news.content}
	</div>
	<div class="author">
		[<fmt:message key="news.author"></fmt:message>：${news.author}]
	</div>
</div>
