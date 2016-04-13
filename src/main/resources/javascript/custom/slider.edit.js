

$(document).ready(function () {
    // Hide all tabs first
    $('.slider-tab-container').find('.tab-selector-edit').hide();
    // Show the first tab content
    $('.slider-tab-container').find('.tab-selector-edit').first().show();

})

function selectSliderPanel(element){
    var $this = $(element)
    sliderPanel = "#" + $this.parent().attr("tab");
    // First hide all tabs again when a new option is selected
    $this.closest('.slider-tab-container').find('.tab-selector-edit').hide();
    // Then show the tab content of whatever option value was selected
    $(sliderPanel).show();
}