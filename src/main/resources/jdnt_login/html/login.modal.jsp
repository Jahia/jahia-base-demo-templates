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
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="currentUser" type="org.jahia.services.usermanager.JahiaUser"--%>
<%--@elvariable id="currentAliasUser" type="org.jahia.services.usermanager.JahiaUser"--%>
<template:addResources type="css" resources="plugins/login-signup-modal-window/style.css"/>
<template:addResources type="javascript" resources="modernizr.js"/>
<template:addResources type="javascript" resources="plugins/login-signup-modal-window/main.js"/>
<c:set var="modalOption" value="${empty param['loginError'] ? 'hide' : 'show'}"/>

<c:if test="${! renderContext.editMode}">
    <c:if test="${! renderContext.loggedIn}">
        <c:set var="siteNode" value="${currentNode.resolveSite}"/>
        <!-- Modal -->
        <div id="loginForm" class="modal fade loginFormModal" role="dialog" modalOption="${modalOption}">
            <div class="cd-user-modal-container">
                <!-- Modal content-->
                <div id="cd-login" class="is-selected cd-form"> <!-- log in form -->
                    <ui:loginArea>
                        <c:if test="${not empty param['loginError']}">
                            <div class="alert alert-error"><fmt:message
                                    key="${param['loginError'] == 'account_locked' ? 'message.accountLocked' : 'message.invalidLogin'}"/></div>
                        </c:if>

                        <p class="fieldset">
                            <label class="image-replace cd-username" for="username">
                                <fmt:message key="label.username"/></label>
                            <input class="full-width has-padding has-border" id="username" name="username"
                                   type="text" placeholder="<fmt:message key="label.username"/>"/>
                            <span class="cd-error-message">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">
                                <fmt:message key="label.password"/></label>
                            <input class="full-width has-padding has-border" name="password" id="password"
                                   type="password" placeholder="<fmt:message key="label.password"/>"/>
                            <a href="javascript:void(0);" class="hide-password">Show</a>
                            <span class="cd-error-message">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <input type="checkbox" id="useCookie" name="useCookie" checked=""/>
                            <label for="useCookie"><fmt:message key="loginForm.rememberMe.label"/></label>
                        </p>

                        <p class="fieldset">
                            <input class="full-width btn btn-primary" type="submit" value="<fmt:message
                                    key='loginForm.loginbutton.label'/>"/>
                        </p>
                    </ui:loginArea>
                </div>
            </div>
        </div>
    </c:if>
</c:if>
