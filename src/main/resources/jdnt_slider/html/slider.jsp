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
<%-- TODO: remove slider arrows if only one panel --%>
<%-- TODO: update list processing --%>
<c:set var="uuid" value="${currentNode.identifier}"/>
<c:set var="id" value="${fn:replace(uuid,'-', '')}"/>
<c:set var="transition" value="${currentNode.properties.transition.string}"/>
<c:if test="${empty transition}">
    <c:set var="transition" value="flow"/>
</c:if>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <template:include view="edit"/>
        <template:module path="*" nodeTypes="jdnt:sliderPanel"/>
    </c:when>
    <c:otherwise>


        <%-- get the child sliderPanels --%>

        <c:set var="panels" value="${jcr:getChildrenOfType(currentNode, 'jdnt:sliderPanel')}"/>
        <div class="ms-layers-template">
            <div class="master-slider ms-skin-black-2 round-skin" id="masterslider${id}">
                    <%-- for each slider panel specified, use the sliderPanel jsp to display --%>
                <c:forEach items="${panels}" var="panel" varStatus="item">
                    <template:module node="${panel}" nodeTypes="jdnt:sliderPanel" editable="true"/>
                </c:forEach>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<template:addResources type="inline">
    <script type="text/javascript">
        $(window).load(function () {
            MSfullWidth.initMSfullWidth("masterslider${id}", "${transition}");
        });
    </script>
</template:addResources>

