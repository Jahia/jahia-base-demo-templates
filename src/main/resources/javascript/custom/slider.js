$(window).load(function () {
    var sliders = document.querySelectorAll(".master-slider-jahia");

    for (var i = 0; i < sliders.length; i++) {

        MSfullWidth.initMSfullWidth(sliders[i].id, sliders[i].getAttribute('transition'), sliders[i].getAttribute('layout'), sliders[i].getAttribute('autoplay')=="true", sliders[i].getAttribute('panelcount'));
    }
});