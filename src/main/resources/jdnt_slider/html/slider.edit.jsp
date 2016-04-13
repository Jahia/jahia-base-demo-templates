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
<template:addResources type="css" resources="masterslider/style/masterslider.css"/>
<template:addResources type="css" resources="masterslider/skins/black-2/style.css"/>
<template:addResources type="javascript" resources="masterslider/masterslider.min.js"/>
<template:addResources type="javascript" resources="masterslider/jquery.easing.min.js"/>
<template:addResources type="javascript" resources="master-slider-fw.js"/>
<template:addResources type="javascript"  resources="custom/slider.edit.js"/>

<!-- Main style -->
<template:addResources type="css" resources="editSlider.css"/>
<template:include view="hidden.header"/>
<!-- Main container -->
<c:set var="componentId" value="${currentNode.identifier}"/>
<c:set var="jsID" value="${fn:replace(currentNode.identifier, '-','' )}"/>
<div class="slider-tab-container" id="sliderEdit-${componentId}">
    <div class="slider-tab-navigation">
        <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Select slider
                <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <c:forEach items="${moduleMap.currentList}" var="subchild">
                    <template:module node="${subchild}" view="select" editable="false"/>
                </c:forEach>
            </ul>

        </div>
    </div>
    <c:set var="resourceReadOnly" value="${currentResource.moduleParams.readOnly}"/>
    <%-- Displaying the view of inherited nodetype jnt:contentList and this view is loading all subnodes,
                                            the view is setting modulemap that we get from the included template header --%>

    <c:set var="isEmpty" value="true"/>
    <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}"
               varStatus="item">
        <template:module node="${subchild}" view="edit"
                         editable="${moduleMap.editable && !resourceReadOnly}"/>
        <c:set var="isEmpty" value="false"/>
    </c:forEach>


    <!-- Placeholder Panel -->
    <c:if test="${not empty moduleMap.emptyListMessage and (renderContext.editMode or moduleMap.forceEmptyListMessageDisplay) and isEmpty}">

        <div id="tab-1-${componentId}" class="slider-tab-content empty">
            <div class="second-layer-editslider">
                <span class="color-red"><fmt:message key="jdnt_sliderPanel.addNewSlider"/></span>
            </div>
            <!-- Placeholder image -->
            <img src="${url.currentModule}/img/placeholder-1000x1000.jpg">
        </div>
    </c:if>

</div>