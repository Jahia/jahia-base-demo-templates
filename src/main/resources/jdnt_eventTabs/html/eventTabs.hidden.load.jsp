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

<%@ page import="java.util.Calendar" %>


<c:set var="view" value="condensed"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="YYYY-MM-DD" var="today"/>


<c:set var="filter" value="${currentNode.properties['filter']}"/>
<c:if test="${not empty filter}">
    <c:set var="filterQuery" value="and event.[j:defaultCategory] = '${filter.string}'"/>
</c:if>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>

<%-- set componentId variable to in order to make each carousel unique on the page. These will be used to define carousel div id and its nav controls --%>
<c:set var="componentId" value="${currentNode.identifier}"/>

<%-- get the starting page for the search --%>
<c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
<c:if test="${empty startNodePath}">
    <c:set var="startNodePath" value="${currentNode.resolveSite.path}"/>
</c:if>

<c:if test="${not empty title}">
    <div class="headline"><h2>${title}</h2></div>
</c:if>

<div id="${componentId}" class="tab-v1">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#upcoming" data-toggle="tab"><fmt:message key="jdnt_eventTabs.upcoming"/></a></li>
        <li><a href="#past" data-toggle="tab"><fmt:message key="jdnt_eventTabs.past"/></a></li>
    </ul>
    <div class="tab-content condensed-list">
        <div class="tab-pane fade in active" id="upcoming">
            <c:set var="sqlQuery"
                   value="select * from [jnt:event] as event where isdescendantnode(event, ['${startNodePath}'])
            ${filterQuery}
         and event.[startDate] >= CAST('${today}T00:00:00.000Z' AS DATE)
         order by event.[startDate] asc"/>
            <jcr:sql var="events"
                     sql="${sqlQuery}"/>
            <c:forEach items="${events.nodes}" var="event" varStatus="item">
                <template:module view="${view}" path="${event.path}"/>
            </c:forEach>

        </div>
        <div class="tab-pane fade in" id="past">
            <c:set var="sqlQuery"
                   value="select * from [jnt:event] as event where isdescendantnode(event, ['${startNodePath}'])
            ${filterQuery}
         and event.[startDate] < CAST('${today}T00:00:00.000Z' AS DATE)
         order by event.[startDate] asc"/>
            <jcr:sql var="events"
                     sql="${sqlQuery}"/>
            <c:forEach items="${events.nodes}" var="event" varStatus="item">
                <template:module view="${view}" path="${event.path}"/>
            </c:forEach>
        </div>
    </div>
</div>
