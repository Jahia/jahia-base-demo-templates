<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>
<fmt:formatDate pattern="dd MMM, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}" var="newsDate"/>

<ul class="list-inline posted-info">
    <%-- display tags --%>
    <jcr:nodeProperty node="${currentNode}" name="j:tagList" var="tags"/>
    <c:forEach items="${tags}" var="tag" varStatus="status">
        <li><c:if test="${status.first}"><fmt:message key="jnt_news.in"/></c:if>&nbsp;${tag.string}</li>
    </c:forEach>
    <li>Posted ${newsDate}</li>
</ul>