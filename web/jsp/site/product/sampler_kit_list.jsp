<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<script type="text/javascript">
     jQuery(document).ready(function() {
     	document.title="Abgent - Antibody Sampler Kits";
			jQuery("#samplerTable tr:even").addClass("evenTR");
	});

</script>

<!--[if lte IE 7]>
	<style>
	#desTxt li{
	   
    }

	</style>
<![endif]-->

<html>
  <head>
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sampler_kits.css" type="text/css" />
  </head>
  
  <body>
  	<div class="trace navigator"   style="margin-bottom: 10px;">
	 	<a href="${pageContext.request.contextPath}/">Home</a> > Antibody Sampler Kits
	</div>
  	<div id="samplerKitsDiv">
  		<div>
  			<span class="caption">Antibody Sampler Kits</span>
  			<div id="desTxt">
	  			Adding Value to Your Research with Sample Sizes<p />
	
				Sampler kits offer an affordable way to purchase multiple validated antibodies from Abgent’s comprehensive antibody product lines.&nbsp;Assemble a collection of antibodies to your pathway of interest,&nbsp;or economically screen for the antibody that is perfect for your application.
	            <div class="samplerKit">
	            <ul>
					<li>Three Easy Steps To Get Your Antibody Sampler Kit:</li>
					<li>&nbsp;1.&nbsp;Select the type of antibody sampler kit you wish to purchase using the list of sampler kits provided below.</li>
					<li>&nbsp;2.&nbsp;Search and/or choose your antibodies from Abgent’s comprehensive collection.  Please note that the sampler kits are available only for antibodies whose catalog# starts with AM/AP.<i><span style="color: #133A95;">&nbsp;You will receive 20ug of each antibody selected for $60 per sample.&nbsp;A minimum of 5 antibodies is required</span></i>.</li>
					<li>&nbsp;3.&nbsp;Use our online ordering system, call <span style="font-weight: bolder;">1-888-735-7227</span>,&nbsp;or fax <span style="font-weight: bolder;">1-858-622-0609</span> to place your order.</li>
	           </ul>
	            </div>
				<div style="padding: 10px 0px 30px 0px;">Orders must be placed prior to 1 p.m. PST on Monday through Thursday for next-day delivery. </div>
  			</div>
			                                    
  		</div>
  		<div id="samplerTable">
  		     <div style="color: #0B3895;padding-bottom: 3px;padding-left: 5px; font-weight: bold;">TRY IT TODAY!</div>
  			<table style="width: 99%;" cellpadding="0" cellspacing="0">
  				<tr>
  					<td colspan="2" class="tableHead" ><span class="tableTitle">Sampler Kits</span></td>
  				</tr>
  				<c:forEach items="${products}" var="product">
  					<c:if test="${fn:startsWith(product.catalog, 'AS') == true}">
	  				<tr>
	  					<td style="width: 200px;padding-left: 10px;"><a href="${pageContext.request.contextPath}/products/samplerKit/${product.catalog}_${product.title}"><span>${product.catalog}</span></a></td>
	  					<td><a href="${pageContext.request.contextPath}/products/samplerKit/${product.catalog}_${product.title}"><span>${product.title}</span></a></td>
	  				</tr>
  					</c:if>
  				</c:forEach>
  			</table>
  		</div>
  	</div>
  </body>
</html>
