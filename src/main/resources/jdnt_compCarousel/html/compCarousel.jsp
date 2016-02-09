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

<template:include view="hidden.header"/>
<%-- Get the title of the carousel, if exists display above carousel --%>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:if test="${not empty title}">
    <div class="headline"><h2>${title}</h2></div>
</c:if>


<div class="owl-carousel-v1 margin-bottom-50"> <%-- id="${currentNode.identifier}">--%>
    <!--navigation-->
    <div class="owl-navigation">
        <div class="customNavigation">
            <a class="owl-btn prev-v1"><i class="fa fa-angle-left"></i></a>
            <a class="owl-btn next-v1"><i class="fa fa-angle-right"></i></a>
        </div>
    </div>
    <!--end navigation-->

    <div class="owl-slider-ap owl-carousel owl-theme">
        <%-- for each carouselImg display using the carouselImg jsp --%>
        <c:forEach items="${moduleMap.currentList}" var="company" varStatus="item">
            <template:module path="${company.path}" view="owl">
                <template:param name="last" value="${item.first}"/>
            </template:module>
        </c:forEach>
    </div>
</div>
<!-- End Owl Carousel v1 -->

