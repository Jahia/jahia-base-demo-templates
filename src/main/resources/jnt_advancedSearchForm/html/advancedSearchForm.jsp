<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="css" resources="plugins/skyforms/sky-forms.css"/>
<template:addResources type="css" resources="plugins/skyforms/custom/custom-sky-forms.css"/>
<template:addResources type="javascript" resources="custom/advancedSearchForm.js"/>

<jcr:nodeProperty name="jcr:title" node="${currentNode}" var="title"/>
<c:if test="${not empty title.string}">
    <h3 class="inline-advancedSearchForm-title"> ${fn:escapeXml(title.string)} </h3>
</c:if>
<div class="container">
    <div id="advancedSearch" class="row panel-collapse collapse" aria-expanded="false">
        <div class="row" id="advanced-search">
            <c:url value='${url.base}${renderContext.mainResource.node.path}.html' var="searchUrl"/>
            <s:form name="advancedSearchForm" class="sky-form" method="post" action="${searchUrl}">
                <div class="col-md-4">
                    <header><fmt:message key="search.advancedSearch.criteria.text.title"/></header>
                    <fieldset>
                        <section>
                            <label class="label"><fmt:message key="search"/></label>
                            <label class="select">
                                <s:termMatch selectionOptions="all_words,exact_phrase,any_word,as_is"/>
                                <i></i>
                            </label>
                            <label class="input">
                                <s:term id="searchTerm"/>
                            </label>
                            <label class="label"><fmt:message key="searchForm.term.searchIn"/></label>
                            <div class="inline-group">
                                <s:termFields id="searchFields" onchange="toggleSearchMode(this)"/>
                            </div>
                        </section>
                    </fieldset>
                </div>
                <div class="col-md-4">
                    <header><fmt:message key="search.advancedSearch.criteria.authorAndDate.title"/></header>
                    <fieldset>
                        <section>
                            <label class="label"><fmt:message
                                    key="search.advancedSearch.criteria.authorAndDate.createdBy"/></label>
                            <label class="input">
                                <s:createdBy id="searchCreatedBy"/>
                            </label>
                            <label class="label"><fmt:message
                                    key="search.advancedSearch.criteria.authorAndDate.created"/></label>
                            <label class="select">
                                <s:created id="searchCreated"/>
                                <i></i>
                            </label>
                            <label class="label"><fmt:message
                                    key="search.advancedSearch.criteria.authorAndDate.modifiedBy"/></label>
                            <label class="input">
                                <s:lastModifiedBy id="searchLastModifiedBy"/>
                            </label>
                            <label class="label"><fmt:message
                                    key="search.advancedSearch.criteria.authorAndDate.modified"/></label>
                            <label class="select">
                                <s:lastModified id="searchLastModified"/>
                                <i></i>
                            </label>
                        </section>
                    </fieldset>
                </div>
                <div class="col-md-4">
                    <header><fmt:message key="search.advancedSearch.criteria.miscellanea.title"/></header>
                    <fieldset>
                        <section>
                            <label class="label"><fmt:message
                                    key="search.advancedSearch.criteria.miscellanea.site"/></label>
                            <label class="select">
                                <s:site id="searchSite" includeReferencesFrom="systemsite"/>
                                <i></i>
                            </label>
                            <label class="label"><fmt:message
                                    key="search.advancedSearch.criteria.miscellanea.language"/></label>
                            <label class="select">
                                <s:language id="searchLanguage"/>
                                <i></i>
                            </label>
                            <c:set var="searchInFieldkey" value="src_terms[0].fields.custom"/>
                            <c:set var="searchInFilesKey" value="src_terms[0].fields.files"/>
                            <c:set var="searchInSiteContentKey" value="src_terms[0].fields.siteContent"/>
                            <c:set var="pValues" value="${fn:join(paramValues[searchInFieldkey], ',')}"/>
                            <c:set var="pFilesValue" value="${param[searchInFilesKey]}"/>
                            <c:set var="pSiteContentValue" value="${param[searchInSiteContentKey]}"/>
                            <label class="label" for="searchResultsPerPage"><fmt:message
                                    key="search.advancedSearch.criteria.miscellanea.itemsPerPage"/></label>
                            <label class="select">
                                <s:itemsPerPage id="searchResultsPerPage"/>
                                <i></i>
                            </label>
                        </section>
                        <div class="control-group"
                             id="search-pages-criteria" ${fn:contains(pValues, 'siteContent') || pSiteContentValue == 'true' ? '' : 'style="display:none"'}>
                            <label class="control-label" for="searchPagePath">
                                <fmt:message key="search.advancedSearch.criteria.miscellanea.pagePath"/>
                            </label>
                            <s:pagePath id="searchPagePath"/>
                        </div>
                        <div class="control-group"
                             id="search-documents-criteria" ${fn:contains(pValues, 'fileContent') or fn:contains(pValues, 'files') or pFilesValue == 'true' ? '' : 'style="display:none"'}>
                            <label class="control-label" for="searchFileType">
                                <fmt:message key="search.advancedSearch.criteria.miscellanea.fileType"/>
                            </label>

                            <div class="controls">
                                <s:fileType id="searchFileType"/>
                            </div>
                            <label class="control-label" for="searchFilePath">
                                <fmt:message key="search.advancedSearch.criteria.miscellanea.location"/>
                            </label>

                            <div class="controls">
                                <s:filePath id="searchFilePath"/>
                            </div>
                        </div>
                    </fieldset>
                    <footer>
                        <button type="submit" class="btn-u"><fmt:message key='search.advancedSearch.submit'/></button>
                    </footer>
                </div>
            </s:form>
        </div>
    </div>
</div>