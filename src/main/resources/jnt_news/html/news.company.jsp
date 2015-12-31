<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jahia" uri="http://www.jahia.org/tags/templateLib" %>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="creator" value="${currentNode.properties['jcr:createdBy']}" />
<c:set var="newsImage" value="${currentNode.properties['image']}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<c:set var="description" value="${currentNode.properties['desc']}" />
<fmt:formatDate pattern="MMM" dateStyle="long" value="${currentNode.properties['date'].time}" var="newsMonth"/>
<fmt:formatDate pattern="d" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>

<c:choose>
    <c:when test="${empty newsImage}">
        <c:set var="imageUrl" value="${url.currentModule}/img/img12.jpg"/>
    </c:when>
    <c:otherwise>
        <c:url var="imageUrl" value="${url.files}${newsImage.node.path}"/>
    </c:otherwise>
</c:choose>

<div class="col-md-4 sm-margin-bottom-30">
    <div class="news-v2-badge">
        <img class="img-responsive" src="${imageUrl}">
        <p>
            <span>${newsDate}</span>
            <small>${newsMonth}</small>
        </p>
    </div>
    <div class="news-v2-desc bg-color-light">
        <h3><a href="#">${newsTitle.string}</a></h3>
        <small>By ${creator.string}</small>
        <p>${description.string}</p>
    </div>
</div>