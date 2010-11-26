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
<tiles:useAttribute id="author" name="author"/>
<tiles:useAttribute id="robots" name="robots"/>
<tiles:useAttribute id="copyright" name="copyright"/>
<tiles:useAttribute id="description1" name="description1"/>
<tiles:useAttribute id="keywords" name="keywords"/>
<tiles:useAttribute id="verify" name="verify"/>

<title>${title}</title>
<meta content="all" name="${robots}" />
<meta name="author" content="${author}" />
<meta name="robots" content="${robots}" />
<meta name="Copyright" content="<fmt:message key="${copyright}"/>" />
<meta name="description" content="${description1}"/>
<meta name="keywords" content="${keywords}"/>
<meta http-equiv="Cache-Control" CONTENT="private,must-revalidate" />

<link rel="icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" /> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />

<script type="text/javascript">
	var gPath = "<%=com.lsxyz.baolu.core.common.Constants.HOME_URL%>";
</script>
<tiles:useAttribute id="maincss" name="maincss"/>
<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}${maincss}" type="text/css" media="all" />
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.4.2.min.js"></script>
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/plugin/jquery.l10n.pack.js" ></script>
<script language="JavaScript" type="text/javascript"src="${pageContext.request.contextPath}/js/common/common.js"></script>

</head>
<body>
	
 	<div id="container">
        <div id="header">
            <tiles:insertAttribute name="header" />
        </div>
        
        <div id="menu">
           <tiles:insertAttribute name="toolbar" />
        </div>
        
        <div id="left">
            <tiles:insertAttribute name="left" />
        </div>
        
        <div id="main">
          <tiles:insertAttribute name="content" />          
        </div> 
        
        <div id="footer">
          <tiles:insertAttribute name="footer" />
        </div>

    </div>

</body>
</html>
