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

<c:set var="colName" value="${currentNode.name}"/>
<c:set var="layout" value="${currentNode.properties['layout'].string}"/>
<c:set var="bottomMargin" value="${currentNode.properties['bottomMargin'].boolean}"/>
<c:if test="${bottomMargin == 'true'}">
    <c:set var="style" value=" nobottommargin"/>
</c:if>

<%--
 1
     1-2_1-2
 2-3_1-3
 1-3_2-3
 1-4_3-4
 3-4_1-4
 1-4_2-4_1-4
 1-3_1-3_1-3 col-md-4
 1-4_1-4_1-4_1-4 col-md-3 col-sm-6
--%>

<div class="container clearfix">
    <c:choose>
        <c:when test="${layout == '1'}">
            <div class="col_full${style}"><template:area path="${colName}"/></div>
        </c:when>

        <c:when test="${layout == '1-2_1-2'}">
            <div class="col-md-6${style}"><template:area path="${colName}"/></div>
            <div class="col-md-6"><template:area path="${colName}-2"/></div>
        </c:when>

        <c:when test="${layout == '1-3_2-3'}">
            <div class="col-md-4"><template:area path="${colName}"/></div>
            <div class="col-md-8"><template:area path="${colName}-2"/></div>
        </c:when>

        <c:when test="${layout == '2-3_1-3'}">
            <div class="col-md-8"><template:area path="${colName}"/></div>
            <div class="col-md-8"><template:area path="${colName}-2"/></div>
        </c:when>

        <c:when test="${layout == '1-4_3-4'}">
            <div class="col-md-3"><template:area path="${colName}"/></div>
            <div class="col-md-9"><template:area path="${colName}-2"/></div>
        </c:when>

        <c:when test="${layout == '3-4_1-4'}">
            <div class="col-md-9"><template:area path="${colName}"/></div>
            <div class="col-md-3"><template:area path="${colName}-2"/></div>
        </c:when>

        <c:when test="${layout == '1-4_2-4_1-4'}">
            <div class="col-md-3"><template:area path="${colName}"/></div>
            <div class="col-md-6"><template:area path="${colName}-2"/></div>
            <div class="col-md-3"><template:area path="${colName}-3"/></div>
        </c:when>

        <c:when test="${layout == '1-3_1-3_1-3'}">
            <div class="col-md-4"><template:area path="${colName}"/></div>
            <div class="col-md-4"><template:area path="${colName}-2"/></div>
            <div class="col-md-4"><template:area path="${colName}-3"/></div>
        </c:when>

        <c:when test="${layout == '1-4_1-4_1-4_1-4'}">
            <div class="col-md-3"><template:area path="${colName}"/></div>
            <div class="col-md-3"><template:area path="${colName}-2"/></div>
            <div class="col-md-3"><template:area path="${colName}-3"/></div>
            <div class="col-md-3"><template:area path="${colName}-4"/></div>
        </c:when>

        <c:otherwise>
            <c:if test="${renderContext.editMode}">
                <div class="col-md-12">
                    <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong><fmt:message key="jdnt_gridLayout.warning"/>!</strong>
                        <fmt:message key="jdnt_gridLayout.couldNotDisplaylayout"/> ${layout}.
                    </div>
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>
