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

<c:set var="name" value="${currentNode.properties.firstname.string}&nbsp;${currentNode.properties.lastname.string}"/>
<c:set var="title" value="${currentNode.properties.function.string}"/>
<c:set var="bio" value="${currentNode.properties.biography.string}"/>
<c:set var="photo" value="${currentNode.properties.picture}"/>

<%-- use the itemCount parameter to decide if the image should be on the left or right --%>
<c:set var="count" value="${currentResource.moduleParams.itemCount}"/>
<c:choose>
    <c:when test="${count % 2 == 0}">
        <c:set var="layout" value="col-md-push-6 team-arrow-left"/>
    </c:when>
    <c:otherwise>
        <c:set var="layout" value="team-arrow-right"/>
    </c:otherwise>
</c:choose>

<div class="row team-v7 no-gutter equal-height-columns">
    <div class="col-md-6 ${layout}">
        <div class="dp-table">
            <div class="equal-height-column dp-table-cell team-v7-in" style="height: 463px;">
                <span class="team-v7-name">${name}</span>
                <span class="team-v7-position">${title}</span>
                ${bio}
                <ul class="list-inline social-icons-v1">
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-6 <c:if test="${count % 2 == 0}">col-md-pull-6 </c:if>team-v7-img">
        <c:choose>
            <c:when test="${empty photo}">
                <c:set var="photoUrl" value="${url.currentModule}/img/default_person_img.jpg"/>
            </c:when>
            <c:otherwise>
                <c:url var="photoUrl" value="${photo.node.url}"/>
            </c:otherwise>
        </c:choose>
            <img class="img-responsive full-width equal-height-column" src="${photoUrl}" alt="" style="height: 463px;">
    </div>
</div>

