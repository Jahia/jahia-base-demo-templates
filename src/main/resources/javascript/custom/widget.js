


function saveStock(value, variation, description,url) {
    $.ajax({
        type: "POST",
        url: url,
        data: {
            "jcrMethodToCall": "put",
            "value": value,
            "variation": variation,
            "description": description
        },
        success: function (data) {
        }
    });
}

function updateStock(element,value, variation, description) {
    if (description) {
        element.find(".stock-widget-wrapper .description p").text(description);
    }
    element.find(".stock-widget-wrapper .description p").show();

    element.find(".stock-price .counter").text(value);
    if (value) {
        element.find(".stock-price .currency-value").text("$")
    }
    if (variation.indexOf("0") == 0) {
        element.find(".stock-variable").append("+" + variation);
    }
    if (variation.indexOf("+") >= 0) {
        element.find(".stock-variable").append("<div class='arrow'></div>" + variation);
    }
    if (variation.indexOf("-") >= 0) {
        element.find(".stock-variable").append("<div class='arrow-down'></div>" + variation);
    }

    element.find('.counter').counterUp({
    delay: 10,
        time: 1000
});
}

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
});