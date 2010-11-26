<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/treeview/screen.css" />

<style type="text/css">

#adminLeft {
	font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #4f6b72;
	background: #E6EAE9;
	width: 206x;
}

#adminLeft th {
	width: 200px;
}

#adminLeft th {
	font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: white;
	font-weight: bold;
	border-bottom: 1px solid #ebebeb;
	letter-spacing: 0px;
	text-transform: uppercase;
	text-align: left;
	padding: 6px 6px 6px 12px;
	background: #F6AE3C no-repeat;
}

#adminLeft th a{
	color: white;
}

#adminLeft td {
	border-bottom: 1px solid #ebebeb;
	background: #fff;
	font-size:11px;
	padding: 6px 6px 6px 25px;
	color: #4f6b72;
}

</style>

</head>
<body>
<div id="adminLeft">
	<table id="mytable" cellspacing="0" style="width: 206px;">
		<c:if test="${user.type eq 'MANAGER' or user.type eq 'MARKETER'}">
		<tr>
			<th>Products</th>
		</tr>
		<c:if test="${user.type eq 'MANAGER'}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/admin/category/list" >Product Category</a></td>
			</tr>
		</c:if>
		<tr>
			<td><a href="${pageContext.request.contextPath}/admin/product/list" >Product List</a></td>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/admin/feedBack/list">Product Review</a></td>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/admin/product/importData">Import Product</a></td>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/admin/product/exportData">Export Product</a></td>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/export/exportUserInfo">Export UserInfo</a></td>
		</tr>
		<tr>
			<th>Orders</th>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/admin/order/list" target="_self">Order List</a></td>
		</tr>
		<tr>
			<th>Users</th>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/admin/user/listUsers">User List</a></td>
		</tr>
		<tr>
			<th><a href="${pageContext.request.contextPath}/admin/project/list">Quotation</a></th>
		</tr>
		</c:if>
		<tr>
			<th><a href="${pageContext.request.contextPath}/admin/distributor/list">Distributor</a></th>
		</tr>
		<tr>
			<th><a href="${pageContext.request.contextPath}/admin/docs/list">Docs</a></th>
		</tr>
		<tr>
			<th><a href="${pageContext.request.contextPath}/admin/citation/list">Citation</a></th>
		</tr>
	</table>
</div>
</body>



<%-- 
<div>
    <!-- <div class="leftTitle">Navigation</div> -->
   	<div id="sidetree" align="left">
	<div class="treeheader">&nbsp;</div>

	<ul id="tree">
	
		<c:if test="${user.type eq 'MANAGER' or user.type eq 'MARKETER'}">
		
			<li><strong>Products</strong>
				<ul>
					<c:if test="${user.type eq 'MANAGER'}">
						<li><a href="${pageContext.request.contextPath}/admin/category/list" >Product Category</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/admin/product/list" >Product List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/feedBack/list">Product Review</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/product/importData">Import Product</a></li>
					<%--
					<li><a href="${pageContext.request.contextPath}/admin/product/issueProduct">Release Product</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/product/addIssueProduct">Add Product</a></li>
					--%>
<%--				
				</ul>
			</li>
	    
			<li><span><strong>Orders</strong></span>
				<ul>
					<li><a href="${pageContext.request.contextPath}/admin/order/list" target="_self">Order List</a></li>
					<!-- 
					<li><a href="${pageContext.request.contextPath}/admin/order/enquiryList" target="_self">Inquire List</a></li>
				    -->
				</ul>
			</li>
		 
			<li><span><strong>Users</strong></span>
				<ul>
					<li><a href="${pageContext.request.contextPath}/admin/user/listUsers">User List</a></li>
				</ul>
			</li>
	
			<li><a href="${pageContext.request.contextPath}/admin/project/list"><span><strong>Quotation</strong></span></a></li>
			
		</c:if>
		<%--
		<li><a href="${pageContext.request.contextPath}/admin/meeting/list"><span><strong>Events</strong></span></a></li>
		
		<li ><a href="${pageContext.request.contextPath}/admin/news/list"><span><strong>News</strong></span></a></li>

		<li ><a href="${pageContext.request.contextPath}/admin/activity/list"><span><strong>Activity</strong></span></a></li>
	    --%>
<%--
		<li><a href="${pageContext.request.contextPath}/admin/distributor/list"><span><strong>Distributor</strong></span></a></li>
	
		<li><a href="${pageContext.request.contextPath}/admin/docs/list"><span><strong>Docs</strong></span></a></li>
		<%--
		<li><a href="${pageContext.request.contextPath}/admin/cro/list"><span><strong>CRO</strong></span></a></li>
		--%>
<%--
		<li><a href="${pageContext.request.contextPath}/admin/citation/list"><span><strong>Citation</strong></span></a></li>
	
	</ul>
	</div>

</div>
--%>
