function activePressSearchTab(){
    $( ".pressSearch" ).each(function() {
        var yearTab = $( this).attr('yearTab');
        $( this ).find("."+yearTab).addClass("active");
    });

}

$(document).bind('DOMNodeInserted', function(e) {
    activePressSearchTab();
});