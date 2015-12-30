<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jahia" uri="http://www.jahia.org/tags/templateLib" %>

<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsImage" value="${currentNode.properties['image']}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<c:set var="description" value="${currentNode.properties['desc']}" />
<fmt:formatDate pattern="MMMM" dateStyle="long" value="${currentNode.properties['date'].time}" var="newsMonth"/>
<fmt:formatDate pattern="d/M/yy" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>
<div class="col-md-4 sm-margin-bottom-30">
    <div class="news-v2-badge">
        <img class="img-responsive" src="assets/img/main/img12.jpg" alt="">
        <p>
            <span>26</span>
            <small>Feb</small>
        </p>
    </div>
    <div class="news-v2-desc bg-color-light">
        <h3><a href="#">Corrupti Quos Dolores</a></h3>
        <small>By Admin | <a class="color-inherit" href="#">16 Comments</a> | In <a href="#">Web Trends</a></small>
        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores.</p>
    </div>
</div>