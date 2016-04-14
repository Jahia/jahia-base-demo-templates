<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<template:addResources type="javascript" resources="custom/modal.js"/>

<c:set var="pressTitle" value="${currentNode.properties['jcr:title'].string}"/>
<jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="pressReleaseContainerCatKeys"/>

<h3><jcr:nodeProperty node="${currentNode}" name='jcr:title'/></h3>

<jcr:nodeProperty node="${currentNode}" name='date' var="datePress"/>
<h4 class="pressRealeseDate"><fmt:formatDate value="${currentNode.properties.date.time}" dateStyle="long"/></h4>

<div>${currentNode.properties.body.string}</div>
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:fileAttachment')}">
    <template:include view="fileAttachment"/>
</c:if>
<jcr:nodeProperty node="${currentNode}" name="pdfVersion" var="pdfVersion"/>
<c:if test="${not empty pdfVersion}">
    <template:addCacheDependency node="${pdfVersion.node}"/>
    <c:set var="label" value="${currentNode.properties.downloadTitle.string}"/>
    <c:if test="${empty label}">
        <c:set var="label"><fmt:message key="jdmix_fileAttachment.label"/></c:set>
    </c:if>
    <div>
            ${pdfVersion.node.name}
        <c:if test="${fn:containsIgnoreCase(pdfVersion.node.name, '.pdf')}">
            <a class="view-pdf" href="${pdfVersion.node.url}">
                <strong>
                    <i class="fa fa-fw fa-eye" title="<fmt:message key="label.view"/>"></i>
                </strong>
            </a>
        </c:if>
        &nbsp;
        <a href="${pdfVersion.node.url}">
            <strong>
                <i class="fa fa-download" title="<fmt:message key="label.download"/>"></i>
            </strong>
        </a>
    </div>
    <div class="container">
        <div class="row">

        </div>
    </div>
</c:if>
<c:if test="${!empty pressReleaseContainerCatKeys }">
            <span class="pressReleaseCategory"><strong>
                <fmt:message key='label.categories'/> :</strong>
                   <c:forEach items="${pressReleaseContainerCatKeys}" var="category" varStatus="status">
                       <c:if test="${not status.first}">,&nbsp</c:if>
                       <template:module path="${category.node.path}" view="pressCategory" editable="false"/>
                   </c:forEach>
            </span>
</c:if>
<br/>


<c:set var="parentUrl">javascript:history.back()</c:set>
<a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
        class="icon-line-arrow-left"></i><fmt:message key="jdmix_backLink.back"/></span></a>

<%-- display attachment in modal --%>
<template:addResources type="inline">
<script type="text/javascript">
    $(function () {
        $('.view-pdf').on('click', function () {
            var pdf_link = $(this).attr('href');
            var iframe = '<object type="application/pdf" data="' + pdf_link + '" width="100%" height="500"><fmt:message key="label.pdfView.noSupport"/><br/><a href="${pdfVersion.node.url}"><strong>${pdfVersion.node.name} <i class="fa fa-download" title="<fmt:message key="label.download"/>"></i></strong></a></object>'
            $.createModal({
                title: '${pressTitle}',
                message: iframe,
                closeButton: true,
                scrollable: false
            });
            return false;
        });
    })
    </script>
</template:addResources>