<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" type="text/css" media="screen" charset="utf-8" />
-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menumatic/MenuMatic.css" type="text/css" media="screen" charset="utf-8" />
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/menumatic/mootools.js"></script>
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/menumatic/MenuMatic_0.68.3.js" ></script>
<!-- 
 -->
<!-- Create a MenuMatic Instance -->
<script type="text/javascript">
		jQuery(document).ready(function() {
			var myMenu = new MenuMatic({ orientation:'vertical' });	
		});
		
		function themeRDiv() {
			document.location.href = path + "/service/services";
		}
		
		function themeLDiv() {
			window.location.href = path + "/products/home";
		}
		
		function operate(id, oper) {
					var content = jQuery("#"+id).children("span").text();
					jQuery("#operateCategory").val(content);
					jQuery("#operateForm").attr("action", path + "/cro/project/toCustomize/" + oper);
					jQuery("#operateForm").submit();
		}
		
		function viewStatus(oper) {
			window.status = path + "/cro/project/toCustomize/" + oper;
			return true;
		}
</script>

<!--[if lt IE 7]>
	<style>
	#nav li a{padding-left: 8px;padding-top:5px;height:21px;text-align:left;}
	#nav li{width:170px; height:20px;}
	#nav .firstlink ,#nav .secondLink { margin-top:-5px;margin-bottom:0px;height:21px;}
	#nav .secondLink a{
		height:21px;
		margin-bottom:0px;
    }
	</style>
<![endif]-->

<!--[if IE 7]>
	<style>
	#nav .IE7second{
	margin-top:30px;
	margin-bottom:-30px;	
	}
	#nav .IE7{	
	margin-top:30px;
	margin-bottom:-32px;		
    }
	</style>
<![endif]-->
<!--[if IE 6]>
	<style>
	#subMenusContainer .smOW{ 
	    margin-left:-20px;
	}
	</style>
<![endif]-->

	<div class="leftboxBackground">
	    <div class="leftboxBackgroundHead"></div>
	    <div class="leftboxBackgroundCentre"></div>
		<div class="leftboxBackgroundFooter"></div>
    </div> 

