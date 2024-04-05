!(function($) {
  const registerDomReady = function() {
    $(document).on("click", "nav.toc  A", function(event) {
      let url = $(event.currentTarget).prop("href");
      let hash = url.substring(url.indexOf("#")+1); 
      $('html, body').animate({ scrollTop: $(hash).offset().top - (160)  }, 1000);
    });
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
