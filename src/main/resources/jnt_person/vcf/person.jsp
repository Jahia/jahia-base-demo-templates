<%@ page language="java" contentType="text/vcard;charset=UTF-8" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="flowRequestContext" type="org.springframework.webflow.execution.RequestContext"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%-- Photo is only added in live mode --%>


<c:set var="picture" value="${currentNode.properties.picture}"/>
<c:set var="lastName" value="${currentNode.properties.lastname.string}"/>
<c:set var="firstName" value="${currentNode.properties.firstname.string}"/>
<c:set var="function" value="${currentNode.properties.function.string}"/>
<c:set var="phone" value="${currentNode.properties.telephone.string}"/>
<c:set var="mobile" value="${currentNode.properties.cellular.string}"/>
<c:set var="email" value="${currentNode.properties.email.string}"/>
<c:set var="fax" value="${currentNode.properties.fax.string}"/>
<c:set var="businessUnit" value="${currentNode.properties.businessUnit.string}"/>

BEGIN:VCARD
VERSION:3.0
N:${lastName};${firstName}
FN:${firstName}<c:out value=" "/>${lastName}
ORG:${businessUnit}
TITLE:${function}
<c:if test="${! empty phone}">
    <c:set var="phone" value="${fn:replace(phone,' ','' )}"/>
    <c:set var="phone" value="${fn:replace(phone,'-','' )}"/>
    <c:set var="phone" value="${fn:replace(phone,'.','' )}"/>
    TEL;TYPE=WORK,VOICE:${phone}
</c:if>
<c:if test="${! empty mobile}">
    <c:set var="mobile" value="${fn:replace(mobile,' ','' )}"/>
    <c:set var="mobile" value="${fn:replace(mobile,'-','' )}"/>
    <c:set var="mobile" value="${fn:replace(mobile,'.','' )}"/>

    TEL;TYPE=WORK,CELL:${mobile}
</c:if>
<c:if test="${! empty fax}">
    <c:set var="fax" value="${fn:replace(fax,' ','' )}"/>
    <c:set var="fax" value="${fn:replace(fax,'-','' )}"/>
    <c:set var="fax" value="${fn:replace(fax,'.','' )}"/>

    TEL;TYPE=WORK,FAX:${fax}
</c:if>
ADR;TYPE=WORK:;;${adresse};${zip};${country}
LABEL;TYPE=WORK:${adresse}\n${zip}\n${country}
EMAIL;TYPE=PREF,INTERNET:${email}
REV:<%=new SimpleDateFormat("yyyyMMdd'T'HHmmss'Z'").format(new Date()) %>
<c:catch var="error">
    <c:if test="${not empty picture.node}">
        <c:url var="pictureUrl" value="${picture.node.url}" context="/"/>
        <%
            String base64 = "";
            String pictureUrl = (String) pageContext.findAttribute("pictureUrl");
            try {
                URL url = new URL(pictureUrl);
                BufferedInputStream bis = new BufferedInputStream(url.openConnection().getInputStream());
                byte[] imageBytes = IOUtils.toByteArray(bis);
                //byte[] imageBytes = IOUtils.toByteArray(pictureUrl);
                base64 = Base64.encodeBase64String(imageBytes);
                pageContext.setAttribute("base64", base64);
            } catch (IOException e) {
            }
        %>
        <c:if test="${! empty base64}">
            <c:set var="extension" value="${fn:toUpperCase(functions:fileExtension(picture.node.path))}"/>
            PHOTO;ENCODING=BASE64;TYPE=${extension}:<%=base64%>
        </c:if>
    </c:if>
</c:catch>
END:VCARD
