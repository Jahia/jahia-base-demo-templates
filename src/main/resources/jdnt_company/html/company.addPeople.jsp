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
<%-- addPeople view of Company --%>

<jcr:nodeProperty node="${currentNode}" name="boxTitle" var="boxTitle"/>
<%-- if the hasPeople Mixin has been selected show people--%>
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:hasPeople')}">

    <div class="tag-box tag-box-v2 box-shadow shadow-effect-1">
        <div class="headline"><h2>${boxTitle.string}</h2></div>
        <ul class="list-unstyled margin-bottom-30">
            <template:area path="relatedPeople" nodeTypes="jnt:person">
                <template:param name="subNodesView" value="condensed"/>
            </template:area>
        </ul>
    </div>

</c:if>

<%-- if in edit mode show new node button --%>
<c:if test="${moduleMap.editable and renderContext.editMode && !resourceReadOnly}">
    <%-- limit to adding jnt:person nodes to the list --%>
    <template:module path="*" nodeTypes="jnt:person"/>
</c:if>