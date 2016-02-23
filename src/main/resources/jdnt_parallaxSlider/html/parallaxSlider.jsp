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
<template:addResources type="css" resources="scrollmagic/style.css"/>
<template:addResources type="css" resources="scrollmagic/examples.css"/>

<template:addResources type="javascript" resources="scrollmagic/highlight.pack.js"/>
<template:addResources type="javascript" resources="scrollmagic/modernizr.custom.min.js"/>
<template:addResources type="javascript" resources="scrollmagic/ScrollMagic.js"/>
<!--template:addResources type="javascript" resources="scrollmagic/debug.addIndicators.js"/-->
<c:set var="sliders" value="${jcr:getChildrenOfType(currentNode, 'jdnt:parallaxSliderItem')}"/>

<div id="content-wrapper">
    <div id="example-wrapper">
        <div class="scrollContent">
            <section class="demo" id="section-wipes">
                <c:forEach items="${sliders}" var="slider" varStatus="item">
                    <template:module node="${slider}"/>
                </c:forEach>
                <c:if test="${renderContext.editMode}">
                    <template:module path="*"/>
                </c:if>
            </section>
        </div>
    </div>
</div>
<template:addResources type="inline">
<script>
    $(function () { // wait for document ready
        // init
        var controller = new ScrollMagic.Controller({
            globalSceneOptions: {
                triggerHook: 'onLeave'
            }
        });

        // get all slides
        var slides = document.querySelectorAll("section.parallaxPanel");

        // create scene for every slide
        for (var i=0; i<slides.length; i++) {
            if (slides[i].className.indexOf("noeffect") < 0){
                new ScrollMagic.Scene({
                    triggerElement: slides[i]
                })
                        .setPin(slides[i])
                        //.addIndicators() add indicators (requires plugin)
                        .addTo(controller);
            }else{
                new ScrollMagic.Scene({
                    triggerElement: slides[i+1]
                })
                        .setPin(slides[i])
                        //.addIndicators() add indicators (requires plugin)
                        .addTo(controller);
            }
        }
    });
    </script>
</template:addResources>