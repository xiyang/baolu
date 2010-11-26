<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
   jQuery(document).ready(function(){
        var valueArray = eval(${legendPictures});
        if(valueArray == null){return;}
        
        var html = "<table>";
        jQuery.each(valueArray.valueList, function(i, n){
            html += "<tr>";
            for(var j=0; j <n.length;j++){
               if(n[j] == '-'){
	               html += "<td></td>";
	               continue;
               }
               if(i == 0 || j==0){
                  html += "<td>"+n[j]+"</td>";
                }else{
                  html += "<td><img src='${pageContext.request.contextPath}/images/legend/"+n[j]+"'></td>";
                }
            }
            html += "</tr>";
		});
		html += "</table>";
		jQuery("#legendPictures").html(html);
    });
</script> 

<div align="left" class="elementTitle">Microarray Panel Display</div>
<div id="legendPictures"></div>
</div>
<div align="left">
<span class="elementTitle">Legent:Adr - Adrenal gland</span><p>
 <img src="${pageContext.request.contextPath}/images/legend/benign_small.png">- Benign tumor,    
 <img src="${pageContext.request.contextPath}/images/legend/hyperplasia_small.png">- Hyperplasia,   
 <img src="${pageContext.request.contextPath}/images/legend/malignant_small.png">- Malignant tumor,   
 <img src="${pageContext.request.contextPath}/images/legend/nat_small.png">- NAT,  
 <img src="${pageContext.request.contextPath}/images/legend/normal_small.png">- Normal tissue
 </div>
 <div align="left">
 <span class="elementTitle">Specification Sheet</span>

<table id="legendInfoList" cellspacing="0">
  <thead>
	<tr class="firstTr">
		<th style="width: 40px">
			<a href="#" onclick="sortTable(this, 0);return false;">Pos
			<span class="sortarrow">&nbsp;&nbsp;</span></a>
		</th>
		<th style="width: 40px">
		    <a href="#"onclick="sortTable(this, 1);return false;">No.
		    <span class="sortarrow"></span></a>
		</th>
		<th style="width: 40px">
			<a href="#" onclick="sortTable(this, 2);return false;">Sex
		    <span class="sortarrow"></span></a>
		</th>
		<th style="width: 20px">
			<a href="#" onclick="sortTable(this, 3);return false;">Age
		    <span class="sortarrow"></span></a>
		</th>
		<th style="width: 100px">
			<a href="#" onclick="sortTable(this, 4);return false;">Organ
		    <span class="sortarrow"></span></a>
		</th>
		<th style="width: 230px">
		    <a href="#" onclick="sortTable(this, 5);return false;">Pathology diagnosis
		    <span class="sortarrow"></span></a>
		</th>
		<th style="width: 80px">
		    <a href="#" onclick="sortTable(this, 6);return false;">Type
		    <span class="sortarrow"></span></a>
		</th>
	</tr>
	</thead>
	<c:forEach var="legendInfo" items="${legendInfoList}" varStatus="count">
	   <c:if test="${count.index%2 == 0}">
		<tr class = "TrSingle">
		</c:if>
		<c:if test="${count.index%2 != 0}">
		<tr class = "TrDouble">
		</c:if>
	  <td>${legendInfo.pos}</td>
	  <td>${legendInfo.num}</td>
	  <td>${legendInfo.sex}</td>
	  <td>${legendInfo.age}</td>
	  <td>${legendInfo.organ}</td>
	  <td>${legendInfo.pathologyDiagnosis}</td>
	  <td>${legendInfo.type}</td>
	  </tr>
	 </c:forEach>
</table>
</div>
<div>