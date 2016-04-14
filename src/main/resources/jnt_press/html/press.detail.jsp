<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<c:set var="pressTitle" value="${currentNode.properties['jcr:title'].string}"/>
<jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="pressReleaseContainerCatKeys"/>

<h3><jcr:nodeProperty node="${currentNode}" name='jcr:title'/></h3>

<jcr:nodeProperty node="${currentNode}" name='date' var="datePress"/>
<h4 class="pressRealeseDate"><fmt:formatDate value="${currentNode.properties.date.time}" dateStyle="long"/></h4>

<div>${currentNode.properties.body.string}</div>
<template:include view="fileAttachment"/>
<c:if test="${!empty pressReleaseContainerCatKeys }">
    <span class="pressReleaseCategory"><strong>
        <fmt:message key='label.categories'/> :</strong>
           <c:forEach items="${pressReleaseContainerCatKeys}" var="category" varStatus="status">
               <c:if test="${not status.first}">,&nbsp</c:if>
               <template:module path="${category.node.path}" view="pressCategory" editable="false"/>
           </c:forEach>
    </span>
</c:if>
<br/>


<c:set var="parentUrl">javascript:history.back()</c:set>
<a href="${parentUrl}" class="button button-mini button-border button-rounded">
    <span><i class="icon-line-arrow-left"></i><fmt:message key="jdmix_backLink.back"/></span>
</a>
