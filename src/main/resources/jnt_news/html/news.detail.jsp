<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<template:addResources type="css" resources="news.css"/>
<template:addResources type="javascript" resources="owl.carousel.js"/>
<template:addResources type="javascript" resources="owl-carousel.js"/>
<template:addResources type="css" resources="owl.carousel.css"/>

<%-- photoswipe files --%>
<template:addResources type="css" resources="plugins/photoswipe/photoswipe.css"/>
<template:addResources type="css" resources="plugins/photoswipe/default-skin/default-skin.css"/>
<template:addResources type="javascript" resources="plugins/photoswipe/photoswipe.min.js"/>
<template:addResources type="javascript" resources="plugins/photoswipe/photoswipe-ui-default.min.js"/>
<%-- TODO: JQuery is not getting the index of the image to open PhotoSwiper at the image instead of the first --%>


<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsImage" value="${currentNode.properties['image'].node}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<c:set var="description" value="${currentNode.properties['desc']}"/>
<c:set var="galleryImgs" value="${currentNode.properties['galleryImg']}"/>
<fmt:formatDate pattern="MMMM dd, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}"
                var="newsDate"/>


    <!-- News Detail -->

        <!-- News v3 -->
        <div class="news-v3 margin-bottom-30">
            <h2>${newsTitle.string}</h2>

    <div id="sync1" class="owl-carousel picture">
        <c:if test="${not empty newsImage}">

            <div class="item">
                <%-- if there is a gallery format for the photoswipe otherwise just display image --%>
                <c:choose>
                    <c:when test="${not empty galleryImgs}">
                        <a href="${newsImage.url}"
                           data-size="${newsImage.properties['j:width'].string}x${newsImage.properties['j:height'].string}">
                            <img class="img-responsive full-width" src="${newsImage.url}"
                                 height="${newsImage.properties['j:height'].string}"
                                 width="${newsImage.properties['j:width'].string}"/>
                    </a>
                    </c:when>
                    <c:otherwise>
                        <img class="img-responsive full-width" src="${newsImage.url}"
                             height="${newsImage.properties['j:height'].string}"
                             width="${newsImage.properties['j:width'].string}"/>
                    </c:otherwise>
                </c:choose>
            </div>


        </c:if>
        <c:if test="${not empty galleryImgs}">
            <c:forEach var="galleryImg" items="${galleryImgs}" varStatus="status">

            <div class="item">
                    <a href="${galleryImg.node.url}"
                       data-size="${galleryImg.node.properties['j:width'].string}x${galleryImg.node.properties['j:height'].string}"><img
                            class="img-responsive full-width" src="${galleryImg.node.url}"
                            height="${galleryImg.node.properties['j:height'].string}"
                            width="${galleryImg.node.properties['j:height'].string}"/></a>
                </div>

            </c:forEach>
        </c:if>
    </div>

    <%-- create thumbnails of news image and gallery images --%>
    <c:if test="${not empty galleryImgs}">
    <div id="sync2" class="owl-carousel owl-theme">

            <c:if test="${not empty newsImage}">
            <div class="item"><img class="img-responsive full-width" src="${newsImage.url}?t=thumbnail2"/></div>
            </c:if>
        <c:if test="${not empty galleryImgs}">
            <c:forEach var="galleryImg" items="${galleryImgs}" varStatus="status">
                <div class="item">
                    <img src="${galleryImg.node.url}?t=thumbnail2"/>
                </div>
            </c:forEach>
        </c:if>
    </div>
    </c:if>
            <div class="news-v3-in">
                <ul class="list-inline posted-info">
            <%-- display tags --%>
            <jcr:nodeProperty node="${currentNode}" name="j:tagList" var="tags"/>
            <c:forEach items="${tags}" var="tag" varStatus="status">
                <li><c:if test="${status.first}"><fmt:message key="jnt_news.in"/></c:if>&nbsp;${tag.string}</li>
            </c:forEach>
                    <li>Posted ${newsDate}</li>
                </ul>
                ${description.string}
            </div>

                    </div>

<%-- set up the back navigation --%>
        <c:set var="parentUrl">javascript:history.back()</c:set>
                    <p>
    <a href="${parentUrl}" class="button button-mini button-border button-rounded"><span><i
            class="icon-line-arrow-left"></i><fmt:message key="jdnt_news.back"/></span></a>
                    </p>

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


<%-- owl carousel syncronization --%>
<script type="text/javascript">
    $(document).ready(function () {

        var sync1 = $("#sync1");
        var sync2 = $("#sync2");

        sync1.owlCarousel({
            singleItem: true,
            slideSpeed: 1000,
            navigation: false,
            pagination: false,
            afterAction: syncPosition,
            responsiveRefreshRate: 200,
        });

        sync2.owlCarousel({
            items: 15,
            itemsDesktop: [1199, 10],
            itemsDesktopSmall: [979, 10],
            itemsTablet: [768, 8],
            itemsMobile: [479, 4],
            pagination: true,
            responsiveRefreshRate: 100,
            afterInit: function (el) {
                el.find(".owl-item").eq(0).addClass("synced");
            }
        });

        function syncPosition(el) {
            var current = this.currentItem;
            $("#sync2")
                    .find(".owl-item")
                    .removeClass("synced")
                    .eq(current)
                    .addClass("synced")
            if ($("#sync2").data("owlCarousel") !== undefined) {
                center(current)
            }
        }

        $("#sync2").on("click", ".owl-item", function (e) {
            e.preventDefault();
            var number = $(this).data("owlItem");
            sync1.trigger("owl.goTo", number);
        });

        function center(number) {
            var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
            var num = number;
            var found = false;
            for (var i in sync2visible) {
                if (num === sync2visible[i]) {
                    var found = true;
                }
            }

            if (found === false) {
                if (num > sync2visible[sync2visible.length - 1]) {
                    sync2.trigger("owl.goTo", num - sync2visible.length + 2)
                } else {
                    if (num - 1 === -1) {
                        num = 0;
                    }
                    sync2.trigger("owl.goTo", num);
                }
            } else if (num === sync2visible[sync2visible.length - 1]) {
                sync2.trigger("owl.goTo", sync2visible[1])
            } else if (num === sync2visible[0]) {
                sync2.trigger("owl.goTo", num - 1)
            }

        }

    });
</script>

<%-- photoswipe generation --%>
<script>
    $('.picture').each( function() {
        var $pic     = $(this),
                getItems = function() {
                    var items = [];
                    $pic.find('a').each(function() {
                        var $href   = $(this).attr('href'),
                                $size   = $(this).data('size').split('x'),
                                $width  = $size[0],
                                $height = $size[1];

                        var item = {
                            src : $href,
                            w   : $width,
                            h   : $height
                        }

                        items.push(item);
                    });
                    return items;
                }

        var items = getItems();

    var $pswp = $('.pswp')[0];
    $pic.on('click', '.item', function(event) {
        event.preventDefault();

        var $index = $(this).index();
        var options = {
            index: $index,
            bgOpacity: 0.7,
            showHideOpacity: true
        }

        // Initialize PhotoSwipe
        var lightBox = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
        lightBox.init();
    });
    });

</script>
