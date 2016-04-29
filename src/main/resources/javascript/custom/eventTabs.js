
function activeEventViewTab() {
    $('.eventTabs').each(function () {
        $(this).attr('uuid');
        var eventTab = GetURLParameter('eventTab'+$(this).attr('uuid'));
        if (eventTab == null){
            eventTab = "upcoming";
        }
        if (!$(this).find(".active")[0]){
            $(this).find("." + eventTab).addClass("active");
        }
    });
}

function activateEventTabAjax(){
    $(".eventTabItem").click(function () {
        var view = $(this).attr('view');
        var eventTabs = $(this).closest(".eventTabs");
        history.pushState(null, null, window.location.href.split('?')[0] + '?eventTab'+eventTabs.attr('uuid')+'=' + view);
        eventTabs.parent().load(eventTabs.attr('url') + '.ajax?eventTab'+eventTabs.attr('uuid')+'=' + view+ ' #'+eventTabs.attr('id'), function() {
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