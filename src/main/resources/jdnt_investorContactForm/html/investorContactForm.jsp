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
<div>
<form action="#" id="sky-form4" class="sky-form" novalidate="novalidate">
  <header>Registration form</header>
  
  <fieldset>                  
    <section>
      <label class="input">
        <i class="icon-append fa fa-user"></i>
        <input type="text" name="username" placeholder="Username">
        <b class="tooltip tooltip-bottom-right">Needed to enter the website</b>
      </label>
    </section>
    
    <section>
      <label class="input">
        <i class="icon-append fa fa-envelope"></i>
        <input type="email" name="email" placeholder="Email address">
        <b class="tooltip tooltip-bottom-right">Needed to verify your account</b>
      </label>
    </section>
    
    <section>
      <label class="input">
        <i class="icon-append fa fa-lock"></i>
        <input type="password" name="password" placeholder="Password" id="password">
        <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
      </label>
    </section>
    
    <section>
      <label class="input">
        <i class="icon-append fa fa-lock"></i>
        <input type="password" name="passwordConfirm" placeholder="Confirm password">
        <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
      </label>
    </section>
  </fieldset>
  
  <fieldset>
    <div class="row">
      <section class="col col-6">
        <label class="input">
          <input type="text" name="firstname" placeholder="First name">
        </label>
      </section>
      <section class="col col-6">
        <label class="input">
          <input type="text" name="lastname" placeholder="Last name">
        </label>
      </section>
    </div>
    
    <section>
      <label class="select">
        <select name="gender">
          <option value="0" selected="" disabled="">Gender</option>
          <option value="1">Male</option>
          <option value="2">Female</option>
          <option value="3">Other</option>
        </select>
        <i></i>
      </label>
    </section>
    
    <section>
      <label class="checkbox"><input type="checkbox" name="subscription" id="subscription"><i></i>I want to receive news and  special offers</label>
      <label class="checkbox"><input type="checkbox" name="terms" id="terms"><i></i>I agree with the Terms and Conditions</label>
    </section>
  </fieldset>
  <footer>
    <button type="submit" class="btn-u">Submit</button>
  </footer>
</form>
</div>