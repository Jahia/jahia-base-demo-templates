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

<c:set var="newsTitle" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}"/>
<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>

<fmt:formatDate pattern="dd MMM, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>
<ul class="list-unstyled blog-latest-posts margin-bottom-20">
    <li>
        <h3><a href="${detailUrl}">${newsTitle}</a></h3>
        <small>${newsDate}
            <%-- display tags --%>
            <jcr:nodeProperty node="${currentNode}" name="j:tagList" var="tags"/>
            <c:forEach items="${tags}" var="tag" varStatus="status">
                <c:if test="${status.first}">&nbsp;<fmt:message key="jnt_news.in"/>&nbsp;</c:if>${tag.string}<c:if
                    test="${not status.last}">,</c:if>
            </c:forEach>
        </small>
        <p>${fn:substring(functions:removeHtmlTags(description), 0, 150)}...</p>
    </li>
</ul>