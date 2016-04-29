
function activePageViewTab() {
    $('.allStories').each(function () {
        $(this).attr('uuid');
        var allStoriesTab = GetURLParameter('allStoriesTab'+$(this).attr('uuid'));
        if (allStoriesTab == null){
            allStoriesTab = "all";
        }
        if (!$(this).find(".active")[0]){
            $(this).find("." + allStoriesTab).addClass("active");
        }
    });
}

function activateStoriesTabAjax(){
    $(".allStoriesTabItem").click(function () {
        var view = $(this).attr('view');
        var allStories = $(this).closest(".allStories");
        history.pushState(null, null, window.location.href.split('?')[0] + '?allStoriesTab'+allStories.attr('uuid')+'=' + view);
        allStories.parent().load(allStories.attr('url') + '.ajax?allStoriesTab'+allStories.attr('uuid')+'=' + view+ ' #'+allStories.attr('id'), function() {
            activateStoriesTabAjax();
            activePageViewTab();
        });
        activePageViewTab();
    });
}


$(document).ready(function () {
    // Initialize to first tab being active
    activePageViewTab();
    activateStoriesTabAjax();
})