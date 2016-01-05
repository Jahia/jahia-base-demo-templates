<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jahia" uri="http://www.jahia.org/tags/templateLib" %>
<%-- TODO: Display News Categories --%>

<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsImage" value="${currentNode.properties['image'].node}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<c:set var="description" value="${currentNode.properties['desc']}"/>
<fmt:formatDate pattern="MMMM dd, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}"
                var="newsDate"/>


    <!-- News Detail -->

        <!-- News v3 -->
        <div class="news-v3 bg-color-white margin-bottom-30">
            <h2>${newsTitle.string}</h2>
            <c:if test="${not empty newsImage}">
                <img class="img-responsive full-width" src="${newsImage.url}" alt="${newsTitle}">
            </c:if>
            <div class="news-v3-in">
                <ul class="list-inline posted-info">
                    <%-- news categories here?                    <li>In <a href="#">Design</a></li> --%>
                    <li>Posted ${newsDate}</li>
                </ul>
                ${description.string}
            </div>

                    </div>

<%-- get the parent page for the back navigation --%>
<c:set var="parentPage" value="${jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}"/>
<c:choose>
    <c:when test="${! empty parentPage}">
        <c:url var="parentUrl" value='${parentPage.url}'/>
        <c:set var="parentTitle" value="${parentPage.properties['jcr:title'].string}"/>
    </c:when>
    <c:otherwise>
        <c:set var="parentUrl">javascript:history.back()</c:set>
    </c:otherwise>
</c:choose>
                    <p>
    <a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
            class="icon-line-arrow-left"></i><fmt:message key="jdnt_news.back"/>&nbsp;${parentTitle}</span></a>
                    </p>


