<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<tiles:useAttribute id="title" name="title"/>
<title><fmt:message key="${title}"/></title>
<meta content="all" name="robots" />
<meta name="Copyright" content="<fmt:message key="${title}"/>" />
<meta name="description" content="<fmt:message key="${title}"/>" />
<meta content="<fmt:message key="${title}"/>" name="keywords" />
<tiles:useAttribute id="maincss" name="maincss"/>

<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}${maincss}" type="text/css" media="all" />
<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/base/ui.all.css" type="text/css" media="all" />
<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css" media="all" />
<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/new/message.css" type="text/css" media="all" />

<script language="JavaScript" type="text/javascript"src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.2.6.js"></script>
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/plugin/jquery.l10n.js" ></script>
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/plugin/jquery.l10n.pack.js" ></script>
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/ui/jquery.ui.all.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jmesa/jmesa.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jmesa/jquery.jmesa.js"></script>
<script type="text/javascript">
	var path="${pageContext.request.contextPath}";
	var gPath = "<%=com.lsxyz.baolu.core.common.Constants.HOME_URL%>";
	function getParam(key, value) {
		var s = document.location.search;
		if (!s) return value;
		s = s.substr(1);
		var re = new RegExp('(^|\&)(' + key + ')\=([^\&]*)(\&|$)', 'gi');
		var res = re.exec(s);
		return (res != null) ? decodeURIComponent(res[3]) : value;
	}

	var lang = getParam('lang', 'en');
	
	$.l10n.init({
        dir: path+'/js/languages',
        lang: lang,
        debug: false,
        before: function() {
        },
        after: function() {
        }
});
</script>

<%

java.util.Locale l = new java.util.Locale("en", "US");
java.util.Locale.setDefault(l);

%>
<c:if test="${ empty user || ( not empty user && user.type == 'WEBSITE')}">
	<script type="text/javascript">
	
	window.location.href=path+"/";
	
	</script>
</c:if>

<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}${maincss}" type="text/css" media="all" />
</head>

<body>
 	<div id="container">
        <div id="header">
            <tiles:insertAttribute name="header" />
        </div>
        <div id="leftAdmin">
            <tiles:insertAttribute name="left" />
        </div>
        <div id="main">
          <tiles:insertAttribute name="content" />
        </div>
        <div id="footer">
          <tiles:insertAttribute name="footer" />
        </div>
    </div>
    <jsp:include page="../../i18n/main_i18n.jsp"></jsp:include>
</body>
</html>
