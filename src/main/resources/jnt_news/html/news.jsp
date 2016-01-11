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
<c:set var="newsTitle" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}" />
<fmt:formatDate dateStyle="long" value="${currentNode.properties['date'].time}" var="newsDate"/>

<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>

<div class="row margin-bottom-20">
    <div class="col-sm-5 sm-margin-bottom-20">
        <c:if test="${not empty newsImage.node}">
            <jahia:addCacheDependency node="${newsImage.node}" />
            <c:url value="${url.files}${newsImage.node.path}" var="imageUrl"/>
        <img class="img-responsive" src="${imageUrl}" alt="">
        </c:if>
    </div>
    <div class="col-sm-7 news-v3">
        <div class="news-v3-in-sm no-padding">
            <ul class="list-inline posted-info">
             <%--   <li>In <a href="#">Design</a></li> --%>
                <li>Posted ${newsDate}</li>
            </ul>
            <h2><a href="${detailUrl}">${newsTitle}</a></h2>
            <c:choose>
                <c:when test="${not jcr:isNodeType(currentNode, 'jdmix:hasReadMore')}">
                    <p>${fn:substring(functions:removeHtmlTags(description), 0, 150)}...</p>
                    <a class="btn-u btn-u-sm" href="${detailUrl}"><fmt:message key="jdnt_news.read_more"/></a>
                </c:when>
                <c:otherwise>
                    <p>${description}</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>