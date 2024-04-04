/*
 *  Project:
 *  Description:
 *  Author:
 *  License:
 */

// the semi-colon before function invocation is a safety net against concatenated
// scripts and/or other plugins which may not be closed properly.
;(function($, window, document, undefined) {

  "use strict";

  // undefined is used here as the undefined global variable in ECMAScript 3 is
  // mutable (ie. it can be changed by someone else). undefined isn't really being
  // passed in so we can ensure the value of it is truly undefined. In ES5, undefined
  // can no longer be modified.

  // window is passed through as local variable rather than global
  // as this (slightly) quickens the resolution process and can be more efficiently
  // minified (especially when both are regularly referenced in your plugin).

  // Create the defaults once
  var pluginName = "scrollbar",
      // key using in $.data()
      dataKey = "plugin_" + pluginName,
      // Default settings
      defaults = {
        wheelSpeed: 2,
        wheelPropagation: true,
        minScrollbarLength: 20
      };

  // The actual plugin constructor
  function Plugin(element, options, objD) {
    this.element = element;

    // jQuery has an extend method which merges the contents of two or
    // more objects, storing the result in the first object. The first object
    // is generally empty as we don't want to alter the default options for
    // future instances of the plugin
    this.settings = $.extend({}, defaults, options, objD);
    this._defaults = defaults;
    this._name = pluginName;
    this.init();
  }

  Plugin.prototype = {
    // initialize options
    init : function() {
      this.scrollbar = new PerfectScrollbar(this.element, this.settings);

      var $element = $(this.element);

      // This event fires when the y-axis is scrolled in either direction.
      $element.on('ps-scroll-y', function(e) {
        var event = $.Event("scrolly.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when the x-axis is scrolled in either direction.
      $element.on('ps-scroll-x', function(e) {
        var event = $.Event("scrollx.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling upwards.
      $element.on('ps-scroll-up', function(e) {
        var event = $.Event("scrollup.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling downwards.
      $element.on('ps-scroll-down', function(e) {
        var event = $.Event("scrolldown.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling to the left.
      $element.on('ps-scroll-left', function(e) {
        var event = $.Event("scrollleft.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling to the right.
      $element.on('ps-scroll-right', function(e) {
        var event = $.Event("scrollright.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling reaches the start of the y-axis.
      $element.on('ps-y-reach-start', function(e) {
        var event = $.Event("scrollstarty.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling reaches the end of the y-axis (useful for infinite scroll).
      $element.on('ps-y-reach-end', function(e) {
        var event = $.Event("scrollendy.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling reaches the start of the x-axis.
      $element.on('ps-x-reach-start', function(e) {
        var event = $.Event("scrollstartx.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });

      // This event fires when scrolling reaches the end of the x-axis.
      $element.on('ps-x-reach-end', function(e) {
        var event = $.Event("scrollendx.jalios.scrollbar", {
          originalEvent : e
        });
        $element.trigger(event);
      });
    },
    /**
     * Call this method if you want to destroy the scrollbar
     */
    destroy : function() {
      this.scrollbar.destroy();
      this.scrollbar = null; // to make sure garbages are collected
      $.data(this.element, dataKey, null);
    },
    /**
     * Call this method if the size of your container or content changes.
     */
    refresh : function() {
      this.scrollbar.update();
    }
  };

  /*
   * Plugin wrapper, preventing against multiple instantiations and return plugin instance.
   */
  $.fn[pluginName] = function(options) {
    var args = arguments;

    // Is the first parameter an object (options), or was omitted,
    // instantiate a new instance of the plugin.
    if (options === undefined || typeof options === 'object') {
      return this.each(function() {

        // Only allow the plugin to be instantiated once,
        // so we check that the element has no plugin instantiation yet
        if (!$.data(this, dataKey)) {
          var objD = $(this).data();
          // if it has no instance, create a new one, pass options to our plugin constructor,
          // and store the plugin instance in the elements jQuery data object.
          $.data(this, dataKey, new Plugin(this, options, objD));
        }
      });

    // If the first parameter is a string and it doesn't start
    // with an underscore or "contains" the `init`-function,
    // treat this as a call to a public method.
    } else if (typeof options === 'string' && options[0] !== '_' && options !== 'init') {

      // Cache the method call to make it possible to return a value
      var returns;

      this.each(function() {
        var instance = $.data(this, dataKey);

        // Tests that there's already a plugin-instance and checks that the requested public method exists
        if (instance instanceof Plugin && typeof instance[options] === 'function') {

          // Call the method of our plugin instance, and pass it the supplied arguments.
          returns = instance[options].apply(instance, Array.prototype.slice.call(args, 1));
        }
      });

      // If the earlier cached method gives a value back return the value,
      // otherwise return this to preserve chainability.
      return returns !== undefined ? returns : this;
    }
  };

}(jQuery, window, document));