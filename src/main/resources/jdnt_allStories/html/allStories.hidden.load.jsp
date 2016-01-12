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
<template:addResources type="css" resources="app.css"/>
<%@ page import="java.util.Calendar" %>

<c:set var="pageView"><%= ((String) request.getParameter("pageView"))%>
</c:set>
    <c:set var="view" value="default"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<c:if test="${renderContext.editMode}"><h4><fmt:message key="label.topStoriesArea"/></h4>
    <p><fmt:message key="label.componentDescription"/></p>
</c:if>

<c:set var="pageNode" value="${renderContext.mainResource.node}"/>
<c:url var="pageUrl" value="${pageNode.url}" />

<div class="tab-v1">
    <ul class="nav nav-tabs">
    <li <c:if test="${pageView != 'top' && pageView != 'featured'}">class="active"</c:if> ><a href="${pageUrl}"><fmt:message key="jdnt_allStories.allNews"/></a></li>
    <li <c:if test="${pageView == 'top'}">class="active"</c:if> ><a href="${pageUrl}?pageView=top" ><fmt:message key="jdnt_allStories.topNews"/></a></li>
    <li <c:if test="${pageView == 'featured'}">class="active"</c:if> ><a href="${pageUrl}?pageView=featured"><fmt:message key="jdnt_allStories.featuredNews"/></a></li>
    </ul>

    <div class="tab-content">
        <c:choose>
            <c:when test="${pageView == 'top'}">
                <jcr:sql var="topStories"
                         sql="select * from [jmix:topStory] as story where isdescendantnode(story, ['${renderContext.site.path}'])
         and story.[j:level]='first' and (story.[j:endDate] is null or story.[j:endDate] > CAST('+${today}T00:00:00.000' as date)) order by story.[date] desc"/>

            </c:when>
            <c:when test="${pageView == 'featured'}">
                <jcr:sql var="topStories"
                         sql="select * from [jmix:topStory] as story where isdescendantnode(story, ['${renderContext.site.path}'])
         and story.[j:level]='second' and (story.[j:endDate] is null or story.[j:endDate] > CAST('+${today}T00:00:00.000' as date)) order by story.[date] desc"/>

            </c:when>
            <c:otherwise>
                <jcr:sql var="topStories"
                         sql="select * from [jnt:news] as story where isdescendantnode(story, ['${renderContext.site.path}']) order by story.[date] desc"/>
            </c:otherwise>
        </c:choose>

        <c:forEach items="${topStories.nodes}" var="topStory" varStatus="item">
            <template:module view="${view}" path="${topStory.path}">
                <template:param name="last" value="${item.last}"/>
            </template:module>
           </c:forEach>
    </div>
</div>