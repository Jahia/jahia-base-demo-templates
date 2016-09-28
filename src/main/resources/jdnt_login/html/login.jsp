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

<c:if test="${! renderContext.editMode}">
    <c:if test="${! renderContext.loggedIn}">
        <div class="pull-right"><a id="login" href="#loginForm" role="button" data-toggle="modal"
                                   data-target="#loginForm"><i class="fa fa-user"></i> <fmt:message
                key="loginForm.loginbutton.label"/></a>
        </div>
    </c:if>
</c:if>
<c:if test="${renderContext.loggedIn}">
    <div class="user-box dropdown pull-right">

        <jcr:node var="userNode" path="${currentUser.localPath}"/>
        <template:module view="hidden.loginForm" editable="false" node="${userNode}"/>

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