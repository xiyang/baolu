<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%
String path = request.getContextPath();
%>
<head>
 	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/admin/news/manage_news.js"></script>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/date_input.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/jquery.date_input.js"></script>
	<script type="text/javascript">
      $.extend(DateInput.DEFAULT_OPTS, {
		  	stringToDate: function(string) {
		    var matches;
		    if (matches = string.match(/^(\d{4,4})-(\d{2,2})-(\d{2,2})$/)) {
		      return new Date(matches[1], matches[2] - 1, matches[3]);
		    } else {
		      return null;
		    };
	  },
	  dateToString: function(date) {
		    var month = (date.getMonth() + 1).toString();
		    var dom = date.getDate().toString();
		    if (month.length == 1) month = "0" + month;
		    if (dom.length == 1) dom = "0" + dom;
		    return date.getFullYear() + "-" + month + "-" + dom;
		  }
	});
      $($.date_input.initialize);  
    </script>
</head>
<form action="${pageContext.request.contextPath}/admin/news/addOrModify">
	<div class="centerbox">
		<div class="title">
			<a href="${pageContext.request.contextPath}/admin/news/list"><span class="home"><fmt:message key="news.list"/>/</span></a>
			<span class="contact"><fmt:message key="news.edit"/></span>
		</div>
		<span id="validationtNewsMsg" style="color: red;"></span>
		<table class="formtable">
			<input type="hidden" id="newsId" name="id" value="${news.id}"/>
			<tr>
				<th><fmt:message key="news.title"/></th>
				<td><input type="text" id="title" value= "${news.title}" name="title" onblur="checkTitle(this.value)"></td>
			</tr>
			<tr>
				<th><fmt:message key="news.author"/></th>
				<td><input type="text" id="author" value= "${news.author}" name="author" onblur="checkTitle(this.value)"></td>
			</tr>
			<tr>
				<th><fmt:message key="news.date"/></th>
				<td><input type="text" class="date_input" name="addDate" value= "${news.addTime}" onblur="checkDate(this.value)"/> 
				</td>
			</tr>
			<tr>
				<th><fmt:message key="news.language"/></th>
				<td>
					<select name="countryNames" multiple="multiple" style="height: 100px;">
						<c:forEach items="${languages}" var="language">
							<c:if test="${not empty news}">
								<option value="${fn:join(language.value, ',')}"
									<c:forEach items="${news.areas}" var="oneArea">
										<c:if test="${fn:contains(fn:join(language.value, ','), oneArea.countryName)}"> selected = "selected"</c:if>
									</c:forEach>>
									${language.key }&nbsp;&nbsp;(${fn:join(language.value, ',')})
								</option>
							</c:if>
							<c:if test="${empty news}">
								<option value="${fn:join(language.value, ',')}"> ${language.key }&nbsp;&nbsp;(${fn:join(language.value, ',')}) </option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<td>
			</tr>
			<tr>
				<th><fmt:message key="news.content"/></th>
				<td colspan="2" align="left">
				<FCK:editor instanceName="content" width="550px" height="500px"  value="${news.content}">
				</FCK:editor>
				</td>
			</tr>
			<tr>
				<th class="center" colspan="2">
					<input type="submit" id="save" value=<fmt:message key="save"/>>
					<input type="button" id="cancel" value=<fmt:message key="cancel"/> onclick="buildNewsList();">
				</th>
			</tr>
		</table>
	</div>
</form>
