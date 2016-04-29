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
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>

<%-- get the starting page for the search --%>
<c:choose>
    <c:when test="${not empty currentNode.properties['startPage']}">
        <c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
    </c:when>
    <c:otherwise>
        <c:set var="startNodePath" value="${renderContext.mainResource.node.resolveSite.path}"/>
    </c:otherwise>
</c:choose>


<%-- get the number of tabs to display --%>
<c:set var="numTabs" value="${currentNode.properties['numTabs'].string}"/>
<c:if test="${empty numTabs}">
    <c:set var="numTabs" value="3"/>
</c:if>

<c:set var="filter" value="${currentNode.properties['filter']}"/>
<c:set var="yearParm" value="yearTab${currentNode.identifier}"/>

<%-- get the parameter passed via the URL --%>
<c:set var="yearTab" value="${param[yearParm]}"/>
<c:if test="${empty yearTab}">
    <c:set var="yearTab" value="${thisYear}"/>
</c:if>

<query:definition var="pressQuery">
    <query:selector nodeTypeName="jnt:press" selectorName="press"/>
    <query:descendantNode path="${startNodePath}" selectorName="press"/>
    <c:if test="${not empty filter}">
        <query:equalTo propertyName="j:defaultCategory" value="${filter.string}"/>
    </c:if>
    <c:choose>
        <c:when test="${yearTab eq 'older'}">
            <query:lessThanOrEqualTo propertyName="date" value="${thisYear-numTabs+1}-01-01T00:00:00.000Z"/>
        </c:when>
        <c:otherwise>
            <query:greaterThanOrEqualTo propertyName="date" value="${yearTab}-01-01T00:00:00.000Z"/>
            <query:lessThanOrEqualTo propertyName="date" value="${yearTab}-12-31T23:59:59.999Z"/>
        </c:otherwise>
    </c:choose>
    <query:sortBy propertyName="date"  order="desc"/>
</query:definition>

<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="listQuery" value="${pressQuery}"/>

<template:addCacheDependency flushOnPathMatchingRegexp="${startNodePath}/.*"/>

