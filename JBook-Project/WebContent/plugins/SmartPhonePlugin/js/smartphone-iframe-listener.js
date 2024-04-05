!(function ($) {
  var registerDomReady = function () {
    if ($.jalios.smartPhone.isMobileApp()) {
      window.addEventListener("jmobile-redirect-to-top-frame", function (e) {
        let url = e.detail.redirect;
        $.jalios.smartPhone.openExternalLinks(url);
      });
    }
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
