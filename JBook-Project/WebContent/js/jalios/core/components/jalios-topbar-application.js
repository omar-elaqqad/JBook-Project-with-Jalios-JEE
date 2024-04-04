(function($, window, document, undefined) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.topbar) {
    $.jalios.topbar = {};
  }
  if (!$.jalios.topbar.applicationmenu) {
    $.jalios.topbar.applicationmenu = {};
  }

  $.jalios.topbar.applicationmenu = {
    refreshApplicationMenuBadges: function() {
      $("[data-jalios-application-async-url]").each(function(index, element) {
        var $element = $(element);
        updateApplicationItem($element);
      });
    }
  };

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var globalClonesInit = false;
  var ps = null; // perfectScrollbar

  var initApplicationMenuShowMore = function() {
    $(document).on("click", ".js-show-more-application-items", function(event) {
      var $applicationItemGlobal = $(".topbar-application-menu .topbar-application-item-inner-global");
      var $topbarCtxMenuBody = $(".topbar-application-menu .topbar-ctxmenu-body");
      $(this).toggleClass("is-expanded");
      if ($applicationItemGlobal.hasClass("is-expanded")) {
        //$topbarCtxMenuBody.scrollTop(0);
        $applicationItemGlobal.toggleClass("is-expanded");
      } else {
        $applicationItemGlobal.toggleClass("is-expanded");
        var $applicationItemMbr = $(".topbar-application-menu .topbar-application-item-mbr");
        $topbarCtxMenuBody.animate({
          scrollTop: $applicationItemMbr.height()
        });
      }

      initAppsClones();
      updatePerfectScrollBar();
    });
  };

  var closeMenuHandler = function() {
    $(document).on("hide.bs.dropdown", function(event) {
      if ($(event.relatedTarget).hasClass("topbar-application-menu")) {
        var $applicationItemGlobal = $(".topbar-application-menu .topbar-application-item-global");
        if ($applicationItemGlobal.hasClass("is-expanded")) {
          var $topbarCtxMenuBody = $(".topbar-application-menu .topbar-ctxmenu-body");
          $topbarCtxMenuBody.scrollTop(0);
          $applicationItemGlobal.toggleClass("is-expanded");
          updatePerfectScrollBar();
        }
      }
    });
  };

  var updatePerfectScrollBar = function() {
    if (ps != null) {
      ps.update();
    }
  };

  var recalculateCloneDivDimension = function() {
    $(".topbar-application-item-mbr-clone")
      .width($(".topbar-application-item-mbr").width())
      .height($(".topbar-application-item-mbr").height());
    $(".topbar-application-item-global-clone")
      .width($(".topbar-application-item-global").width())
      .height($(".topbar-application-item-global").height());
  };
  var $appHelper;
  var initDragAndDrop = function() {
    recalculateCloneDivDimension();
    $(".topbar-application-item-mbr, .topbar-application-item-global").sortable({
      start: function(e, ui) {
        $(".topbar-application-item-mbr-clone").removeClass("hide");
        $(".topbar-application-item-global-clone").removeClass("hide");

        $appHelper = ui.helper.clone();
        $appHelper.addClass("app-draggable-clone");
        $appHelper.css("position", "absolute");

        $(".topbar-application-menu .topbar-ctxmenu-body").prepend($appHelper);
        ui.helper.css("visibility", "hidden");
        initAppsClones();

        var isMemberBlock = false;
        if (ui.helper.parent().hasClass("topbar-application-item-mbr")) {
          isMemberBlock = true;
        }
        $(document).on("mousemove.helperAppEvent", function(event) {
          if (isMemberBlock) {
            $appHelper.css({
              top: ui.helper.position().top,
              left: ui.helper.position().left
            });
          } else {
            var positionTop = $(".topbar-application-item-mbr").outerHeight() + ui.helper.position().top;
            $appHelper.css({
              top: positionTop,
              left: ui.helper.position().left
            });
          }
        });

        ui.helper.addClass("exclude-me");
        // Show clones, hide legit
        $(".topbar-application-item-mbr a:not('.exclude-me')").css("visibility", "hidden");
        $(".topbar-application-item-global a:not('.exclude-me')").css("visibility", "hidden");

        ui.helper.data("clone").hide();
      },

      change: function(e, ui) {
        recalculateCloneDivDimension();
        $(".topbar-application-item-mbr a:not(.exclude-me, .ui-sortable-placeholder)").each(function() {
          var item = $(this);
          var clone = item.data("clone");

          // stop current clone animations...
          clone.stop(true, false);

          // get the invisible item, which has snapped to a new
          // location, get its position, and animate the visible
          // clone to it...
          var position = item.position();

          clone.animate(
            {
              left: position.left,
              top: position.top
            },
            150
          );
        });

        $(".topbar-application-item-global a:not(.exclude-me, .ui-sortable-placeholder)").each(function() {
          var item = $(this);
          var clone = item.data("clone");

          // stop current clone animations...
          clone.stop(true, false);

          // get the invisible item, which has snapped to a new
          // location, get its position, and animate the visible
          // clone to it...
          var position = item.position();

          clone.animate(
            {
              left: position.left,
              top: position.top
            },
            200
          );
        });
      },
      delay: 150,
      containment: $(".topbar-application-menu .topbar-ctxmenu-body"),
      connectWith: ".topbar-application-item-wrapper",
      tolerance: "pointer",
      stop: function(event, ui) {
        $(document).off("mousemove.helperAppEvent");
        $appHelper.remove();
        //Send new index of dragged item to the server
        var $draggedItem = $(event.target);
        var draggedItemId = $draggedItem.data("jalios-dataid");

        var applicationItems = [];
        $(".topbar-application-item-mbr .topbar-application-item").each(function(index, element) {
          var currentItemId = $(element).data("jalios-dataid");
          var $element = $(element);
          if (currentItemId != null && currentItemId !== draggedItemId) {
            applicationItems[index] = $element.data("jalios-dataid");
          } else if ($element.hasClass("ui-sortable-placeholder")) {
            applicationItems[index] = draggedItemId;
          }
        });
        var applicationGlobalItems = [];
        $(".topbar-application-item-global .topbar-application-item").each(function(index, element) {
          var currentItemId = $(element).data("jalios-dataid");
          var $element = $(element);
          if (currentItemId != null && currentItemId !== draggedItemId) {
            applicationGlobalItems[index] = $element.data("jalios-dataid");
          } else if ($element.hasClass("ui-sortable-placeholder")) {
            applicationGlobalItems[index] = draggedItemId;
          }
        });

        var jsonData = JSON.stringify({
          mbrIds: applicationItems,
          globalIds: applicationGlobalItems
        });

        $.ajax({
          url: "front/memberpreference/savePreference.jsp",
          method: "post",
          data: {
            key: "core.application.member-application",
            value: jsonData
          }
        });

        // get the item we were just dragging, and
        // its clone, and adjust accordingly...
        $(".topbar-application-item-mbr a.exclude-me").each(function() {
          var item = $(this);
          var clone = item.data("clone");
          var position = item.position();

          // move the clone under the item we've just dropped...
          clone.css("left", position.left);
          clone.css("top", position.top);
          clone.show();

          // remove unnecessary class...
          item.removeClass("exclude-me");
        });

        // get the item we were just dragging, and
        // its clone, and adjust accordingly...
        $(".topbar-application-item-global a.exclude-me").each(function() {
          var item = $(this);
          var clone = item.data("clone");
          var position = item.position();

          // move the clone under the item we've just dropped...
          clone.css("left", position.left);
          clone.css("top", position.top);
          clone.show();

          // remove unnecessary class...
          item.removeClass("exclude-me");
        });

        // make sure all our original items are visible again...
        $(".topbar-application-item-mbr a").css("visibility", "visible");

        // make sure all our original items are visible again...
        $(".topbar-application-item-global a").css("visibility", "visible");

        $(".topbar-application-item-mbr-clone").addClass("hide");
        $(".topbar-application-item-global-clone").addClass("hide");

        initAppsClones();
      }
    });
  };

  var BADGE_ELEMENT = $("<span>", {
      "class": "topbar-item-badge fade"
    }),
    BADGE_LEVEL_CSS_PREFIX = "app-badge-level-";

  var initAsyncShortcut = function() {
    $("[data-jalios-application-async-url]").each(function(index, element) {
      var $element = $(element);
      updateApplicationItem($element);
    });
  };

  var updateApplicationItem = function(item) {
    var $item = $(item);
    var shortcutId = $item.data("jalios-dataid");
    $.getJSON(
      $item.data("jalios-application-async-url"),
      {
        shortcutId: shortcutId
      },
      function(data) {
        if (data) {
          if ($item.find(".topbar-item-badge").exists()) {
            $item.find(".topbar-item-badge").remove();
          }

          if (data.title) {
            $item.find(".label-wrapper").html(data.title);
          }
          if (data.url) {
            $item.attr("href", data.url);
          }

          var hasBadge = data.badgeLevel && data.badgeText;
          if (hasBadge) {
            var newBadge = BADGE_ELEMENT.clone();
            newBadge.html(data.badgeText);
            newBadge.addClass(BADGE_LEVEL_CSS_PREFIX + data.badgeLevel.toLowerCase());
            if (data.badgeTitle) {
              newBadge.attr("title", data.badgeTitle);
            }
            $item.prepend(newBadge);
            newBadge.addClass("in");
          }
        }
      }
    );
  };

  var initAppsClones = function() {
    // loop through the original items...
    $(".topbar-application-item-mbr-clone").empty();
    $(".topbar-application-item-mbr a.topbar-application-item").each(function() {
      // clone the original items to make their
      // absolute-positioned counterparts...
      var item = $(this);
      var item_clone = item.clone();
      // 'store' the clone for later use...
      item.data("clone", item_clone);

      // set the initial position of the clone
      var position = item.position();
      item_clone.css("left", position.left);
      item_clone.css("top", position.top);
      item_clone.addClass("is-clone");
      // append the clone...
      $(".topbar-application-item-mbr-clone").append(item_clone);
    });

    // loop through the original items...
    $(".topbar-application-item-global-clone").empty();

    $(".topbar-application-item-global a.topbar-application-item").each(function() {
      // clone the original items to make their
      // absolute-positioned counterparts...
      var item = $(this);
      var item_clone = item.clone();
      // 'store' the clone for later use...
      item.data("clone", item_clone);

      // set the initial position of the clone
      var position = item.position();
      item_clone.css("left", position.left);
      item_clone.css("top", position.top);
      item_clone.addClass("is-clone");

      // append the clone...
      $(".topbar-application-item-global-clone").append(item_clone);
    });
  };

  var initPerfectScrollbar = function() {
    ps = new PerfectScrollbar(".topbar-application-menu .topbar-ctxmenu-body");
  };

  var register = function() {
    initDragAndDrop();
    closeMenuHandler();
    initApplicationMenuShowMore();
    initPerfectScrollbar();
    initAsyncShortcut();
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });
})(jQuery, window, document);
