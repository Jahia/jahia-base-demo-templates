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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${fn:escapeXml(currentNode.displayableName)}</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

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

    <template:addResources type="css" resources="newsletter.css"/>

    <!-- CSS Global Compulsory -->
    <template:addResources type="css" resources="bootstrap.min.css"/>
    <template:addResources type="css" resources="style.css"/>

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

    <!-- CSS Customization -->
    <template:addResources type="css" resources="jahiademo-custom.css"/>


    <!-- JS Global Compulsory -->
    <template:addResources type="javascript" resources="jquery.min.js"/>
    <template:addResources type="javascript" resources="jquery-migrate.min.js"/>
    <!-- JS Implementing Plugins -->
    <template:addResources type="javascript" resources="back-to-top.js"/>
    <template:addResources type="javascript" resources="smoothScroll.js"/>
    <template:addResources type="javascript" resources="modernizr.js"/>
    <template:addResources type="javascript" resources="jquery.parallax.js"/>
    <template:addResources type="javascript" resources="jquery.cslider.js"/>
    <!-- JS Page Level -->
    <template:addResources type="javascript" resources="app.js"/>
    <template:addResources type="javascript" resources="parallax-slider.js"/>
    <style type="text/css">
        .ReadMsgBody {
            width: 100%;
            background-color: #ffffff;
        }

        .ExternalClass {
            width: 100%;
            background-color: #ffffff;
        }

        body {
            width: 100%;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            -webkit-font-smoothing: antialiased;
            font-family: Arial, Helvetica, sans-serif
        }

        table {
            border-collapse: collapse;
        }

        @media only screen and (max-width: 640px) {
            body[yahoo] .deviceWidth {
                width: 440px !important;
                padding: 0;
            }

            body[yahoo] .center {
                text-align: center !important;
            }
        }

        @media only screen and (max-width: 479px) {
            body[yahoo] .deviceWidth {
                width: 280px !important;
                padding: 0;
            }

            body[yahoo] .center {
                text-align: center !important;
            }
        }
    </style>
