
function activePageViewTab(){
    var allStoriesTab = GetURLParameter('allStoriesTab');
    $(".allStories").find("."+allStoriesTab).addClass("active");
}

$(document).bind('DOMNodeInserted', function(e) {
    activePageViewTab();
});