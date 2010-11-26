<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/jqueryslidemenu.css" type="text/css" media="all" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jqueryslidemenu.js"></script>

<script type="text/javascript">
	function onMous(){
		this.style.backgroundColor='#DD7305'
	}
	
	function home(){
	   document.location.href = gPath;
	}
	function ordering(){
	   window.location.href='${pageContext.request.contextPath}/docs/offline?orderingNode=ordering';
	}
	function support(){
	   window.location.href='${pageContext.request.contextPath}/docs/support?supportNode=support';
	}
	function aboutUs(){
	   window.location.href='${pageContext.request.contextPath}/docs/company?aboutUsNode=aboutUs';
	}
	function contactUs(){
	   window.location.href='${pageContext.request.contextPath}/distributor/list';
	}
</script>

<!--[if IE 6]>
   <style>
	#m4.ie6hover{
		background-image:url(${pageContext.request.contextPath}/images/new/menu-button-click.gif);
		color:#FFFFFF;	
		background-repeat:no-repeat;    
	}
	#myslidemenu li:hover,#myslidemenu .m_li:hover{
	background-position: 0px 0px;
	color: #FFFFFF;	
    }
	</style>
<![endif]-->

<script language="javascript">
	sfHover =function() {
		var sfEls = document.getElementById("myslidemenu").getElementsByTagName("li");
		for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
		this.className+=" ie6hover";
		}
		sfEls[i].onmouseout=function() {
		this.className=this.className.replace(new RegExp(" ie6hover\\b"), "");
		}
		}
	}
	if (window.attachEvent) window.attachEvent("onload", sfHover);
</script>

<div class="menuLeft"></div>
<div class="menuContre">

<div id="myslidemenu" class="jqueryslidemenu">
<ul>
    <!--   You can use the assembly button if the menu content too long.
    <div class="menuButton">
	    <div class="menuButtonLeft"></div>
	    <div class="menuButtonRight"></div>
    </div>
    -->
<li id="m1" class="m_li hand" onclick="contactUs()" ><fmt:message key="menu.contact.us"/></li>

<li id="m4" class="m_li hand" onclick="aboutUs()" ><fmt:message key="menu.about.us"/>
	<ul> 
		<li><a class="a categoryTitle" href="${pageContext.request.contextPath}/docs/company?aboutUsNode=company" ><fmt:message key="menu.company.profile"/></a></li>
		<li><a class="a categoryTitle" href="${pageContext.request.contextPath}/docs/company_bus_dev" ><fmt:message key="menu.business.development"/></a></li>
		<li><a class="a categoryTitle" href="${pageContext.request.contextPath}/docs/company_jobs" ><fmt:message key="menu.job.abgent"/></a></li>
		<%-- 
		<li><a class="a categoryTitle" href="${pageContext.request.contextPath}/news/list"  ><fmt:message key="menu.news"/></a></li>
		--%>
	</ul>
</li>


<li id="m3" class="m_li hand" onclick="support()" ><fmt:message key="menu.support"/>
	<ul>
		<li><a  class="a categoryTitle" href="${pageContext.request.contextPath}/docs/literature"><fmt:message key="menu.literature"/></a></li>
		<li><a  class="a categoryTitle" href="${pageContext.request.contextPath}/citation/list"><fmt:message key="menu.citations"/></a></li>
		<%-- 
		<li><a  class="a categoryTitle" href="${pageContext.request.contextPath}/meeting/list"><fmt:message key="menu.events"/></a></li>
		--%>
		<li><a  class="a categoryTitle" href="${pageContext.request.contextPath}/docs/support"><fmt:message key="menu.technical.support"/></a></li>
		<li><a  class="a categoryTitle" href="${pageContext.request.contextPath}/docs/Useful_Links"><fmt:message key="menu.Useful.link"/></a></li>
		<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/products/productReview"><fmt:message key="product.review"/></a></li>
	</ul>
</li>

<li id="m2" class="m_li hand" onclick="ordering()"><fmt:message key="menu.ordering"/>
	<ul>
			<c:if test="${1 eq countryLevel}">
				<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/order/online"><fmt:message key="menu.order.online"/></a></li>
			</c:if>
			<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/docs/offline?orderingNode=offline"><fmt:message key="menu.order.offline"/></a></li>
			<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/docs/international"><fmt:message key="menu.international"/></a></li>
			<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/docs/terms"><fmt:message key="menu.terms.and.conditions"/></a></li>
			<c:if test="${1 eq countryLevel}">
				<!--<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/order/list/1"><fmt:message key="menu.order.list"/></a></li>
				<li><a   class="a categoryTitle" href="${pageContext.request.contextPath}/order/list/2"><fmt:message key="menu.enquiry.list"/></a></li>-->
		    </c:if>
	</ul>
</li>

<li id="m5" class="m_li hand" onclick="home()" ><fmt:message key="menu.home"/></li>

</ul>
</div>
</div>
<div class="menuRight"></div>
<!--  
<img src="${pageContext.request.contextPath}/images/new/menu-image.gif" align="bottom" class="menuImage">
-->