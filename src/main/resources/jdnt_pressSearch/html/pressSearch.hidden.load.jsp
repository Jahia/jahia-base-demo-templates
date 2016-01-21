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

    <c:set var="view" value="default"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>

<%-- get the number of tabs to display --%>
<c:set var="numTabs" value="${currentNode.properties['numTabs'].string}"/>
<c:if test="${empty numTabs}">
    <c:set var="numTabs" value="3"/>
</c:if>

<c:set var="filter" value="${currentNode.properties['filter']}"/>
<c:if test="${not empty filter}">
    <c:set var="filterQuery" value="and press.[j:defaultCategory] = '${filter.string}'"/>
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
        <li class="active"><a href="#${thisYear}" data-toggle="tab">${thisYear}</a></li>
        <c:forEach var="i" begin="1" end="${numTabs-1}">
        <li><a href="#${thisYear-i}" data-toggle="tab">${thisYear-i}</a></li>
        </c:forEach>
        <li><a href="#Older" data-toggle="tab">Older</a></li>
    </ul>
    <div class="tab-content condensed-list">
        <div class="tab-pane fade in active" id="${thisYear}">
            <c:set var="sqlQuery" value="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
            ${filterQuery}
         and press.[date] >= CAST('${thisYear}-01-01T00:00:00.000Z' AS DATE)
            AND press.[date] <= CAST('${thisYear}-12-31T23:59:59.999Z' AS DATE)
         order by press.[date] desc"/>
            <jcr:sql var="pressReleases"
                     sql="${sqlQuery}"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="${view}" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>

        </div>
        <%-- create tab for each year --%>
        <c:forEach var="i" begin="1" end="${numTabs-1}">
            <div class="tab-pane fade in" id="${thisYear-i}">
            <jcr:sql var="pressReleases"
                     sql="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
                         ${filterQuery}
         and press.[date] >= CAST('${thisYear-i}-01-01T00:00:00.000Z' AS DATE)
            AND press.[date] <= CAST('${thisYear-i}-12-31T23:59:59.999Z' AS DATE)
         order by press.[date] desc"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="${view}" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>
                  </div>
            </c:forEach>
        <%-- create tab for items older than the last year tab --%>
        <div class="tab-pane fade in" id="Older">
            <jcr:sql var="pressReleases"
                     sql="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
                     ${filterQuery}
         and press.[date] <= CAST('${thisYear-numTabs+1}-01-01T00:00:00.000Z' AS DATE)
         order by press.[date] desc"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="${view}" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>

        </div>
    </div>
</div>
