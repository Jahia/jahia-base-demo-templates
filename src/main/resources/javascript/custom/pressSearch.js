
function activePressSearchTab(){
    $('.pressSearch').each(function () {
        $(this).attr('uuid');
        var yearTab = GetURLParameter('yearTab'+$(this).attr('uuid'));
        if (yearTab == null){
            yearTab = "defaultYear";
        }
        if (!$(this).find(".active")[0]){
            $(this).find("." + yearTab).addClass("active");
        }
    });
}

function activatePressSearchTabAjax(){
    $(".pressTabItem").click(function () {
        var yearTab = $(this).attr('view');
        var yearTabs = $(this).closest(".pressSearch");
        history.pushState(null, null, window.location.href.split('?')[0] + '?yearTab'+yearTabs.attr('uuid')+'=' + yearTab);
        yearTabs.parent().load(yearTabs.attr('url') + '.ajax?yearTab'+yearTabs.attr('uuid')+'=' + yearTab+ ' #'+yearTabs.attr('id'), function() {
            activatePressSearchTabAjax();
            activePressSearchTab();
        });
    });
}

$(document).ready(function () {
    activePressSearchTab();
    activatePressSearchTabAjax();
})
