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


<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="startDate" value="${currentNode.properties['startDate'].time}"/>
<c:set var="endDate" value="${currentNode.properties['endDate']}"/>
<c:set var="location" value="${currentNode.properties['location'].string}"/>
<c:set var="body" value="${currentNode.properties['body'].string}"/>
<c:url var="detailUrl" value="${url.base}${currentNode.path}.html"/>


<!-- event title -->
<h2><a href="${detailUrl}">${title}</a></h2>
<!-- event type, date, location -->
<ul class="list-inline">
    <c:if test="${not empty currentNode.properties.eventsType}">
        <li>
            <button class="btn btn-xs rounded btn-primary" type="button"><fmt:message
                    key='jnt_event.eventsType.${currentNode.properties.eventsType.string}'/></button>
        </li>
    </c:if>
    <li><fmt:formatDate dateStyle="long" type="date"
                        value="${currentNode.properties.startDate.time}"/></li>
    <li><i class="fa  fa-map-marker"></i>&nbsp;${location}</li>
</ul>
<!-- event body -->
<p>${body}</p>
<!-- event people if they exist -->
<%--            <c:if test="${jcr:isNodeType(currentNode, 'jdmix:hasPeople')}">
                <c:set var="boxTitle" value="${currentNode.properties['boxTitle'].string}"/>
                <c:if test="${empty boxTitle}">
                    <c:set var="boxTitle" value="Speakers"/>
                </c:if>
                <ul class="list-inline">
                    <li><i class="fa   fa-users"></i>&nbsp;${boxTitle}:</li>
                    <template:area path="${currentNode.path}/relatedPeople" nodeTypes="jnt:person">
                        <template:param name="subNodesView" value="event"/>
                    </template:area>
                </ul>
            </c:if>
            --%>
<!-- event categories -->
<jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="cat"/>
<c:if test="${cat != null}">
    <ul class="list-inline">
        <c:forEach items="${cat}" var="category">
            <li><i class="fa fa-tag">&nbsp;${category.node.displayableName}</i></li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${jcr:isNodeType(currentNode, 'jdmix:fileAttachment')}">
    <jcr:nodeProperty node="${currentNode}" name="pdfVersion" var="pdfVersion"/>
    <c:if test="${not empty pdfVersion}">
        <c:set var="label" value="${currentNode.properties.downloadTitle.string}"/>
        <c:if test="${empty label}">
            <c:set var="label"><fmt:message key="jdmix_fileAttachment.label"/></c:set>
        </c:if>
        <p>
        <div>
                ${pdfVersion.node.name} <a class="view-pdf" href="${pdfVersion.node.url}"><strong><i
                class="fa fa-fw fa-eye" title="<fmt:message key="label.view"/>"></i></strong></a>&nbsp;<a
                href="${pdfVersion.node.url}"><strong><i class="fa fa-download"
                                                         title="<fmt:message key="label.download"/>"></i></strong> </a>
        </div>
        </p>
    </c:if>
</c:if>
<%-- set up the back navigation --%>
<c:set var="parentUrl">javascript:history.back()</c:set>
<p>
    <a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
            class="icon-line-arrow-left"></i><fmt:message key="jdmix_backLink.back"/></span></a>
</p>


<script type="text/javascript">

    (function (a) {
        a.createModal = function (b) {
            defaults = {title: "", message: "Your Message Goes Here!", closeButton: true, scrollable: false};
            var b = a.extend({}, defaults, b);
            var c = (b.scrollable === true) ? 'style="max-height: 420px;overflow-y: auto;"' : "";
            html = '<div class="modal fade" id="myModal">';
            html += '<div class="modal-dialog">';
            html += '<div class="modal-content">';
            html += '<div class="modal-header">';
            html += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>';
            if (b.title.length > 0) {
                html += '<h4 class="modal-title">' + b.title + "</h4>"
            }
            html += "</div>";
            html += '<div class="modal-body" ' + c + ">";
            html += b.message;
            html += "</div>";
            html += '<div class="modal-footer">';
            if (b.closeButton === true) {
                html += '<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>'
            }
            html += "</div>";
            html += "</div>";
            html += "</div>";
            html += "</div>";
            a("body").prepend(html);
            a("#myModal").modal().on("hidden.bs.modal", function () {
                a(this).remove()
            })
        }
    })(jQuery);


    $(function () {
        $('.view-pdf').on('click', function () {
            var pdf_link = $(this).attr('href');
//var iframe = '<div class="iframe-container"><iframe src="'+pdf_link+'"></iframe></div>'
//var iframe = '<object data="'+pdf_link+'" type="application/pdf"><embed src="'+pdf_link+'" type="application/pdf" /></object>'
            var iframe = '<object type="application/pdf" data="' + pdf_link + '" width="100%" height="500"><fmt:message key="label.pdfView.noSupport"/><br/><a href="${pdfVersion.node.url}"><strong>${pdfVersion.node.name} <i class="fa fa-download" title="<fmt:message key="label.download"/>"></i></strong></a></object>'
            $.createModal({
                title: '${title}',
                message: iframe,
                closeButton: true,
                scrollable: false
            });
            return false;
        });
    })
</script>
