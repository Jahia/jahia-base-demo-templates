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
            <%-- display tags --%>
            <jcr:nodeProperty node="${currentNode}" name="j:tagList" var="tags"/>
            <c:forEach items="${tags}" var="tag" varStatus="status">
                <li><c:if test="${status.first}"><fmt:message key="jnt_news.in"/></c:if>&nbsp;${tag.string}</li>
            </c:forEach>
                    <li>Posted ${newsDate}</li>
                </ul>
                ${description.string}
            </div>

                    </div>

<%-- set up the back navigation --%>
        <c:set var="parentUrl">javascript:history.back()</c:set>
                    <p>
    <a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
            class="icon-line-arrow-left"></i><fmt:message key="jdnt_news.back"/></span></a>
                    </p>


