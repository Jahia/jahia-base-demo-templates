var MSfullWidth = function () {

    return {
        
        //Master Slider - Full Width
        initMSfullWidth: function (id, transition) {
		    var slider = new MasterSlider();
            slider.control('arrows');
            slider.control('bullets' ,{autohide:false});
            slider.setup(id , {
		        width:1024,
		        height:600,
		        fullwidth:true,
		        centerControls:false,
		        speed:18,
		        view: transition,
				loop: true,
		    });
        },

    };
}();        