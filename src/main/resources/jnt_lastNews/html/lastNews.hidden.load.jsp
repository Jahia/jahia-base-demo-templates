<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>

<%-- search for the latest news --%>
<jcr:nodeProperty node="${currentNode}" name="maxNews" var="maxNews"/>
<jcr:nodeProperty node="${currentNode}" name="filter" var="filter"/>

<query:definition var="lastNewsQuery" limit="${maxNews.long}">
    <query:selector nodeTypeName="jnt:news" selectorName="news"/>
    <query:descendantNode path="${renderContext.mainResource.node.resolveSite.path}" selectorName="news"/>
    <%-- check if a filter category was selected and apply to the query --%>
    <c:if test="${not empty filter.string}">
        <query:equalTo propertyName="j:defaultCategory" value="${filter.string}"/>
    </c:if>
    <query:sortBy propertyName="date"  order="desc"/>
</query:definition>

<c:set target="${moduleMap}" property="editable" value="false"/>
<c:set target="${moduleMap}" property="emptyListMessage"><fmt:message key="label.noNewsFound"/></c:set>
<c:set target="${moduleMap}" property="listQuery" value="${lastNewsQuery}"/>
<c:set target="${moduleMap}" property="subNodesView" value="${currentNode.properties['j:subNodesView'].string}"/>


