$(document).ready(function () {
    if ( $(".404_backstretch").length ) {
            $.backstretch([$('.404_backstretch').attr('backstretch')]);
        }

    var copyright = $(".copyright-space").text();
    $(".copyright-space").text(new Date().getFullYear()+copyright);
});