<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/jmesa.tld" prefix="jmesa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="msg" uri="http://www.founder.com/jsp/jstl/message"%>

<head>
	<link href="${pageContext.request.contextPath}/css/jmesa.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/admin/news/manage_news.js"></script>
</head>
<div class="centerbox">
	<div class="title">
		<a href="${pageContext.request.contextPath}/"><span class="home"><fmt:message key="home"/></span></a>
		<span class="contact"><fmt:message key="news.list"/></span>
	</div>
	<jsp:include page="../../../commons/message.jsp"></jsp:include>
	<!-- div class="title"><fmt:message key="news.list"/></div> -->
	<jmesa:springTableFacade id="newsTable" items="${news}" maxRows="50"
	maxRowsIncrements="50,100,150"
	limit="${limit}" 
	toolbar="com.lsxyz.baolu.core.jmesa.AbgentAddDeleteToolBar"
	var="news" editable="true" >
	<jmesa:htmlTable width="100%" style="text-align:left;word-wrap:break-word;word-break:break-all;">
		<jmesa:htmlRow uniqueProperty="id">
			<jmesa:htmlColumn property="title" titleKey="news.title" filterable="true" editable="false" style="width:160px;">
				<div id = "title" align="left" onclick="getNewsDetailById('${news.id}','${news.title}')" style="cursor: pointer;">
					<span class="STYLE19">
						<a href="${pageContext.request.contextPath}/news/detail/${news.id}">${news.title}</a>
					</span>
				</div>	
			</jmesa:htmlColumn>
			
			<jmesa:htmlColumn property="area" titleKey="news.area" filterable="true" editable="false" style="width:160px;">
				<c:forEach items="${news.areas}" var="area">
					<c:if test="${not empty area.countryName}">
					 ${area.countryName}<br/>
					</c:if>
				</c:forEach>
			</jmesa:htmlColumn>
			
			<jmesa:htmlColumn property="addDate" titleKey="news.date" filterable="true" editable="false" style="width:160px;">
					${news.addDate}
			</jmesa:htmlColumn>
			
			<jmesa:htmlColumn property="modify" titleKey="modify" filterable="false" editable="false" sortable="false" style="width:160px;">
				<img src="${pageContext.request.contextPath}/images/modify.png" class="edite hand" onclick="getNewsById('${news.id}','${news.title}')"/>
			</jmesa:htmlColumn>

		</jmesa:htmlRow>	
	</jmesa:htmlTable>
</jmesa:springTableFacade>
</div>
