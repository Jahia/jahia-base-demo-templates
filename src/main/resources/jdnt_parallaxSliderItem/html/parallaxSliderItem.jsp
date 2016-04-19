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

<c:set var="backgroundImg" value="${currentNode.properties['backgroundImg'].node}"/>
<c:if test="${not empty backgroundImg}">
    <c:url var="backgroundImgUrl" value="${backgroundImg.url}" context="/"/>
</c:if>
<c:set var="pause" value="${currentNode.properties['pause'].boolean}"/>
<c:set var="width" value="${currentNode.properties['width'].string}"/>
<c:set var="body" value="${currentNode.properties['body'].string}"/>
<c:set var="slideTheme" value="${currentNode.properties['slideTheme'].string}"/>

<c:if test="${not currentNode.properties['effect'].boolean}">
    <c:set var="effectClass" value="noeffect"/>
</c:if>

<section class="parallaxPanel ${effectClass}" id="parallax${currentNode.identifier}"
         style="background-image: url('${backgroundImgUrl}');
         <c:if test="${pause}">margin-bottom:400px</c:if> ">
    <div>${body}</div>
</section>

<c:choose>
    <c:when test="${slideTheme == 'option1'}">
        <c:set var="backgroundColor" value="rgba(231, 76, 60, 0.85)"/>
        <c:set var="textColor" value="#ffe3e3"/>
    </c:when>
    <c:when test="${slideTheme == 'option2'}">
        <c:set var="backgroundColor" value="rgba(45, 48, 48, 0.85)"/>
        <c:set var="textColor" value="#cacaca"/>
    </c:when>
    <c:when test="${slideTheme == 'option3'}">
        <c:set var="backgroundColor" value="rgba(37, 35, 43, 0.94)"/>
        <c:set var="textColor" value="#ababab"/>
    </c:when>
    <c:when test="${slideTheme == 'option4'}">
        <c:set var="backgroundColor" value="rgba(187, 187, 187, 0.85)"/>
        <c:set var="textColor" value="#3a3535"/>
    </c:when>
    <c:when test="${slideTheme == 'option5'}">
        <c:set var="backgroundColor" value="#FFFFFF"/>
        <c:set var="textColor" value="#000000"/>
    </c:when>
    <c:when test="${slideTheme == 'option6'}">
        <c:set var="backgroundColor" value="rgba(255,255,255,0.95)"/>
        <c:set var="textColor" value="#000000"/>
    </c:when>
    <c:when test="${slideTheme == 'option7'}">
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#000000"/>
    </c:when>
    <c:when test="${slideTheme == 'option8'}">
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#FFFFFF"/>
    </c:when>
    <c:when test="${slideTheme == 'option9'}">
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#E74C3C"/>
    </c:when>
    <c:otherwise>
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#FFFFFF"/>
    </c:otherwise>
</c:choose>

<template:addResources type="inline">
<script type="text/javascript">
    $(document).ready(function () {
        $("#parallax${currentNode.identifier}").css("background-image", "url('${backgroundImgUrl}')");
        $("#parallax${currentNode.identifier}").css("background-color", "${backgroundColor}");
        $("#parallax${currentNode.identifier} div").width("${width}");
        $("#parallax${currentNode.identifier} p, #parallax${currentNode.identifier} li, #parallax${currentNode.identifier} li a, #parallax${currentNode.identifier} label, #parallax${currentNode.identifier} h1, #parallax${currentNode.identifier} h2, #parallax${currentNode.identifier} h3, #parallax${currentNode.identifier} h4, #parallax${currentNode.identifier} h5, #parallax${currentNode.identifier} h6").css("color", "${textColor}");
    })
</script>
</template:addResources>

