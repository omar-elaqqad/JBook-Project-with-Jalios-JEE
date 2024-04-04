!function ($) {
	
  let carouselDefaultConfig = {
    arrows: true,
    dots: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<button type="button" class="jalios-icon slide-arrow prev-arrow chevron-left icomoon-arrow-left4 slick-arrow"><span class="glyph-alt">'+$.jalios.I18N.glp("ui.com.alt.prev")+'</span></button>',
    nextArrow: '<button type="button" class="jalios-icon slide-arrow next-arrow chevron-right icomoon-arrow-right4 slick-arrow"><span class="glyph-alt">'+$.jalios.I18N.glp("ui.com.alt.next")+'</span></button>',
    responsive: [
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false
      },
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        dots: true
      },
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        dots: false,
        slidesToScroll: 1
      }
    }]
  };  
  
  const setArrowsLabels = function(slick, currentSlide) {
    let nextSlideIndex = currentSlide + 1 > slick.$slides.length ? 0 : currentSlide + 1;
    let previousSlideIndex = currentSlide - 1 <= 0 ? slick.$slides.length - 1 : currentSlide - 1;
    
    let nextSlideLabel = $.jalios.I18N.glp("ui.carousel.next-slide", $(slick.$slides[nextSlideIndex]).find(".slick-carousel-caption-content").text().trim());
    let previousSlideLabel = $.jalios.I18N.glp("ui.carousel.previous-slide", $(slick.$slides[previousSlideIndex]).find(".slick-carousel-caption-content").text().trim());
    
    slick.$slider.find(".next-arrow").attr("title", nextSlideLabel).attr("aria-label", nextSlideLabel);
    slick.$slider.find(".prev-arrow").attr("title", previousSlideLabel).attr("aria-label", previousSlideLabel);    
  }
  
/*  const setDotsLabels = function(slick) {
    slick.$slider.find(".slick-dots LI").each(function(idx, element) {
      const $button = $(element).find("button");
      $button.attr("aria-label", $button.attr("aria-label") + " - " + $(slick.$slides[idx]).find(".slick-carousel-caption-content").text());
    });
  }
  */
  /* Do stuff on DOM Ready */
  const init = function() {  
    $(".slick-carousel").each(function(idx, element) {
      let $carousel = $(element);
      let carouselCustomConfig = $carousel.data("slick-config");
      let carouselConfig = $.extend(carouselDefaultConfig, carouselCustomConfig); 
      if ($carousel.width() < 400) {
        carouselConfig = $.extend(carouselDefaultConfig, {
          slidesToShow: 1
        });
        $carousel.closest(".slick-arrow-ext").removeClass("slick-arrow-ext");
      }
      
      if ($.jalios.a11y.prefersReducedMotion()) {
        carouselConfig.autoplay = false;
        $carousel.closest(".carousel-container").addClass("is-paused");
      }
      
      // Bind init event listener function
      $carousel.on('init', function (_event, slick) {
        setArrowsLabels(slick, 0);
        //setDotsLabels(slick);
        const $sliderContainer = $(slick.$slider).closest(".carousel-container");
        const $carouselPause = $sliderContainer.find(".carousel-pause-button");
        
        const $dotsWrapper = $sliderContainer.find(".slick-dots").wrap("<div class='slick-dots-wrapper'></div>").closest(".slick-dots-wrapper");
        
        $carouselPause.prependTo($dotsWrapper);
        if (slick.$slider.closest(".Portlet").exists()) {
          if (slick.$slider.closest(".Portlet.empty-skin").find(".portlet-header-actions-menu").exists()) {
            slick.$slider.closest(".carousel-container").addClass("has-actions");
          }
        }
        if (slick.$slides.length === 1) {
          slick.$slider.closest(".carousel-container").find(".carousel-pause-button").remove();
        }
      });
      
      if (!$carousel.is('.slick-carousel.slick-initialized')) {
        $carousel.slick(carouselConfig);
        $carousel.closest(".carousel-container").find(".carousel-pause-button").on("click keydown", function(event) {
          if (!$.jalios.a11y.isFocusedClick(event)) {
            return;
          }
          if ($carousel.slick("getSlick").paused) {
            $carousel.slick('slickPlay');
            $carousel.closest(".carousel-container").removeClass("is-paused");
          } else {
            $carousel.slick('slickPause');
            $carousel.closest(".carousel-container").addClass("is-paused");
          }
        });
        $carousel.on("afterChange", function(_event, slick, currentSlide, _nextSlide) {
          setArrowsLabels(slick, currentSlide);
          // The initiator of the change is a click on an arrow, therefore we can force focus on active slide
          if ($(document.activeElement).is(".slick-arrow")) {
            let $currentSlide = $(slick.$slides.get(currentSlide));
            $currentSlide.find("A").first().focus();
          }
        })
      }
      $carousel.closest(".carousel-container").addClass("is-initialized");
      $carousel.closest(".Portlet").addClass("is-carousel-initialized");
    });
    $(".slick-carousel").css({"height": "100%"}); 
    fixHeight();
    $(".carousel-container").css({"opacity": "1"}); 
  
    $(window).resize(function () {
      clearTimeout(window.resizeEvt);
      window.resizeEvt = setTimeout(function() {
        fixHeight(); 
      }, 250);
    });
  };
  
  function fixHeight() {
    $(".carousel-container .slick-carousel .slick-pub").each(function() {
      var widthSlide = $(this).width();
      var heightSlide = widthSlide * ( 9/16 );
      $("IMG", this).height(heightSlide);
    });
  }
  
  // -------------------------------------
  // DOM READY
  // -------------------------------------

  
  $(document).ready(function() {
    let checkLoad = setInterval(function() {
      if ($('.jportal-overlay.is-first-load:visible').length === 0) {
        init();
        clearInterval(checkLoad);
      }
    }, 100);
  });
  
  $(document).on('jalios:refresh', function(event) {
    if (event.refresh.type == "after") {
      let checkLoad = setInterval(function() {
        if ($('.jportal-overlay.is-first-load:visible').length === 0) {
          init();
          clearInterval(checkLoad);
        }
      }, 100);
    }
  });
  
}(window.jQuery);