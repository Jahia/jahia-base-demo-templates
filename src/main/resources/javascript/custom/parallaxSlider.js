$(function () { // wait for document ready
    // init
    var controller = new ScrollMagic.Controller({
        globalSceneOptions: {
            triggerHook: 'onLeave'
        }
    });

    // get all slides
    var slides = document.querySelectorAll("section.parallaxPanel");

    // create scene for every slide
    for (var i = 0; i < slides.length; i++) {
        if (slides[i].className.indexOf("noeffect") < 0) {
            new ScrollMagic.Scene({
                triggerElement: slides[i]
            })
                .setPin(slides[i])
                //.addIndicators() add indicators (requires plugin)
                .addTo(controller);
        } else {
            new ScrollMagic.Scene({
                triggerElement: slides[i + 1]
            })
                .setPin(slides[i])
                //.addIndicators() add indicators (requires plugin)
                .addTo(controller);
        }
    }
});