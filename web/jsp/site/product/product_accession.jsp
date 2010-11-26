<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="count" value="0"></c:set>
<c:forEach items="${crossReferenceList}" var="crossReference">
    <c:if test="${crossReference.referenceCategory.name == 'UniProt'}">
        <span style="color: #3F42EF;">
             <a href="http://www.uniprot.org/uniprot/${crossReference.referenceKey}" target="_blank" class="notUnderline">${crossReference.referenceKey}</a>
        <c:if test="${fn:length(crossReferenceList) ne (count+1)}">,</c:if>
        </span>
        <c:set var="count" value="${count+1}"></c:set>
        <c:if test="${count%2==0}"> <br /> </c:if>
	</c:if>
	<c:if test="${crossReference.referenceCategory.name == 'RefSeq_Protein'}">
	        <span style="color: #3F42EF;">
	            <a href="http://www.ncbi.nlm.nih.gov/protein/${crossReference.referenceKey}" target="_blank" class="notUnderline">${crossReference.referenceKey}</a>
            <c:if test="${fn:length(crossReferenceList) ne (count+1)}">,</c:if>
             </span>
            <c:set var="count" value="${count+1}"></c:set>
           <c:if test="${count%2==0}"> <br /> </c:if>
	</c:if>
	<c:if test="${crossReference.referenceCategory.name == 'RefSeq_RNA'}">
	       <span style="color: #3F42EF;">
	            <a href="http://www.ncbi.nlm.nih.gov/nucleotide/${crossReference.referenceKey}" target="_blank" class="notUnderline">${crossReference.referenceKey}</a>
           <c:if test="${fn:length(crossReferenceList) ne (count+1)}">,</c:if>
            </span>
           <c:set var="count" value="${count+1}"></c:set>
          <c:if test="${count%2==0}"> <br /> </c:if>
	</c:if>
</c:forEach>