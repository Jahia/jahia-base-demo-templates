<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<template:addResources type="css" resources="pages/page_search.css"/>
<template:addCacheDependency uuid="${currentNode.properties.result.string}"/>
<c:if test="${not empty currentNode.properties.result.node}">
    <c:url value='${url.base}${currentNode.properties.result.node.path}.html' var="searchUrl"/>
    <div class="search-block parallaxBg" style="background-position: 50% 16px;">
        <div class="container">
            <div class="col-md-6 col-md-offset-3">
                <h1>Discover <span class="color-theme">new</span> things</h1>

                <div class="input-group">
                    <s:form method="post" action="${searchUrl}">
                        <fmt:message key='search.startSearching' var="startSearching"/>
                        <s:term match="all_words" id="searchTerm" value="${startSearching}"
                                searchIn="siteContent,tags,files"
                                onfocus="if(this.value=='${startSearching}')this.value='';"
                                onblur="if(this.value=='')this.value='${startSearching}';" class="form-control"
                                placeholder="${startSearching}"/>
                        <s:site value="${renderContext.site.name}" includeReferencesFrom="systemsite" display="false"/>
                        <s:language value="${renderContext.mainResource.locale}" display="false"/>
					<span class="input-group-btn">
                        	<button class="btn-u btn-u-lg" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                    </s:form>
                </div>
                <a class="accordion-toggle collapsed" id="search-options" data-toggle="collapse" href="#advancedSearch"
                   aria-expanded="false">Advanced Search
                    <div class="arrow"></div>
                </a>
            </div>
        </div>
    </div>
</c:if>

