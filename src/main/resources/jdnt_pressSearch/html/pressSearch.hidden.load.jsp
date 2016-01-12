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

<c:set var="pageView"><%= ((String) request.getParameter("pageView"))%>
</c:set>
    <c:set var="view" value="default"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>
<c:set var="lastYear" value="${thisYear-1}"/>
<c:set var="yearBefore" value="${lastYear-1}"/>

<%-- get the starting page for the search --%>
<c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
<c:if test="${empty startNodePath}">
    <c:set var="startNodePath" value="${currentNode.resolveSite.path}"/>
</c:if>

<div class="tab-v1">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#${thisYear}" data-toggle="tab">${thisYear}</a></li>
        <li><a href="#${lastYear}" data-toggle="tab">${lastYear}</a></li>
        <li><a href="#${yearBefore}" data-toggle="tab">${yearBefore}</a></li>
        <li><a href="#Older" data-toggle="tab">Older</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="${thisYear}">
            <jcr:sql var="pressReleases"
                     sql="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
         and press.[date] >= CAST('${thisYear}-01-01T00:00:00.000Z' AS DATE)
            AND press.[date] <= CAST('${thisYear}-12-31T23:59:59.999Z' AS DATE)
         order by press.[date] desc"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="default" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>

        </div>
        <div class="tab-pane fade in" id="${lastYear}">
            <jcr:sql var="pressReleases"
                     sql="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
         and press.[date] >= CAST('${lastYear}-01-01T00:00:00.000Z' AS DATE)
            AND press.[date] <= CAST('${lastYear}-12-31T23:59:59.999Z' AS DATE)
         order by press.[date] desc"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="default" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>
                  </div>
        <div class="tab-pane fade in" id="${yearBefore}">
            <jcr:sql var="pressReleases"
                     sql="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
         and press.[date] >= CAST('${yearBefore}-01-01T00:00:00.000Z' AS DATE)
            AND press.[date] <= CAST('${yearBefore}-12-31T23:59:59.999Z' AS DATE)
         order by press.[date] desc"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="default" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>
        </div>
        <div class="tab-pane fade in" id="Older">
            <jcr:sql var="pressReleases"
                     sql="select * from [jnt:press] as press where isdescendantnode(press, ['${startNodePath}'])
         and press.[date] <= CAST('${yearBefore}-01-01T00:00:00.000Z' AS DATE)
         order by press.[date] desc"/>
            <c:forEach items="${pressReleases.nodes}" var="pressRelease" varStatus="item">
                    <template:module view="default" path="${pressRelease.path}">
                        <template:param name="last" value="${item.last}"/>
                    </template:module>
            </c:forEach>

        </div>
    </div>
</div>
