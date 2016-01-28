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
<%-- TODO: hover on button rolls over to green regardless of theme --%>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="subtitle" value="${currentNode.properties.subtitle.string}"/>
<c:set var="summary" value="${currentNode.properties.body.string}"/>
<c:set var="textColor" value="${currentNode.properties.textColor.string}"/>
<c:set var="link" value="${currentNode.properties.internalLink.node}"/>
<c:set var="linkText" value="${currentNode.properties.linkText.string}"/>
<c:set var="background" value="${currentNode.properties.backgroundImg.node}"/>
<c:set var="image" value="${currentNode.properties.smallPhoto.node}"/>

<%-- If a color theme was not selected use light --%>
<c:if test="${empty textColor}"><c:set var="textColor" value="light"/></c:if>

<%-- if linkText is not filled in use default Read More from resource file --%>
<c:if test="${empty linkText}">
    <c:set var="linkText"><fmt:message key="jdnt_sliderPanel.readMore"/></c:set>
</c:if>

<%-- get the background image, if none provided use default background.jpg image --%>
<c:choose>
    <c:when test="${empty background}">
        <c:url var="backgroundUrl" value="${url.currentModule}/img/background.jpg"/>
    </c:when>
    <c:otherwise>
        <c:url var="backgroundUrl" value="${background.url}"/>
    </c:otherwise>
</c:choose>

<%-- get pixel layout for text and image --%>
<%-- TODO: edit this as necessary for best layout options or update to be a parameter --%>
<c:set var="layout" value="${currentNode.properties.layout.string}"/>
<c:choose>
    <c:when test="${layout == 'right'}">
        <c:set var="textLayout" value="450px;"/>
        <c:set var="photoLayout" value="15px;"/>
    </c:when>
    <c:otherwise>
        <c:set var="textLayout" value="15px;"/>
        <c:set var="photoLayout" value="550px;"/>
    </c:otherwise>
</c:choose>

        <div class="ms-slide" style="z-index: 10">
    <%-- loading image, this is a part of the original templates --%>
    <img src="${url.currentModule}/img/blank.gif" data-src="${backgroundUrl}" alt=""/>

    <%-- if a small photo was provided display it --%>
    <%-- TODO: Update layout options here for small photo layer placement --%>
            <c:if test="${not empty image}">
                <div class="ms-layer" style="bottom: -10px; left: ${photoLayout} width: 400px; height: 562px; margin: 0px; padding: 0px; overflow: hidden;">
                    <img src="${image.url}" alt="" style="height: 100%;">
                </div>
            </c:if>

    <%-- TODO: update the following div class to use different styles already provided in the CSS --%>
    <%-- if a subtitle is provided display it --%>
    <c:if test="${not empty subtitle}">
            <div class="ms-layer ms-promo-info-in color-${textColor}" style="left:${textLayout}; top:160px"
                 data-effect="bottom(40)"
                 data-duration="2000"
                 data-delay="700"
                 data-ease="easeOutExpo"
                    >${subtitle}</div>
    </c:if>

    <%-- TODO: update the following div class to use different styles already provided in the CSS --%>
    <%-- if a title is provided display it --%>
    <c:if test="${not empty title}">
            <div class="ms-layer ms-promo-info-in ms-promo-info color-${textColor}" style="left:${textLayout}; top:210px"
                 data-effect="bottom(40)"
                 data-duration="2000"
                 data-delay="1000"
                 data-ease="easeOutExpo"
                    ><span class="color-green">${title}</span></div>
    </c:if>

    <%-- TODO: update the following div class to use different styles already provided in the CSS --%>
    <%-- if a summary is provided display it --%>
    <c:if test="${not empty summary}">
            <div class="ms-layer ms-promo-sub color-${textColor}" style="left:${textLayout}; top:310px"
                 data-effect="bottom(40)"
                 data-duration="2000"
                 data-delay="1300"
                 data-ease="easeOutExpo"
                >${summary}</div>
    </c:if>


    <%-- TODO: update the following classes to use the different button styles provided in the css --%>
    <%-- if a link has been provided display it as a button --%>
            <c:if test="${not empty link}">
            <a class="ms-layer btn-u" style="left:${textLayout} top:390px" href="${link.url}"
               data-effect="bottom(40)"
               data-duration="2000"
               data-delay="1300"
               data-ease="easeOutExpo"
           alt="${title}"
                    >${linkText}</a>
            </c:if>


        </div>



