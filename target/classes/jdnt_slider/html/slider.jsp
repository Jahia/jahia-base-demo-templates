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
<template:addResources type="css" resources="masterslider/style/masterslider.css"/>
<template:addResources type="css" resources="masterslider/skins/black-2/style.css"/>
<template:addResources type="javascript" resources="masterslider/masterslider.min.js"/>
<template:addResources type="javascript" resources="masterslider/jquery.easing.min.js"/>
<template:addResources type="javascript" resources="master-slider-fw.js"/>
<%-- TODO: Hardcoded component --%>
<%-- TODO: when masterslider.css is added nothing displays on the screen. If masterslider.css is left out the content displays just not in a proper layout as expected. --%>


<%-- Close the container from the template before starting a slider section
       Have to reopen the div AFTER the slider --%>
<%--</div>--%>
<!--=== Slider ===-->
<div class="ms-layers-template">
<!-- masterslider -->
    <div class="master-slider ms-skin-black-2 round-skin" id="masterslider">
        <div class="ms-slide" style="z-index: 10">
            <img src="http://htmlstream.com/preview/unify-v1.8/assets/plugins/master-slider/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8/assets/img/bg/img2.jpg" alt="">
            <div class="ms-layer ms-promo-info color-light" style="left:15px; top:160px"
                 data-effect="bottom(40)"
                 data-duration="2000"
                 data-delay="700"
                 data-ease="easeOutExpo"
                    >Introducing</div>

            <div class="ms-layer ms-promo-info ms-promo-info-in color-light" style="left:15px; top:210px"
                 data-effect="bottom(40)"
                 data-duration="2000"
                 data-delay="1000"
                 data-ease="easeOutExpo"
                    ><span class="color-green">Unify</span> Template</div>

            <div class="ms-layer ms-promo-sub color-light" style="left:15px; top:310px"
                 data-effect="bottom(40)"
                 data-duration="2000"
                 data-delay="1300"
                 data-ease="easeOutExpo"
                    >We are creative technology company providing <br> key digital services on web and mobile.</div>


            <a class="ms-layer btn-u" style="left:15px; top:390px" href="#"
               data-effect="bottom(40)"
               data-duration="2000"
               data-delay="1300"
               data-ease="easeOutExpo"
                    >LEARN MORE</a>

            <a class="ms-layer btn-u btn-u-dark" style="left:150px; top:390px" href="#"
               data-effect="bottom(40)"
               data-duration="2000"
               data-delay="1300"
               data-ease="easeOutExpo"
                    >ABOUT US</a>
            </div>

        <div class="ms-slide" style="z-index: 13">
            <img src="http://htmlstream.com/preview/unify-v1.8/assets/plugins/master-slider/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8/assets/img/bg/img4.jpg" alt="">

            <img class="ms-layer" src="http://htmlstream.com/preview/unify-v1.8/assets/plugins/master-slider/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8/assets/img/mockup/hand-black-iphone-l.png" alt=""
                 style="bottom:-10px; left:15px; width:400px; height: auto;"
                 data-effect="bottom(100)"
                 data-duration="2000"
                 data-ease="easeOutExpo"
                 data-type="image"
                    />

            <h3 class="ms-layer ms-promo-info-in color-light"  style="left:450px; top:170px;"
                data-effect="right(40)"
                data-duration="2300"
                data-delay="1300"
                data-ease="easeOutExpo"
                    >MOST</h3>

            <h3 class="ms-layer ms-promo-info-in color-darker"  style="left:450px; top:230px"
                data-effect="left(40)"
                data-duration="2300"
                data-delay="1400"
                data-ease="easeOutBack"
                    >INCREDIBLE</h3>

            <h3 class="ms-layer ms-promo-info-in color-darker"  style="left:450px; top:290px"
                data-effect="left(40)"
                data-duration="2300"
                data-delay="1400"
                data-ease="easeOutBack"
                    >NEW <span class="color-light">FEATURES</span></h3>

            <a class="ms-layer btn-u" style="left:450px; top:370px" href="#"
               data-effect="bottom(40)"
               data-duration="2000"
               data-delay="1300"
               data-ease="easeOutExpo"
                    >LEARN MORE</a>

            <a class="ms-layer btn-u btn-u-dark" style="left:580px; top:370px" href="#"
               data-effect="bottom(40)"
               data-duration="2000"
               data-delay="1300"
               data-ease="easeOutExpo"
                    >DOWNLOAD NOW</a>
        </div>

        <div class="ms-slide" style="z-index: 12">
            <img src="http://htmlstream.com/preview/unify-v1.8/assets/plugins/master-slider/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8/assets/img/bg/img3.jpg" alt="">

            <div class="ms-layer video-box" style="bottom:125px; right:15px; width:650px; height:370px;"
                 data-type="video"
                 data-effect="rotate3dright(0,30,0,100,r)"
                 data-duration="1500"
                 data-ease="easeOutQuad"
                    >
                <img class="ms-img-bordered" src="http://htmlstream.com/preview/unify-v1.8/assets/plugins/master-slider/slider-templates/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img20.jpg" alt="">
                <iframe src="http://player.vimeo.com/video/70528799" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen> </iframe>
        </div>

            <h3 class="ms-layer ms-promo-info color-light"  style="left:10px; top:170px"
                data-effect="bottom(20)"
                data-duration="2300"
                data-delay="2300"
                data-ease="easeOutExpo"
                    >AMAZING</h3>

            <h3 class="ms-layer ms-promo-info-in color-light"  style="left:10px; top:245px"
                data-effect="left(100)"
                data-duration="3300"
                data-delay="1900"
                data-ease="easeOutExpo"
                    ><span class="color-green">FEATURES</span></h3>

            <h3 class="ms-layer normal-title color-light"  style="left:10px; top:312px"
                data-effect="bottom(20)"
                data-duration="2300"
                data-delay="2000"
                data-ease="easeOutExpo"
                    >UNIFY BOOTSTRAP TEMPLATE</h3>

            <p class="ms-layer ms-promo-sub ms-promo-sub-in color-light"  style="left:10px; top:360px"
               data-effect="right(40)"
               data-duration="2300"
               data-delay="2300"
               data-ease="easeOutExpo"
                    >YOUTUBE, VIMEO AND CUSTOM <br> IFRAME SUPPORTED</p>
        </div>
    </div>
<!-- end of masterslider -->
</div>
<!--=== End Slider ===-->

<%--
<template:addResources type="inline">
    <script>
        var slider = new MasterSlider();
        slider.setup('masterslider' , {
            width:800,    // slider standard width
            height:350,   // slider standard height
            space:5
            // more slider options goes here...
            // check slider options section in documentation for more options.
        });
        // adds Arrows navigation control to the slider.
        slider.control('arrows');
    </script>
</template:addResources>
--%>
<%-- open the template container for remaining content --%>
<%--<div class="container">--%>

