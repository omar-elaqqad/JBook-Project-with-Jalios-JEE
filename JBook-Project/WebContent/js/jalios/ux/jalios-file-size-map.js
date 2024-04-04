! function($) {


  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------


  // Register to broker
  var register = function() {

    $.jalios.ux.FileSizeMap.registerListener();

    // Register to Ajax-Refresh
    $(document).on('jalios:refresh', function(event) {
      //refresh before
      var refresh = $.jalios.Event.match(event, 'refresh', 'before');
      if (refresh) {
        if (refresh.url == "work/refreshDataReportDocument.jsp" || refresh.url == "admin/refreshDataReportDocument.jsp") {
          $trigger = $(refresh.target);
          $requestedWS = $trigger.closest(".ajax-refresh-div").find("[name='requestedWS']");
          if ($requestedWS.length == 1) {
            $.extend(true, refresh.options.params, {
              requestedWS: $requestedWS.val()
            });
          }
        }
      }

      // refresh after
      var refresh = $.jalios.Event.match(event, 'refresh', 'after');
      if (!refresh) {
        return;
      }
      $.jalios.ux.FileSizeMap.registerListener();
      if (!refresh.options) {
        return;
      }
      if (!refresh.options.params) {
        return;
      }
      if (!refresh.options.params.opRefreshFileSizeMap) {
        return;
      }
      //avoid refresh periodical loop when opRefreshFileSizeMap is true
      refresh.options.params.opRefreshFileSizeMap = false;
    });
    // simularte ajax-lazy, need to be after  refresh listener is added
    $('.fileSizeMap.ajax-refresh-div').refresh({
      nohistory: true,
      noscroll: true
    });
  }

  // ------------------------------------------
  //  PUBLIC
  // ------------------------------------------

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.ux) {
    $.jalios.ux = {};
  }

  $.jalios.ux.FileSizeMap = {

    registerListener: function() {
      $('.fileSizeMap .refresh-trigger').on("click", $.jalios.ux.FileSizeMap.doRefresh);
    },

    doRefresh: function(event) {
      var params = {
        opRefreshFileSizeMap: true
      };
      $trigger = $(event.currentTarget);
      $requestedWS = $trigger.closest(".ajax-refresh-div").find("[name='requestedWS']");
      if ($requestedWS.length == 1) {
        $.extend(true, params, {
          requestedWS: $requestedWS.val()
        });
      }
      $trigger.refresh({
        "nohistory": true,
        "params": params
      });
    }
  }

  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });

}(window.jQuery);