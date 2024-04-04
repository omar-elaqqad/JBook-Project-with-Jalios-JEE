!function ($) {

  // Plugin initialization on DOM ready
  $(document).ready(function () {
    $(".lightbox-img-gallery").on("lgInit", function(event) {
      event.detail.instance.plugins.push(globalThis["lgJPlatformDebug"])
    });
  });

}(window.jQuery);