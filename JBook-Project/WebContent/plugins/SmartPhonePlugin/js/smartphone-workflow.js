!(function($) {
  var registerDomReady = function() {
    $(document).on("change", ".service-workflow-page [name=pstatus]", function(
      e
    ) {
      var pstatus = $(".service-workflow-page [name=pstatus]").val();
      if (pstatus === "-10") {
        $(".service-workflow-page .wf-update-smartphone-pdate").removeClass(
          "wf-update-smartphone-pdate-hidden"
        );
      } else {
        $(".service-workflow-page [name=pdate_dummy_date]").val("");
        $(".service-workflow-page [name=pdate_dummy_time]").val("");
        $(".service-workflow-page [name=pdate]").val("");
        $(".service-workflow-page .wf-update-smartphone-pdate").addClass(
          "wf-update-smartphone-pdate-hidden"
        );
      }
    });
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
