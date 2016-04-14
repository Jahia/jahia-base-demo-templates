<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%-- query view to locate company news --%>

<c:set var="boundComponent"
       value="${uiComponents:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:set var="limit" value="${currentNode.properties['limit'].string}"/>
<c:if test="${empty limit}">
    <c:set var="limit" value="3"/>
</c:if>

<%-- set the search query --%>
<c:set var="lastNewsStatement"
       value="select * from [jnt:news] as news where desc like '%${boundComponent.properties['jcr:title'].string}%' and ISDESCENDANTNODE(news,'${renderContext.mainResource.node.resolveSite.path}')  order by news.[date] desc"/>

<query:definition var="listQuery" statement="${lastNewsStatement}" limit="${limit}"/>

<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="emptyListMessage"><fmt:message key="label.noNewsFound"/></c:set>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}"/>
<c:set target="${moduleMap}" property="subNodesView" value="company"/>

<template:addCacheDependency flushOnPathMatchingRegexp="${renderContext.mainResource.node.resolveSite.path}/.*"/>
<template:addCacheDependency node="${boundComponent}"/>