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
<div  id="loginBox" class="pull-right"/>
<c:if test="${! renderContext.editMode}">
    <c:if test="${! renderContext.loggedIn}">
        <c:set var="siteNode" value="${currentNode.resolveSite}"/>

        <c:if test="${! jcr:isNodeType(siteNode, 'genericmix:hideLoginButton')}">
            <div class="pull-right"><a id="login" href="#loginForm" role="button" data-toggle="modal" data-target="#loginForm"><i class="fa fa-user"></i> <fmt:message
                    key="loginForm.loginbutton.label"/></a>
            </div>

            <!-- Modal -->
            <div id="loginForm" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" id="bodyLogin">

                        <div class="modal-body">
                            <ui:loginArea>
                                <c:if test="${not empty param['loginError']}">
                                    <div class="alert alert-error"><fmt:message
                                            key="${param['loginError'] == 'account_locked' ? 'message.accountLocked' : 'message.invalidLogin'}"/></div>
                                </c:if>


                                <table class="formTable" cellpadding="0" cellspacing="1" border="0">
                                    <tbody><tr>
                                        <th>
                                            <label for="username" class="control-label"><fmt:message
                                                    key="label.username"/></label>
                                        </th>
                                        <td>
                                            <input type="text" value="" id="username" name="username"
                                                   class="input-icon input-icon-first-name"
                                                   placeholder="<fmt:message key="label.username"/>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label for="password" class="control-label"><fmt:message
                                                    key="label.password"/></label>
                                        </th>
                                        <td>
                                            <input type="password" name="password" id="password"
                                                   class="input-icon input-icon-password"
                                                   placeholder="<fmt:message key="label.password"/>">
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <p>

                                <p>
                                    <label for="useCookie" class="checkbox">
                                        <input type="checkbox" id="useCookie" name="useCookie"/>
                                        <fmt:message key="loginForm.rememberMe.label"/>
                                    </label>
                                </p>

                                <p class="text-right">
                                    <button class="btn btn-primary"><i class="fa fa-check"></i> <fmt:message
                                            key='loginForm.loginbutton.label'/>
                                    </button>
                                </p>

                            </ui:loginArea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="label.close"/></button>
                        </div>
                    </div>

                </div>
            </div>

        </c:if>
    </c:if>
</c:if>
<c:if test="${renderContext.loggedIn}">
    <div class="user-box dropdown pull-right">

        <jcr:node var="userNode" path="${currentUser.localPath}" />
        <jcr:nodeProperty var="picture" node="${userNode}" name="j:picture"/>
        <c:set var="firstname" value="${userNode.properties['j:firstName'].string}"/>
        <c:set var="lastname" value="${userNode.properties['j:lastName'].string}"/>

        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            ${fn:escapeXml(empty firstname and empty lastname ? userNode.name : firstname)}&nbsp;${fn:escapeXml(lastname)} <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <c:if test="${!renderContext.settings.distantPublicationServerMode
and renderContext.mainResource.node.properties['j:originWS'].string ne 'live'
and not jcr:isNodeType(renderContext.mainResource.node.resolveSite, 'jmix:remotelyPublished')
}">
                <c:if test="${! renderContext.liveMode}">
                    <li>
                        <a href="<c:url value='${url.live}'/>">
                            <i class="fa fa-fw fa-eye"></i>
                            <fmt:message key="label.live"/>
                        </a>
                    </li>
                </c:if>
                <c:if test="${! renderContext.previewMode && jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess')}">
                    <li>
                        <a href="<c:url value='${url.preview}'/>">
                            <i class="fa fa-fw fa-eye-slash"></i>
                            <fmt:message key="label.preview"/>
                        </a>
                    </li>
                </c:if>
                <c:if test="${! renderContext.editMode && jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess')}">
                    <li>
                        <a href="<c:url value='${url.edit}'/>">
                            <i class="fa fa-fw fa-edit"></i>
                            <fmt:message key="label.editMode"/>
                        </a>
                    </li>
                </c:if>
                <c:if test="${! renderContext.editMode && !jcr:hasPermission(renderContext.mainResource.node, 'editModeAccess') && jcr:hasPermission(renderContext.mainResource.node, 'contributeModeAccess')}">
                    <li>
                        <a href="<c:url value='${url.contribute}'/>">
                            <i class="fa fa-fw fa-edit"></i>
                            <fmt:message key="label.contribute"/>
                        </a>
                    </li>
                </c:if>
            <li>
                <a href="<c:url value='${url.logout}'/>">
                    <i class="fa fa-fw fa-power-off"></i>
                    <fmt:message key="logout"/>
                </a>
            </li>
        </ul>
    </div>
</c:if>
</c:if>
</div>