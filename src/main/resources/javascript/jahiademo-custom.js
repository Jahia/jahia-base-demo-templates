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

function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
        return uri + separator + key + "=" + value;
    }
}

function initializeActiveTab(tabClass,urlParamPrefix,defaultTab){
    $(tabClass).each(function () {
        var activetab = GetURLParameter(urlParamPrefix+$(this).attr('uuid'));
        if (activetab == null){
            activetab = defaultTab;
        }
        if (!$(this).find(".active")[0]){
            $(this).find("." + activetab).addClass("active");
        }
    });
}





