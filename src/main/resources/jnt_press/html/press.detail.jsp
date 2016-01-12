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
<c:set var="body" value="${currentNode.properties['body']}"/>
<c:set var="pressTitle" value="${currentNode.properties['jcr:title']}"/>
<fmt:formatDate pattern="MMMM dd, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}"
                var="pressDate"/>


    <!-- News Detail -->

        <!-- News v3 -->
        <div class="news-v3 bg-color-white margin-bottom-30">
            <h2>${pressTitle.string}</h2>
            <div class="news-v3-in">
                <ul class="list-inline posted-info">
                    <%-- news categories here?                    <li>In <a href="#">Design</a></li> --%>
                    <li>Posted ${pressDate}</li>
                </ul>
                ${body.string}
            </div>

                    </div>

<%-- set up the back navigation --%>
        <c:set var="parentUrl">javascript:history.back()</c:set>
                    <p>
    <a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
            class="icon-line-arrow-left"></i><fmt:message key="jdnt_news.back"/></span></a>
                    </p>


