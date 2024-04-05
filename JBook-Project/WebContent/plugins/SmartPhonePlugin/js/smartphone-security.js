!(function($) {
  var CSRF_TOKEN_PARAMETER_NAME = "csrftoken";

  // ------------------------------------------
  //  METHODS
  // ------------------------------------------

  var initCsrfToken = function() {
    $('FORM[method="post"]').each(function() {
      if ($('input[type="hidden"][name="csrftoken"]', this).length > 0) {
        return;
      }

      $("<input>")
        .attr({
          type: "hidden",
          name: CSRF_TOKEN_PARAMETER_NAME,
          value: getCsrfToken()
        })
        .appendTo(this);
    });
  };

  var getCsrfToken = function() {
    return $("BODY").data("jalios-csrf-token");
  };

  // ------------------------------------------
  //  REGISTER
  // ------------------------------------------

  var registerPageInit = function() {
    initCsrfToken();
  };

  // ------------------------------------------
  //  INIT
  // ------------------------------------------
  $(document).on("pageshow", ".ui-page", function(event) {
    registerPageInit();
  });

  $(document).on("jalios:refresh", function(event) {
    if (event.broker.type !== "after") {
      return;
    }

    registerPageInit();
  });
})(window.jQuery);
