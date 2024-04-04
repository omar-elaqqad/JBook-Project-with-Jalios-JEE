!(function ($) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------
  const SPACE_KEY = 32;

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.topbar) {
    $.jalios.topbar = {};
  }

  $.jalios.topbar = {
    refreshApplicationBadges: function () {
      var $applicationMenu = $('.topbar-application-launcher');

      if (!$applicationMenu.exists()) {
        return;
      }

      $.getJSON(
        $applicationMenu.data('jalios-topbar-application-menu-async-url'),
        function (data) {
          if (data) {
            var levelSuffix = data.badgeLevel;
            var badgeCount = data.badgeCount;

            // Do not display badge if badgeCount = 0
            if (parseInt(badgeCount, 10) > 0) {
              BADGE_ELEMENT.html(badgeCount).addClass(
                BADGE_LEVEL_CSS_PREFIX + levelSuffix.toLowerCase()
              );
              $applicationMenu.find('.topbar-item').prepend(BADGE_ELEMENT);
              setTimeout(function () {
                BADGE_ELEMENT.addClass('in');
              }, 100);
            }
          }
        }
      );

      if ($.jalios.topbar.applicationmenu) {
        $.jalios.topbar.applicationmenu.refreshApplicationMenuBadges();
      }
    },
  };

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var BADGE_ELEMENT = $('<span>', {
      'class': 'topbar-item-badge fade'
    });
  
  var BADGE_LEVEL_CSS_PREFIX = 'topbar-badge-level-';

  /**
   *
   * MANAGE OVERLAY
   *
   */
  var _createOverlay = function () {
    if ($('body').find('.dropdown-overlay-backdrop').length == 0) {
      $('body').append(
        $('<div/>').addClass('dropdown-overlay-backdrop fade fadeout')
      );
    }
  };

  var _addOverlay = function () {
    $('.dropdown-overlay-backdrop').addClass('full in');
    $('BODY').addClass('has-overlay');
  };

  var _removeOverlay = function () {
    var $sidebarBackdrop = $('.dropdown-overlay-backdrop');
    $sidebarBackdrop.removeClass('in');
    $sidebarBackdrop.one($.support.transition.end, function () {
      $sidebarBackdrop.removeClass('full');
    });
    $('BODY').removeClass('has-overlay');
  };

  const _registerEvents = function () {
    window.addEventListener('resize', _windowResizeEventHandler);
  };

  const timeBeforeRefreshTopbar = 1000;
  let topbarRefreshTimeout;
  const _windowResizeEventHandler = function (event) {
    topbarRefreshTimeout && clearTimeout(topbarRefreshTimeout);
    topbarRefreshTimeout = setTimeout(function () {
      let isExpanded = $(".topbar-navigation-menu-wrapper").hasClass("is-expanded"  );
      $('.topbar-navigation-menu').refresh({
        params:{
          isExpanded: isExpanded,
          isRefreshAfterResize: true
        },
        nohistory: true,
        noscroll: true
      });
    }, timeBeforeRefreshTopbar);
  };

  var register = function () {
    _createOverlay();
    _registerEvents();

    $(document).on('click keydown', '.topbar-pull-wrapper', function (event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      
      event.preventDefault();
      
      const $target = $(event.currentTarget);
      
      $target
        .closest('.topbar-navigation-menu-wrapper')
        .toggleClass('is-expanded');

      if ($target.closest('.topbar-navigation-menu-wrapper.is-expanded').exists()) {
        $target.attr("aria-expanded", true)
      } else {
        $target.attr("aria-expanded", false)
      }

      $target
        .closest('.topbar-wrapper')
        .toggleClass('is-expanded');
      $('BODY').toggleClass('is-topbar-with-navigation-expanded');
    });

    // Specific code for application menu TODO : move in app menu js
    $(document).on('jalios:topbar-dropdown', function (event) {
      var isApplicationMenu =
        event.dropdown &&
        event.dropdown.type === 'done' &&
        event.dropdown.trigger &&
        event.dropdown.trigger.hasClass('topbar-application-menu');
      if (isApplicationMenu) {
        var $items = $(
          '.topbar-application-item-wrapper .topbar-application-item'
        );
        if ($items.length > 9) {
          $('.topbar-application-menu .topbar-ctxmenu-footer').removeClass(
            'hide'
          );
        }
      }
    });

    // Hide overlay if menu has class has-overlay
    $(document).on('hide.bs.dropdown', function (event) {
      var $menu = $(event.target);
      $menu.find(".topbar-item").attr("aria-expanded", false);
      if (!$menu.hasClass('dropdown-topbar')) {
        return;
      }
      _removeOverlay();
    });

    // Lazy load of inner menu
    $(document).on('shown.bs.dropdown', function (event) {
      var $menu = $(event.target);
      if (!$menu.hasClass('dropdown-topbar')) {
        return;
      }
      _addOverlay();
      var isReloadEnabled =
        $menu.data('jalios-dropdown-topbar-reload') === true;
      if (
        $menu.data('jalios-dropdown-topbar-lazy-url') &&
        ((isReloadEnabled && !$menu.hasClass('is-loaded')) ||
          (!isReloadEnabled && !$menu.hasClass('is-loaded')))
      ) {
        $menu.find('.dropdown-menu').addClass('is-loading');
        // Prevent clear menu to close the dropdown after the ajaxrefresh when menu is not loaded
        $.jalios.ui.CtxMenu.$latest = undefined;
        $.jalios.AjaxRefresh.refresh(
          $menu.data('jalios-dropdown-topbar-lazy-url'),
          $menu.find('.topbar-ctxmenu-body'),
          {
            noscroll: true,
            nohistory: true,
            callback: function () {
              $menu.find('.dropdown-menu').removeClass('is-closed');
              if (!isReloadEnabled) {
                $menu.addClass('is-loaded');
              }
              $menu.find('.dropdown-menu').removeClass('is-loading');
              var evt = jQuery.Event('jalios:topbar-dropdown');
              evt.dropdown = {};
              evt.dropdown.type = 'done';
              evt.dropdown.trigger = $menu;
              $(document).trigger(evt);
            },
          }
        );
      }
    });

    // Close menu action
    $(document).on('click', '.topbar-menu .js-close-menu', function (event) {
      var $closeLink = $(event.target);
      var $menu = $closeLink.closest('.dropdown');
      if (!$menu.exists()) {
        return;
      }
      // Note: DIV.dropdown-backdrop must be removed on mobile devices!
      $.fn.dropdown.clearMenus();
    });
    $('.topbar-menu .js-close-menu').on('keydown', function (event) {
      if(event.keyCode !== SPACE_KEY) {
        return;
      }      
      event.preventDefault();
      
      var $closeLink = $(event.target);
      var $menu = $closeLink.closest('.dropdown');
      if (!$menu.exists()) {
        return;
      }
      // Note: DIV.dropdown-backdrop must be removed on mobile devices!
      $.fn.dropdown.clearMenus();
    });    
    
    $.jalios.topbar.refreshApplicationBadges();

    // Setup instant search form action and workspace hidden field to avoid cache issues on PortletSearch (JCMS-7010)
    var $topbarWrapper = $('.topbar-wrapper');
    $('.topbar-search-wrapper > FORM').attr(
      'action',
      $topbarWrapper.data('portlet-search-action')
    );
    if ($topbarWrapper.data('workspace-filter-hidden-field')) {
      $('<input>')
        .attr({
          type: 'hidden',
          name: 'ws',
          value: $topbarWrapper.data('workspace-filter-hidden-field'),
        })
        .appendTo('.topbar-search-wrapper > FORM');
    }
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    register();
  });
})(window.jQuery);
