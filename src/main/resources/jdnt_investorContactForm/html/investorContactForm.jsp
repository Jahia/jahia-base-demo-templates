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
<template:addResources type="css" resources="plugins/skyforms/sky-forms.css"/>
<template:addResources type="css" resources="plugins/skyforms/custom/custom-sky-forms.css"/>
<div>
<form action="#" id="sky-form4" class="sky-form" novalidate="novalidate">
  <jcr:nodeType name="jdnt:investorContact" var="investorContact"/>
  <c:set var="propDefs" value="${investorContact.declaredPropertyDefinitionsAsMap}"/>
  <header><fmt:message key="jdnt_investorContactForm.header"/></header>
  <fieldset>                  
    <section>
      <label class="input">
        <i class="icon-append fa fa-user"></i>
        <input type="text" name="firstname" placeholder="<fmt:message key="jdnt_investorContactForm.firstname"/>">
        <b class="tooltip tooltip-bottom-right"><fmt:message key="jdnt_investorContactForm.firstname.tooltip"/></b>
      </label>
    </section>

    <section>
      <label class="input">
        <i class="icon-append fa fa-user"></i>
        <input type="text" name="lastname" placeholder="<fmt:message key="jdnt_investorContactForm.lastname"/>">
        <b class="tooltip tooltip-bottom-right"><fmt:message key="jdnt_investorContactForm.lastname.tooltip"/></b>
      </label>
    </section>

    <section>
      <label class="input">
        <i class="icon-append fa fa-envelope"></i>
        <input type="email" name="email" placeholder="<fmt:message key="jdnt_investorContactForm.email"/>">
        <b class="tooltip tooltip-bottom-right"><fmt:message key="jdnt_investorContactForm.email.tooltip"/></b>
      </label>
    </section>

    <section>
      <label class="input">
        <i class="icon-append fa fa-phone"></i>
        <input type="text" name="phone" placeholder="<fmt:message key="jdnt_investorContactForm.phone"></fmt:message>">
        <b class="tooltip tooltip-bottom-right"><fmt:message key="jdnt_investorContactForm.phone.tooltip"/></b>
      </label>
    </section>
    
    <section>
      <label class="select">
        <select name="investorType" id="investorType">
          <option value="0" selected="" disabled=""><fmt:message key="jdnt_investorContactForm.investorType"/></option>
          <c:forEach items="${propDefs.investorType.valueConstraints}" var="valueOption">
            <option value="${valueOption}"><fmt:message key="jdnt_investorContactForm.investorType.${valueOption}"/></option>
          </c:forEach>
        </select>
        <i></i>
      </label>
    </section>

    <section>
      <label class="select">
        <select name="contactReason" id="contactReason">
          <option value="0" selected="" disabled=""><fmt:message key="jdnt_investorContactForm.contactReason"/></option>
          <c:forEach items="${propDefs.contactReason.valueConstraints}" var="valueOption">
            <option value="${valueOption}"><fmt:message key="jdnt_investorContactForm.contactReason.${valueOption}"/></option>
          </c:forEach>
        </select>
        <i></i>
      </label>
    </section>

    <section>
        <label class="label">
          <fmt:message key="jdnt_investorContactForm.subscription.label"/>
        </label>
          <c:forEach items="${propDefs.subscription.valueConstraints}" var="valueOption">
            <label class="radio">
            <input type="radio" name="subscription" value="${valueOption}"><fmt:message key="jdnt_investorContactForm.subscription.${valueOption}"/>
              <i></i>
            </label>
          </c:forEach>
    </section>
  </fieldset>
  <footer>
    <button type="submit" class="btn-u">Submit</button>
  </footer>
</form>
</div>