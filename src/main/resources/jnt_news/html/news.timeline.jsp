<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jahia" uri="http://www.jahia.org/tags/templateLib" %>

<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsImage" value="${currentNode.properties['image']}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<c:set var="description" value="${currentNode.properties['desc']}" />
<fmt:formatDate pattern="MMMM" dateStyle="long" value="${currentNode.properties['date'].time}" var="newsMonth"/>
<fmt:formatDate pattern="d/M/yy" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>
<li class="equal-height-columns">
    <div class="cbp_tmtime equal-height-column"><span>${newsDate}</span> <span>${newsMonth}</span></div>
    <i class="cbp_tmicon rounded-x hidden-xs"></i>
    <div class="cbp_tmlabel equal-height-column">
        <h2>${fn:escapeXml(newsTitle.string)}</h2>
        <c:choose>

        <c:when test="${not empty newsImage}">
            <div class="row">
                <div class="col-md-4">
                        <jahia:addCacheDependency node="${newsImage.node}" />
                        <c:url value="${url.files}${newsImage.node.path}" var="imageUrl"/>
                        <img class="img-responsive" src="${imageUrl}" alt=""/>

                <div class="md-margin-bottom-20"></div>
            </div>
            <div class="col-md-8">
                <p>${description.string}</p>
            </div>
        </div>
        </c:when>
            <c:otherwise>
                <p>${description.string}</p>

            </c:otherwise>
        </c:choose>

    </div>
</li>
