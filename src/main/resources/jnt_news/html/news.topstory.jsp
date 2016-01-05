<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jahia" uri="http://www.jahia.org/tags/templateLib" %>

<%-- TODO: display categories and/or tags --%>
<%-- TODO: remove html tags from the description --%>
<%-- TODO: check formatting, should ... indicate read more? --%>

<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsTitle" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}" />
<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>

<fmt:formatDate pattern="dd MMM, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>
<ul class="list-unstyled blog-latest-posts margin-bottom-20">
<li>
    <h3><a href="${detailUrl}">${newsTitle}</a></h3>
    <small>${newsDate} / <%-- categories <a href="#">Hi-Tech,</a> <a href="#">Technology</a>--%></small>
    <p>${fn:replace(description, fn:substring(description, 150, fn:length(description)), '... ')}</p>
</li>
    </ul>