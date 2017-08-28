<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
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



<!doctype html>
<html amp lang="en">
<head>
    <meta charset="utf-8">
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <link rel="canonical" href="<c:url value='${url.server}${url.base}${renderContext.mainResource.node.path}.html'/>">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">

    <c:set var="publicationDate" value="${renderContext.mainResource.node.properties['j:lastPublished'].time}"/>
    <script type="application/ld+json">
      {
        "@context": "http://schema.org",
        "@type": "NewsArticle",
        "headline": "${renderContext.mainResource.node.properties['jcr:title'].string}",
        "datePublished": <fmt:formatDate
            value="${publicationDate}" type="both" dateStyle="full" timeStyle="long" />,
        "image": [
          "logo.jpg"
        ]
      }
    </script>
    <style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
    <style amp-custom>
        .btn-primary {
            background-color: #ffffff;
            color: #e74c3c;
        }
        .btn {
            display: inline-block;
            padding: 4px 12px;
            margin-bottom: 10px;
            font-size: 14px;
            font-weight: bold;
            line-height: 20px;
            text-align: center;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 0;
            text-shadow: 0 1px rgba(0, 0, 0, 0.1);
        }
        .headline {
            background: #fafafa;
            border: solid 1px #eee;
            border-left: solid 2px #e74c3c;
            border-radius: 0;
            display: block;
            padding: 1px 10px;
            margin: 0 0 20px 0;
        }
        h1 {
            color: #555;
            font-family: "Open Sans", Arial, sans-serif;
            font-size: 20px;
            font-weight: 200;
            line-height: 33px;
            margin: 3px 0;
        }
    </style>
</head>
<body>
    <template:area editable="true" moduleType="existingNode" view="amp"/>
</body>
</html>