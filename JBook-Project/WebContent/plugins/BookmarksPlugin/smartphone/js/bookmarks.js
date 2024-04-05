!(function($) {
  var registerDomReady = function() {
    $(document).on("tap", ".js-bookmarks-action", function(event) {
      event.preventDefault();
      event.stopPropagation();
      if ($(event.currentTarget).hasClass("is-bookmarked")) {
        let message = $(event.currentTarget).data(
          "jalios-action-bookmark-delete-message"
        );
        executeAction("opBookmarkDelete", message, event);
      } else {
        let message = $(event.currentTarget).data(
          "jalios-action-bookmark-add-message"
        );
        executeAction("opBookmarkAdd", message, event);
      }
    });

    function executeAction(action, message, event) {
      $(event.currentTarget).toggleClass("is-bookmarked");
      let pubId = $(event.currentTarget).data("jalios-pubid");
      let actionUrl = $(event.currentTarget).data("jalios-action-url");
      $(".topbar-menu-dropdown ").popup("close");

      $.jalios.smartPhone.Toastr.show(message);

      let data = {};
      data.dataId = pubId;
      data["changeTab"] = "tabData";
      data[action] = true;

      $.ajax({
        method: "POST",
        url: actionUrl,
        data: data
      });
    }
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
