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
<%-- edit view for the company --%>

<jcr:nodeProperty node="${currentNode}" name="jcr:title" var="title"/>
<jcr:nodeProperty node="${currentNode}" name="headline" var="headline"/>
<jcr:nodeProperty node="${currentNode}" name="industryCat" var="category"/>
<jcr:nodeProperty node="${currentNode}" name="thumbnail" var="thumb"/>


<%--Set variable for company descriptions and remove HTML tags--%>
<c:set var="description" value="${functions:removeHtmlTags(currentNode.properties.headline.string)}"/>

<div>
    <div class="edit-comp-img-cont">
        <c:if test="${not empty thumb}">
            <c:url value="${url.files}${thumb.node.path}" var="thumbURL"/>
            <img src="${thumbURL}" alt=""/>
        </c:if>
    </div>
    <div class="edit-comp-text-cont">
        <a href="<c:url value='${url.base}${currentNode.path}.html'/>"
           class="edit-comp-title">${fn:escapeXml(title.string)}</a>
        <div class="edit-comp-subtitle">${fn:replace(description, fn:substring(description, 50, fn:length(description)), ' ...')}</div>
    </div>
</div>


