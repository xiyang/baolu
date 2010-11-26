<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/site/common/TableHighLight.js"></script>

<div id="searchResutltDiv">
	<div class="messageDiv">${message}</div>
	<table id="searchResult">
		<tr>
			<th width="50px;">
				<span class="columnName"><fmt:message key="product.catalog" />
				</span>
			</th>
			<th width="150px;">
				<span class="columnName"><fmt:message key="product.name" />
				</span>
			</th>
			<th width="150px;">
				<span class="columnName"><fmt:message key="product.target" />
				</span>
			</th>
			<th width="100px;">
				<span class="columnName"><fmt:message
						key="product.specificity" />
				</span>
			</th>
			<th width="100px;">
				<span class="columnName"><fmt:message key="product.price" />
				</span>
			</th>
		</tr>
		<c:forEach items="${products}" var="product" varStatus="status">
			<tr onmouseover="changeto()" onmouseout="changeback()"
				<c:if test="${status.count % 2 == 0}">bgcolor="#eeeeee"</c:if>>
				<td>
					<a href="${pageContext.request.contextPath}/products/catalog/${product.catalog}_${product.title}">${product.catalog}</a>
				</td>
				<td>
					${product.title}
				</td>
				<td>
					${product.target}
				</td>
				<td>
					${product.specificity}
				</td>
				<td>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>