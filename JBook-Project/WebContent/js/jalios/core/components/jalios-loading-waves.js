!(function ($) {
  var loadingTemplate;
  $.fn.displayLoadingWaves = function () {
    var $this = $(this);
    if ($this.find('.ajax-loading-component-waves').length === 0) {
      $this.prepend("<div class='ajax-loading-component-waves'></div>");
    }
    // Add animation
    let $ajaxLoadingComponentWaves = $this.find('.ajax-loading-component-waves');
    if ($ajaxLoadingComponentWaves.is(':empty') && loadingTemplate) {
      $ajaxLoadingComponentWaves.append(loadingTemplate());
    }
    return $this;
  };

  $(document).ready(function () {
    loadingTemplate = Handlebars.compile($('#jalios-loading-wave').html());
  });
})(window.jQuery);
