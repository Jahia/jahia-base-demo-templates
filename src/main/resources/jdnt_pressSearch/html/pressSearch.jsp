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
<template:include view="hidden.header"/>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>

<c:set var="view" value="default"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>

<%-- get the number of tabs to display --%>
<c:set var="numTabs" value="${currentNode.properties['numTabs'].string}"/>
<c:if test="${empty numTabs}">
    <c:set var="numTabs" value="3"/>
</c:if>

<%-- set componentId variable to make it unique --%>
<c:set var="yearId" value="year${currentNode.identifier}"/>
<c:choose>
    <c:when test="${not empty param[yearId]}">
        <c:set var="yearTab" value="${param[yearId]}"/>
    </c:when>
    <c:otherwise>
        <c:set var="yearTab" value="${thisYear}"/>
    </c:otherwise>
</c:choose>


<c:if test="${not empty title && empty param[yearId]}">
    <div class="headline"><h2>${title}</h2></div>
</c:if>

<div id="pressSearch-content-${currentNode.identifier}" class="tab-v1">
    <c:set var="id" value="${fn:replace(currentNode.identifier,'-', '')}"/>
    <%-- generate tabs --%>
    <ul class="nav nav-tabs">
        <li
                <c:if test="${yearTab eq thisYear}">class="active"</c:if> ><a
                href="javascript:void(0)" onclick="reload${id}('${thisYear}')">${thisYear}</a></li>
        <c:forEach var="i" begin="1" end="${numTabs-1}">
            <li
                    <c:if test="${yearTab eq thisYear-i}">class="active"</c:if> ><a
                    href="javascript:void(0)" onclick="reload${id}('${thisYear-i}')">${thisYear-i}</a></li>
        </c:forEach>
        <li
                <c:if test="${yearTab eq 'older'}">class="active"</c:if> ><a
                href="javascript:void(0)" onclick="reload${id}('older')">Older</a></li>
    </ul>
    <div id="tab-content-${currentNode.identifier}">
        <c:forEach items="${moduleMap.currentList}" var="pressRelease" varStatus="item">
            <template:module view="${view}" path="${pressRelease.path}" editable="false"/>
        </c:forEach>
    </div>
    <template:addResources type="inline">
        <script type="text/javascript">
            function reload${id}(param) {
                $('#pressSearch-content-${currentNode.identifier}').load('<c:url value="${url.base}${currentNode.path}.html.ajax?year${currentNode.identifier}="/>' + param);
            }
        </script>
    </template:addResources>

</div>
