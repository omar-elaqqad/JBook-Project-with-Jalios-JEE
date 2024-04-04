;( function( $, window, document, undefined ) {

  const handleRefresh = function(event) {
    // Handle an Ajax-Refresh After
    var refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){ return; }
    initAlertLevelChooser(event);
  }; // handleRefresh

  const register = function(event) {
    JcmsLogger.info('Alert level chooser', 'Init JS');
    initAlertLevelChooser(event);
    $(document).on("click",".input-group .alert-level INPUT[type=radio]", handleAlertLevelChange);
    $(document).on('jalios:refresh', handleRefresh);
  }; // register

  /**
   * Inits existing alert level chooser(s) in the page.
   */
  const initAlertLevelChooser = function(event) {
    let $alertLevelRadios = $(".input-group .alert-level INPUT[type=radio]");
    if (!$alertLevelRadios.exists()) {
      return;
    }
    // Update parent data attribute
    let $parent = $alertLevelRadios.closest('.input-group');
    updateAlertChooser($parent);
  }; // initAlertLevelChooser
  
  /**
   * Updates one alert level chooser(s) when selected level does change.
   */
  const handleAlertLevelChange = function(event) {
    let $elt = $(event.currentTarget);
    let checked = $elt.is(':checked');
    if (checked) {
      let $parent = $elt.closest('.input-group');
      updateAlertChooser($parent);
    }
  }; // handleAlertLevelChange
  
  /**
   * Updates given alert level chooser(s) with currently selected level.
   */
  const updateAlertChooser = function($alertLevelChooser) {
    if (!$alertLevelChooser || !$alertLevelChooser.exists()) {
      return;
    }
    let $selectedLevel = $alertLevelChooser.find('INPUT[type=radio]:checked');
    if (!$selectedLevel.exists()) {
      return;
    }
    let selectedLevelValue = $selectedLevel.val();
    $alertLevelChooser.attr('data-jalios-selected-level', selectedLevelValue);
  }; // updateAlertChooser
  
  // ------------------------------------------
  // INIT
  // ------------------------------------------

  $(document).ready(function() {
    register();
  });

})(jQuery, window, document);
