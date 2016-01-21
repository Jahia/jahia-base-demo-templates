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
<template:addResources type="javascript" resources="plugins/counter/waypoints.min.js"/>
<template:addResources type="javascript" resources="plugins/counter/jquery.counterup.min.js"/>
<c:set var="uuid" value="${currentNode.identifier}"/>
<div class="headline"><h2>Stock Widget</h2></div>
<div id="stock-widget${uuid}" class="stock-widget">
  <div class="stock-widget-wrapper">
    <div class="title">${currentNode.properties['stock'].string}</div>
    <div class="description">
      <p>Lorem ipsum dolor et sumet malaris</p>
    </div>
    <div class="stock-price">
      <span class="currency-value">$</span>
      <span class="counter"></span>
    </div>
    <div class="stock-variable">
    </div>
    <a href="#" class="btn">Show me more</a>
  </div>
</div>



<template:addResources type="inline">
  <script type="text/javascript">
    $.ajax({
      url: 'http://finance.google.com/finance/info?client=ig&q=${currentNode.properties['stock'].string}',
      dataType: 'jsonp',
      data: { get_param: 'value' },
      success: function(data){
        $("#stock-widget${uuid} .stock-widget-wrapper .description p").text(data[0].e);
        $("#stock-widget${uuid} .stock-price .counter").text(data[0].l);
        var variation = data[0].c;
        if (variation.indexOf("+")>=0){
          $("#stock-widget${uuid} .stock-variable").append("<div class='arrow'></div>"+variation.replace('+',''));
        }
        if (variation.indexOf("-")>=0){
          $("#stock-widget${uuid} .stock-variable").append("<div class='arrow-down'></div>"+variation.replace('-',''));
        }
        <c:if test="${not renderContext.editMode}">
        jQuery('#stock-widget${uuid} .counter').counterUp({
          delay: 10,
          time: 1000
        });
        </c:if>
      },
      error: function(){ alert('error'); },

    });
  </script>
</template:addResources>


