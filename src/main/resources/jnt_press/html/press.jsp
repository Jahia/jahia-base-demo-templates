<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<jcr:nodeProperty node="${currentNode}" name='date' var="datePress"/>

<jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="pressReleaseContainerCatKeys"/>
<h4><a href="<c:url value='${url.base}${currentNode.path}.pressdetail.html'/>"><jcr:nodeProperty node="${currentNode}"
                                                                                                 name='jcr:title'/></a>
</h4>
<span class="pressRealeseDate"><strong><fmt:formatDate dateStyle="long" type="date"
                                                       value="${datePress.date.time}"/></strong></span>
<c:if test="${!empty pressReleaseContainerCatKeys }">
            <span class="pressRealeseCategory">
                <fmt:message key='label.categories'/> :
                 <c:forEach items="${pressReleaseContainerCatKeys}" var="category" varStatus="status">
                     <c:if test="${not status.first}">,&nbsp</c:if>
                     <template:module path="${category.node.path}" view="pressCategory" editable="false"/>
                 </c:forEach>
            </span>
</c:if>

<div class="clear"></div>