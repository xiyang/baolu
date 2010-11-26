<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table id="citation" cellpadding="0" cellspacing="0" style="margin-bottom: -25px;">
	 <c:forEach items="${product.citations}" var="citation" varStatus="count">
	      <tr>
		      <td>
			      <c:if test="${empty citation.abstractArray}">${count.index+1}.${citation.content} </c:if>
			      <c:if test="${not empty citation.abstractArray}">
			      <a target="_blank" href="${citation.abstractArray[0]}" style="color: #3F42EF; font-weight: bold;"> ${count.index+1}.${citation.content}</a>
			      </c:if>
		      </td>
          </tr> 
	  </c:forEach>
</table>
<br>
<!--<div style="border:1px solid #666666;width:165px;height:14px; text-align: left;"><a href="${pageContext.request.contextPath}/citation/docs" style="color:#3F42EF; text-decoration:none;font-weight:bold;" onmouseover="this.style.color='#F49300'" onmouseout="this.style.color='#3F42EF'">Data Rewards Program ></a></div>  -->
