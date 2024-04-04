;( function( $, window, document, undefined ) {

  var _unreadInfo;

  // ------------------------------------------
  // PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) { $.jalios = {}; }
  if (!$.jalios.alert) { $.jalios.alert = {}; }

  $.jalios.alert = {
   _ACTION_URL: "jcore/alert/action/handleAlertAction.jsp",

   /**
    * Ajax request to mark given alert as read.
    * If success, triggers an event.
    *
    * alertId: id of alert to read.
    * event: original event
    */
    markAsRead : function(alertId, event) {
      $.ajax({
        url : $.jalios.alert._ACTION_URL,
        data : {
          "alerts" : alertId,
          "opRead" : true
        },
        type : "post"
      })
      .then(function(data) {
        // Trigger an event
        var newEvent = $.Event("jalios:alert");
        newEvent.alert = {};
        newEvent.alert.type = "action";
        newEvent.alert.action = "read";
        newEvent.alert.alertId = alertId;
        if (event) {
          // Bind original event, for listeners needs
          newEvent.alert.originalEvent = event;
        }
        $.console.debug("[alert]", "markAsRead: before trigger event");
        $(document).trigger(newEvent);
        $.console.debug("[alert]", "markAsRead: after trigger event");
        // Refresh unread info
        $.jalios.alert.refreshUnreadInfoFromParams(data.count, data.level);
      });
    }, // markAsRead

    /**
     * Ajax request to mark given alert as unread.
     * If success, triggers an event.
     */
    markAsUnread : function(alertId, event) {
      $.ajax({
        url : $.jalios.alert._ACTION_URL,
        data : {
          "alerts" : alertId,
          "opUnread" : true
        },
        type : "post"
      })
      .done(function(data) {
        // Trigger an event
        var newEvent = $.Event("jalios:alert");
        newEvent.alert = {};
        newEvent.alert.type = "action";
        newEvent.alert.action = "unread";
        newEvent.alert.alertId = alertId;
        if (event) {
          // Bind original event, for listeners needs
          newEvent.alert.originalEvent = event;
        }
        $.console.debug("[alert]", "markAsUnread: before trigger event");
        $(document).trigger(newEvent);
        $.console.debug("[alert]", "markAsUnread: after trigger event");
        // Refresh unread info
        $.jalios.alert.refreshUnreadInfoFromParams(data.count, data.level);
      });
    }, // markAsUnread

    /**
     * Ajax request to mark all unread alerts as read.
     * If success, triggers an event.
     *
     * formData: (optional) AlertQueryBuilder's parameters to read only matching alerts.
     */
    markAllAsRead : function(formDataArray) {
      var computedFormDataArray = [ { "name": "opReadAll", "value" : "true" } ];
      if (formDataArray) {
        // Merging both arrays in first one
        $.merge(computedFormDataArray, formDataArray);
      }
      $.ajax({
        url: $.jalios.alert._ACTION_URL,
        type : "post",
        data: computedFormDataArray
      }).done(function(data) {
        // "You have read all your alerts.";
        var message = $.jalios.I18N.glp(/* js. */"alerts.mark-all-read.success");
        toastr.options.timeOut = 2000;
        toastr.options.positionClass = "toast-top-center";
        toastr.info(message);
        // Trigger an event
        var event = $.Event("jalios:alert");
        event.alert = {};
        event.alert.type = "action";
        event.alert.action = "all-read";
        $.console.debug("[alert]", "markAllAsRead: before trigger event");
        $(document).trigger(event);
        $.console.debug("[alert]", "markAllAsRead: after trigger event");
        $.jalios.alert.refreshUnreadInfoFromParams(data.count, data.level);
      });
    }, // markAllAsRead


    refreshUnreadInfoFromParams : function(count, level) {
      if (hasUnreadInfoChanged(count, level)) {
        var event = $.Event("jalios:alert");
        event.alert = {};
        event.alert.type = "refresh";
        event.alert.unreadInfo = {"count": count, "level": level};
        $(document).trigger(event);
      }
    },


    /**
     * Refreshes unread info.
     * Refresh event is triggered only when info changed.
     *      (This allows UIs to take in account new info.)
     * Callback will be called when unread info is received from server.
     *      (Example: do a confirmation that needs unread info.)
     */
    refreshUnreadInfo : function(firstRefresh) {
      $.ajax({
        url : $.jalios.alert._ACTION_URL,
        dataType : "json",
        timeout: 5000 //10 second timeout

      })
      .fail(function(_jqXHR, textStatus){
        if (textStatus === 'timeout') {
          $.console.debug("[alert]", "Ajax has timed out");
        }
      })
      .done(function(data) {
        // Trigger an event (only if unreadInfo changed!)
        var prevUnreadInfo = _unreadInfo;
        if (!data) {return;}
        if (!_unreadInfo || hasUnreadInfoChanged(data.count, data.level)) {
          _unreadInfo = {"count": data.count, "level": data.level};
          var event = $.Event("jalios:alert");
          event.alert = {};
          event.alert.type = "refresh";
          event.alert.unreadInfo = data;
          event.alert.prevUnreadInfo = prevUnreadInfo;
          $(document).trigger(event);
        }
      });
    } // refreshUnreadInfo
    ,
    handleAlertAction: function(event) {
      event.stopPropagation();
      event.preventDefault();
      var action = $(event.currentTarget).data("jalios-alert-action");
      let $alertItem = $(event.currentTarget).closest("[data-jalios-dataid]");
      if (!$alertItem.exists()) {
        return;
      }
      let parentId = $(event.currentTarget).data("jalios-alert-parent-data-id");

      var $dropdown = $(event.currentTarget).closest(".dropdown-menu");
      //TODO : handle second level Actions

      var data = {
        alerts: $alertItem.data("jalios-dataid")
      };
      data[action] = true;

      switch (action) {
        case "opUnfollow":
          $.ajax({
            url : $.jalios.alert._ACTION_URL,
            method: "post",
            data : data
          }).done(function(data) {
            $dropdown.find(".alert-unfollow-action").remove();
            $dropdown.find(".alert-unfollow-read-action").remove();
            toastr.options = {
              "positionClass": "toast-top-center"
            };
            toastr.info(I18N.glp("alert.action-unfollow-success.msg"));
          });
          break;
        case "opUnfollowRead":
        case "opReadAllPub":
          $.ajax({
            url : $.jalios.alert._ACTION_URL,
            method: "post",
            data : data
          }).done(function(data) {
            $.jalios.alert.refreshUnreadInfoFromParams(data.count, data.level);
            if (parentId) {
              $("[data-jalios-alert-parent-data-id=" + parentId +"]").each(function(index, element) {
                $(element).closest("LI").remove();
                $(element).remove();
              });
            }
            var event = $.Event("jalios:alert");
            event.alert = {};
            event.alert.type = "read-all";
            $(document).trigger(event);

            toastr.options = {
              "positionClass": "toast-top-center"
            };
            toastr.info(I18N.glp("alert.action-read-all-success.msg"));
          });
        default:

      }
    }
  }; // $.jalios.alert

  // ------------------------------------------
  // PRIVATE CODE
  // ------------------------------------------

  /**
   * Compares given unreadInfo with the cached one.
   * Returns true if either count or max level has changed.
   * info1: the cached version
   * info2: the fresh info
   */
  var hasUnreadInfoChanged = function(count, level) {
    if (!_unreadInfo) {
      // There is no current cached version
      // (this is likely the first init at 'dom ready')
      // Do not make a 'refresh' event triggered!
      _unreadInfo = {"count": count, "level": level};
      return false;
    }
    // Compare count
    // compare max level
    var countChanged = _unreadInfo.count !== count;
    var levelChanged = _unreadInfo.level !== level;
    if (countChanged || levelChanged) {
      _unreadInfo = {"count": count, "level": level};
      return true;
    }
    return false;
  }; // hasUnreadInfoChanged


  var initUnreadInfo = function(event) {
    $.jalios.alert.refreshUnreadInfo();
  }; // initUnreadInfo

  var handleAlertAction = function(event) {
    $.jalios.alert.handleAlertAction(event);
  }

  // ------------------------------------------
  // INIT
  // ------------------------------------------

  $(document).ready(function() {
    initUnreadInfo();
    $(document).on("click","[data-jalios-alert-action]", handleAlertAction);
  });

})(jQuery, window, document);
