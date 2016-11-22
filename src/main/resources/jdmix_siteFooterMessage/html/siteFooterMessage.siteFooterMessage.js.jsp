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

<c:set var="footerMessage" value="${renderContext.site.properties.footerMessage.string}"/>
<c:set var="privacyPolicyLinkText" value="${renderContext.site.properties.privacyPolicyLinkText.string}"/>
<c:set var="privacyLink" value="${renderContext.site.properties.privacyLink.string}"/>
<c:set var="termsLinkText" value="${renderContext.site.properties.termsLinkText.string}"/>
<c:set var="termsLink" value="${renderContext.site.properties.termsLink.string}"/>

<p>
<c:if test="${not empty footerMessage}">
    ${footerMessage}&nbsp;
</c:if>
<c:choose>
    <c:when test="${privacyLink == 'none'}">
        ${privacyPolicyLinkText}&nbsp;
    </c:when>
    <c:when test="${privacyLink == 'externalLink'}">
        <template:addCacheDependency node="${renderContext.site.properties.privacyPageExternalLink.node}"/>
        <a href="${renderContext.site.properties.privacyPageExternalLink.string}">${privacyPolicyLinkText}</a>
    </c:when>
    <c:when test="${privacyLink == 'link'}">
        <c:if test="${! empty privacyLink}">
            <template:addCacheDependency node="${renderContext.site.properties.privacyPageLink.node}"/>
            <c:url var="privacyPolicyLinkTextUrl" value="${renderContext.site.properties.privacyPageLink.node.url}" context="/"/>
            <a href="${privacyPolicyLinkTextUrl}">${privacyPolicyLinkText}</a>
        </c:if>
    </c:when>
    <c:when test="${privacyLink == 'modal'}">
        <c:set var="privacyModalMessage" value="${renderContext.site.properties.privacyModalMessage.string}"/>
        <a href="" data-toggle="modal" data-target="#myPrivacyModal">${privacyPolicyLinkText}</a>
    </c:when>
</c:choose>
<c:if test="${not empty privacyPolicyLinkText and not empty termsLinkText}">
    |&nbsp;
</c:if>
<c:choose>
    <c:when test="${termsLink == 'none'}">
        ${termsLinkText}
    </c:when>
    <c:when test="${termsLink == 'externalLink'}">

        <a href="${renderContext.site.properties.termsPageExternalLink.string}">${termsLinkText}</a>
    </c:when>
    <c:when test="${termsLink == 'link'}">
        <c:if test="${! empty privacyLink}">
            <template:addCacheDependency node="${renderContext.site.properties.termsPageLink.node}"/>
            <c:url var="termsLinkUrl" value="${renderContext.site.properties.termsPageLink.node.url}" context="/"/>

            <a href="${termsLinkUrl}">${termsLinkText}</a>
        </c:if>
    </c:when>
    <c:when test="${termsLink == 'modal'}">
        <c:set var="termsModalMessage" value="${renderContext.site.properties.termsModalMessage.string}"/>
        <a href="" data-toggle="modal" data-target="#myTermsModal">${termsLinkText}</a>
    </c:when>
</c:choose>
</p>