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
<template:addResources type="css" resources="cookiecuttr.css"/>
<template:addResources type="javascript" resources="jquery.cookiecuttr.js"/>

<c:set var="cookieModalMessage" value="${currentNode.properties.cookieModalMessage.string}"/>
<c:set var="cookieMessage" value="${currentNode.properties.cookieMessage.string}"/>
<c:set var="cookieWhatAreLinkText" value="${currentNode.properties.cookieWhatAreLinkText.string}"/>
<c:set var="cookieAcceptButtonText" value="${currentNode.properties.cookieAcceptButtonText.string}"/>

<template:addResources type="inline">
    <script>
        $(document).ready(function () {
            $.cookieCuttr({
                cookieExpires: 365
                <c:if test="${! empty cookieMessage}">
                , cookieAnalyticsMessage: '${cookieMessage}'
                </c:if>
                <c:if test="${! empty cookieAcceptButtonText}">
                , cookieAcceptButtonText: '${fn:escapeXml(cookieAcceptButtonText)}'
                </c:if>
                <c:if test="${! empty cookieWhatAreLinkText}">
                , cookieWhatAreLinkText: '${fn:escapeXml(cookieWhatAreLinkText)}'
                </c:if>
                <c:if test="${jcr:isNodeType(currentNode, 'jdmix:cookieExternalLink')}">
                    <c:url var="cookieWhatAreTheyLink" value="${currentNode.properties.cookiePageExternalLink.string}" />
                    <c:if test="${! empty cookieWhatAreTheyLink}">
                    ,cookieWhatAreTheyLink: '${fn:escapeXml(cookieWhatAreTheyLink)}'
                    </c:if>
                </c:if>
                <c:if test="${jcr:isNodeType(currentNode, 'jdmix:cookieLink')}">
                <c:url var="cookieWhatAreTheyLink" value="${currentNode.properties.cookiePageLink.node.url}" context="/"/>
                <c:if test="${! empty cookieWhatAreTheyLink}">
                , cookieWhatAreTheyLink: '${fn:escapeXml(cookieWhatAreTheyLink)}'
                </c:if>
                </c:if>
                <c:if test="${jcr:isNodeType(currentNode, 'jdmix:cookieModalMessage')}">
                , cookieModal: true
                </c:if>
            });
        });
    </script>
</template:addResources>