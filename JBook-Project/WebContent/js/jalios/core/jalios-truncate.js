;(function($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------
  var truncateSelector = "[data-jalios-truncate]:not(js-truncated)";

  var ajaxRefreshAfterCallBack = function(event) {
    var refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){
      return;
    }
    $(truncateSelector).jalios_truncate();
  };

  var truncate = function(element, options) {
    //Specific code for clamp library
    if ($clamp) {
      var clampOptions = {};
      clampOptions.clamp = options.value;

      $clamp(element, clampOptions);
    }
  };

  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  if (!$.jalios) {
    $.jalios = {};
  }

  $.jalios.truncate = function(el, options) {
    var base = this;
    base.$el = $(el);
    base.el = el;

    base.init = function() {


      base.$el.each(function(index, element) {
        var elementData = $(element).data("jalios-truncate");
        // Merge default options and element options
        var elementOptions = $.extend({}, $.jalios.truncate.defaultOptions, elementData);
        // Merge element options and method call options
        $.extend(elementOptions, options);

        truncate(element, elementOptions);

        $(element).addClass("js-truncated");
      });
    };

    base.init();
  };

  $.jalios.truncate.defaultOptions = {
    value: 2 // 2 lines by default
  };

  $.fn.jalios_truncate = function(options) {
    return this.each(function() {
      (new $.jalios.truncate(this, options));
    });
  };

  $(document).ready(function() {
    $(truncateSelector).jalios_truncate();
    // Register Ajax-Refresh callback
    $(document).on('jalios:refresh', ajaxRefreshAfterCallBack);
  });

})(jQuery);
