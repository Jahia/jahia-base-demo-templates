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
<template:addResources type="css" resources="leadership.css"/>

<c:set var="name" value="${currentNode.properties.firstname.string}&nbsp;${currentNode.properties.lastname.string}"/>
<c:set var="title" value="${currentNode.properties.function.string}"/>
<%-- set bio variable as plain text by stripping the rich text html tags from it --%>
<c:set var="bio" value="${functions:removeHtmlTags(currentNode.properties.biography.string)}"/>
<c:set var="photo" value="${currentNode.properties.picture}"/>
<c:url var="personURL" value="${currentNode.url}" context="/"/>


<%-- get default photo if one was not provided --%>
<c:choose>
    <c:when test="${empty photo}">
        <c:set var="photoUrl" value="${url.currentModule}/img/default_person_img.jpg"/>
    </c:when>
    <c:otherwise>
        <template:addCacheDependency node="${photo.node}"/>
        <c:url var="photoUrl" value="${photo.node.url}" context="/"/>
    </c:otherwise>
</c:choose>

<li><a href="${personURL}"><img class="rounded-x center-block margin-bottom-20 margin-top-20 photo80" src="${photoUrl}"
                                 alt=""></a></li>
<li><a href="${personURL}"><c:if test="${not empty title}"><strong>${title}:</strong> </c:if>${name}</a></li>
<li><p>${fn:replace(bio, fn:substring(bio, 200, fn:length(bio)), '... ')}</p></li>

<c:if test="${jcr:isNodeType(currentNode, 'jdmix:socialIcons')}">
    <template:include view="socialIcons.condensed"/>
</c:if>

<p></p>
