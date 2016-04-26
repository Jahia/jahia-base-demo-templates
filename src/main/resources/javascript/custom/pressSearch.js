
function activePressSearchTab(){
    var yearTab = GetURLParameter('yearTab');
    if (yearTab == null){
        yearTab = "defaultYear";
    }
    $(".pressSearch").find("." + yearTab).addClass("active");
}

function activatePressSearchTabAjax(){
    $(".pressTabItem").click(function () {
        var yearTab = $(this).attr('view');
        history.pushState(null, null, window.location.href.split('?')[0] + '?yearTab=' + yearTab);
        var yearTabs = $(this).closest(".pressSearch");
        yearTabs.parent().load(yearTabs.attr('url') + '.ajax?yearTab=' + yearTab+ ' #'+yearTabs.attr('id'), function() {
            activatePressSearchTabAjax();
            activePressSearchTab();
        });
    });
}

$(document).ready(function () {
    activePressSearchTab();
    activatePressSearchTabAjax();
})
