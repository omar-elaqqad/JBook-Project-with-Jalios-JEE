;( function( $, window, document, undefined ) {

  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------
  
  const register = function(){
    initTooltips();
    $(document).on('.tracking-filter-item', 'click', resetTooltips);
    $(document).on("jalios:refresh", handleAjaxRefresh);
  };
    
  const handleAjaxRefresh = function(event) {
    if (event.refresh.type !== "after") {
      return;
    }
    initTooltips();
  }; // handleAjaxRefresh
  
  /**
   * Prevent some tooltip to remain visible after ajax, or tab toggle with no ajax
   */
  const resetTooltips = function() {
    let $recoModal = $(".recommendation-modal");
    let $recoModalTabs = $recoModal.find(".nav-tabs + .tab-content > .tab-pane");
    let observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
        var attributeValue = $(mutation.target).prop(mutation.attributeName);
        $.console.log("Class attribute changed to:", attributeValue);
        /* Prevent some tooltip to remain visible after ajax */
        $.console.log("hide tooltips: ", $('.tooltip'));
        $('.tooltip').removeClass('in');
      });
    });
    if ($recoModalTabs.exists()) {
      $recoModalTabs.each(function() {
        observer.observe($(this)[0], {
          attributes: true,
          attributeFilter: ['class']
        });
      });
    }
  }; // resetTooltips
  
  /**
   * Init tooltips. (element need a non empty title HTML attr).
   * Processes only tooltips that are not yet initialied, ie, having no data-original-title.
   */
  const initTooltips = function() {
    resetTooltips();
    let $tooltips = $('.recommendation-modal [data-toggle="tooltip"]').filter(function(){
      let $e = $( this );
      // remove non empty data-original-title items
      return !$e.attr('data-original-title');
    });
    if (!$tooltips.length) {
      return;
    }
    $tooltips.tooltip();
  }; // initTooltips

  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
})(jQuery, window, document);