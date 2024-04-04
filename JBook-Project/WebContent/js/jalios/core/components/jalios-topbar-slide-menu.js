;
(function($, window, document, undefined) {
  var ajaxTimeout = false;

  "use strict";

  // Create the defaults once
  var pluginName = "topbarSlideMenu",
    ps = null,
    defaults = {
      propertyName: "value"
    };

  // The actual plugin constructor
  function Plugin(element, options) {
    this.element = element;
    this.settings = $.extend({}, defaults, options);
    this._defaults = defaults;
    this._name = pluginName;
    this.init();
  }

  // Avoid Plugin.prototype conflicts
  $.extend(Plugin.prototype, {
    init: function() {
      var $element = $(this.element);

      //Focus the first search input matching specified selector
      if ($element.find(".js-slidemenu-input-refresh").exists()) {
        $element.find(".js-slidemenu-input-refresh").focus();
      }

      ps = new PerfectScrollbar($element.closest(".topbar-ctxmenu-body")[0]);

      // Bind event to navigate through slide menu items
      $element.on('click keydown', '[data-bound]:not(.main-menu):not(.child-menu)', function(event) {
        if (!$.jalios.a11y.isFocusedClick(event)) {
          return;
        }
        var $targetLink = $(event.target).closest('A.js-no-slide');
        if ($targetLink.length) {
          var isTargetDataBound = $targetLink.data("bound");
          // if target is (or is in) a link, but has no [data-bound], prevent bound
          if (!isTargetDataBound) {
            return;
          }
        }
        event.preventDefault();

        var boundItem = $(event.currentTarget).data("bound");
        var boundSelector = "DIV[data-bound='" + boundItem + "']";
        var boundMode = $(event.currentTarget).data("jalios-slidemenu-bound-mode");

        if ($(boundSelector).hasClass("hide")) {
          $(boundSelector).removeClass("hide");
        }
        var $listGroup = $(event.currentTarget).closest(".list-group");
        var $slideWrapper = $(event.currentTarget).closest(".slide-wrapper");

        if (boundMode === "back") {
          // BOUND BACK
          $(boundSelector).addClass("is-active").removeClass("is-parent");
          $listGroup.removeClass("is-active is-parent");

          $(boundSelector).one($.support.transition.end, function() {
            // After slide transition has finished, hide .list-group which is not active
            if ($slideWrapper.exists()) {
              $slideWrapper.find(".list-group:not(.is-active)").addClass("hide");

              // Add end event when back has finished ?
              var $childMenu = $(event.currentTarget).closest(".child-menu");
              var backToMainMenuEvent = $.Event("jalios.topbar.slidemenu.backToMainMenu", {
                childMenu: $childMenu
              });
              $slideWrapper.trigger(backToMainMenuEvent);
            }
          });

        } else {
          // BOUND ITEM
          $(boundSelector).addClass("is-active");
          if ($listGroup.hasClass("child-menu")) {
            $listGroup.addClass("is-parent");
          } else {
            $listGroup.removeClass("is-active");
          }

          if ($slideWrapper.exists()) {
            $(boundSelector).one($.support.transition.end, function() {
              // After slide transition has finished, hide .list-group which is not active
              $slideWrapper.find(".list-group:not(.is-active)").addClass("hide");

              // send a topbar slide "transition end" event
              var $childMenu = $(event.currentTarget).closest(".slide-wrapper").find('.child-menu.is-active');
              var transitionEndEvent = $.Event("jalios.topbar.slidemenu.transition.end", {
                childMenu: $childMenu
              });
              $slideWrapper.trigger(transitionEndEvent);
            });
          }
        }

        if ($slideWrapper.exists()) {
          $slideWrapper.data("plugin_topbarSlideMenu").recomputeHeight();
        }

        var $topBarCtxMenuBody = $(event.currentTarget).closest(".topbar-ctxmenu-body");
        if ($topBarCtxMenuBody.exists()) {
          $topBarCtxMenuBody[0].scrollTop = 0;
        }
      });

      // Refreshes the slide menu from search typed in search input
      $element.on('input change propertychange', '.js-slidemenu-input-refresh', function(event) {
        var $searchInput = $(event.currentTarget);
        var $slideWrapper = $(event.currentTarget).closest(".slide-wrapper");
        var ajaxUrl = $slideWrapper.data("jalios-ajax-refresh-url");
        var $refreshedWrapper = $slideWrapper.find(".js-slidemenu-input-refresh-wrapper");
        var query = event.target.value;

        // Trigger behavior based on length of query text
        var minLength = $searchInput.attr('data-ac-min-length') || $.jalios.Properties.get('autocomplete-min-chars');
        if (query.length < minLength && query.length !== 0) {
          return;
        }

        // Use a timeout to avoid search being performed each type a character is typed
        if (ajaxTimeout) {
          clearTimeout(ajaxTimeout);
        }

        var attrName = $searchInput.attr("name");
        var params = {};
        params[$searchInput.attr("name")] = query;

        ajaxTimeout = setTimeout(function() {
          $refreshedWrapper.displayLoading();

          $.jalios.AjaxRefresh.refresh(
            ajaxUrl,
            $refreshedWrapper, {
              "params": params,
              'noscroll': true,
              'nohistory': true,
              "callback": function() {
                var $slideWrapper = $(event.currentTarget).closest(".slide-wrapper");
                if ($slideWrapper.exists()) {
                  $slideWrapper.data("plugin_topbarSlideMenu").recomputeHeight();
                }
              }
            });
          ajaxTimeout = false;
        }, $.jalios.Properties.get('autocomplete-chooser-timeout'));
      });

      $(document).on('jalios:refresh', function(event) {
        // Recompute height when a refresh happens inside the slide wrapper
        var refresh = $.jalios.Event.match(event, 'refresh', 'after');
        if (!refresh || !refresh.target) {
          return;
        }

        var $slideWrapper = $(refresh.target).closest(".slide-wrapper");

        // fugly fix for IE11, need to set dropdown-menu height
        if ($(".browser-IE11").length && $slideWrapper.exists() && $slideWrapper.hasClass("workspace-menu") && !$slideWrapper.data("is-height-set")) {
          $slideWrapper.data("is-height-set", true);
          var $searchInput = $slideWrapper.find(".slide-menu-search-input");
          var searchHeight = $searchInput.exists() ? $searchInput.outerHeight() : 0;
          var activeMenuHeight = $slideWrapper.find(".list-group").outerHeight();
          var height = searchHeight + activeMenuHeight;
          $slideWrapper.closest(".dropdown-menu").css("height", height);
        }

        var plugin = $slideWrapper.data("plugin_topbarSlideMenu");
        if (plugin) {
          $slideWrapper.data("plugin_topbarSlideMenu").recomputeHeight();
        }

      });
    }, // init

    returnToMainMenu: function($from) {
      if (!$from || (!$from.exists() && !$from.hasClass(".child-menu"))) {
        return;
      }
      $from.removeClass("is-active");
      var $slideWrapper = $from.closest(".slide-wrapper");
      $slideWrapper.find(".main-menu").removeClass("hide").addClass("is-active");
      $from.one($.support.transition.end, function() {
        $slideWrapper.find(".list-group:not(.is-active)").addClass("hide");
        var returnToMainMenuEvent = $.Event("jalios.topbar.slidemenu.returnToMainMenu", {
          childMenu: $from
        });
        $slideWrapper.trigger(returnToMainMenuEvent);
      });
      this.recomputeHeight();
    },

    recomputeHeight: function() {
      var $slideWrapper = $(this.element);
      var activeMenuHeight = $slideWrapper.find(".list-group.is-active:not('.is-parent')").outerHeight();
      var $searchInput = $slideWrapper.find(".slide-menu-search-input");
      var searchHeight = $slideWrapper.find(".main-menu.is-active:not('.is-parent')").exists() && $searchInput.exists() ? $slideWrapper.find(".slide-menu-search-input").outerHeight() : 0;
      var totalHeight = activeMenuHeight + searchHeight;

      $slideWrapper.animate({
        height: totalHeight
      }, 200);
      $slideWrapper.one($.support.transition.end, function() {
        ps.update();
      });
    }
  });

  $.fn[pluginName] = function(options) {
    return this.each(function() {
      if (!$.data(this, "plugin_" + pluginName)) {
        $.data(this, "plugin_" +
          pluginName, new Plugin(this, options));
      }
    });
  };

  $(document).ready(function() {
    $(".slide-wrapper").topbarSlideMenu();
    $(document).on('jalios:topbar-dropdown', handleDropDownReload);
    $(document).on('shown.bs.dropdown', function(event) {
      var slideWrapperPlugin = $(event.target).find(".slide-wrapper").data("plugin_topbarSlideMenu");
      if (slideWrapperPlugin) {
        slideWrapperPlugin.recomputeHeight();
      }
    });
    $(document).on('hide.bs.dropdown', function(event) {
      var $ajaxRefreshInput = $(event.target).find(".js-slidemenu-input-refresh");
      // Empty search field and refresh the items
      if ($ajaxRefreshInput.exists() && $ajaxRefreshInput.val()) {
        $ajaxRefreshInput.val("");
        $ajaxRefreshInput.trigger("change");
      }
    });
  });

  var handleDropDownReload = function(event) {
    if (event.dropdown.type !== "done") {
      return;
    }

    $(".slide-wrapper").topbarSlideMenu();
  };

})(jQuery, window, document);