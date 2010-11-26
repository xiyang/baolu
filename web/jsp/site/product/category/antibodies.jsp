<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />

 <div class="remmends">
    <table class="producttable">
		<c:forEach items="${recommendCategories}" var="category" varStatus="status">
			<c:if test="${(status.count - 1) % 3 == 0}">
				<tr>
			</c:if>
			<th style="width: 70px;" valign="bottom">
				<a href="${pageContext.request.contextPath}/products/category/${category.name}">
					<img style="width: 45px;height: 49px;" src="${pageContext.request.contextPath}<c:if test="${category.logo eq null || category.logo eq ''}">/images/product/no_picture.jpg</c:if>${category.logo}" alt="${category.name}" />
				</<a>
			</th>
			<td style="width: 155px;">
				<a style="color: #F6AF3B;" title="${category.name}" href="${pageContext.request.contextPath}/products/category/${category.name}">${category.name}</a>
				<ul>
					<c:forEach items="${category.recommendProducts}" var="product" varStatus="productStatus">
						<c:if test="${productStatus.index < 3}">
							<li><a href="${pageContext.request.contextPath}/products/catalog/${product.catalog}_${product.title}">${product.title}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<c:if test="${status.count % 3 == 0}">
				</tr>
			</c:if>
		</c:forEach>
	</table>     
 </div>
 <table class="antibodyBottom">
     <tr>
         <td style="width: 200px; text-align: left;">
             <div class="box">
                 <div class="title">Product spotlight</div>
                 <div class="content">
                     <ul>
                         <li><a>Flow Cytometry Antibodies</a></li>
                         <li><a>Stem Cell Marker Antibodies</a></li>
                         <li><a>Biotin Single Shot Antibody Labeling Ki</a></li>
                     </ul>
                 </div>
             </div>
             <div class="box">
                 <div class="title">New Release</div>
                 <div class="content">
                     <ul>
                         <li><a>Flow Cytometry Antibodies</a></li>
                         <li><a>Stem Cell Marker Antibodies</a></li>
                         <li><a>Biotin Single Shot Antibody Labeling Ki</a></li>
                     </ul>
                 </div>
             </div>
         </td>
         <td style="width: 254px;">
             <div class="boxm">
                 <div class="title">Phospho</div>
                 <div class="content">
                     Specific LC3 Antibody Detect Autophagy Marker Phosphorylation!<br />
                     <img src="${pageContext.request.contextPath}/images/AutoDOT.gif" alt="AutoDOT"><br />
                     <a href="#" class="list">Click</a> for more information
                 </div>
             </div>
         </td>
         <td>
             <div class="boxr">
                 <div class="title">AutoDOT</div>
                 <div class="content">
                     The Autophagy Visualization Solution<br />
                     Superior to monodansyl cadaverine staining<br />
                     <img src="${pageContext.request.contextPath}/images/Phospho-LC3.gif" alt="Phospho-LC3"><br />
                     <a href="#" class="list">Click</a> for more information
                 </div>
             </div>
         </td>
     </tr>
 </table>
</div>