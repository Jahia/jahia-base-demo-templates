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
<template:addResources type="javascript" resources="custom/allStories.js"/>
<template:include view="hidden.header"/>

<%-- allStories.js does some handle some ajax calls for allStories.jsp.
     The parameters needed for the ajax call are present in the DOM of this view (attributes url and view)--%>
<div class="allStoriesContainer">
    <div id="allStories-content-${currentNode.identifier}" class="allStories" url="<c:url value='${url.base}${currentNode.path}.html'/>" uuid="${currentNode.identifier}">
        <c:if test="${renderContext.editMode}">
            <h4><fmt:message key="label.topStoriesArea"/></h4>
            <p><fmt:message key="label.componentDescription"/></p>
        </c:if>

        <div class="tab-v1">
            <ul class="nav nav-tabs margin-bottom-10">
                <li class="all">
                    <a class="allStoriesTabItem" view="all" href="javascript:void(0)">
                        <fmt:message key="jdnt_allStories.allNews"/>
                    </a>
                </li>
                <li class="top">
                    <a class="allStoriesTabItem" view="top" href="javascript:void(0)">
                        <fmt:message key="jdnt_allStories.topNews"/>
                    </a>
                </li>
                <li class="featured">
                    <a  class="allStoriesTabItem" view="featured" href="javascript:void(0)">
                        <fmt:message key="jdnt_allStories.featuredNews"/>
                    </a>
                </li>
            </ul>

            <div id="tab-content-${currentNode.identifier}">
                <c:forEach items="${moduleMap.currentList}" var="topStory" varStatus="item">
                    <template:module path="${topStory.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
                </c:forEach>
            </div>
        </div>
    </div>
</div>