<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%-- TODO: detail content template is not displaying --%>
<c:set var="pressTitle" value="${currentNode.properties['jcr:title'].string}"/>
<jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="pressReleaseContainerCatKeys"/>

<h3><jcr:nodeProperty node="${currentNode}" name='jcr:title'/></h3>

<jcr:nodeProperty node="${currentNode}" name='date' var="datePress"/>
<h4 class="pressRealeseDate"><fmt:formatDate value="${currentNode.properties.date.time}" dateStyle="long"/></h4>

<div>${currentNode.properties.body.string}</div>
<jcr:nodeProperty node="${currentNode}" name="pdfVersion" var="pdfVersion"/>
<c:if test="${not empty pdfVersion}">
    <div>${pdfVersion.node.name} <a class="view-pdf" href="${pdfVersion.node.url}"><strong><i class="fa fa-fw fa-eye" title="<fmt:message key="label.view"/>"></i></strong></a>&nbsp;<a href="${pdfVersion.node.url}"><strong><i class="fa fa-download" title="<fmt:message key="label.download"/>"></i></strong> </a>

    </div>
    <div class="container">
        <div class="row">

    </div></div>
</c:if>
<c:if test="${!empty pressReleaseContainerCatKeys }">
            <span class="pressReleaseCategory"><strong>
                <fmt:message key='label.categories'/> :</strong>
                 <c:forEach items="${pressReleaseContainerCatKeys}" var="category" varStatus="status">
                     <c:if test="${not status.first}">,</c:if><jcr:nodeProperty node="${category.node}" name="jcr:title"
                                                                                var="title"/>
                     <c:choose><c:when
                             test="${not empty title}">${title.string}</c:when><c:otherwise>${category.node.name}</c:otherwise>
                     </c:choose></c:forEach>
            </span>
</c:if>
<br/>



<c:set var="parentUrl">javascript:history.back()</c:set>
<a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
        class="icon-line-arrow-left"></i><fmt:message key="jdmix_backLink.back"/></span></a>
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
            var iframe = '<object type="application/pdf" data="' + pdf_link + '" width="100%" height="500">No Support</object>'
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