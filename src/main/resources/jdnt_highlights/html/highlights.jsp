<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%-- Check if the current subview uses the masonry script --%>
<c:if test="${(currentNode.properties['j:subNodesView'].string == 'cards-flip') || (currentNode.properties['j:subNodesView'].string == 'cards-overlay') || (currentNode.properties['j:subNodesView'].string == 'cards-card') }">
    <c:set var="isMasonryView" value="true"/>
</c:if>


<%-- Get the title of the carousel, if exists display above carousel --%>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:if test="${not empty title}">
    <div class="headline"><h2>${title}</h2></div>
</c:if>

<%-- get the bottom margin size --%>
<c:set var="bottomMargin" value="${currentNode.properties['bottomMargin'].string}"/>
<%-- if empty default to 30 pixels --%>
<c:if test="${not empty bottomMargin}">
    <c:set var="marginClass" value=" margin-bottom-${bottomMargin}"/>
</c:if>
<%-- if empty default to 30 pixels --%>
<c:if test="${empty bottomMargin}">
    <c:set var="marginClass" value=" margin-bottom-30"/>
</c:if>
<%-- get the number of columns from the properties, if empty set to 3 columns--%>
<c:set var="numColumns" value="${currentNode.properties['numColumns'].string}"/>
<c:if test="${empty numColumns}">
    <c:set var="numColumns" value="3"/>
</c:if>


<c:set var="resourceReadOnly" value="${currentResource.moduleParams.readOnly}"/>
<%-- Displaying the view of inherited nodetype jnt:contentList and this view is loading all subnodes,
                                        the view is setting modulemap that we get from the included template header --%>
<template:include view="hidden.header"/>

<c:if test="${isMasonryView}">
    <%-- start masonry --%>
    <c:if test="${not renderContext.editMode}">
        <template:addResources type="css" resources="masonry.css"/>
        <template:addResources type="javascript" resources="plugins/masonry/masonry.pkgd.min.js"/>
        <template:addResources type="javascript" resources="plugins/imagesloaded/imagesloaded.pkgd.min.js"/>
        <template:addResources type="javascript" resources="custom/highlightCard.js"/>
    </c:if>

    <%-- get the width of columns based on the number of columns numColumns--%>
    <c:set var="widthColumns">
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${100/numColumns}"/>
    </c:set>

    <%-- set the grid column size, in percentage. --%>
    <template:addResources><style>.grid-sizer,.grid-item {width: ${widthColumns}%;}</style></template:addResources>

    <%-- add styles for edit mode --%>
    <c:if test="${renderContext.editMode}">
        <style>.grid-item {height: 100%; clear: both; display: inline-block}</style>
    </c:if>



    <div class="row${marginClass}">
        <div class="grid picture" itemscope itemtype="http://schema.org/ImageGallery">
            <div class="grid-sizer"></div>
            <c:set var="isEmpty" value="true"/>
            <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}" varStatus="item">
                <template:module node="${subchild}" view="${moduleMap.subNodesView}" editable="${moduleMap.editable && !resourceReadOnly}"/>
                <c:set var="isEmpty" value="false"/>
            </c:forEach>
        </div>
    </div>


    <%-- will show only for edit mode --%>
    <c:if test="${not renderContext.editMode}">
        <%-- photoswipe setup --%>
        <%-- Root element of PhotoSwipe. Must have class pswp. DO NOT CHANGE --%>
        <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
            <!-- Background of PhotoSwipe.
                 It's a separate element, as animating opacity is faster than rgba(). -->
            <div class="pswp__bg"></div>
            <!-- Slides wrapper with overflow:hidden. -->
            <div class="pswp__scroll-wrap">
                <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
                <!-- don't modify these 3 pswp__item elements, data is added later on. -->
                <div class="pswp__container">
                    <div class="pswp__item"></div>
                    <div class="pswp__item"></div>
                    <div class="pswp__item"></div>
                </div>
                <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
                <div class="pswp__ui pswp__ui--hidden">
                    <div class="pswp__top-bar">
                        <!--  Controls are self-explanatory. Order can be changed. -->
                        <div class="pswp__counter"></div>
                        <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                        <button class="pswp__button pswp__button--share" title="Share"></button>
                        <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                        <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                        <!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
                        <!-- element will get class pswp__preloader--active when preloader is running -->
                        <div class="pswp__preloader">
                            <div class="pswp__preloader__icn">
                                <div class="pswp__preloader__cut">
                                    <div class="pswp__preloader__donut"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                        <div class="pswp__share-tooltip"></div>
                    </div>
                    <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
                    </button>
                    <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
                    </button>
                    <div class="pswp__caption">
                        <div class="pswp__caption__center"></div>
                    </div>
                </div>
            </div>
        </div>
        <%-- end photoswipe setup --%>
    </c:if>

    <%-- end masonry --%>
