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

<%-- get the bottom margin size --%>
<c:set var="bottomMargin" value="${currentNode.properties['bottomMargin'].string}"/>
<%-- if empty default to 30 pixels --%>
<c:if test="${empty bottomMargin}">
    <c:set var="bottomMargin" value="30"/>
</c:if>
<c:choose>
    <c:when test="${bottomMargin == 'No margin'}">
        <c:set var="marginClass" value=""/>
    </c:when>
    <c:otherwise>
        <c:set var="marginClass" value=" margin-bottom-${bottomMargin}"/>
    </c:otherwise>
</c:choose>


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
<%-- set the column width based on 12 for a full width, divided by number of columns selected --%>
<c:set var="colWidth">
    <fmt:formatNumber type="number" maxFractionDigits="0" value="${12/numColumns}" />
</c:set>

<c:set var="resourceReadOnly" value="${currentResource.moduleParams.readOnly}"/>
<%-- Displaying the view of inherited nodetype jnt:contentList and this view is loading all subnodes,
                                        the view is setting modulemap that we get from the included template header --%>
<template:include view="hidden.header"/>
<c:set var="isEmpty" value="true"/>
<c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}"
           varStatus="item">
    <%-- if this is the start of a new row create a new row div --%>
        <c:if test="${item.count%numColumns == 1}">
        <div class="row${marginClass}">
        </c:if>
        <div class="col-md-${colWidth}">
        <template:module node="${subchild}" view="${moduleMap.subNodesView}"
                         editable="${moduleMap.editable && !resourceReadOnly}"/>
        </div>
    <%-- if this is the end of a row or the last highlight in the list, close the row div --%>
        <c:if test="${item.count%numColumns == 0 or item.last}">
            </div>
        </c:if>
    <c:set var="isEmpty" value="false"/>
    </c:forEach>

<%-- If the list is empty then we will display a sample imgView and default view Highlight --%>
<c:if test="${not empty moduleMap.emptyListMessage and (renderContext.editMode or moduleMap.forceEmptyListMessageDisplay) and isEmpty}">
    <%-- Sample imgView Highlight --%>
    <div class="row${marginClass}">
        <div class="col-md-${colWidth}">
            <div class="thumbnails thumbnail-style thumbnail-kenburn">
                <div class="thumbnail-img">
                    <div class="overflow-hidden">
                        <img class="img-responsive" src="${url.currentModule}/img/background.jpg" alt="">
                    </div>
                    <a class="btn-more hover-effect" href="#" alt=""><fmt:message key="jdnt_highlight.readmore"/> +</a>
                </div>
                <div class="caption">

                    <h3><a class="hover-effect" href="#"><fmt:message key="jdnt_highlight.sampleImgTitle"/></a></h3>

                    <p><fmt:message key="jdnt_highlight.sampleBody"/></p>
                </div>
            </div>

        </div>
<%-- Sample default view highlight --%>
    <div class="col-md-${colWidth}">
        <div class="service">
            <a href="#"><i class="fa fa-chevron-down service-icon"></i></a>

            <div class="desc">
                <h4><fmt:message key="jdnt_highlight.sampleTitle"/></h4>

                <p><fmt:message key="jdnt_highlight.sampleBody"/></p>
                <a href="#" alt=""><fmt:message key="jdnt_highlight.readmore"/></a>
            </div>

        </div>
    </div>
</div>
</c:if>
<%-- Add the add new content item button if in edit mode --%>
<c:if test="${moduleMap.editable and renderContext.editMode && !resourceReadOnly}">
    <%-- limit to adding jdnt:highlight nodes to the list --%>
        <template:module path="*" nodeTypes="jdnt:highlight"/>
    </c:if>
<template:include view="hidden.footer"/>



