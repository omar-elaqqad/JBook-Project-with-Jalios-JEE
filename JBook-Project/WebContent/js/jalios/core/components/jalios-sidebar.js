/**
 * Jalios Sidebar Plugin
 */
;
(function($, window, document, undefined) {
  "use strict";

  // Create the defaults once
  var pluginName = "sidebar",
    defaults = {
      jaliosSidebarOverlay: true,
      jaliosSidebarDirection: "left",
      jaliosSidebarReadyOpen: false,
      jaliosSidebarCloseOnModal: true
    };

  // Plugin constructor
  function Plugin(element, options) {
    this.element = element;
    this.trigger = options ? options.trigger : null;
    this.settings = $.extend({}, defaults, $(this.element).data(), options);
    this._defaults = defaults;
    this._name = pluginName;
    this.init();
  }

  // Avoid Plugin.prototype conflicts
  $.extend(Plugin.prototype, {
    init: function() {
      var _self = this;

      $(this.element).addClass('ajax-refresh-div ajax-waiting-0.25');

      // Open direction (from left or right)
      if (this.settings.jaliosSidebarDirection == 'right') {
        $(this.element).addClass('sidebar-right');
      } else if ($(this.element).hasClass('sidebar-right')) {
        this.settings.jaliosSidebarDirection = 'right';
      }

      // Create overlay if needed
      if (this.settings.jaliosSidebarOverlay) {
        _createOverlay.apply(this);
      }
    },
    getFirstActiveElement: function() {
      const focusInformation = $.jalios.a11y.getFocusInformation(this.element);
      return focusInformation.firstFocusableElement;
    },
    open: function(options) {
      var _self = this;
      if (_self.settings.jaliosSidebarOverlay) {
        // Close all sidebar when clicking on overlay
        $(document).one('click', '.sidebar-backdrop', function(event) {
          _self.close();
        });
      }
      if (options.url) {
        this.displayAjaxLoadingAnimation.apply(this);

        $(this.element).refresh({
          "url": options.url,
          "noscroll": true,
          "nofocus": true
        });
      }
      _openSidebar.apply(this);
    },

    close: function() {
      disableTrapFocus();
      _closeSidebar.apply(this);
    },

    displayAjaxLoadingAnimation: function() {
      if ($.fn.displayLoading) {
        $(this.element).displayLoading();
      }
    }
  });


  //////////////////////////////////////////////////////////////////////////////////////////////////
  //
  // PRIVATE METHODS
  //
  //////////////////////////////////////////////////////////////////////////////////////////////////


  /**
   *
   * MANAGE SIDEBAR
   *
   */
  var _openSidebar = function() {
    var _self = this;
    var side = this.settings.jaliosSidebarDirection;
    var direction = {};
    var $sidebarElement = $(_self.element);

    direction[side] = 0;

    var showEvent = $.Event('show.jalios.sidebar', {
      sidebar: $sidebarElement
    });
    $sidebarElement.trigger(showEvent);
    $("BODY").addClass("sidebar-open");

    if (_self.settings.jaliosSidebarOverlay) {
      _addOverlay();
    }
    $sidebarElement.one($.support.transition.end, function() {

      var shownEvent = $.Event('shown.jalios.sidebar', {
        sidebar: $sidebarElement
      });
      $sidebarElement.trigger(shownEvent);
/*      $(_self.getFirstActiveElement())[0].focus({
        focusVisible: false
      });*/
      enableTrapFocus(_self); 
    });
    $sidebarElement.removeClass("is-closed");

    setTimeout(function() {
      $sidebarElement.addClass("is-open");
    }, 10);

    // Only close this sidebar with escape if it has an overlay
    if(this.settings.jaliosSidebarOverlay){
      $(document).on("SIDEBAR_ESCAPE", function(e){
        _closeSidebar.apply(_self);
      });
    }
  }

  var _closeSidebar = function() {
    $(document).off("SIDEBAR_ESCAPE");
    
    // Close any opened menu
    $.fn.dropdown.clearMenus();
     
    var _self = this;
    var side = this.settings.jaliosSidebarDirection;
    var direction = {};
    direction[side] = -$(this.element).outerWidth(true) * 2;
    var $sidebarElement = $(_self.element);


    if ($sidebarElement.hasClass("is-closed")) {
      return;
    }

    var hideEvent = $.Event('start-hide.jalios.sidebar', {
      sidebar: $sidebarElement
    });
    $sidebarElement.trigger(hideEvent);

    $sidebarElement.one($.support.transition.end, function() {
      var hiddenEvent = $.Event('hidden.jalios.sidebar', {
        sidebar: $sidebarElement
      });
      $sidebarElement.trigger(hiddenEvent);
      if (_self.settings.jaliosSidebarOverlay) {
        _removeOverlay();
        // Remove disable overflow-y on body
        $sidebarElement.addClass("is-closed");
      }
      $("BODY").removeClass("sidebar-open");
      
      if (_self.trigger) {
        // Restore focus on opener
        $(_self.trigger).focus();
      }
    });

    $sidebarElement.removeClass("is-open");

  }

  /**
   *
   * MANAGE OVERLAY
   *
   */
  var _createOverlay = function() {
    if ($('body').find('.sidebar-backdrop').length == 0) {
      $('body').append($('<div/>').addClass("sidebar-backdrop fade fadeout"));
    }
  };

  var _addOverlay = function() {
    $(".sidebar-backdrop").addClass("full in");
  };

  var _removeOverlay = function() {
    var $sidebarBackdrop = $(".sidebar-backdrop");
    $sidebarBackdrop.removeClass("in");
    $sidebarBackdrop.one($.support.transition.end, function() {
      $sidebarBackdrop.removeClass("full");
    });
  };

  const enableTrapFocus = function (sidebar) {
    let $element = $(sidebar.element);
    if (!$element.exists()) {
      return;
    }
    $(sidebar.getFirstActiveElement()).focusElement();
    
    $(document).on('keydown.jalios.sidebar', function (event) {
      $.jalios.a11y.handleKeydownTabEvent(event, $element);
    });
  }

  const disableTrapFocus = function () {
    $(document).off('keydown.jalios.sidebar');
  }

  /**
   * REGISTER
   */
  var register = function() {
    // When escape key is pressed trigger a SIDEBAR_ESCAPE event listened by all sidebars 
    // This will close sidebars with an overlay
    $(document).on("keydown", function(e){
      e = e || window.event;
      if(e.key === "Escape"){
        $(document).trigger("SIDEBAR_ESCAPE");
      }
    });
    
  	$(document).on('keydown', '[data-jalios-sidebar-action="close"]', function (event) {
      if (event.key !== 'Enter') {
        return;
      }
      let target = $(this).data('jalios-sidebar-target');
      $(target).data(pluginName)['close']();
    });
    
    $(document).on("click keydown", "[data-jalios-sidebar-target]", function(event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      
      let $target = $(event.target);
      if (!$target.data('jalios-sidebar-target') && ($target.is('A') || $target.is('INPUT') || $target.hasClass('jalios-sidebar-no-open'))) {
        return;
      }
      event.preventDefault();
      let target = $(this).data('jalios-sidebar-target');
      let action = $(this).data('jalios-sidebar-action');
      let options = {
        url: $(this).data('jalios-sidebar-url')
      };

      //Init plugin if needed
      let sidebarPlugin = $(target).data(pluginName);
      if (sidebarPlugin == null) {
        $(target).sidebar({
          trigger: $(event.currentTarget)
        });
      }

      $(target).data(pluginName)[action](options);
    });

    // Avoid FOUC in back office
    $(".sidebar-component").removeClass("hide");
  }

  /**
   *
   *  A really lightweight plugin wrapper around the constructor,
   *  preventing against multiple instantiations
   *
   */
  $.fn[pluginName] = function(options) {
    return this.each(function() {
      if (!$.data(this, pluginName)) {
        $.data(this, pluginName, new Plugin(this, options));
      }
    });
  };

  $(document).ready(function($) {
    register();
  });

})(jQuery, window, document);