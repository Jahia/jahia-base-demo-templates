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
<jcr:nodeProperty node="${currentNode}" name="j:street" var="street"/>
<jcr:nodeProperty node="${currentNode}" name="j:zipCode" var="zipCode"/>
<jcr:nodeProperty node="${currentNode}" name="j:town" var="town"/>
<jcr:nodeProperty node="${currentNode}" name="j:country" var="country"/>
<jcr:nodeProperty node="${currentNode}" name="location" var="location"/>


<div class="headline"><h2><fmt:message key="jnt_event.eventLocation"/></h2></div>
<ul class="list-unstyled who">
    <c:if test="${not empty location}">
        <li>${location.string}</li>
    </c:if>
    <c:if test="${not empty street or not empty  town or not empty country}">
        <li>
            <a href="https://maps.google.com?q=${street.string}+${town.string}+${zipCode.string}+${country.string}"><i
            class="fa fa-building-o"></i>${street.string}
        <br/><i class="fa fa-building-o" style="visibility: hidden;"></i>${town.string}&nbsp;${zipCode.string}&nbsp;-&nbsp;${country.string}
    </a>
        </li>
        </c:if>
</ul>

