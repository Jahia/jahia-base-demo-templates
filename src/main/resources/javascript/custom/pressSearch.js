
function activePressSearchTab(){
    var yearTab = GetURLParameter('yearTab');
    $(".pressSearch").find("." + yearTab).addClass("active");
}

function activatePressSearchTabAjax(){
    $(".pressTabItem").click(function () {
        var yearTab = $(this).attr('view');
        history.pushState(null, null, window.location.href.split('?')[0] + '?yearTab=' + yearTab);
        var yearTabs = $(this).closest(".pressSearch");
        yearTabs.parent().load(yearTabs.attr('url') + '.ajax?yearTab=' + yearTab+ '#'+yearTabs.attr('id'));
        activePressSearchTab();
        $(this).closest(".pressSearch")
    });
}

$(document).ready(function () {
    // Initialize to first tab being active
    var currentyear = new Date().getFullYear();
    $(".pressSearch").find("." + currentyear).addClass("active");
    // After an ajax call has been done, we need to rerun the JS on the HTML fragment that has been reloaded
$(document).bind('DOMNodeInserted', function(e) {
    activePressSearchTab();
        activatePressSearchTabAjax();
});

    activatePressSearchTabAjax();
})
