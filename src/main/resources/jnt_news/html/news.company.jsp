<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>

<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="creator" value="${currentNode.properties['jcr:createdBy']}"/>
<c:set var="newsImage" value="${currentNode.properties['image']}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<%-- set descriptionTxt variable as plain text by stripping the rich text html tags from it --%>
<c:set var="descriptionTxt" value="${functions:removeHtmlTags(currentNode.properties['desc'].string)}"/>

<fmt:formatDate pattern="MMM" dateStyle="long" value="${currentNode.properties['date'].time}" var="newsMonth"/>
<fmt:formatDate pattern="d" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>

<c:choose>
    <c:when test="${empty newsImage}">
        <c:set var="imageUrl" value="${url.currentModule}/img/img12.jpg"/>
    </c:when>
    <c:otherwise>
        <c:url var="imageUrl" value="${url.files}${newsImage.node.path}"/>
        <template:addCacheDependency node="${newsImage.node}"/>
    </c:otherwise>
</c:choose>

<div class="col-md-4 sm-margin-bottom-30">
    <div class="news-v2-badge">
        <img class="img-responsive company-news-img" src="${imageUrl}">
        <p>
            <span>${newsDate}</span>
            <small>${newsMonth}</small>
        </p>
    </div>
    <div class="news-v2-desc bg-color-light">
        <h3><a href="<c:url value='${url.base}${currentNode.path}.html'/>">${newsTitle.string}</a></h3>

        <%-- Shorten the description text to 100 characters --%>
        <p>${fn:replace(descriptionTxt, fn:substring(descriptionTxt, 100, fn:length(descriptionTxt)), '... ')}</p>
    </div>
</div>