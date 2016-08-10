
function activePageViewTab() {
    initializeActiveTab('.allStories','allStoriesTab', 'all');
}

function activateStoriesTabAjax(){
    $(".allStoriesTabItem").click(function () {
        var view = $(this).attr('view');
        var allStories = $(this).closest(".allStories");
        var newUrl = updateQueryStringParameter(window.location.href,'allStoriesTab'+allStories.attr('uuid'),view);
        if (allStories.attr('disableAjax') == 'true'){
            window.location.replace(newUrl);
        }else {
            history.pushState(null, null, newUrl);
            allStories.parent().load(allStories.attr('url') + '.ajax?allStoriesTab' + allStories.attr('uuid') + '=' + view + ' #' + allStories.attr('id'), function () {
                activateStoriesTabAjax();
                activePageViewTab();
            });
        }
    });
}


$(document).ready(function () {
    // Initialize to first tab being active
    activePageViewTab();
    activateStoriesTabAjax();
})