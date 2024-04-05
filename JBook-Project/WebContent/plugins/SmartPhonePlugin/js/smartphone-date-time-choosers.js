/**
 * Handles dateTime choosers. Because date and time are separate jqm-datebox widgets, we need to
 * merge date and time in a hidden field when either date or time is changed by user
 */
!(function($) {
  var registerDomReady = function() {
    $(document).on("datebox", function(e, passed) {
      if (passed.method === "set") {
        var wrapper = $(e.target).closest(".date-time-wrapper");
        if (wrapper.length === 0) {
          return;
        }
        var dateValue = wrapper.find(".dateChooser").val();
        var timeValue = wrapper.find(".timeChooser").val();
        var dateTime = wrapper.find(".dateTime");
        if (
          wrapper
            .find(".timeChooser-wrapper")
            .hasClass("timeChooser-wrapper-hidden")
        ) {
          // Date only
          dateTime.val(dateValue);
        } else {
          // Date + time
          if (dateValue && timeValue) {
            dateTime.val(dateValue + " " + timeValue);
          } else {
            dateTime.val("");
          }
        }
      }
    });
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
