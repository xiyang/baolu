<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />


	<table style="width:800px;">
		<tr>
			<td style="text-align:center;">
			<br><br>
			<form action="${pageContext.request.contextPath}/searches/keyword" method="post" id="searchProduct" >
				
				<table>
					<tr><td>Search:</td><td>
					<select name="searchType" id="searchType" >
						<option value="">---Choose field---</option>
						<option value="name" <c:if test="${searchType eq 'name'}"> selected="selected" </c:if> selected="selected" >Product Name or Cat #</option>
						<option></option>
						<option value="">--Product Type--</option>
						<c:forEach items="${recommendCategories}" var="category" >
							<option value="${category.id}" <c:if test="${searchType eq category.id}"> selected="selected" </c:if> >${category.name}</option>
						</c:forEach>
						<option></option>
						<option value="">--Applications--</option>
						<option value="westernblot" <c:if test="${searchType eq 'westernblot'}"> selected="selected" </c:if> >Western blotting</option>
						<option value="immuno" <c:if test="${searchType eq 'immuno'}"> selected="selected" </c:if> >Immunoprecipitation</option>
						<option value="ihc" <c:if test="${searchType eq 'ihc'}"> selected="selected" </c:if>>Immunohistochemistry</option>
						<option value="flowcytometry" <c:if test="${searchType eq 'flowcytometry'}"> selected="selected" </c:if> >Flow Cytometry</option>
					</select>	
					
					</td><td style="width:50px;">For:</td><td><input type="text" name="words" id="qwords" value="${words}" /></td>
					<td>
						<img src="${pageContext.request.contextPath}/images/go.gif" alt="GO" class="hand" onclick="searchProduct()"/>
					</td></tr>
				</table>
				
			</form>
			
			</td>
		</tr>
	</table>





<div id="searchDiv">
	
</div>