</c:if>


<%-- Regular (not masonry) subview type --%>
<c:if test="${not isMasonryView}">
    <%-- set the column width based on 12 for a full width, divided by number of columns selected --%>
    <c:set var="colWidth">
        <fmt:formatNumber type="number" maxFractionDigits="0" value="${12/numColumns}"/>
    </c:set>

    <c:set var="isEmpty" value="true"/>
    <c:forEach items="${moduleMap.currentList}" var="subchild" begin="${moduleMap.begin}" end="${moduleMap.end}"
               varStatus="item">
        <%-- if this is the start of a new row create a new row div --%>
        <c:if test="${item.count%numColumns == 1}">
            <div class="row${marginClass}">
        </c:if>
        <div class="col-md-${colWidth}">
            <template:module node="${subchild}" view="${moduleMap.subNodesView}"
                             editable="${moduleMap.editable && !resourceReadOnly}"/>
        </div>
        <%-- if this is the end of a row or the last highlight in the list, close the row div --%>
        <c:if test="${item.count%numColumns == 0 or item.last}">
            </div>
        </c:if>
        <c:set var="isEmpty" value="false"/>
    </c:forEach>

    <%-- If the list is empty then we will display a sample imgView and default view Highlight --%>
    <c:if test="${not empty moduleMap.emptyListMessage and (renderContext.editMode or moduleMap.forceEmptyListMessageDisplay) and isEmpty}">
        <%-- Sample imgView Highlight --%>
        <div class="row${marginClass}">
            <div class="col-md-${colWidth}">
                <div class="thumbnails thumbnail-style thumbnail-kenburn">
                    <div class="thumbnail-img">
                        <div class="overflow-hidden">
                            <img class="img-responsive" src="${url.currentModule}/img/background.jpg" alt="">
                        </div>
                        <a class="btn-more hover-effect" href="#" alt=""><fmt:message key="jdnt_highlight.readmore"/> +</a>
                    </div>
                    <div class="caption">

                        <h3><a class="hover-effect" href="#"><fmt:message key="jdnt_highlight.sampleImgTitle"/></a></h3>

                        <p><fmt:message key="jdnt_highlight.sampleBody"/></p>
                    </div>
                </div>

            </div>
                <%-- Sample default view highlight --%>
            <div class="col-md-${colWidth}">
                <div class="service">
                    <a href="#"><i class="fa fa-chevron-down service-icon"></i></a>

                    <div class="desc">
                        <h4><fmt:message key="jdnt_highlight.sampleTitle"/></h4>

                        <p><fmt:message key="jdnt_highlight.sampleBody"/></p>
                        <a href="#" alt=""><fmt:message key="jdnt_highlight.readmore"/></a>
                    </div>

                </div>
            </div>
        </div>
    </c:if>
    <%-- end  --%>
</c:if>


    <%-- Add the add new content item button if in edit mode --%>
<c:if test="${moduleMap.editable and renderContext.editMode && !resourceReadOnly}">
    <%-- limit to adding jdnt:highlight nodes to the list --%>
    <template:module path="*" nodeTypes="jdnt:highlight"/>
</c:if>
<template:include view="hidden.footer"/>



