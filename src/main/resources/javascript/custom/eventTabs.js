
function activeEventViewTab() {
    var eventTab = GetURLParameter('eventTab');
    $(".eventTabs").find("." + eventTab).addClass("active");
}

function activateEventTabAjax(){
    $(".eventTabItem").click(function () {
        var view = $(this).attr('view');
        history.pushState(null, null, window.location.href.split('?')[0] + '?eventTab=' + view);
        var eventTabs = $(this).closest(".eventTabs");
        eventTabs.parent().load(eventTabs.attr('url') + '.ajax?eventTab=' + view+ '#'+eventTabs.attr('id'));
        activeEventViewTab();
        $(this).closest(".eventTabs")
    });
}

$(document).ready(function () {
    // Initialize to first tab being active
    $(".eventTabs").find("." + "upcoming").addClass("active");
    // After an ajax call has been done, we need to rerun the JS on the HTML fragment that has been reloaded
    $(document).bind('DOMNodeInserted', function (e) {
        activeEventViewTab();
        activateEventTabAjax();
    });

    activateEventTabAjax();
})

