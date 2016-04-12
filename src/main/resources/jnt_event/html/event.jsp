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

<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="startDate" value="${currentNode.properties['startDate'].time}"/>
<c:set var="endDate" value="${currentNode.properties['endDate'].time}"/>
<c:set var="location" value="${currentNode.properties['location'].string}"/>
<c:set var="body" value="${currentNode.properties['body'].string}"/>
<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>

<div class="eventsListItem"><!--start eventsListItem -->
    <div class="eventsInfoDate hidden-xs">
        <div class="eventsDateBadge margin-top-20">
            <p><fmt:formatDate value="${startDate}" pattern="dd" type="date"/><span><fmt:formatDate value="${startDate}"
                                                                                                    pattern="MMM"
                                                                                                    type="date"/></span>
            </p>
        </div>
    </div>
    <div class="eventsBody"><!--start eventsBody -->
        <div class=" shadow-wrapper">
            <div class="tag-box tag-box-v2 box-shadow shadow-effect-4">
                <!-- event title -->
                <h2><a href="${detailUrl}">${title}</a></h2>
                <!-- event type, date, location -->
                <ul class="list-inline">
                    <c:if test="${not empty currentNode.properties.eventsType}">
                        <li>
                            <button class="btn btn-xs rounded btn-primary" type="button"><fmt:message
                                    key='jnt_event.eventsType.${currentNode.properties.eventsType.string}'/></button>
                        </li>
                    </c:if>
                    <li><fmt:formatDate dateStyle="long" type="date"
                                        value="${startDate}"/>
                        <c:if test="${not empty endDate}">&nbsp;-&nbsp;<fmt:formatDate dateStyle="long" type="date"
                                                                                       value="${endDate}"/></c:if></li>
                    <li><i class="fa  fa-map-marker"></i>&nbsp;${location}</li>
                </ul>
                <!-- event body -->
                <p>${fn:substring(functions:removeHtmlTags(body), 0, 150)}...</p>

                <%-- event people if they exist --%>
                <c:if test="${jcr:isNodeType(currentNode, 'jdmix:hasPeople')}">
                    <template:include view="eventPeople"/>
                </c:if>

                <%-- event categories --%>
                <jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="cat"/>
                <c:if test="${cat != null}">
                    <ul class="list-inline">
                        <c:forEach items="${cat}" var="category">
                            <template:module path="${category.node.path}" view="eventCategory" editable="false"/>
                        </c:forEach>
                    </ul>
                </c:if>

            </div>
        </div>
    </div>

</div>

