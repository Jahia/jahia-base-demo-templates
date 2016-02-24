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
<c:if test="${nodePosition == 1}">
    <div class="headline"><h2><fmt:message key="jnt_news.featured"/></h2></div>
    <div class="news-v3 margin-bottom-20">
</c:if>

<div class="row margin-bottom-20">
    <div class="col-sm-5 sm-margin-bottom-20">
        <c:if test="${not empty newsImage}">
            <a href="${detailUrl}"><img class="img-responsive" src="${newsImage.url}" alt="${newsTitle}"></a>
        </c:if>
    </div>
    <div class="col-sm-7 news-v3">
        <div class="news-v3-in-sm no-padding">
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
            <%--          <ul class="post-shares">
                          <li>
                              <a href="#">
                                  <i class="rounded-x icon-speech"></i>
                                  <span>5</span>
                              </a>
                          </li>
                          <li><a href="#"><i class="rounded-x icon-share"></i></a></li>
                          <li><a href="#"><i class="rounded-x icon-heart"></i></a></li>
                      </ul> --%>
        </div>
    </div>
</div>
<%-- if not the last item put a separator in place --%>
<c:if test="${not last}">
    <div class="clearfix margin-bottom-20">
        <hr>
    </div>
</c:if>
<c:if test="${last}">
    </div>
</c:if>
