<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
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

<%-- Get the title of the carousel, if exists display above carousel --%>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:if test="${not empty title}">
    <div class="headline"><h2>${title}</h2></div>
</c:if>

<%-- get the number of columns from the properties, if empty set to 3 columns--%>
<c:set var="numColumns" value="${currentNode.properties['numColumns'].string}"/>
<c:if test="${empty numColumns}">
    <c:set var="numColumns" value="3"/>
</c:if>
<%-- set the columnd width based on 12 for a full width, divided by number of columns selected --%>
<c:set var="colWidth">
    <fmt:formatNumber type="number" maxFractionDigits="0" value="${12/numColumns}" />
</c:set>

    <c:set var="highlights" value="${jcr:getChildrenOfType(currentNode, 'jdnt:highlight')}"/>
    <c:forEach items="${highlights}" var="highlight" varStatus="item">
        <c:if test="${item.count%numColumns == 1}">
            <div class="row margin-bottom-30">
        </c:if>
        <div class="col-md-${colWidth}">
            <template:module node="${highlight}" nodeTypes="jdnt:highlight" editable="true"/>
        </div>
        <c:if test="${item.count%numColumns == 0 or item.last}">
            </div>
        </c:if>
    </c:forEach>
    <c:if test="${renderContext.editMode}">
        <template:module path="*" nodeTypes="jdnt:highlight"/>
    </c:if>




