
function activeEventViewTab() {
    initializeActiveTab('.eventTabs','eventTab', 'upcoming');
}

function activateEventTabAjax(){
    $(".eventTabItem").click(function () {
        var view = $(this).attr('view');
        var eventTabs = $(this).closest('.eventTabs');
        var newUrl = updateQueryStringParameter(window.location.href,'eventTab'+eventTabs.attr('uuid'),view);
        if (eventTabs.attr('disableAjax') == 'true'){
            window.location.replace(newUrl);
        }else {
            history.pushState(null, null, newUrl);
            eventTabs.parent().load(eventTabs.attr('url') + '.ajax?eventTab' + eventTabs.attr('uuid') + '=' + view + ' #' + eventTabs.attr('id'), function () {
                activateEventTabAjax();
                activeEventViewTab();
            });
        }
    });
}

$(document).ready(function () {
    // Initialize to first tab being active
    activeEventViewTab();
    activateEventTabAjax();
})