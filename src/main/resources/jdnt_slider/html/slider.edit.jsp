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

<!-- Main style -->
<template:addResources type="css" resources="editSlider.css"/>

<!-- Main container -->
<div class="tab-container">

    <!-- Dropdown navigation -->
    <%-- commented out due to not working
    <div class="tab-navigation">
        <select id="select-box">
            <option value="1">First tab (empty)</option>
            <option value="2">Option 2 - Left text and CTA</option>
            <option value="3">Option 3 - Right text</option>
            <option value="4">Option 4 - text plus small img</option>
        </select>

    </div> --%>
    <c:set var="resourceReadOnly" value="${currentResource.moduleParams.readOnly}"/>
    <%-- Displaying the view of inherited nodetype jnt:contentList and this view is loading all subnodes,
                                            the view is setting modulemap that we get from the included template header --%>
    <template:include view="hidden.header"/>
    <c:set var="isEmpty" value="true"/>
    <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}"
               varStatus="item">
        <template:module node="${subchild}" view="edit"
                         editable="${moduleMap.editable && !resourceReadOnly}"/>
        <c:set var="isEmpty" value="false"/>
    </c:forEach>


    <!-- Placeholder Panel -->
    <c:if test="${not empty moduleMap.emptyListMessage and (renderContext.editMode or moduleMap.forceEmptyListMessageDisplay) and isEmpty}">

        <div id="tab-1" class="tab-content empty">
            <div class="second-layer-editslider">
                <span class="color-red">ADD A NEW SLIDER PANEL</span>
            </div>
            <!-- Placeholder image -->
            <img src="${url.currentModule}/img/placeholder-1000x1000.jpg">
        </div>
    </c:if>

</div>

<!-- Main script -->
<%--<template:addResources type="inline">
    <script type="text/javascript">
        $(document).ready(function () {
            // Hide all tabs first
            $('.tab-content').hide();

            // Show the first tab content
            $('#tab-1').show();

            $('#select-box').change(function () {

                dropdown = $('#select-box').val();

                // First hide all tabs again when a new option is selected
                $('.tab-content').hide();

                // Then show the tab content of whatever option value was selected
                $('#' + "tab-" + dropdown).show();

            });
        })
    </script>
</template:addResources>--%>