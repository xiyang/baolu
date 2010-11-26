<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>abgent product</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/treeview/jquery.treeview.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/treeview/screen.css" />
	<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
		
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/treeview/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/treeview/jquery.treeview.js"></script>


<script type="text/javascript">
		$(function() {
			$("#tree").treeview({
				collapsed: true,
				animated: "medium",
				control: "#sidetreecontrol",
				persist: "location"
			});
		})
		
	</script>
  </head>
  
  <body>
    <div id="container">
    	<!-- category tree -->
    	<div id="categoryTree" align="left">
    		<ul id="tree">
    		<c:forEach items="${parentCategories}" var="parentCategory" >
    			<!-- parent category -->
				<li><a href="${pageContext.request.contextPath}/product/category/${parentCategory.id}" ><span class="parent">${parentCategory.name}</span></a>
				<c:if test="${not empty parentCategory.childCategories}">
					<ul>
					<c:forEach items="${parentCategory.childCategories}" var="childCategory" >
							<!-- child category -->
							<li><a href="${pageContext.request.contextPath}/product/category/${childCategory.id}" >${childCategory.name}</a></li>
							<!-- grandChild category -->
							<c:if test="${not empty childCategory.childCategories}">
								<ul>
									<c:forEach items="${childCategory.childCategories}" var="grandChildCategory">
										<li><a href="${pageContext.request.contextPath}/product/category/${grandChildCategory.id}" >${grandChildCategory.name}</a></li>
									</c:forEach>
								</ul>
							</c:if>
					</c:forEach>
					</ul>
				</c:if>
				</li>
			</c:forEach>
			</ul>
		</div>
		
		<!-- category -->
    	<div id="category">
    		<table width="650px;" >
    			<c:forEach items="${recommendCategories}" var="category" varStatus="status">
    				<c:if test="${(status.count - 1) % 3 == 0}">
    					<tr>
    				</c:if>
    					<td style="width: 50px;height: 50px;"><a href="${pageContext.request.contextPath}/product/category/${category.id}"><img src="${pageContext.request.contextPath}${category.logo}" alt="product picture" style="width: 50px;height: 50px;"/></<a></td>
    					<td style="width: 320px;height: 50px;">
    						<c:forEach items="${category.products}" var="product" >
    							<c:if test="${product.status eq 'RECOMMEND'}">
    								<span><a href="${pageContext.request.contextPath}/product/${product.id}">${product.title}</a></span><br />
    							</c:if>
    						</c:forEach>
    					</td>
    				<c:if test="${status.count % 3 == 0}">
    					</tr>
    				</c:if>
    			</c:forEach>
    			</tr>
    		</table>
		</div>
    </div>
  </body>
</html>
