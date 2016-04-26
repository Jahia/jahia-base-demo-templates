
function activeEventViewTab() {
    var eventTab = GetURLParameter('eventTab');
    if (eventTab == null){
        eventTab = "upcoming";
    }
    $(".eventTabs").find("." + eventTab).addClass("active");
}

function activateEventTabAjax(){
    $(".eventTabItem").click(function () {
        var view = $(this).attr('view');
        history.pushState(null, null, window.location.href.split('?')[0] + '?eventTab=' + view);
        var eventTabs = $(this).closest(".eventTabs");
        eventTabs.parent().load(eventTabs.attr('url') + '.ajax?eventTab=' + view+ ' #'+eventTabs.attr('id'), function() {
            activateEventTabAjax();
            activeEventViewTab();
        });
    });
}

$(document).ready(function () {
    // Initialize to first tab being active
    activeEventViewTab();
    activateEventTabAjax();
})