<div class="leftbox" style="margin-top: -616px;">   
    
   <div class="title"><div class="hand" onclick="themeLDiv()">Products</div></div>
   <div class="content">
      <ul id="nav" >
      		<c:forEach items="${parentCategories}"  var="parentCategory" >
      			<c:if test="${parentCategory.status != 'N'}">
					<c:if test="${parentCategory.name == 'Antibodies'}">
						<li class="firstlink">
							<a href="${pageContext.request.contextPath}/products/category/Antibodies">
								${parentCategory.name}
							</a>
						</li>
					</c:if>
				
					<c:if test="${parentCategory.name == 'Cell/Tissues/Lysates'}">
						<li class="firstlink">
							<a href="${pageContext.request.contextPath}/products/category/Cells?group=cells">
								${parentCategory.name}&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/new/arrow-gray.png"/>
							</a>
							<ul>								
	      						<c:forEach items="${falseParentCategories}" var="falseParentCategories">
	      							<li class="bottomDotted"><a href="${pageContext.request.contextPath}/products/category/${falseParentCategories.restName}?group=none">${falseParentCategories.name} </a></li>
	      						</c:forEach>
	       					</ul>
						</li>
					 </c:if>
				
					<c:if test="${parentCategory.name != 'Antibodies' and parentCategory.name != 'Cell/Tissues/Lysates'}">
						<li class="firstlink">
	       					<a  href="${pageContext.request.contextPath}/products/category/${parentCategory.restName}" >
								${parentCategory.name}
							</a>
						</li>
					</c:if>
      			</c:if>
      			<c:if test="${not empty parentCategory.childCategoryList}">
      				<c:forEach items="${parentCategory.childCategoryList}" var="childCategory">
      					<c:if test="${childCategory.status != 'N'}">	       					    
		       				<li class="secondLink"><a href="${pageContext.request.contextPath}/products/category/${childCategory.restName}">${childCategory.name}<c:if test="${not empty childCategory.childCategoryList}">&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/new/arrow-gray.png"/></c:if></a>
		       				<c:if test="${empty childCategory.childCategoryList}"> </li> </c:if>
		       				<c:if test="${not empty childCategory.childCategoryList}">
		       					<ul>
		       						<c:forEach items="${childCategory.childCategoryList}" var="grandChildCategory" varStatus="loopStatus">
		       							<c:if test="${grandChildCategory.status != 'N'}">
		       								<li class="thirdLink"><a href="${pageContext.request.contextPath}/products/category/${grandChildCategory.restName}" <c:if test="${loopStatus.count != fn:length(parentCategory.childCategories)}"> class="bottomDotted" </c:if> >${grandChildCategory.name} </a></li>
		       							</c:if>
		       						</c:forEach>
		       					</ul>
		       					</li>
		       				</c:if>
       				    </c:if>
      				</c:forEach>
      			</c:if>
      		</c:forEach>
      	
		 <div class="croTitle hand"><div onclick="themeRDiv()">Services</div></div>
		 
		  <li class="firstlink IE7"><a href="${pageContext.request.contextPath}/docs/service/basic_biology_services">Basic Biology Services</a>
		       <li class="secondLink IE7second"><a href="${pageContext.request.contextPath}/docs/service/custom_peptide_synthesis_services" >Peptide synthesis</a></li>
		       <li class="secondLink IE7second"><a href="${pageContext.request.contextPath}/docs/service/custom_protein_expression_services" >Protein Expression</a></li>
		       <li class="secondLink IE7second"><a href="${pageContext.request.contextPath}/docs/service/custom_antibody_services" >Custom Antibody</a></li>
		       <li class="secondLink IE7second"><a href="${pageContext.request.contextPath}/docs/service/ihc_services" >Immunohistochemistry </a></li>
		       <li class="secondLink IE7second"><a href="${pageContext.request.contextPath}/docs/service/cell_line_development" >Cell Line Development</a></li>
		  </li>
		 
		 <li class="firstlink IE7" style="height: 30px; line-height:15px;padding-top:5px;"><a href="${pageContext.request.contextPath}/docs/service/therapeutic_antibody_development">
		 Therapeutic Antibody <br/>Development &nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/new/arrow-gray.png"/></a>
		     <ul>  
		       <li class="bottomDotted" ><a href="${pageContext.request.contextPath}/docs/service/multidimensional_epitope_mapping" >Multidimensional Epitope Mapping </a></li>
		       <%--
		       <li class="bottomDotted" ><a href="${pageContext.request.contextPath}/docs/service/antigen_expression_and_purification" >Antigen Expression and Purification</a></li>
		       --%>
		       <li class="bottomDotted" ><a href="${pageContext.request.contextPath}/docs/service/recombinant_monoclonal_rabbits" >Recombinant Monoclonal-Rabbits</a></li>
		       <li class="bottomDotted" ><a href="${pageContext.request.contextPath}/docs/service/antibody_expression_and_purification" >Antibody Expression and Purification</a></li>
		       <li class="bottomDotted" ><a href="${pageContext.request.contextPath}/docs/service/production_under_glp_and_gmp" >Production under GLP and GMP</a></li>
		     </ul>
		  </li>
		  <%-- 
		      <c:forEach items="${serviceParentCategories}"  var="serviceParentCategories" >		
		      
		       <c:if test="${'Technology Advantages' ne serviceParentCategories.title}">      
			      <li class="firstlink IE7" <c:if test="${fn:contains(serviceParentCategories.resTitle,'<br/>')}"> style="height: 30px; line-height:15px; " </c:if> >
						<a href="/abgent/${serviceParentCategories.link}" >
							${serviceParentCategories.title}<c:if test="${not empty serviceParentCategories.childCategoryList and serviceParentCategories.title != 'Basic Biology Services'}">&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/new/arrow-gray.png"/></c:if>
						</a>
				  <c:if test="${empty serviceParentCategories.childCategoryList}"> </li> </c:if>				  
					  <c:if test="${not empty serviceParentCategories.childCategoryList}">
					         <c:if test="${serviceParentCategories.title == 'Basic Biology Services'}">
						         <c:forEach items="${serviceParentCategories.childCategoryList}" var="serviceChildCategoryList">
									<li  class="secondLink IE7second"><a href="${pageContext.request.contextPath}/${serviceChildCategoryList.link}" >${serviceChildCategoryList.title} </a></li>
									</li>
								</c:forEach>
					         </c:if>		     
						     <c:if test="${serviceParentCategories.title != 'Basic Biology Services' }">
			   					<ul>
			   						<c:forEach items="${serviceParentCategories.childCategoryList}" var="serviceChildCategoryList">
			   							<li  class="bottomDotted"><a href="${pageContext.request.contextPath}/${serviceChildCategoryList.link}" >${serviceChildCategoryList.title} </a></li>
			   						</c:forEach>
			   					</ul>
			   				    </li>
			   				  </c:if>
		   			    </c:if>
	   			    </c:if>
		       </c:forEach>
		       --%>
		</ul>
    </div>
</div>

<form id="operateForm" method="post">
	<input type="hidden" name="operateCategory" id="operateCategory"/>
</form>