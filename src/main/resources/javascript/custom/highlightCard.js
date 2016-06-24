/* ---- Masonry used on the highlight and highlights card(s) view  ---- */
$(document).ready(function() {
    // init Masonry
    var $grid = $('.grid').masonry({
        itemSelector: '.grid-item',
        percentPosition: true,
        columnWidth: '.grid-sizer'
    });
    // layout Isotope after each image loads
    $grid.imagesLoaded().progress( function() {
        $grid.masonry();
    });
});

$(document).ready(function() {
    /* Masonry highlight overlay view ANIMATION*/
    $(".grid-item-overlay").mouseenter(function() {
            $(this).find(".caption-items").show();
            $(this).find("img").css('opacity','0.4');
        })
        .mouseleave(function() {
            $(this).find(".caption-items").hide();
            $(this).find("img").css('opacity','1');
        });

    /* Photoswipe lightbox*/
    var $pswp = $('.pswp')[0];
    var image = [];

    $('.picture').each( function() {
        var $pic     = $(this),
            getItems = function() {
                var items = [];
                $pic.find('.image').each(function() {
                    var $href   = $(this).attr('href'),
                        $size   = $(this).data('size').split('x'),
                        $width  = $size[0],
                        $height = $size[1];
                    var item = {
                        src : $href,
                        w   : $width,
                        h   : $height
                    }
                    items.push(item);
                });
                return items;
            }

        var items = getItems();

        $.each(items, function(index, value) {
            image[index]     = new Image();
            image[index].src = value['src'];
        });
        //prevent to link to the image
        $pic.on('click', 'figure', function(event) {
            event.preventDefault();
        });
        //will show the lightbox only when the user clicks on the magnify glass icon
        $pic.on('click', '.msn-lightbox', function(event) {
            event.preventDefault();
            //One or more picture (highlights) blocks
            var index =  $(this).closest('.picture').find('.msn-lightbox').index(this);

            var $index = index;
            var options = {
                index: $index,
                bgOpacity: 0.7,
                showHideOpacity: true
            }
            var lightBox = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
            lightBox.init();
        });
    });
});
