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
<template:addResources type="javascript" resources="custom/modal.js"/>

<c:set var="privacyModalMessage" value="${currentNode.properties.privacyModalMessage.string}"/>
<c:set var="termsModalMessage" value="${currentNode.properties.termsModalMessage.string}"/>

<template:include view="siteFooterMessage.js"/>

<c:if test="${! empty privacyModalMessage}">
    <div id="myPrivacyModal" class="modal fade" role="dialog" style="display: none">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">${renderContext.site.properties.privacyPolicyLinkText.string}</h4>
                </div>
                <div class="modal-body">
                        ${privacyModalMessage}
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${! empty termsModalMessage}">
    <div id="myTermsModal" class="modal fade" role="dialog" style="display: none">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">${renderContext.site.properties.termsLinkText.string}</h4>
                </div>
                <div class="modal-body">
                        ${termsModalMessage}
                </div>
            </div>
        </div>
    </div>
</c:if>