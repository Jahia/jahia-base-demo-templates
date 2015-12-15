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
<template:addResources type="css" resources="masterslider/skins/default/style.css"/>
<template:addResources type="javascript" resources="masterslider/masterslider.min.js"/>
<%-- TODO: Hardcoded component --%>
<%-- TODO: when masterslider.css is added nothing displays on the screen. If masterslider.css is left out the content displays just not in a proper layout as expected. --%>


<!-- Close the container from the template before starting a slider section
       Have to reopen the div AFTER the slider -->
</div>

<h1>SLIDER</h1>
<!-- masterslider -->
<div class="master-slider ms-skin-default" id="masterslider">
    <!-- new slide -->
    <div class="ms-slide">

        <!-- slide background -->
        <img src="http://htmlstream.com/preview/unify-v1.8//assets/plugins/master-slider/masterslider/style/blank.gif"
             data-src="http://htmlstream.com/preview/unify-v1.8//assets/plugins/master-slider/masterslider/images/1.jpg" alt="lorem ipsum dolor sit"/>

        <!-- slide text layer -->
        <div class="ms-layer ms-caption" style="top:10px; left:30px;">
            Lorem ipsum dolor sit amet
            </div>

    </div>
    <!-- end of slide -->
<%--
    <!-- new slide -->
    <div class="ms-slide">

        <!-- slide background -->
        <img src="hhttp://htmlstream.com/preview/unify-v1.8//assets/plugins/master-slider/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8//assets/plugins/master-slider/masterslider/images/2.jpg" alt="lorem ipsum dolor sit"/>

        <!-- slide text layer -->
        <div class="ms-layer ms-caption" style="top:10px; left:30px;">
            Lorem ipsum dolor sit amet
        </div>

        <!-- linked slide -->
        <a href="http://codecanyon.net/user/averta">Averta</a>

        </div>
    <!-- end of slide -->

    <!-- new slide -->
    <div class="ms-slide">

        <!-- slide background -->
        <img src="http://htmlstream.com/preview/unify-v1.8//assets/plugins/master-slider/masterslider/style/blank.gif" data-src="http://htmlstream.com/preview/unify-v1.8//assets/plugins/master-slider/masterslider/images/3.jpg" alt="lorem ipsum dolor sit"/>

        <!-- slide text layer -->
        <div class="ms-layer ms-caption" style="top:10px; left:30px;">
            Lorem ipsum dolor sit amet
        </div>

        <!-- youtube video -->
        <a href="http://www.youtube.com/embed/YHWkro9-e9Q?hd=1&wmode=opaque&controls=1&showinfo=0" data-type="video">Youtube video</a>

        </div>
    <!-- end of slide -->
--%>
    </div>
<!-- end of masterslider -->
<!--=== End Slider ===-->
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

<!-- open the template container for remaining content -->
<div class="container">

