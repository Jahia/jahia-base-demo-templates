<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="logo" value="${currentNode.properties['logo'].node}"/>

<c:if test="${! empty logo}">
    <%-- ${logo.url} already adds the context the url
    so we need to tell the tag <c:url> not add the context a second time by specifying context="/" --%>
    <c:url var="logoUrl" value="${logo.url}" context="/"/>
    <c:url var="homePageURL" value="${renderContext.site.home.url}" context="/"/>

    <a href="${homePageURL}" class="logo"><img src="${logoUrl}" alt="Logo"></a>
</c:if>
