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
<%-- TODO: Update for automatic list ordering -- %>

<div class="container content" id="leadership">
    <c:set var="people" value="${jcr:getChildrenOfType(currentNode, 'jnt:person')}"/>
    <c:choose>
        <%-- if there are no person modules added yet, show a placeholder --%>
        <c:when test="${fn:length(people) == 0}">
            <div class="row content-xs">
                <div class="col-md-3">
                    <div class="portrait">
                        <div class="portrait-bg">
                            <img src="${url.currentModule}/img/default_person_img.jpg" alt="" />
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="title">Sample Person</div>
                    <div class="subtitle color-green">Placeholder</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia <strong>deserunt</strong> mollit anim id est laborum.</p>

                    <ul class="list-inline team-social">
                        <li><a data-placement="top" data-toggle="tooltip" class="fb tooltips" data-original-title="Facebook" href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a data-placement="top" data-toggle="tooltip" class="tw tooltips" data-original-title="Twitter" href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a data-placement="top" data-toggle="tooltip" class="gp tooltips" data-original-title="Google plus" href="#" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <hr class="devider devider-dotted">
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <%-- for each person show the default view --%>
            <c:forEach items="${people}" var="person" varStatus="item">
                <template:module node="${person}" nodeTypes="jnt:person" editable="true"/>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="jnt:person"/>
</c:if>
