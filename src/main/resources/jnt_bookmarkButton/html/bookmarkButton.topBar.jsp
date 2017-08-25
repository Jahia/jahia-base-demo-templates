<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<template:addResources type="javascript" resources="jquery.min.js"/>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:if test="${renderContext.loggedIn}">
	<div class="pull-right">
		<form action="/" method="post" name="bookmark" id="bookmarkForm">
			<p>
				<jcr:node path="${renderContext.user.localPath}" var="user"/>

				<input type="hidden" name="jcr:title" value=""/>
				<input type="hidden" name="jcrNodeType" value="jnt:bookmark">
				<input type="hidden" name="url" value="">
        <span class="btn-bookmark"><i class="fa fa-bookmark" aria-hidden="true"></i> <input id="bookmark"
																							   type="submit" value="<fmt:message
        key="bookmark.add"/>"/></span>


				<fmt:message var="i18nSuccess" key="bookmark.added"/><c:set var="i18nSuccess"
																			value="${functions:escapeJavaScript(i18nSuccess)}"/>
				<fmt:message var="i18nAlreadyExist" key="bookmark.alreadyExist"/><c:set var="i18nAlreadyExist"
																						value="${functions:escapeJavaScript(i18nAlreadyExist)}"/>
				<script type="text/javascript">
					document.forms['bookmark'].elements['jcr:title'].value = document.title;
					document.forms['bookmark'].elements['url'].value = document.location;

					toastr.options = {
						"positionClass": "toast-bottom-right"
					}

					$(document).ready(function () {
						$("#bookmarkForm").submit(function () {
							$.ajax({
								type: "POST",
								dataType: "json",
								data: $(this).serialize(),
								url: "<c:url value='${url.baseLive}${renderContext.user.localPath}.addBookmark.do'/>"
							}).done(function (data) {
								if (data.isNew) {
									//alert("${i18nSuccess}");
									toastr.info('${i18nSuccess}');
								} else {
									toastr.warning('${i18nAlreadyExist}');
								}
							});
							return false;
						});
					});
				</script>
			</p>
		</form>
	</div>
</c:if>