<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%-- TODO: Graphics are not lining up exactly with the timeline circle --%>
<%-- TODO: Layout issues when there is an entry longer than the others. Same issue as on jahia.com --%>

<template:addResources type="css" resources="shortcode_timeline1.css"/>

<ul class="timeline-v1">
    <c:set var="entries" value="${jcr:getChildrenOfType(currentNode, 'jnt:news')}"/>
    <c:forEach items="${entries}" var="entry" varStatus="item">
        <%-- TODO: by placing <li>and top <div> tags here in the list the timeline displays properly in edit mode --%>
        <li <c:if test="${item.count%2 == 0}">class="timeline-inverted"</c:if> >
            <div class="timeline-badge primary"><i class="glyphicon glyphicon-record"></i></div>
            <div class="timeline-panel">
            <template:module node="${entry}" view="alternating" nodeTypes="jnt:news" editable="true"/>
                </div>
        </li>
    </c:forEach>
    <li class="clearfix" style="float: none;"></li>
</ul>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="jnt:news"/>
</c:if>
