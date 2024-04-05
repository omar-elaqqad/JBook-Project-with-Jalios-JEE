!(function ($) {
  $(document).on('pagebeforeshow', function (prevpage) {
    $('video').each((index, element) => {
      element.pause();
    });
  });
})(window.jQuery);
