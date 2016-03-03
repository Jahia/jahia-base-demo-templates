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

<c:set var="siteNode" value="${renderContext.site}"/>
<c:if test="${jcr:isNodeType(siteNode, 'jdmix:style')}">
    <jcr:nodeProperty var="layout" node="${siteNode}" name="layout"/>
    <jcr:nodeProperty var="colorTheme" node="${siteNode}" name="colorTheme"/>

    <c:if test="${colorTheme.string == 'Dark'}"> dark</c:if>
    <c:if test="${layout.string == 'Boxed'}"> boxed-layout container</c:if>
</c:if>

