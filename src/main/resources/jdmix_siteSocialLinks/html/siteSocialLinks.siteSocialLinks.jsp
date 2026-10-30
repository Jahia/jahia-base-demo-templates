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
<%-- a value with no http(s), ftp, mailto or tel scheme links as http:// --%>
<c:set var="linkSchemes" value="(?i)(https?|ftp)://.*|(mailto|tel):.*"/>

<!-- Site Social Links -->

<ul class="footer-socials list-inline pull-right">
    <c:if test="${not empty facebookLink and facebookLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, facebookLink) ? '' : 'http://'}${fn:escapeXml(facebookLink)}" title="Facebook">
            <i class="fa fa-facebook"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty googlePlusLink and googlePlusLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, googlePlusLink) ? '' : 'http://'}${fn:escapeXml(googlePlusLink)}" title="Google Plus">
            <i class="fa fa-google-plus"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty twitterLink and twitterLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, twitterLink) ? '' : 'http://'}${fn:escapeXml(twitterLink)}" title="Twitter">
            <i class="fa fa-twitter"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty youtubeLink and youtubeLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, youtubeLink) ? '' : 'http://'}${fn:escapeXml(youtubeLink)}" title="YouTube">
            <i class="fa fa-youtube"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty instagramLink and instagramLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, instagramLink) ? '' : 'http://'}${fn:escapeXml(instagramLink)}" title="Instagram">
            <i class="fa fa-instagram"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty linkedinLink and linkedinLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, linkedinLink) ? '' : 'http://'}${fn:escapeXml(linkedinLink)}" title="LinkedIn">
            <i class="fa fa-linkedin"></i></a>
        </li>
    </c:if>
    <c:if test="${not empty pinterestLink and pinterestLink != 'http://'}">
        <li><a href="${functions:matches(linkSchemes, pinterestLink) ? '' : 'http://'}${fn:escapeXml(pinterestLink)}" title="Pinterest">
            <i class="fa fa-pinterest"></i></a>
        </li>
    </c:if>
</ul>


