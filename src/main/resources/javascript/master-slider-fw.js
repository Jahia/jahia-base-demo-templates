var MSfullWidth = function () {

    return {
        
        //Master Slider - Full Width
        initMSfullWidth: function (id, transition, layout, autoplay, panelcount) {
		    var slider = new MasterSlider();
            if (parseInt(panelcount) > 1)
            {
            slider.control('arrows');
            slider.control('bullets' ,{autohide:false});
            }
            slider.setup(id , {
		        width:1024,
		        height:600,
		        fullwidth:true,
		        centerControls:false,
		        speed:18,
		        view: transition,
			loop: true,
			layout: layout,
              autoplay: autoplay,
		    });
        },

    };
}();        