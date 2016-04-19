
function activePageViewTab() {
    var allStoriesTab = GetURLParameter('allStoriesTab');
    $(".allStories").find("." + allStoriesTab).addClass("active");
}

function activateStoriesTabAjax(){
    $(".allStoriesTabItem").click(function () {
        var view = $(this).attr('view');
        history.pushState(null, null, window.location.href.split('?')[0] + '?allStoriesTab=' + view);
        var allStories = $(this).closest(".allStories");
        allStories.parent().load(allStories.attr('url') + '.ajax?allStoriesTab=' + view+ '#'+allStories.attr('id'));
        activePageViewTab();
        $(this).closest(".allStories")
    });
}
$(document).ready(function () {
    $(document).bind('DOMNodeInserted', function (e) {
        activePageViewTab();
        activateStoriesTabAjax();
    });
    activateStoriesTabAjax();
})
