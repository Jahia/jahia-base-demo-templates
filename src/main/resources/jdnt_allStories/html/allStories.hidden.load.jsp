<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%-- get the starting page for the search --%>
<c:set var="startNodePath" value="${currentNode.properties['startPage'].node.path}"/>

<%-- if user entered a starting node, override default --%>
<c:if test="${empty startNodePath}">
    <c:set var="startNodePath" value="${currentNode.resolveSite.path}"/>
</c:if>

<%-- get the parameter passed via the URL --%>
<c:set var="pageView" value="${param['pageView']}"/>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

<%-- set search query based on pageView selected --%>
<c:choose>
    <c:when test="${pageView == 'top'}">
        <c:set var="topStoriesStatement"
               value="select * from [jmix:topStory] as story where isdescendantnode(story, ['${startNodePath}'])
         and story.[j:level]='first' and (story.[j:endDate] is null or story.[j:endDate] > CAST('+${today}T00:00:00.000' as date)) order by story.[date] desc"/>
    </c:when>
    <c:when test="${pageView == 'featured'}">
        <c:set var="topStoriesStatement"
               value="select * from [jmix:topStory] as story where isdescendantnode(story, ['${startNodePath}'])
         and story.[j:level]='second' and (story.[j:endDate] is null or story.[j:endDate] > CAST('+${today}T00:00:00.000' as date)) order by story.[date] desc"/>
    </c:when>
    <c:otherwise>
        <c:set var="topStoriesStatement"
               value="select * from [jnt:news] as story where isdescendantnode(story, ['${startNodePath}']) order by story.[date] desc"/>
    </c:otherwise>
 </c:choose>

<query:definition var="listQuery" statement="${topStoriesStatement}" />

<c:set target="${moduleMap}" property="editable" value="false" />
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" />
<c:set target="${moduleMap}" property="subNodesView" value="default" />
<c:set target="${moduleMap}" property="pageView" value="pageView" />