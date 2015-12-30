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
<jcr:nodeProperty node="${currentNode}" name="phone" var="phone"/>
<jcr:nodeProperty node="${currentNode}" name="email" var="email"/>
<jcr:nodeProperty node="${currentNode}" name="website" var="website"/>
<jcr:nodeProperty node="${currentNode}" name="j:street" var="street"/>
<jcr:nodeProperty node="${currentNode}" name="j:zipCode" var="zipCode"/>
<jcr:nodeProperty node="${currentNode}" name="j:town" var="town"/>
<jcr:nodeProperty node="${currentNode}" name="j:country" var="country"/>

<div class="headline"><h2>Headquarters</h2></div>
<ul class="list-unstyled who">
    <li><a href="#"><i class="fa fa-building-o"></i>${street.string},&nbsp;${zipCode.string}&nbsp;${town.string}&nbsp;${country.string}</a></li>
    <li><a href="#"><i class="fa fa-envelope"></i>${email.string}</a></li>
    <li><a href="#"><i class="fa fa-phone"></i>${phone.string}</a></li>
    <li><a href="#"><i class="fa fa-globe"></i>${website.string}</a></li>
</ul>

<ul class="list-inline who margin-bottom-30">
    <li><a href="#"><i class="fa fa-facebook-official"></i></a></li>
    <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
    <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
    <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
</ul>