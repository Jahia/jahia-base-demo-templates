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
<c:set var="bio" value="${currentNode.properties.biography.string}"/>
<c:set var="photo" value="${currentNode.properties.picture}"/>

<%-- if social icons were included, get the urls --%>
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:socialIcons')}">
    <c:set var="facebook" value="${currentNode.properties.facebook.string}"/>
    <c:set var="linkedin" value="${currentNode.properties.linkedIn.string}"/>
    <c:set var="twitter" value="${currentNode.properties.twitter.string}"/>
    <c:set var="googlePlus" value="${currentNode.properties.googlePlus.string}"/>
</c:if>

<%-- get default photo if one was not provided --%>
<c:choose>
    <c:when test="${empty photo.node}">
        <c:set var="photoUrl" value="${url.currentModule}/img/default_person_img.jpg"/>
    </c:when>
    <c:otherwise>
        <template:addCacheDependency node="${photo.node}"/>
        <c:url var="photoUrl" value="${photo.node.url}" context="/"/>
    </c:otherwise>
</c:choose>


<div class="row content-xs">
    <div class="col-md-3">
        <div class="portrait">
            <div class="portrait-bg">
                <img src="${photoUrl}" alt="${name}"/>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="title">${name}</div>
        <div class="subtitle color-theme">${title}</div>
        ${bio}
        <c:if test="${jcr:isNodeType(currentNode, 'jdmix:socialIcons')}">
            <template:include view="socialIcons"/>
        </c:if>
    </div>
    <div class="col-md-12">
        <hr class="devider devider-dotted">
    </div>
</div>