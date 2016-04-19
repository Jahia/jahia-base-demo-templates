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
<template:include view="hidden.bannerHeader"/>

<c:if test="${jcr:isNodeType(currentNode, 'jdmix:internalLink')}">
    <a href="<c:url value="${currentNode.properties.internalLink.node.url}" context="/"/>" style="text-decoration: none;">
</c:if>
    <!--=== Breadcrumbs v1 ===-->
    <div class="breadcrumbs-v1" style='background:url("${moduleMap.bannerUrl}") no-repeat scroll center center / cover;'>
        <div class="container">
            <span>${moduleMap.headline}</span>
            <h1>${moduleMap.title}</h1>
        </div>
    </div>
    <!--=== End Breadcrumbs v1 ===-->
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:internalLink')}">
    </a>
</c:if>
