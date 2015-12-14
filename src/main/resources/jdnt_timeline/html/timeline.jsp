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
<template:addResources type="css" resources="shortcode_timeline2.css"/>


<%-- Get the title of the timeline, if exists display above carousel --%>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:if test="${not empty title}">
    <div class="headline"><h2>${title}</h2></div>
</c:if>

    <ul class="timeline-v2">
        <c:set var="entries" value="${jcr:getChildrenOfType(currentNode, 'jnt:news')}"/>
        <c:forEach items="${entries}" var="entry" varStatus="item">
            <%-- TODO: by placing <li> tag here in the list the timeline displays properly in edit mode --%>
            <li class="equal-height-columns">
                <template:module node="${entry}" nodeTypes="jnt:news" editable="true"/>
            </li>
        </c:forEach>
<%--        <li class="equal-height-columns">
            <div class="cbp_tmtime equal-height-column"><span>7/2/09</span> <span>February</span></div>
            <i class="cbp_tmicon rounded-x hidden-xs"></i>
            <div class="cbp_tmlabel equal-height-column">
                <h2>First achievements</h2>
                <p>Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi.</p>
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-check color-green"></i> Donec id elit non mi porta gravida</li>
                            <li><i class="fa fa-check color-green"></i> Corporate and Creative</li>
                            <li><i class="fa fa-check color-green"></i> Responsive Bootstrap Template</li>
                            <li><i class="fa fa-check color-green"></i> Corporate and Creative</li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-check color-green"></i> Donec id elit non mi porta gravida</li>
                            <li><i class="fa fa-check color-green"></i> Corporate and Creative</li>
                            <li><i class="fa fa-check color-green"></i> Responsive Bootstrap Template</li>
                            <li><i class="fa fa-check color-green"></i> Corporate and Creative</li>
                        </ul>
                    </div>
                </div>
            </div>
        </li>
       <li class="equal-height-columns">
            <div class="cbp_tmtime equal-height-column"><span>11/3/10</span> <span>March</span></div>
            <i class="cbp_tmicon rounded-x hidden-xs"></i>
            <div class="cbp_tmlabel equal-height-column">
                <h2>Our Popularity</h2>
                <p>Parsnip lotus root celery yarrow seakale tomato collard greens tigernut epazote ricebean melon tomatillo soybean chicory broccoli beet greens peanut salad. Lotus root burdock bell pepper chickweed shallot groundnut pea sprouts welsh onion wattle seed pea salsify turnip scallion peanut arugula bamboo shoot onion swiss chard.</p>

                <div class="margin-bottom-20"></div>

                <div class="row">
                    <div class="col-sm-6">
                        <!-- Progress Bar Text -->
                        <div class="progress-bar-text">
                            <p class="text-left">HTML &amp; CSS</p>
                            <p class="text-right">91%</p>
                            <div class="progress progress-u progress-xs">
                                <div class="progress-bar progress-bar-u progress-bar-u-success" role="progressbar" aria-valuenow="91" aria-valuemin="0" aria-valuemax="100" style="width: 91%">
                                </div>
                            </div>
                        </div>
                        <!-- End Progress Bar Text -->

                        <!-- Progress Bar Text -->
                        <div class="progress-bar-text">
                            <p class="text-left">Web Animation</p>
                            <p class="text-right">55%</p>
                            <div class="progress progress-u progress-xs">
                                <div class="progress-bar progress-bar-u progress-bar-u-info" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%">
                                </div>
                            </div>
                        </div>
                        <!-- End Progress Bar Text -->
                    </div>

                    <div class="col-sm-6">
                        <!-- Progress Bar Text -->
                        <div class="progress-bar-text">
                            <p class="text-left">Web Design</p>
                            <p class="text-right">67%</p>
                            <div class="progress progress-u progress-xs">
                                <div class="progress-bar progress-bar-u progress-bar-u-danger" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width: 67%">
                                </div>
                            </div>
                        </div>
                        <!-- End Progress Bar Text -->

                        <!-- Progress Bar Text -->
                        <div class="progress-bar-text">
                            <p class="text-left">PHP &amp; Javascript</p>
                            <p class="text-right">73%</p>
                            <div class="progress progress-u progress-xs">
                                <div class="progress-bar progress-bar-u progress-bar-u-warning" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 73%">
                                </div>
                            </div>
                        </div>
                        <!-- End Progress Bar Text -->
                    </div>
                </div>
            </div>
        </li>
        <li class="equal-height-columns">
            <div class="cbp_tmtime equal-height-column"><span>18/7/13</span> <span>June</span></div>
            <i class="cbp_tmicon rounded-x hidden-xs"></i>
            <div class="cbp_tmlabel equal-height-column">
                <h2>Unify in recent years</h2>
                <p>Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi.</p>
                <p>Bitterleaf celery coriander epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout.</p>

                <div class="margin-bottom-20"></div>

                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <img class="img-responsive md-margin-bottom-10" src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img2.jpg" alt="">
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <img class="img-responsive md-margin-bottom-10" src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img4.jpg" alt="">
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <img class="img-responsive md-margin-bottom-10" src="http://htmlstream.com/preview/unify-v1.8/assets/img/main/img3.jpg" alt="">
                    </div>
                </div>
            </div>
        </li>--%>
    </ul>

<c:if test="${renderContext.editMode}">
    <template:module path="*" nodeTypes="jnt:news"/>
</c:if>
