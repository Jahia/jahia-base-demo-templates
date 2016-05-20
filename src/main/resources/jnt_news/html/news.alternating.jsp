<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>

<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsImage" value="${currentNode.properties['image']}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}"/>
<fmt:formatDate dateStyle="long" value="${currentNode.properties['date'].time}" var="newsDate"/>

<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>

<c:if test="${not empty newsImage}">
    <template:addCacheDependency node="${newsImage.node}"/>
    <c:url value="${url.files}${newsImage.node.path}" var="imageUrl"/>
    <div class="timeline-heading">
        <img class="img-responsive" src="${imageUrl}" alt=""/>
    </div>
</c:if>
<div class="timeline-body text-justify">
    <h2><a href="#">${fn:escapeXml(newsTitle)}</a></h2>
    <c:choose>
        <c:when test="${not jcr:isNodeType(currentNode, 'jdmix:removeReadMore')}">
            <template:include view="hidden.readMoreButton"/>
        </c:when>
        <c:otherwise>
            <p>${description}</p>
        </c:otherwise>
    </c:choose>

</div>
<div class="timeline-footer">
    <ul class="list-unstyled list-inline blog-info">
        <li><i class="fa fa-clock-o"></i> ${newsDate}</li>
    </ul>
</div>
