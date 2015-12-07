<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%-- TODO: Hardcoded component --%>

<div class="topbar">
    <ul class="loginbar pull-right">
        <li class="hoverSelector">
            <i class="fa fa-globe"></i>
            <a>Languages</a>
            <ul class="languages hoverSelectorBlock">
                <li class="active">
                    <a href="#">English <i class="fa fa-check"></i></a>
                </li>
                <li><a href="#">Spanish</a></li>
                <li><a href="#">Russian</a></li>
                <li><a href="#">German</a></li>
            </ul>
        </li>
        <li class="topbar-devider"></li>
        <li><a href="page_faq.html">Help</a></li>
        <li class="topbar-devider"></li>
        <li><a href="page_login.html">Login</a></li>
    </ul>
</div>
