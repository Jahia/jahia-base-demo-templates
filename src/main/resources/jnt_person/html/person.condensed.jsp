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
<c:url var="personURL" value="${currentNode.url}"/>
<%-- if social icons were included, get the urls --%>
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:socialIcons')}">
    <c:set var="facebook" value="${currentNode.properties.facebook.string}"/>
    <c:set var="linkedin" value="${currentNode.properties.linkedIn.string}"/>
    <c:set var="twitter" value="${currentNode.properties.twitter.string}"/>
    <c:set var="googlePlus" value="${currentNode.properties.googlePlus.string}"/>
</c:if>

<%-- get default photo if one was not provided --%>
<c:choose>
    <c:when test="${empty photo}">
        <c:set var="photoUrl" value="${url.currentModule}/img/default_person_img.jpg"/>
    </c:when>
    <c:otherwise>
        <c:url var="photoUrl" value="${photo.node.url}"/>
    </c:otherwise>
</c:choose>

<li><a href="${personURL}"><img class="rounded-x center-block margin-bottom-20 margin-top-20" src="${photoUrl}"
                                style="width: 80px" alt=""></a></li>
<li><a href="${personURL}"><c:if test="${not empty title}"><strong>${title}:</strong> </c:if>${name}</a></li>
<li><p>${fn:replace(bio, fn:substring(bio, 200, fn:length(bio)), '... ')}</p></li>

<!-- Contact Social Icons -->
<ul class="list-inline who">
    <c:if test="${not empty facebook and facebook != 'http://'}">
        <li><a href="${facebook}"><i class="fa fa-facebook-official"></i></a></li>
    </c:if>
    <c:if test="${not empty twitter and twitter != 'http://'}">
        <li><a href="${twitter}"><i class="fa fa-twitter-square"></i></a></li>
    </c:if>
    <c:if test="${not empty googlePlus and googlePlus != 'http://'}">
        <li><a href="${googlePlus}"><i class="fa fa-google-plus-square"></i></a></li>
    </c:if>
    <c:if test="${not empty linkedin and linkedin != 'http://'}">
        <li><a href="${linkedin}"><i class="fa fa-linkedin-square"></i></a></li>
    </c:if>
</ul>
<p></p>
