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
<template:addResources type="css" resources="languageSwitchingLinks.css"/>
<c:set var="linkKind" value="${currentNode.properties.typeOfDisplay.string}"/>

<ui:initLangBarAttributes activeLanguagesOnly="${renderContext.liveMode}"/>
<div id="languages" class="hidden-sm hidden-md hidden-lg">
    <c:if test="${fn:length(requestScope.languageCodes) > 1}">
    <a href="javascript:void(0);">Languages <span class="caret"></span></a>
    <ul class="topbar-dropdown">
        <c:forEach items="${requestScope.languageCodes}" var="language">
            <ui:displayLanguageSwitchLink languageCode="${language}" display="false" urlVar="switchUrl"
                                          var="renderedLanguage"
                                          linkKind="${currentNode.properties.typeOfDisplay.string}"/>
            <c:choose>
                <c:when test="${language eq currentResource.locale}">
                    <li class="active"><a href="#">${renderedLanguage}<i class="fa fa-check"></i></a></li>
                </c:when>
                <c:otherwise>
                    <li><a title="<fmt:message key='switchTo'/>"
                           href="<c:url context='/' value='${switchUrl}'/>">${renderedLanguage}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
    </c:if>
</div>