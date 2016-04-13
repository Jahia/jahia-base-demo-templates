<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<template:addResources type="javascript" resources="owl.carousel.js"/>
<template:addResources type="javascript" resources="owl-carousel.js"/>
<template:addResources type="css" resources="owl.carousel.css"/>
<%-- query module to create owl carousel view of companies --%>

<%-- get the starting page for the search --%>
<c:choose>
    <c:when test="${not empty currentNode.properties['startPage']}">
        <c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
    </c:when>
    <c:otherwise>
        <c:set var="startNodePath" value="${renderContext.mainResource.node.resolveSite.path}"/>
    </c:otherwise>
</c:choose>


<%-- generate search query --%>
<c:set var="searchStatement"
       value="select * from [jdnt:company] as comp where isdescendantnode(comp, ['${startNodePath}'])"/>

<query:definition var="listQuery" statement="${searchStatement}"/>

<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}"/>
<c:set target="${moduleMap}" property="subNodesView" value="default"/>

<template:addCacheDependency flushOnPathMatchingRegexp="${startNodePath}/.*"/>