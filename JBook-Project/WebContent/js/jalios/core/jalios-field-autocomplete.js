/*
  Plugin which allows search on an input text.
  When text is typed in the field, a target element is refreshed on defined target.
  @since jcms-10.0.0
*/
;(function($, window, document, undefined) {
  var ajaxTimeout = false;

  "use strict";

  // Create the defaults once
  var pluginName = "fieldAutocomplete",
      defaults = {
        propertyName: "value"
      };

  // The actual plugin constructor
  function Plugin(element, options) {
    this.element = element;
    this.settings = $.extend({}, defaults, options);
    this._defaults = defaults;
    this._name = pluginName;
    this.backupedSearch = "";
    this.init();
  }

  // Avoid Plugin.prototype conflicts
  $.extend(Plugin.prototype, {
    init: function() {
      var plugin = this;
      var $element = $(this.element);
      //Refreshes the slide menu from search typed in search input
      $element.closest("form").on('keyup keypress', function(e) {
        if ($(document.activeElement)[0] !== $element[0]) {
          return;
        }
        
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) { 
          e.preventDefault();
          return false;
        }
      });
      $element.on('input change propertychange', $element, function(event) {
        var ajaxUrl = $element.data("jalios-field-autocomplete");
        var $refreshedElement = $($element.data("jalios-target"));

        if (!ajaxUrl || !$refreshedElement.exists()) {
          return;
        }

        var query = event.target.value;

        if (query === plugin.backupedSearch) {
          return;
        }

        plugin.backupedSearch = query;

        // Trigger behavior based on length of query text
        var minLength = $element.attr('data-ac-min-length') || $.jalios.Properties.get('autocomplete-min-chars');
        if (query.length < minLength && query.length !== 0) {
          return;
        }

        // Use a timeout to avoid search being performed each type a character is typed
        if (ajaxTimeout) {
          clearTimeout(ajaxTimeout);
        }

        if ($element.data("jalios-field-autocomplete-form")) {
          var formData = new FormData($element.closest("form").get(0));
          var params = {};
          formData.forEach(function (value, key) {
            if (value) {
              params[key] = value;
            }
          });
        } else {
          var attrName = $element.attr("name");
          var params = {};
          params[$element.attr("name")] = query;
        }
        


        ajaxTimeout = setTimeout(function() {
          if ($.fn.displayLoading) {
            $refreshedElement.displayLoading();
          }
          $.jalios.AjaxRefresh.refresh(
            ajaxUrl,
            $refreshedElement, {
              "fieldAutocomplete": true,
              "params": params,
              'noscroll': true,
              'nohistory': true,
              "callback": function() {
                //TODO
              }
            });
          ajaxTimeout = false;
        }, $.jalios.Properties.get('autocomplete-chooser-timeout'));
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

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  var register = function() {
    $("[data-jalios-field-autocomplete]").fieldAutocomplete();
  }

  var handleAjaxRefresh = function(event) {
    // Handle an Ajax-Refresh After
    var refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){
      return;
    }
    $("[data-jalios-field-autocomplete]").fieldAutocomplete();
  }

  $(document).ready(function() {
    register();
    $(document).on('jalios:refresh', handleAjaxRefresh);
  });

})(jQuery, window, document);
