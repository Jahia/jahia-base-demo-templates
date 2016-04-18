$( document ).ready(function() {
    $(".stock-widget").flip({
        axis: 'y',
        trigger: 'click',
        forceWidth: false,
        forceHeight: false
    }).find('.front, .back').css({
        'width': '100%',
        'height': '100%'
    });

    $(".stock-widget").find('.counter').counterUp({
        delay: 10,
        time: 1000
    });
});