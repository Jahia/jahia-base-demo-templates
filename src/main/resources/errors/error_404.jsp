<%-- Default Error page in static HTML --%>
<%@page language="java" contentType="text/html; charset=UTF-8" session="false" %><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/errors.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/modules/jahiademo/css/page_404_error3.css"/>
    <link rel="stylesheet" type="text/css" href="/modules/jahiademo/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/modules/jahiademo/css/app.css"/>
    <script type="text/javascript" src="/modules/jahiademo/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="/modules/jahiademo/javascript/jquery.backstretch.min.js"></script>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Error</title>
</head>
<body>
<!--=== Error v4 ===-->
<div class="container content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="error-v4">
                <a href="#"><img src="/modules/jahiademo/css/404/logo_red.png" alt=""></a>
                <h1><span class="color-green">404</h1>
                <span class="sorry">Hmm, it seems you took a wrong turn somewhere.<br/>Sorry, the page you were looking for could not be found!</span>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <a class="btn-u btn-brd btn-brd-hover btn-u-light" href="/"> Go Back to Main Page</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!--End Error Block-->

<div class="sticky-footer">
    <p class="copyright-space">
        2013 © Unify Template. ALL Rights Reserved.
    </p>
</div>

<script type="text/javascript">
    $.backstretch([
        "/modules/jahiademo/css/404/404-bg.jpg"
    ])
</script>

</body>