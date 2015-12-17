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

<div class="container-fluid">
    <c:set var="people" value="${jcr:getChildrenOfType(currentNode, 'jnt:person')}"/>
    <c:choose>
        <%-- if there are no person modules added yet, show a placeholder --%>
        <c:when test="${fn:length(people) == 0}">
            <div class="row team-v7 no-gutter equal-height-columns">
                <div class="col-md-6 team-arrow-right">
                    <div class="dp-table">
                        <div class="equal-height-column dp-table-cell team-v7-in" style="height: 463px;">
                            <span class="team-v7-name">Person Name</span>
                            <span class="team-v7-position">Person Title</span>
                            This is the biography of the sample person.
                            <ul class="list-inline social-icons-v1">
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 team-v7-img">
                    <c:set var="photoUrl" value="${url.currentModule}/img/default_person_img.jpg"/>
                    <img class="img-responsive full-width equal-height-column" src="${photoUrl}" alt=""
                         style="height: 463px;">
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${people}" var="person" varStatus="item">
                <%-- pass a parameter to the person template so we can use to calculate proper layout --%>
                <template:module node="${person}" nodeTypes="jnt:person" editable="true">
                    <template:param name="itemCount" value="${item.count}"/>
                </template:module>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="jnt:person"/>
</c:if>
