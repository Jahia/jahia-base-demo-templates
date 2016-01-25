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
<%-- TODO: javascript updates the parallax CSS but text color is overwritten by style.css --%>

<c:set var="backgroundImg" value="${currentNode.properties['backgroundImg'].node}"/>
<c:set var="pause" value="${currentNode.properties['pause'].boolean}"/>
<c:set var="width" value="${currentNode.properties['width'].string}"/>
<c:set var="body" value="${currentNode.properties['body'].string}"/>
<c:set var="slideTheme" value="${currentNode.properties['slideTheme'].string}"/>

<c:if test="${not currentNode.properties['effect'].boolean}">
    <c:set var="effectClass" value="noeffect"/>
</c:if>

<section class="parallaxPanel ${effectClass}" id="parallax${currentNode.identifier}"
         style="background-image: url('${backgroundImg.url}'); <c:if test="${pause}">margin-bottom:400px</c:if> ">
    <div>${body}</div>
</section>

<c:choose>
    <c:when test="${slideTheme == 'option1'}">
        <c:set var="backgroundColor" value="#E74C3C"/>
        <c:set var="textColor" value="#ffe3e3"/>
    </c:when>
    <c:when test="${slideTheme == 'option2'}">
        <c:set var="backgroundColor" value="#2D3030"/>
        <c:set var="textColor" value="#cacaca"/>
    </c:when>
    <c:when test="${slideTheme == 'option3'}">
        <c:set var="backgroundColor" value="#25232B"/>
        <c:set var="textColor" value="#ababab"/>
    </c:when>
    <c:when test="${slideTheme == 'option4'}">
        <c:set var="backgroundColor" value="#BBBBBB"/>
        <c:set var="textColor" value="#3a3535"/>
    </c:when>
    <c:when test="${slideTheme == 'option5'}">
        <c:set var="backgroundColor" value="#FFFFFF"/>
        <c:set var="textColor" value="#000000"/>
    </c:when>
    <c:when test="${slideTheme == 'option6'}">
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#000000"/>
    </c:when>
    <c:when test="${slideTheme == 'option7'}">
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#FFFFFF"/>
    </c:when>
    <c:when test="${slideTheme == 'option8'}">
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#E74C3C"/>
    </c:when>
    <c:otherwise>
        <c:set var="backgroundColor" value=""/>
        <c:set var="textColor" value="#FFFFFF"/>
    </c:otherwise>
</c:choose>

<script type="text/javascript">
    $(document).ready(function(){
        $("#parallax${currentNode.identifier}").css("background-image", "url('${backgroundImg.url}')");
    })
    $(document).ready(function(){
        $("#parallax${currentNode.identifier}").css("background-color", "${backgroundColor}");
    })
    $(document).ready(function(){
        $("#parallax${currentNode.identifier} div").width("${width}");
    })
    $(document).ready(function(){
        $("#parallax${currentNode.identifier}").css("color", "${textColor}");
    })
</script>


