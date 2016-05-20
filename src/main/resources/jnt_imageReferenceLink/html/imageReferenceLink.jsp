<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<jcr:nodeProperty node="${currentNode}" name="j:node" var="reference"/>
<jcr:nodeProperty node="${currentNode}" name="j:target" var="target"/>
<jcr:nodeProperty node="${currentNode}" name="j:linknode" var="linkreference"/>
<jcr:nodeProperty node="${currentNode}" name="j:alternateText" var="title"/>
<jcr:nodeProperty node="${currentNode}" name="j:url" var="externalUrl"/>
<jcr:nodeProperty node="${currentNode}" name="j:linkTitle" var="linkTitle"/>

<c:set var="node" value="${reference.node}"/>
<%-- only display if image is available --%>
<c:if test="${not empty node}">
    <template:addCacheDependency node="${node}"/>
    <c:url var="imageUrl" value="${node.url}" context="/"/>

    <%-- check that the url is valie --%>
    <c:if test="${not empty target.string}"><c:set var="target"> target="${target.string}"</c:set></c:if>
    <c:set var="linknode" value="${linkreference.node}"/>

    <c:if test="${not empty linknode}">
        <template:addCacheDependency node="${linknode}"/>
        <c:url var="linkUrl" value="${url.base}${linknode.path}.html"/>
        <c:set var="linkTitle"> title="${linknode.displayableName}"</c:set>
    </c:if>
    <c:if test="${empty linkUrl and not empty externalUrl}">
        <c:if test="${!functions:matches('^[A-Za-z]*:.*', externalUrl.string)}">
            <c:set var="protocol">http://</c:set>
        </c:if>
        <c:url var="linkUrl" value="${protocol}${externalUrl.string}"/>
        <c:if test="${not empty linkTitle.string}">
            <c:set var="linkTitle"> title="${linkTitle.string}"</c:set>
        </c:if>
    </c:if>
    <c:if test="${!empty linkUrl}">
        <a href="${linkUrl}" ${target} ${linkTitle}>
    </c:if>

    <img src="${imageUrl}" alt="${fn:escapeXml(not empty title.string ? title.string : currentNode.name)}" width="100%" height="auto"/>

    <c:if test="${!empty linkUrl}">
        </a>
    </c:if>
</c:if>
<c:if test="${empty node}">
    <c:if test="${not empty reference}">
        <template:addCacheDependency node="${reference.node}"/>
    </c:if>
    <c:if test="${renderContext.editMode}">
        <fmt:message key="label.empty"/>
    </c:if>
</c:if>