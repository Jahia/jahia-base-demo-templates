<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
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
<c:set var="allStoriesTabParam" value="allStoriesTab${currentNode.identifier}"/>
<c:set var="allStoriesTab" value="${param[allStoriesTabParam]}"/>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

<%-- set search query based on allStoriesTab selected --%>
<query:definition var="topStoryQuery">
    <query:selector nodeTypeName="jmix:topStory" selectorName="story"/>
    <query:descendantNode path="${startNodePath}" selectorName="story"/>

    <c:choose>
        <c:when test="${allStoriesTab == 'top'}">
            <query:equalTo propertyName="j:level" value="first"/>
            <query:or>
                <query:not>
                    <query:propertyExistence propertyName="j:endDate"/>
                </query:not>
                <query:greaterThan propertyName="j:endDate" value="${today}T00:00:00.000"/>
            </query:or>
        </c:when>
        <c:when test="${allStoriesTab == 'featured'}">
            <query:equalTo propertyName="j:level" value="second"/>
            <query:or>
                <query:not>
                    <query:propertyExistence propertyName="j:endDate"/>
                </query:not>
                <query:greaterThan propertyName="j:endDate" value="${today}T00:00:00.000"/>
            </query:or>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
    <query:sortBy propertyName="date"  order="desc"/>
</query:definition>


<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="listQuery" value="${topStoryQuery}"/>
<c:set target="${moduleMap}" property="subNodesView" value="default"/>
<c:set target="${moduleMap}" property="allStoriesTab" value="allStoriesTab"/>
<template:addCacheDependency flushOnPathMatchingRegexp="${startNodePath}/.*"/>
