!(function ($) {
  let currentPlugin;
  const mediaQuery = window.matchMedia('screen and (max-width: 480px)');
  let sidebarBurgerTemplate;
  let sidebarRefresh = false;

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  const checkValues = function () {
    $('.app-sidebar .form-control:input').each(function () {
      if (this.value !== '') $(this).addClass('has-value');
    });
  };

  const afterAjax = function (event) {
    if ($.jalios.Event.match(event, 'refresh', 'before')) {
      // If the trigger was in a sidebar, switch sidebarRefresh to true
      if (event.refresh.options.brokerTrigger && $(event.refresh.options.brokerTrigger).closest(".app-sidebar").exists()) {
        sidebarRefresh = true;
      } else if (event.refresh.options.trigger && $(event.refresh.options.trigger).closest(".app-sidebar").exists()) {
        sidebarRefresh = true;
      }
      return;
    }
    
    const refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh) {
      return;
    }
    
    //Check we are in an app-sidebar
    var $refreshedElement = event.refresh.target.find('.app-sidebar');
    if ($refreshedElement.exists()) {
      checkValues();
      if ($(".app").data("plugin_jaliosApp")) {
        $(".app").data("plugin_jaliosApp").addLastVisibleButtonClass(event.target);
      } else {
        $('.app').jaliosApp();
      }
    }
    // Focus app body if refresh comes from a sidebar filter
    if (sidebarRefresh) {
      $(".app-body").attr("tabindex","-1")
      $(".app-body")[0].focus({
        preventScroll: true
      });
      sidebarRefresh = false;
    }
    
  };



  // ------------------------------------------
  //  App Plugin
  // ------------------------------------------

  // Create the defaults once
  const pluginName = 'jaliosApp',
    defaults = {};

  // The actual plugin constructor
  function Plugin(element, options) {
    this.$element = $(element);
    this.settings = $.extend({}, defaults, options);
    this._defaults = defaults;
    this._name = pluginName;
    this.hasToggler = this.$element.find('.sidebar-pull-wrapper').exists();
    if (this.hasToggler) {
      this.$element.addClass('is-toggleable-app');
    }
    this.init();
  }

  // Avoid Plugin.prototype conflicts
  $.extend(Plugin.prototype, {
    init: function () {
      currentPlugin = this;
      currentPlugin.checkMediaQuery();
      $(window).resize(function () {
        currentPlugin.checkMediaQuery();
      });

      this.$element.on('click', '.sidebar-pull-wrapper', function (event) {
        currentPlugin.toggleSidebar(event);
      });
      
      this.$element.on('keydown', '.app-sidebar-section LABEL[role=button]', function(e){
        if ($.jalios.a11y.isFocusedClick(e)) {
          e.preventDefault();
          const $input = $(e.currentTarget).find(":input");
          if ($input.is(":checked"))  {
            $input.prop("checked", false);
          } else {
            $input.prop("checked", true);
          }
        }
      });
      
      this.$element.on('keydown', function(e){
        if($(document.activeElement).is('.sidebar-pull-wrapper') && (e.keyCode === 13 || e.keyCode === 32)) {
          currentPlugin.toggleSidebar(event);
          e.preventDefault();
        }
      });     
      this.$element.on('click', '.js-toggle-sidebar', function (event) {
        event.preventDefault();
        currentPlugin.toggleResponsiveSidebar(event);
      });
      this.$element.on("click", ".js-search-cancel, .btn-reset-search", function (event) {
        let $searchWidget = $(event.currentTarget).closest(".widget");
        $searchWidget.find(".app-search-field, input[type=text]").val("");
        $searchWidget.find(".app-search-submit, .btn-submit-search").click();
      });
      this.$element.find(".app-sidebar .input-group-btn").each(function (idx, element) {
        $(element).find(".btn:visible").last().addClass("is-last-visible-btn");
      });
      this.addLastVisibleButtonClass();

      $(document).on('shown.bs.collapse', '.app-sidebar .collapse', function (event) {
        currentPlugin.addLastVisibleButtonClass(event.target);
      })

      $(".app-sidebar-section .radio.control-enumerate, .app-sidebar-section .checkbox.control-enumerate, .app-sidebar-treecat li").each(function (idx, element) {
        $(element).find("> label").attr("tabindex", 0).attr("role", "button");
        $(element).find("> label").on("keypress", function (event) {
          if ((event.key || event.which || (event.keyCode === 32 || event.keyCode === 13))) {
            $(event.currentTarget).find("input").prop('checked', true).trigger("change");
          }
        });
      });

    },
    checkMediaQuery: function () {
      if (mediaQuery.matches && !this.$element.hasClass('is-no-responsive')) {
        currentPlugin.$element.addClass('app-mobile');
        if (!currentPlugin.$element.find('.app-header .js-toggle-sidebar').exists()) {
          currentPlugin.$element.find('.app-header > H1').prepend(sidebarBurgerTemplate);
        }
        if (!currentPlugin.$element.find('.app-sidebar .js-toggle-sidebar').exists()) {
          currentPlugin.$element.find('.app-sidebar .app-sidebar-icon').prepend(sidebarBurgerTemplate);
        }
        currentPlugin.$element.addClass('is-sidebar-folded-mq');
      } else if (!this.$element.hasClass('is-no-responsive')) {
        currentPlugin.$element.removeClass('app-mobile');
        currentPlugin.$element.find('.app-header > H1 .js-toggle-sidebar').remove();
        currentPlugin.$element.find('.app-sidebar .app-sidebar-icon .js-toggle-sidebar').remove();
        currentPlugin.$element.removeClass('is-sidebar-folded-mq');
        currentPlugin.getToggler().attr("aria-expanded", true);
      }
    },
    addLastVisibleButtonClass: function (element) {
      let $element;
      if (!element) {
        $element = this.$element.find(".app-sidebar");
      } else {
        $element = $(element);
      }

      $element.find(".input-group-btn").each(function (idx, element) {
        $(element).find(".btn:visible").last().addClass("is-last-visible-btn");
      });
    },
    toggleResponsiveSidebar: function (event) {
      if (currentPlugin.$element.hasClass('is-sidebar-folded') || currentPlugin.$element.hasClass('is-sidebar-folded-mq')) {
        currentPlugin.openSidebar(event);
      } else {
        currentPlugin.closeSidebar(event);
      }
    },
    getToggler: function() {
      return currentPlugin.$element.find(".sidebar-pull-wrapper");
    },
    getSidebar: function() {
      return currentPlugin.$element.find(".app-sidebar");
    },    
    toggleSidebar: function (event) {
      if (currentPlugin.$element.hasClass('is-sidebar-folded')) {
        currentPlugin.openSidebar(event);
      } else {
        currentPlugin.closeSidebar(event);
      }
    },
    openSidebar: function (event) {
      var hideEvent = $.Event('show.jalios.sidebar', {
        app: currentPlugin.$element,
        event: event
      });
      currentPlugin.getSidebar().css("visibility", "visible");
      currentPlugin.getToggler().attr("aria-expanded", true);
      currentPlugin.$element.trigger(hideEvent).removeClass('is-sidebar-folded').removeClass('is-sidebar-folded-mq');
      currentPlugin.$element.one($.support.transition.end, function () {
        var hiddenEvent = $.Event('shown.jalios.sidebar', {
          app: currentPlugin.$element,
          event: event
        });
        currentPlugin.$element.trigger(hiddenEvent);
      });
    },
    closeSidebar: function (event) {
      var hideEvent = $.Event('start-hide.jalios.sidebar', {
        app: currentPlugin.$element,
        event: event
      });
      currentPlugin.getToggler().attr("aria-expanded", false);
      currentPlugin.$element.trigger(hideEvent).addClass('is-sidebar-folded');
      currentPlugin.$element.one($.support.transition.end, function () {
        var hiddenEvent = $.Event('hidden.jalios.sidebar', {
          app: currentPlugin.$element,
          event: event
        });
        currentPlugin.$element.trigger(hiddenEvent);
        setTimeout(function() {
          currentPlugin.getSidebar().css("visibility", "hidden");
        }, 100);
      });
    }
  });

  $.fn[pluginName] = function (options) {
    return this.each(function () {
      if (!$.data(this, 'plugin_' + pluginName)) {
        $.data(this, 'plugin_' + pluginName, new Plugin(this, options));
      }
    });
  };

  const registerJaliosReady = function () {
    $(document).on('jalios:ready', function () {
      $('.app').jaliosApp();
    });
  };

  const register = function () {
    $('.app').jaliosApp();
    $(document).on('jalios:refresh', afterAjax);
    $(document).on('input change propertychange', '.app-sidebar .form-control:input', function (event) {
      if (this.value !== '') {
        $(this).addClass('has-value');
      } else {
        $(this).removeClass('has-value');
      }
    });
    $(document).on('jalios.date.change', '.app-sidebar .form-control:input', function (event) {
      if (this.value !== '') {
        $(this).addClass('has-value');
      } else {
        $(this).removeClass('has-value');
      }
    });
    checkValues();
  };

  // Plugin initialization on DOM ready
  $(document).ready(function ($) {
    let burger = document.getElementById('jalios-app-sidebar-burger');

    if (burger) {
      var source = burger.innerHTML;
      sidebarBurgerTemplate = Handlebars.compile(source);
    }
    register();
    registerJaliosReady();
  });
})(window.jQuery);
