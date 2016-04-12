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

<jcr:nodeProperty node="${currentNode}" name="pdfVersion" var="pdfVersion"/>
<c:if test="${not empty pdfVersion}">
    <c:set var="label" value="${currentNode.properties.downloadTitle.string}"/>
    <c:if test="${empty label}">
        <c:set var="label"><fmt:message key="jdmix_fileAttachment.label"/></c:set>
    </c:if>
    <p>
        <div>
        ${pdfVersion.node.name}
            <c:if test="${fn:containsIgnoreCase(pdfVersion.node.name, '.pdf')}">
                <a class="view-pdf" href="${pdfVersion.node.url}">
                    <strong>
                        <i class="fa fa-fw fa-eye" title="<fmt:message key="label.view"/>"></i>
                    </strong>
                </a>
            </c:if>
            &nbsp;
            <a href="${pdfVersion.node.url}">
                <strong>
                    <i class="fa fa-download" title="<fmt:message key="label.download"/>"></i>
                </strong>
            </a>
        </div>
    </p>
</c:if>