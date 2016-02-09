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

<%-- get the starting page for the search --%>
<c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>
<c:if test="${empty startNodePath}">
    <c:set var="startNodePath" value="${currentNode.resolveSite.path}"/>
</c:if>

<c:set var="searchStatement"
               value="select * from [jdnt:company] as comp where isdescendantnode(comp, ['${startNodePath}'])"/>
<%--
<jcr:sql var="companies"
         sql="${searchStatement}"/>
--%>
<query:definition var="listQuery" statement="${searchStatement}" />

<c:set target="${moduleMap}" property="editable" value="false" />
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" />
<c:set target="${moduleMap}" property="subNodesView" value="default" />
