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

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="subtitle" value="${currentNode.properties.subtitle.string}"/>
<c:set var="summary" value="${currentNode.properties.body.string}"/>
<c:set var="textColor" value="${currentNode.properties.textColor.string}"/>
<c:set var="link" value="${currentNode.properties.internalLink.node}"/>
<c:set var="linkText" value="${currentNode.properties.linkText.string}"/>
<c:set var="background" value="${currentNode.properties.backgroundImg.node}"/>
<c:set var="image" value="${currentNode.properties.smallPhoto.node}"/>


<%-- if linkText is not filled in use default Read More from resource file--%>
<c:if test="${empty linkText}">
    <c:set var="linkText"><fmt:message key="jdnt_sliderPanel.readMore"/></c:set>
</c:if>

<c:if test="${not empty title}">
    <h1>Title: ${title}</h1>
</c:if>
<c:if test="${not empty subtitle}">
    <h2>Subtitle: ${subtitle}</h2>
</c:if>
<c:if test="${not empty summary}">
    <h3>Summary: ${summary}</h3>
</c:if>
<c:if test="${not empty link}">
    <a class="ms-layer btn-u" href="${link.url}"
       data-effect="bottom(40)"
       data-duration="2000"
       data-delay="1300"
       data-ease="easeOutExpo"
       alt="${title}"
            >${linkText}</a>
</c:if>

