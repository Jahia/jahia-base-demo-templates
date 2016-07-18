<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>

<%-- get the starting page for the search --%>
<%-- if user did not enter start node, use site --%>
<c:choose>
    <c:when test="${not empty currentNode.properties['startPage'] and not empty currentNode.properties['startPage'].node}">
        <c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
    </c:when>
    <c:otherwise>
        <c:set var="startNodePath" value="${renderContext.mainResource.node.resolveSite.path}"/>
    </c:otherwise>
</c:choose>


<%-- get the parameter passed via the URL --%>
<c:set var="eventTabParam" value="eventTab${currentNode.identifier}"/>
<c:set var="eventTab" value="${param[eventTabParam]}"/>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

<c:set var="filter" value="${currentNode.properties['filter']}"/>

<query:definition var="eventsQuery">
    <query:selector nodeTypeName="jnt:event" selectorName="event"/>
    <query:descendantNode path="${startNodePath}" selectorName="event"/>

    <c:if test="${not empty filter}">
        <query:equalTo propertyName="j:defaultCategory" value="${filter.string}"/>
    </c:if>
    <c:choose>
        <c:when test="${eventTab != 'past'}">
            <query:greaterThanOrEqualTo propertyName="startDate" value="${today}T00:00:00.000Z"/>
        </c:when>
        <c:otherwise>
            <query:lessThan propertyName="startDate" value="${today}T00:00:00.000Z"/>
        </c:otherwise>
    </c:choose>
    <query:sortBy propertyName="startDate"  order="asc"/>
</query:definition>

<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="listQuery" value="${eventsQuery}"/>

<template:addCacheDependency flushOnPathMatchingRegexp="${startNodePath}/.*"/>