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

<%-- if social icons were included, get the urls --%>
<c:set var="facebookLink" value="${currentNode.properties.facebookLink.string}"/>
<c:set var="googlePlusLink" value="${currentNode.properties.googlePlusLink.string}"/>
<c:set var="twitterLink" value="${currentNode.properties.twitterLink.string}"/>
<c:set var="youtubeLink" value="${currentNode.properties.youtubeLink.string}"/>
<c:set var="instagramLink" value="${currentNode.properties.instagramLink.string}"/>
<c:set var="linkedinLink" value="${currentNode.properties.linkedinLink.string}"/>
<c:set var="pinterestLink" value="${currentNode.properties.pinterestLink.string}"/>

<!-- Site Social Links -->

<ul class="footer-socials list-inline pull-right">
    <c:if test="${not empty facebookLink and facebookLink != 'http://'}">
        <li><a href="${facebookLink}" title="Facebook">
            <i class="fa fa-facebook"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty googlePlusLink and googlePlusLink != 'http://'}">
        <li><a href="${googlePlusLink}" title="Google Plus">
            <i class="fa fa-google-plus"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty twitterLink and twitterLink != 'http://'}">
        <li><a href="${twitterLink}" title="Twitter">
            <i class="fa fa-twitter"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty youtubeLink and youtubeLink != 'http://'}">
        <li><a href="${youtubeLink}" title="YouTube">
            <i class="fa fa-youtube"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty instagramLink and instagramLink != 'http://'}">
        <li><a href="${instagramLink}" title="Instagram">
            <i class="fa fa-instagram"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty linkedinLink and linkedinLink != 'http://'}">
        <li><a href="${linkedinLink}" title="LinkedIn">
            <i class="fa fa-linkedin"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty pinterestLink and pinterestLink != 'http://'}">
        <li><a href="${pinterestLink}" title="Pinterest">
            <i class="fa fa-pinterest"></i></a>
        </li>
    </c:if>
</ul>


