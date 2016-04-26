
function activePageViewTab() {
    var allStoriesTab = GetURLParameter('allStoriesTab');
    if (allStoriesTab == null){
        allStoriesTab = "all";
    }
    $(".allStories").find("." + allStoriesTab).addClass("active");
}

function activateStoriesTabAjax(){
    $(".allStoriesTabItem").click(function () {
        var view = $(this).attr('view');
        history.pushState(null, null, window.location.href.split('?')[0] + '?allStoriesTab=' + view);
        var allStories = $(this).closest(".allStories");
        allStories.parent().load(allStories.attr('url') + '.ajax?allStoriesTab=' + view+ ' #'+allStories.attr('id'), function() {
            activateStoriesTabAjax();
            activePageViewTab();
        });
        activePageViewTab();
    });
}

$(document).ready(function () {
    activateStoriesTabAjax();
    activePageViewTab();
})
