<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="siteNode" value="${renderContext.site}"/>

<head>
    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta http-equiv="cache-control" content="must-revalidate" />

    <!-- Favicon -->
    <c:choose>
        <c:when test="${jcr:isNodeType(renderContext.site, 'jdmix:favicon')}">
            <template:module path="${renderContext.site.path}" view="favicon" />
        </c:when>
        <c:otherwise>
            <link rel="shortcut icon" href="${url.context}${url.currentModule}/img/favicon/favicon.ico" type="image/x-icon">
        </c:otherwise>
    </c:choose>
    <!-- Web Fonts -->
    <%-- Using local web fonts versus the google resource. If you want to change to google please uncomment this and comment out the local open-sans-webfonts.css
    <link rel='stylesheet' type='text/css'
          href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'> --%>

    <template:addResources type="css" resources="open-sans-webfonts.css"/>

    <!-- CSS Global Compulsory -->
    <template:addResources type="css" resources="bootstrap.min.css"/>
    <template:addResources type="css" resources="style.css"/>

    <!-- CSS Header and Footer -->
    <template:addResources type="css" resources="headers/header-v8.css"/>
    <template:addResources type="css" resources="footers/footer-v1.css"/>

    <!-- CSS Implementing Plugins -->
    <template:addResources type="css" resources="animate.css"/>
    <template:addResources type="css" resources="line-icons.css"/>
    <template:addResources type="css" resources="font-awesome.min.css"/>
    <template:addResources type="css" resources="parallax-slider.css"/>
    <template:addResources type="css" resources="dark.css"/>
    <template:addResources type="css" resources="ie8.css"/>
    <template:addResources type="css" resources="blocks.css"/>
    <template:addResources type="css" resources="plugins.css"/>
    <template:addResources type="css" resources="app.css"/>
    <template:addResources type="css" resources="plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css"/>
    <template:addResources type="css" resources="plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css"/>
    <!-- CSS Jahia Theme -->
    <template:theme/>

    <!-- JS Global Compulsory -->
    <template:addResources type="javascript" resources="jquery.min.js"/>
    <template:addResources type="javascript" resources="jquery-migrate.min.js"/>
    <template:addResources type="javascript" resources="bootstrap.min.js"/>
    <!-- JS Implementing Plugins -->
    <template:addResources type="javascript" resources="back-to-top.js"/>
    <template:addResources type="javascript" resources="smoothScroll.js"/>
    <template:addResources type="javascript" resources="modernizr.js"/>
    <template:addResources type="javascript" resources="jquery.parallax.js"/>
    <template:addResources type="javascript" resources="jquery.cslider.js"/>
    <!-- CSS Customization -->
    <template:addResources type="css" resources="jahiademo-custom.css"/>

    <!-- JS Page Level -->
    <template:addResources type="javascript" resources="app.js"/>
    <template:addResources type="javascript" resources="parallax-slider.js"/>

    <!-- Custom Javascript -->
    <template:addResources type="javascript" resources="custom/template.js"/>


    <!--[if lt IE 9]>
    <template:addResources type="javascript" resources="respond.js"/>
    <template:addResources type="javascript" resources="html5shiv.js"/>
    <template:addResources type="javascript" resources="placeholder-IE-fixes.js"/>
    <![endif]-->
</head>

<c:set var="siteNode" value="${renderContext.site}"/>



<%-- get the current year for the copyright --%>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy" var="thisYear"/>

<c:if test="${not renderContext.editMode}">
    <c:set var="headerSpace" value="header-fixed-space-v2 "/>
    <c:set var="stickyHeader" value="header-sticky"/>
</c:if>

<body class="header-fixed ${headerSpace} <template:include view="hidden.style"/>">
<c:if test="${jcr:isNodeType(siteNode, 'jdmix:cookies')}">
    <template:module node="${siteNode}" view="cookieView" editable="false"/>
