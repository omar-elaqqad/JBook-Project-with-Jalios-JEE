!(function(e){let carouselDefaultConfig={arrows:true,dots:true,slidesToShow:1,slidesToScroll:1,prevArrow:'<span class="slide-arrow prev-arrow jalios-icon glyphicon-chevron-left chevron-left icomoon-arrow-left4"></span>',nextArrow:'<span class="slide-arrow next-arrow jalios-icon glyphicon-chevron-right chevron-right icomoon-arrow-right4"></span>',rows:0};let cardsDefaultConfig={arrows:false,rows:0,infinite:false};const c=function(){e(".ui-page-active .card-layout-carousel:not(.is-slide-initialized)").css({visibility:"hidden"})};const a=function(){e(".ui-page-active .card-layout-sliding:not(.is-slide-initialized)").css({visibility:"hidden"})};const b=function(){let $carousels=e(".ui-page-active .card-layout-carousel");$carousels.css({visibility:"visible"});$carousels.each(function(g,h){let $carousel=e(h);let carouselCustomConfig=$carousel.data("slick-config");let carouselConfig=e.extend({},carouselDefaultConfig,carouselCustomConfig);if($carousel.is(".is-slick-initialized")){$carousel.slick("unslick")}else{$carousel.addClass("is-slick-initialized")}$carousel.slick(carouselConfig)})};const d=function(){let $sliders=e(".ui-page-active .card-layout-sliding:not(.is-slide-initialized)");$sliders.css({visibility:"visible"});$sliders.each(function(g,h){let $slider=e(h);$slider.addClass("is-slide-initialized");let cardsConfig=$slider.data("slick-config");cardsConfig=e.extend({},cardsDefaultConfig,cardsConfig);$slider.slick(cardsConfig)})};const f=function(){d();b()};e(document).on("pagecontainerbeforeshow",function(g,h){c();a()});e(document).on("pagecontainershow",function(g,h){f()});e(document).on("jalios:refresh",function(g){if(g.broker.type!="after"){return}c();a();f()})})(window.jQuery);