<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="boundComponent"
       value="${uiComponents:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>

<c:if test="${not empty boundComponent}">
    <template:addCacheDependency node="${boundComponent}"/>

    <%-- Now, we start the pager to show the initial number of elements (news, images, etc) some variables might not be needed --%>
    <c:set var="pagesizeid" value="pagesize${boundComponent.identifier}"/>
    <c:set var="pageSize" value="${currentNode.properties['pageSize'].long}"/>


    <c:set var="varName">${boundComponent.identifier}_loaded</c:set>
    <c:set var="totalSize" value="${2147483647}"/>
    <c:if test="${not empty pagerLimits[varName]}">
        <c:set var="totalSize" value="${pagerLimits[varName]+1}"/>
    </c:if>

    <template:initPager totalSize="${totalSize}" pageSize="${pageSize}" id="${boundComponent.identifier}"/>

    <c:if test="${not empty moduleMap.paginationActive and moduleMap.totalSize > 0 and moduleMap.nbPages > 0 and moduleMap.end<moduleMap.totalSize}">

        <div id="infiniteScrollerMessage"></div>
        <template:addResources>
            <script type="text/javascript">
                var start = ${currentNode.properties['pageSize'].long}
                var finish = ${currentNode.properties['loadItems'].long}
                var docLoading = false;

                //Create an array with the path/url from the items of the list
                //Then append the result HTML from each url, from a start-end using an offset
                function getNext(begin, offset){
                    var end = begin + offset;

                    <%-- If the binded node is a list, then we simply iterate the items --%>
                    <c:if test="${jcr:isNodeType(boundComponent, 'jmix:list')}">
                        var url = [<c:forEach items="${boundComponent.nodes}" var="items">"${url.base}${items.path}.html.ajax",</c:forEach>];
                    </c:if>

                    <%-- We set a query if the binded node is a query component (because the bound component is empty). --%>
                    <c:if test="${jcr:isNodeType(boundComponent, 'jnt:query')}">
                        <jcr:sql var="query" sql='${boundComponent.properties["jcr:statement"].string}'/>
                        var url = [<c:forEach items="${query.nodes}" var="items">"${url.base}${items.path}.html.ajax",</c:forEach>];
                    </c:if>

                    //Check if our array length is greater than the next index
                    if (url.length > begin) {
                        for (i = begin; i < end; i++) {
                            if (i<url.length) {
                                $.ajax({
                                    type: "GET",
                                    url: url[i],
                                    async: false,
                                    success: function (text) {
                                        //Append the text and show with a fade animation.
                                        var newData = $('<div>').html(text);
                                        $('#infiniteScrollingLoader').append(newData);
                                        newData.hide().fadeIn("slow");

                                        //Stop flag
                                        docLoading = false;
                                        start = end;
                                    },
                                    error: function (ajaxContext) {
                                        console.log("Error getting the next item at the url: "+url[i])
                                        docLoading =true;
                                    }
                                });
                            } else {
                                docLoading = true;
                            }
                        }
                    }
                    return true;
                }
                $(document).ready(function() {
                    //Check if the placeholder for the loaded HTML exist.
                    if($("#infiniteScrollingLoader").length == 0) {
                        //it doesn't exist
                        $("#infiniteScrollerMessage").html("Infinite scroller. Use the Infinite Scroller Component to display the loaded text.")
                    } else {
                       $(window).scroll(function () {
                            if (!docLoading && $(window).scrollTop() + $(window).height() == $(document).height()) {
                                //stop flag
                                docLoading = true;
                                //Get next series of items to show
                                getNext(start, finish);
                            }
                        });
                    }
                });
            </script>
        </template:addResources>
    </c:if>
</c:if>
