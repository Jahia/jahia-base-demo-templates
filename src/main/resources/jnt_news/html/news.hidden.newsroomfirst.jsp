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
<c:set var="newsTitle" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['desc'].string}"/>
<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>

<fmt:formatDate pattern="MMMM dd, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}"
                var="newsDate"/>

<%-- if the first node for the top level --%>
<c:choose>
    <c:when test="${nodePosition == 1 && topLevel == 'first'}">
        <div class="news-v3 margin-bottom-20">
            <c:if test="${not empty newsImage}">
                <a href="${detailUrl}"><img class="img-responsive full-width" src="${newsImage.url}" alt="${newsTitle}"></a>
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
                <h2><a href="${detailUrl}">${newsTitle}</a></h2>
                <p>${fn:substring(functions:removeHtmlTags(description), 0, 300)}...</p>
                    <%--     <ul class="post-shares">
                             <li>
                                 <a href="#">
                                     <i class="rounded-x icon-speech"></i>
                                     <span>26</span>
                                 </a>
                             </li>
                             <li>
                                 <a href="#">
                                     <i class="rounded-x icon-share"></i>
                                     <span>98</span>
                                 </a>
                             </li>
                             <li>
                                 <a href="#">
                                     <i class="rounded-x icon-heart"></i>
                                     <span>30</span>
                                 </a>
                             </li>
                         </ul>--%>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <%-- if the start of the smaller story view --%>
        <c:if test="${nodePosition == 2}">
            <div class="news-v3 margin-bottom-20">
        </c:if>
        <%-- if the first in a 3 column row --%>
        <c:if test="${nodePosition%3 == 2}">
            <div class="row news-v2">
        </c:if>
        <div class="col-md-4 sm-margin-bottom-20">
            <div class="news-v2-badge">
                <a href="${detailUrl}"><img class="img-responsive" src="${newsImage.url}" alt="${newsTitle}"></a>
                <p>
                    <span>26</span>
                    <small>Feb</small>
                </p>
            </div>
            <div class="news-v2-desc bg-color-light">
                <h3><a href="${detailUrl}">${newsTitle}</a></h3>
                <small>
                        <%-- display tags --%>
                    <jcr:nodeProperty node="${currentNode}" name="j:tagList" var="tags"/>
                    <c:forEach items="${tags}" var="tag" varStatus="status">
                        <c:if test="${status.first}"><fmt:message key="jnt_news.in"/></c:if>&nbsp;${tag.string}
                    </c:forEach>
                </small>
                    <%--            <small>By Admin | <a class="color-inherit" href="#">16 Comments</a> | In <a href="#">Web Trends</a></small>--%>
            </div>
        </div>
        <%-- if the last in a 3 column row --%>
        <c:if test="${nodePosition%3 == 1 || last}">
            </div>
        </c:if>
        <%-- if the end of the smaller section --%>
        <c:if test="${last}">
            </div>
        </c:if>
    </c:otherwise>
</c:choose>
