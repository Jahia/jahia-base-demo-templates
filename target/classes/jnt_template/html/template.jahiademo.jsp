<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
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


<head>
    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <template:addResources type="css" resources="bootstrap.min.css"/>
    <template:addResources type="css" resources="style.css"/>

    <!-- CSS Header and Footer -->
    <template:addResources type="css" resources="headers/header-default.css"/>
    <template:addResources type="css" resources="footers/footer-v1.css"/>

    <!-- CSS Implementing Plugins -->
    <template:addResources type="css" resources="animate.css"/>
    <template:addResources type="css" resources="line-icons.css"/>
    <template:addResources type="css" resources="font-awesome.min.css"/>


    <!-- CSS Customization -->
    <template:addResources type="css" resources="custom.css"/>
</head>

<c:set var="siteNode" value="${renderContext.site}"/>


<body>

<div class="wrapper">
    <!--=== Header ===-->
    <div class="header">
        <div class="container">
            <!-- Logo -->
            <a class="logo" href="index.html">
                <img src="assets/img/logo1-default.png" alt="Logo">
            </a>
            <!-- End Logo -->

            <!-- Topbar -->
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
            <!-- End Topbar -->

            <!-- Toggle get grouped for better mobile display -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
            <!-- End Toggle -->

        </div><!--/end container-->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
        <div class="container">
        <template:area path="navmenu"/>
        </div>
    </div>
    </div>
    <!--=== End Header ===-->




    <!--=== Content Part ===-->
    <div class="container content-sm">
        <template:area path="pagecontent"/>
    </div><!--/container-->
    <!-- End Content Part -->

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 md-margin-bottom-40">
                        <template:area path="footer-1" nodeTypes="jdmix:footerWidgets" moduleType="absoluteArea" level="0"/>
                    </div><!--/col-md-3-->

                    <div class="col-md-3 md-margin-bottom-40">
                        <template:area path="footer-2" nodeTypes="jdmix:footerWidgets" moduleType="absoluteArea" level="0"/>
                    </div><!--/col-md-3-->

                    <div class="col-md-3 md-margin-bottom-40">
                        <template:area path="footer-3" nodeTypes="jdmix:footerWidgets" moduleType="absoluteArea" level="0"/>
                    </div><!--/col-md-3-->

                    <div class="col-md-3 map-img md-margin-bottom-40">
                        <template:area path="footer-4" nodeTypes="jdmix:footerWidgets" moduleType="absoluteArea" level="0"/>
                    </div><!--/col-md-3-->

                </div>
            </div>
        </div><!--/footer-->

        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p>
                            2015 &copy; All Rights Reserved.
                            <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
                        </p>
                    </div>

                    <!-- Social Links -->
                    <div class="col-md-6">
                        <ul class="footer-socials list-inline">
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Skype">
                                    <i class="fa fa-skype"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Google Plus">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Linkedin">
                                    <i class="fa fa-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest">
                                    <i class="fa fa-pinterest"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="tooltips" data-toggle="tooltip" data-placement="top" title="" data-original-title="Dribbble">
                                    <i class="fa fa-dribbble"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Social Links -->
                </div>
            </div>
        </div><!--/copyright-->
    </div>
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/parallax-slider/js/modernizr.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/js/app.js"></script>
<!--[if lt IE 9]>
<script src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/respond.js"></script>
<script src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/html5shiv.js"></script>
<script src="file:///Users/rlodge/Documents/Unify-v1.8/HTML/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
