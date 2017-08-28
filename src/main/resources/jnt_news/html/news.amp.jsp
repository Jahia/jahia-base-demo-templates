<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:if test="${!empty jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}">
	<c:url value='${url.base}${jcr:getParentOfType(renderContext.mainResource.node, "jnt:page").path}.html'
		   var="action"/>
</c:if>
<c:if test="${empty jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}">
	<c:set var="action">javascript:history.back()</c:set>
</c:if>

<jcr:nodeProperty node="${currentNode}" name="jcr:title" var="title"/>
<c:set var="newsTitleEscaped" value="${not empty title ? fn:escapeXml(title.string) : ''}"/>
<jcr:nodeProperty node="${currentNode}" name="desc" var="newsDesc"/>

<jcr:nodeProperty node="${currentNode}" name="date" var="newsDate"/>
<jcr:nodeProperty var="image" node="${currentNode}" name="image"/>

<a class="btn btn-primary" href="${action}" title="<fmt:message key="jdmix_backLink.back"/>">
	<i class="icon-chevron-left icon-white"></i> <fmt:message key="jdmix_backLink.back"/> </a>

<article class="news">

	<div class="media-body">
		<div class="headline"><h1>${title.string}</h1></div>
		<span class="btn btn-default"><fmt:formatDate
			value="${newsDate.time}" type="both" dateStyle="full" timeStyle="long"/></span></div>

	<div class="media-text-big">
		${newsDesc.string}
	</div>
	<c:if test="${! empty image}">
		<c:set var="width" value="${image.node.properties['j:width'].long}"/>
		<c:set var="height" value="${image.node.properties['j:height'].long}"/>
		<figure>
			<amp-img src="<c:url value="${image.node.url}" context="/"/>" width="${width}" height="${height}">
				<noscript>
					<img src="<c:url value="${image.node.url}" context="/"/>" alt="${image.node.displayableName}">
				</noscript>
			</amp-img>
		</figure>
	</c:if>

</article>