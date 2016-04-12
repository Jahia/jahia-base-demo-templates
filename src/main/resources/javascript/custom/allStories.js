function GetURLParameter(sParam){
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}

function activePageViewTab(){
    var pageView = GetURLParameter('pageView');
    $(".allStories").find("."+pageView).addClass("active");
}

$(document).bind('DOMNodeInserted', function(e) {
    activePageViewTab();
});