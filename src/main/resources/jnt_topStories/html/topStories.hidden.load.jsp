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
<c:set var="pageView" value="${param['pageView']}"/>
<c:set var="topLevel" value="${currentNode.properties['j:level'].string}"/>
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:topViews')}">
    <c:set var="view" value="${currentNode.properties['view'].string}"/>
    <c:set target="${moduleMap}" property="subNodesView" value="${view}"/>
</c:if>

<c:choose>
    <c:when test="${jcr:isNodeType(currentNode, 'jdmix:searchArea') and not empty currentNode.properties['startPage']}">
        <c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
    </c:when>
    <c:otherwise>
        <c:set var="startNodePath" value="${currentNode.resolveSite.path}"/>
    </c:otherwise>
</c:choose>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>


<c:set var="endDateConstraint" value="true"/>

<c:choose>
    <c:when test="${view == 'newsroom'}">
        <c:set var="jlevel" value="${topLevel}"/>
        <c:set var="limit" value="${currentNode.properties['j:limit'].long}"/>
    </c:when>
    <c:when test="${pageView == 'top'}">
        <c:set var="jlevel" value="first"/>
    </c:when>
    <c:when test="${pageView == 'featured'}">
        <c:set var="jlevel" value="second"/>
    </c:when>
    <c:when test="${pageView == 'all'}">
        <c:set var="endDateConstraint" value="false"/>
    </c:when>
    <c:otherwise>
        <c:set var="jlevel" value="${topLevel}"/>
        <c:set var="limit" value="${currentNode.properties['j:limit'].long}"/>
    </c:otherwise>
</c:choose>


<c:set var="statement" value="select * from [jmix:topStory] as story where isdescendantnode(story, ['${startNodePath}'])"/>
<c:if test="${not empty jlevel}">
    <c:set var="statement" value="${statement} and story.[j:level]='${jlevel}'"/>
</c:if>
<c:if test="${not empty endDateConstraint}">
    <c:set var="statement" value="${statement} and (story.[j:endDate] is null or story.[j:endDate] > CAST('+${today}T00:00:00.000' as date)) order by story.[date] desc"/>
</c:if>

<c:set var="searchStatement" value="${statement}"/>

<query:definition var="listQuery" statement="${searchStatement}"  limit="${limit}"/>

<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}"/>

<template:addCacheDependency flushOnPathMatchingRegexp="${startNodePath}/.*"/>