</c:if>
<div class="wrapper">
    <!--=== Header v8 ===-->
    <div class="header-v8 ${stickyHeader}">
        <!-- Topbar blog -->
        <div class="blog-topbar">
            <div class="topbar-search-block">
                <template:area path="search"/>
            </div>
            <div class="container">
                <div class="row">
                    <!--Small language login menu-->
                    <div class="col-sm-6 col-xs-6">
                        <div class="topbar-list topbar-menu">
                            <template:area path="languageLoginMini"/>
                        </div>
                        <div class="topbar-toggler"><span class="user-box hidden-sm hidden-md hidden-lg"> <i
                                class="fa fa-user"></i>&nbsp;|&nbsp;<i class="fa fa-globe"></i>&nbsp;<i
                                class="fa fa-caret-up"></i></span>
                        </div>
                        <div class="pull-left"><span class="hidden-sm hidden-md hidden-lg">
                            <i class="fa fa-search search-btn"></i></span>
                        </div>
                    </div>
                    <!--/end Small language login menu-->
                    <!--Full language login menu-->
                    <div class="col-sm-6 col-xs-6 clearfix">
                        <div class="topbar-list topbar-log_reg pull-right visible-sm-block visible-md-block visible-lg-block">
                            <template:area path="languageLogin"/>
                        </div>
                    </div>
                    <!--/end Full language login menu-->
                </div>
                <!--/end row-->
            </div>
            <!--/end container-->
        </div>
        <!-- End Topbar blog -->

        <!-- Navbar -->
        <div class="navbar mega-menu" role="navigation">

            <div class="container">
                <div class="res-container">
                    <template:area path="toggleNav"/>
                    <c:choose>
                        <%-- check to see if the site has site logo specified, if not then use the logo area as defined in the template definition--%>
                        <c:when test="${jcr:isNodeType(siteNode, 'jdmix:siteLogo')}">
                            <div class="navbar-brand">
                                <template:module node="${siteNode}" view="default" nodeTypes="jdmix:siteLogo"
                                                 editable="true"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="logo" class="navbar-brand">
                                <template:area path="logo"/>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <template:area path="navmenu"/>
                </div>
            </div>
        </div>
        <!-- End Navbar -->
    </div>
    <!--=== End Header v8 ===-->

    <template:area path="landing"/>
    <!--=== Content Part ===-->
    <div class="container margin-top-20">
        <template:area path="pagecontent"/>
    </div>
    <!-- End Content Part -->
    <br/>
    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 md-margin-bottom-40">
                        <template:area path="footer-1" nodeTypes="jdmix:footerWidgets" moduleType="absoluteArea"
                                       level="0"/>
                    </div>
                    <!--/col-md-12-->

                </div>
            </div>
        </div>
        <!--/footer-->

        <div class="copyright">
            <div class="container">
                <div class="row">
                    <!-- Footer Message  -->
                    <div class="col-md-6">
                        <c:choose>
                            <c:when test="${jcr:isNodeType(renderContext.site, 'jdmix:siteFooterMessage')}">
                                <template:module path="${renderContext.site.path}" view="siteFooterMessage" />
                            </c:when>
                            <c:otherwise>
                        <p>
                            ${thisYear} &copy; <fmt:message key="footer.copyrights"/>
                            <a href="#"><fmt:message key="footer.privacy"/></a> | <a href="#"><fmt:message
                                key="footer.terms"/></a>
                        </p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- End Footer Message  -->
                    <!-- Social Links -->
                    <div class="col-md-6">
                        <a href="http://www.jahia.com" title="Powered by Jahia" target="_blank"><img
                                src="<c:url value="${url.currentModule}/img/poweredByJahia.png"/>" alt="Powered by Jahia"></a>
                    <c:if test="${jcr:isNodeType(renderContext.site, 'jdmix:siteSocialLinks')}">
                        <template:module path="${renderContext.site.path}" view="siteSocialLinks" />
                    </c:if>
                    </div>
                    <!-- End Social Links -->
                </div>
            </div>
        </div>
        <!--/copyright-->
    </div>
    <!--=== End Footer Version 1 ===-->
    <template:area path="modals"/>
</div>
<!--/wrapper-->

</body>
</html>
