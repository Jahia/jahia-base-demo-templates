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
<%-- display the search results for the allStories query --%>

<template:include view="hidden.header"/>

<div id="allStories-content-${currentNode.identifier}">
    <c:set var="id" value="${fn:replace(currentNode.identifier,'-', '')}"/>
    <c:set var="pageView" value="${fn:trim(param['pageView'])}"/>

    <c:if test="${renderContext.editMode}">
        <h4><fmt:message key="label.topStoriesArea"/></h4>

        <p><fmt:message key="label.componentDescription"/></p>
    </c:if>
    <c:set var="current" value="${jcr:getMeAndParentsOfType(renderContext.mainResource.node, 'jnt:page')[0]}"/>
    <c:set var="pageUrl" value="${current.url}"/>

    <div class="tab-v1">
        <ul class="nav nav-tabs margin-bottom-10">
            <li
                    <c:if test="${pageView != 'top' && pageView != 'featured'}">class="active"</c:if> ><a
                    href="javascript:void(0)" onclick="reload${id}('all')"><fmt:message
                    key="jdnt_allStories.allNews"/></a></li>
            <li
                    <c:if test="${pageView == 'top'}">class="active"</c:if> ><a href="javascript:void(0)"
                                                                                onclick="reload${id}('top')"><fmt:message
                    key="jdnt_allStories.topNews"/></a></li>
            <li
                    <c:if test="${pageView == 'featured'}">class="active"</c:if> ><a href="javascript:void(0)"
                                                                                     onclick="reload${id}('featured')"><fmt:message
                    key="jdnt_allStories.featuredNews"/></a></li>
        </ul>

        <div id="tab-content-${currentNode.identifier}">
            <c:forEach items="${moduleMap.currentList}" var="topStory" varStatus="item">
                <template:module path="${topStory.path}">
                    <template:param name="last" value="${item.last}"/>
                </template:module>
            </c:forEach>
        </div>
    </div>

    <template:addResources type="inline">
        <script type="text/javascript">
            function reload${id}(param) {
                history.pushState(null, null, window.location.href.split('?')[0] + '?pageView=' + param);
                $('#allStories-content-${currentNode.identifier}').load('<c:url value="${currentNode.path}.html.ajax?pageView="/>' + param);
            }
        </script>
    </template:addResources>
</div>