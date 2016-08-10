
function activePressSearchTab(){
    initializeActiveTab('.pressSearch','yearTab', 'defaultYear');
}

function activatePressSearchTabAjax(){
    $(".pressTabItem").click(function () {
        var yearTab = $(this).attr('view');
        var yearTabs = $(this).closest(".pressSearch");
        var newUrl = updateQueryStringParameter(window.location.href,'yearTab'+yearTabs.attr('uuid'),yearTab);
        if (yearTabs.attr('disableAjax') == 'true'){
            window.location.replace(newUrl);
        }else{
            history.pushState(null, null,newUrl);
            yearTabs.parent().load(yearTabs.attr('url') + '.ajax?yearTab'+yearTabs.attr('uuid')+'=' + yearTab+ ' #'+yearTabs.attr('id'), function() {
                activatePressSearchTabAjax();
                activePressSearchTab();
            });
        }
    });
}

$(document).ready(function () {
    activePressSearchTab();
    activatePressSearchTabAjax();
})
