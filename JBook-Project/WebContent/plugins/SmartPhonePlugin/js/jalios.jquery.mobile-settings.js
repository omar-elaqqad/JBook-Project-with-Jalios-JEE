!(function($) {
  $(document).on("mobileinit", function() {
    $.mobile.dynamicBaseEnabled = false; // Handle our own base href
    $.mobile.popup.prototype.options.overlayTheme = "b"; // Popup black overlay
    $.mobile.loader.prototype.options.theme = "g"; // Loader theme, see smartphone-loader.less
    $.mobile.pageLoadErrorMessageTheme = "h"; // Loader theme when an error occurs. See smartphone-loader.less
    $.mobile.ignoreContentEnabled = true;
    $.mobile.page.prototype.options.keepNative = ".itemlist-item";
    if (!$["jalios-settings"]) {
      $["jalios-settings"] = {};
    }
    $["jalios-settings"]["imageuploader-default-max-width"] = 1600; // Default image width when uploading pictures
    $["jalios-settings"]["imageuploader-default-max-height"] = 1600; // Default image height when uploading pictures
    $["jalios-settings"]["imageuploader-default-jpeg-quality"] = 0.9; // Default JPEG quality when uploading pictures

    $.mobile.filterable.prototype.options.filterCallback = function(
      index,
      searchValue
    ) {
      var searchRegex = $.jalios.smartPhone.Util.makePattern(searchValue);
      return !searchRegex.test(
        (
          "" + ($.mobile.getAttribute(this, "filtertext") || $(this).text())
        ).toLowerCase()
      );
    };
  });
})(window.jQuery);
