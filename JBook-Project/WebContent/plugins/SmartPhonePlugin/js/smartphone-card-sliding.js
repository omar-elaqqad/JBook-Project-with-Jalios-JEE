!(function($) {
  let carouselDefaultConfig = {
    arrows: true,
    dots: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<span class="slide-arrow prev-arrow jalios-icon glyphicon-chevron-left chevron-left icomoon-arrow-left4"></span>',
    nextArrow: '<span class="slide-arrow next-arrow jalios-icon glyphicon-chevron-right chevron-right icomoon-arrow-right4"></span>',
    rows: 0
  };  
  
  let cardsDefaultConfig = {
    arrows: false,
    rows: 0,
    infinite: false
  };
  
  const hideCarousels = function() {
    $(".ui-page-active .card-layout-carousel:not(.is-slide-initialized)").css({"visibility": "hidden"});
  }
  
  const hideCardsSlider = function() {
    $(".ui-page-active .card-layout-sliding:not(.is-slide-initialized)").css({"visibility": "hidden"});
  }
  
  const initCarousels = function() {
    let $carousels = $(".ui-page-active .card-layout-carousel");
    $carousels.css({"visibility": "visible"});

    $carousels.each(function(_idx, element) {
      let $carousel = $(element);
      let carouselCustomConfig = $carousel.data("slick-config");
      let carouselConfig = $.extend({}, carouselDefaultConfig, carouselCustomConfig);
  
      if ($carousel.is('.is-slick-initialized')) {
        $carousel.slick("unslick");
      } else {
        $carousel.addClass("is-slick-initialized");
      }
  
      $carousel.slick(carouselConfig);
    });
  }
  
  const initCardsSlider = function() {
    let $sliders = $(".ui-page-active .card-layout-sliding:not(.is-slide-initialized)");

    $sliders.css({"visibility": "visible"});
    
    $sliders.each(function(_idx, element) {
      let $slider = $(element);
      $slider.addClass("is-slide-initialized");
  
      let cardsConfig = $slider.data("slick-config");
      cardsConfig = $.extend({}, cardsDefaultConfig, cardsConfig);
      $slider.slick(cardsConfig);      
      
    });
  }

  /* Do stuff on DOM Ready */
  const init = function() {
    initCardsSlider();
    initCarousels();
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).on("pagecontainerbeforeshow", function(event, ui) {
    hideCarousels();
    hideCardsSlider();
  });

  $(document).on("pagecontainershow", function(event, ui) {
    init();
  });

  $(document).on("jalios:refresh", function(event) {
    if (event.broker.type != "after") {
      return;
    }
    hideCarousels();
    hideCardsSlider();
    init();
  });
})(window.jQuery);