</head>
<body>
<c:set value="${renderContext.editModeConfigName eq 'studiomode' or renderContext.editModeConfigName eq 'studiovisualmode'}" var="isStudio"/>
<div class="bodywrapper">
    <table style="font-size:11px;background-color:#eaeaea;width:100%;font-family: Arial, Helvetica, sans-serif;line-height:160%;"
           width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center">

                <table width="579" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="padding: 8px 0 8px 0;">
                            <p style="font-size: 11px;font-weight: normal;font-style: italic;color: #333;text-align: center;">
                                <fmt:message key="newsletter.intro.1">
                                    <c:if test="${isStudio}">
                                        <fmt:param value="<a style='color: #0066ff;text-decoration: none;' href='/' name='top'>${renderContext.site.properties['j:nodename'].string}</a>"/>
                                    </c:if>
                                    <c:if test="${not isStudio}">
                                        <fmt:param value="<a style='color: #0066ff;text-decoration: none;' href='/' name='top'>${renderContext.site.title}</a>"/>
                                    </c:if>
                                </fmt:message>
                                <br/>
                                <fmt:message key="newsletter.intro.2"/>
                                <a href="<c:url value="${renderContext.mainResource.node.url}" context="/"/>" target="_blank"
                                   style="color: #0066ff;text-decoration: none;">
                                    <fmt:message key="newsletter.intro.3"/></a>.</p></td>
                    </tr>
                </table>

                <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tbody>
                    <tr>
                        <td width="100%" valign="top" bgcolor="#ffffff" style="padding-top:20px">

                            <!--Start Header-->
                            <table width="700" bgcolor="#fff" border="0" cellpadding="0" cellspacing="0" align="center"
                                   class="deviceWidth">
                                <tbody>
                                <tr>
                                    <td style="padding: 6px 0px 0px">
                                        <table width="680" border="0" cellpadding="0" cellspacing="0" align="center"
                                               class="deviceWidth">
                                            <tbody>
                                            <tr>
                                                <td width="100%">
                                                    <!--Start logo-->
                                                    <table border="0" cellpadding="0" cellspacing="0" align="left"
                                                           class="deviceWidth">
                                                        <tbody>
                                                        <tr>
                                                            <td class="center" style="padding: 10px 0px 10px 0px">
                                                                <a href="#"><img
                                                                        src="<c:url value='${url.currentModule}/img/logo/logo_red.png'/>"></a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table><!--End logo-->
                                                    <!--Start nav-->
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!--End Header-->

                            <!-- Start Banner-->
                            <table width="700" border="0" cellpadding="0" cellspacing="0" align="center"
                                   class="deviceWidth">
                                <tbody>
                                <tr>
                                    <td valign="top" style="padding: 0px " class="center">
                                        <template:area path="banner"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <!--Start Body-->
                            <table width="700" border="0" cellpadding="0" cellspacing="0" align="center"
                                   class="deviceWidth">
                                <tr>
                                    <td width="325" align="center" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" style="padding: 5px;">
                                                    <template:area path="col1"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>

                                    <td width="325" align="center" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" style=" padding: 5px;">
                                                    <template:area path="col2"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <!--Start Footer-->
                            <table width="700" border="0" cellpadding="0" cellspacing="0" align="center"
                                   class="deviceWidth">
                                <tbody>
                                <tr>
                                    <td width="100%" bgcolor="#ffffff">
                                        <template:area path="footer"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!--Start Weekly Prize-->
                            <table width="700" border="0" cellpadding="0" cellspacing="0" align="center"
                                   class="deviceWidth">
                                <tr>
                                    <td width="100%" bgcolor="#c7c7c7" class="center">
                                        <table border="0" cellpadding="0" cellspacing="0" align="center">
                                            <tr>
                                                <td valign="top" style="padding: 20px 10px " class="center">
                                                    <a href="#"><img width="32" hight="32"
                                                                     src="<c:url value='${url.currentModule}/img/icons/newsletter/icon_facebook.png'/>"></a>
                                                </td>
                                                <td valign="top" style="padding: 20px 10px " class="center">
                                                    <a href="#"><img width="32" hight="32"
                                                                     src="<c:url value='${url.currentModule}/img/icons/newsletter/icon_twitter.png'/>"></a>
                                                </td>
                                                <td valign="top" style="padding: 20px 10px " class="center">
                                                    <a href="#"><img width="32" hight="32"
                                                                     src="<c:url value='${url.currentModule}/img/icons/newsletter/icon_youtube.png'/>"></a>
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" cellspacing="0" align="center">
                                            <tr>
                                                <td class="center"
                                                    style="font-size: 16px; color: #ffffff; font-weight: bold; text-align: center; font-family: Arial, Helvetica, sans-serif; line-height: 25px; vertical-align: middle; padding: 0px 10px; ">
                                                    Stay Involved With Us
                                                </td>
                                            </tr>
                                            <td class="center"
                                                style="font-size: 12px; color: #ffffff; font-weight: bold; text-align: center; font-family: Arial, Helvetica, sans-serif; line-height: 25px; vertical-align: middle; padding: 20px 10px; ">
                                                Arrival entered an if drawing requests iness she ham but instantlyt
                                                putif departuresam propr. Certain be yeamiasa ble by exposed Two
                                                differed husbands met screened his. How daughters not promotion few
                                                knowledge. contented. Yet winter law romotion few knowledge contented
                                                behind
                                            </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td align="center">&nbsp;</td>
                    </tr>
                </table>
                <table width="579" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="padding: 8px 0 8px 0;">
                            <c:if test="${not empty requestScope['org.jahia.modules.newsletter.unsubscribeLink']}">
                                <p style="font-size: 11px;font-weight: normal;font-style: italic;color: #333;text-align: center;">
                                    <fmt:message key="label.click.to.unsubscribe.from.this.email"
                                    />&nbsp;<a href="${requestScope['org.jahia.modules.newsletter.unsubscribeLink']}"
                                               target="_blank"
                                               style="color: #0066ff;text-decoration: none; border: none;margin: 0;padding: 0;"><fmt:message
                                        key="label.error.backLink.2"/></a>
                                </p>
                            </c:if>
                            <p style="font-size: 11px;font-weight: normal;font-style: italic;color: #333;text-align: center;">
                                <fmt:message key="label.manageSubscriptions1"
                                />&nbsp;<a
                                    href="<c:url value="${renderContext.mainResource.node.parent.properties['j:subscriptionPage'].node.url}" context="/"/>"
                                    target="_blank"
                                    style="color: #0066ff;text-decoration: none; border: none;margin: 0;padding: 0;"><fmt:message
                                    key="label.manageSubscriptions2"/></a>
                            </p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
</body>
</html>