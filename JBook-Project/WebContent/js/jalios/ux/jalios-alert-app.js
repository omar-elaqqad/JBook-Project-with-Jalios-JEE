!function ($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var _APP_STATUS_URL = "jcore/alert/app/alerts/getAlertAppStatus.jsp";
  
  /**
   * Called on click on a "Changer reverse sort" link.
   * Disables the reverse hidden input, usually used for other AJAX filtering.
   */
  var changePagerReverse = function(event){
    $.console.debug("[alert-app]", "changePagerReverse");
    
    var $form = $.jalios.alert.app.getForm();
    if (!$form || !$form.exists()) {
      throw("[alert-app] changePagerReverse: FORM not found. Cannot continue");
      return;
    }
    var formData = $.jalios.alert.app.getFormData();
    if (!formData) {
      throw("[alert-app] changePagerReverse: formData not found. Cannot continue");
      return;
    }
    // sync hidden input from click
    var $target = $(event.currentTarget);
    var options = $target.data("jalios-options");
    if (!options) {
      throw("[alert-app] invalid (or no) data-jalios-options found on reverse link. Cannot continue");
      return;
    }
    var params = options["params"];
    if (!params) {
      throw("[alert-app] params not found in data-jalios-options ("+JSON.stringify(options)+"). Cannot continue");
      return;
    }
    var reverse = params[$.jalios.alert.app.PARAM_PAGER_REVERSE_NAME];
    if (reverse === undefined) { // don't test '!reverse' here as "false" is a valid value
      throw("[alert-app] reverse value not found in params ("+JSON.stringify(options)+") of data-jalios-options ("+JSON.stringify(options)+"). Cannot continue");
      return;
    }
    var reverseInputSelector = ":input[name='"+$.jalios.alert.app.PARAM_PAGER_REVERSE_NAME+"']";
    var $reverseInput = $form.find(reverseInputSelector);
    if ($reverseInput.exists()) {
      $.console.debug("[alert-app]", "Update reverse to", reverse);
      $reverseInput.val(reverse);
    } else {
      $reverseInput = $('<INPUT/>').attr('type', 'hidden').attr('name', $.jalios.alert.app.PARAM_PAGER_REVERSE_NAME).val(reverse);
      $form.append($reverseInput);
    }
    // Post FORM with updated reverse input
    $form.refresh({isform: true});
  }; // changePagerReverse

  /**
   * Called on click on a Tab.
   * Make clicked Tab's hidden input as checked, then POSTs the form.
   */
  var changeTab = function(event){
    $.console.debug("[alert-app]", "changeTab");

    var $alertTab = $(event.currentTarget);
    var $alertTabInput = $alertTab && $alertTab.exists() ? $alertTab.closest('LI.js-alert-tab').find(":input[name='alertTab']") : null;
    
    if ($alertTabInput && $alertTabInput.exists()) {
      // Disable all other tabs
      $(":input[name='alertTab']").each(function(i, element) {
        $(element).attr("checked", false);
      });
      // Enable current clicked tab
      $alertTabInput.attr("checked", true);
    }
    $alertTab.refresh({isform: true});
  }; // changeTab

  /**
   * Marks as read or unread (depending on the current state).
   */
  var markAsRead = function(event){
    $.console.debug("[alert-app]", "markAsRead");
    var $alertCard = $(event.currentTarget).closest(".alert-card");
    if (!$alertCard.exists() || $alertCard.data("jalios-reading-in-progress")) {
      // Skip if no alert or if alert read/unread action already in progress (prevent double click wrong counter)
      return;
    }
    $alertCard.data("jalios-reading-in-progress", true);

    var alertId = getAlertId($alertCard);
    var read = $alertCard.hasClass("alert-read") ? false : true;
    if (read) {
      $.jalios.alert.markAsRead(alertId);
    } else {
      $.jalios.alert.markAsUnread(alertId);
    }
  }; // markAsRead

  /**
   * Delegates to confirmMarkAllRead after retrieval of current unread
   * alerts count (ajax).
   */
  var buildConfirmMarkAllRead = function() {
    $.console.debug("[alert-app]", "buildConfirmMarkAllRead");
    var formData = $.jalios.alert.app.getFormData();
    $.ajax({
      // For now, this JSP only prints current unread alerts count
      url : _APP_STATUS_URL,
      data : formData,
      type: "POST"
    })
    .done(function(data){
      confirmMarkAllRead(data, formData);
    });
  }; // buildConfirmMarkAllRead

  /**
   * If there are still unread alerts (ajax).
   * If none, display message "All alerts already read" and return.
   * Else, ask for confirmation "Mark 123 alerts as read?".
   */
  var confirmMarkAllRead = function(unreadInfo, formData) {
    if (!unreadInfo) {
      return;
    }
    $.console.debug("[alert-app]", "confirmMarkAllRead");
    if (unreadInfo.count === 0) {
      // "You have no unread alerts." (Prevents "Really mark as read 0 alerts?")
      var message = $.jalios.I18N.glp(/*js.*/"alerts.no-unread-alerts");
      toastr.options.timeOut = 2000;
      toastr.options.positionClass = "toast-top-center";
      toastr.info(message);

    } else if (unreadInfo.count > 0) {
      // Compute customized confirmation message: "Mark {0} alerts as read?"
      var msg = unreadInfo.count == 1 
          ? $.jalios.I18N.glp(/*js.*/"alerts.mark-all-read.confirm", unreadInfo.count)
          : $.jalios.I18N.glp(/*js.*/"alerts.mark-all-read.confirm-2", unreadInfo.count);
      // Ask for confirmation
      $.jalios.ui.Modal.confirm(msg, function(value) {
        // Call "markAllRead" action with potential Form filters (=formData)
        $.jalios.alert.markAllAsRead(formData);
      });
    }
  }; // confirmMarkAllRead

  /**
   * Handle events triggered by jalios-alert.js.
   */
  var handleAlertEvent = function(event) {
    if (event.alert) {
      $.console.debug("[alert-app]", "handleAlertEvent, event: " + JSON.stringify(event.alert));
      if (event.alert.type === "action") {
        if (event.alert.action === "read" || event.alert.action === "unread") {
          afterReadOrUnread(event);
        }
        if (event.alert.action === "all-read") {
          afterAllRead(event);
        }
      } else if (event.alert.type === "refresh") {
        refreshSidebarCounter(event);
      }
    }
  }; // handleAlertEvent

  /**
   * Updates UI after read or unread action.
   */
  var afterReadOrUnread = function(event) {
    $.console.debug("[alert-app]", "afterReadOrUnread");
    if (!event || !event.alert) { return; }
    var $alertCard = getAlertCard(event.alert.alertId);
    if (!$alertCard) { return; }

    // Retrieve current read mode
    var readMode = $(".read-mode-filters INPUT[name=alertReadMode]:checked").val();
    if (readMode === "all") {
      // Toggle display read/unread
      $alertCard.find(".js-alert-mark-as-read").toggleClass("hide");
      $alertCard.toggleClass("alert-read");
    } else {
      $alertCard.hide("fast", function(){
        $alertCard.remove();
        // Refresh Form for navbar filters to be updated when less than 2 results (reverse option)
        var refreshForm = $(".app-alerts .alert-card").length <= 1;
        if (refreshForm) {
          refreshAppForm();
        }
      });
    }
    $alertCard.data("jalios-reading-in-progress", false);
  }; // afterReadOrUnread

  /**
   * Updates UI after readAll action.
   */
  var afterAllRead = function(event) {
    $.console.debug("[alert-app]", "afterAllRead");
    if (!event || !event.alert) { return; }
    refreshAppForm();
  }; // afterAllRead

  /**
   * Refreshes APP (FORM POST).
   */
  var refreshAppForm = function() {
    $.console.debug("[alert-app]", "refreshAppForm");
    var $form = $.jalios.alert.app.getForm();
    if ($form && $form.exists()) {
      $form.refresh({isform: true})
    }
  }; // refreshAppForm

  /**
   * Refreshes (POST) the APP (FORM) when startDate or endDate input changes.
   */
  var refreshOnDateFilter = function(event) {
    if (event.oldDate == null || event.oldDate == ""){
      return;
    }
    refreshAppForm();
  }; // refreshOnDateFilter

  var refreshSidebarCounter = function(event) {
    $.console.debug("[alert-app]", "refreshSidebarCounter");
    // Check counter in DOM
    var $alertCounter = $(".app-alerts-sidebar-unread-count");
    if (!$alertCounter.exists()) {
      return;
    }

    if (!event.alert || !event.alert.unreadInfo) {
      return;
    }
    var info = event.alert.unreadInfo;
    var $wrapper = $(".app-alerts-sidebar-read-mode-suffix");
    if (info.count > 0) {
      $alertCounter.text(info.count);
      $wrapper.show(); // If if gets positive
    } else {
      $wrapper.hide();
      $alertCounter.text(0);
    }
  }; // refreshSidebarCounter

  var getAlertCard = function(alertId) {
    var $alertCard = $(".app-alerts .alert-card[data-jalios-alert-id='"+alertId+"']");
    return $alertCard;
  }; // getAlertCard

  var getAlertId = function($alertCard) {
    var alertId = $alertCard.data("jalios-alert-id");
    return alertId;
  }; // getAlertId

  // ------------------------------------------
  // PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) { $.jalios = {}; }
  if (!$.jalios.alert) { $.jalios.alert = {}; }
  if (!$.jalios.alert.app) { $.jalios.alert.app = {}; }

  $.jalios.alert.app = {
    _APP_FORM_URL : "jcore/alert/app/doAlertAppInner.jsp",
    PARAM_PAGER_REVERSE_NAME : "alertListReverse",
    
    getForm : function() {
      return $("FORM.app-alert-form");
    }, // getForm
    
    getFormData : function() {
      var $form = $.jalios.alert.app.getForm();
      return $form && $form.exists() ? $form.serializeArray() : null;
    } // getFormData
  };
  
  // ------------------------------------------
  //  INIT
  // ------------------------------------------

  var register = function(){
    // Actions
    $(document).on("click", ".app-alerts .js-alert-tab", changeTab);
    $(document).on("click", ".app-alerts .js-alert-mark-as-read", markAsRead);
    $(document).on("click", ".app-alerts .js-alert-mark-all-as-read", buildConfirmMarkAllRead);
    $(document).on("click", ".app-alerts .js-alert-app-pager-reverse", changePagerReverse);
    // Events
    $(document).on("jalios.date.change", ".app-alerts .datepicker-wrapper .form-control", refreshOnDateFilter);
    $(document).on("jalios:alert", handleAlertEvent);
  };

  $(document).ready(function() {
    register();
  });

}(window.jQuery);
