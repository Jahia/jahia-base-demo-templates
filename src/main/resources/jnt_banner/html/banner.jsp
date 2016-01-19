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
<jcr:nodeProperty node="${currentNode}" name="background" var="bannerImg"/>
<c:choose>
    <c:when test="${not empty bannerImg}">
        <c:url value="${url.files}${bannerImg.node.path}" var="bannerUrl"/>
    </c:when>
    <c:otherwise>
        <c:url value="${url.currentModule}/img/default_banner_img.jpg" var="bannerUrl"/>
    </c:otherwise>
</c:choose>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<%--If no title is set with banner then use the current page title--%>
<c:if test="${empty currentNode.properties['jcr:title'].string}">
    <c:set var="title" value="${renderContext.mainResource.node.displayableName}"/>
</c:if>

<%--Set variable for banner headline and remove HTML tags--%>
<c:set var="headline" value="${functions:removeHtmlTags(currentNode.properties.cast.string)}"/>

<c:if test="${jcr:isNodeType(currentNode, 'jdmix:internalLink')}">
    <c:set var="linkNode" value="${currentNode.properties.internalLink.node}"/>
    <c:set var="linkTitle" value="${currentNode.properties.linkTitle.string}"/>
    <c:if test="${empty linkTitle}">
        <c:set var="linkTitle" value="${linkNode.displayableName}"/>
    </c:if>
    <a href="${linkNode.url}" style="text-decoration: none;">
</c:if>
    <!--=== Breadcrumbs v1 ===-->
    <div class="breadcrumbs-v1" style='background:url("${bannerUrl}") no-repeat scroll center center / cover;'>
        <div class="container">
            <span>${headline}</span>
            <h1>${title}</h1>
        </div>
    </div>
    <!--=== End Breadcrumbs v1 ===-->
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:internalLink')}">
    </a>
</c:if>
