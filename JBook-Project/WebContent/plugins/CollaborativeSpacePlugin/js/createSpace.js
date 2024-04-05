/**
 * -----------------------------------------------------------------
 *
 *  JavaScript for CollaborativeSpace creation modal.
 * 
 * -----------------------------------------------------------------
 */ 

!function ($) {
  
  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  var _init = false;
  /* Do stuff on DOM Ready */
  var register = function() {
    if (_init) {
      return;
    }
    _init = true;
    $(document).on('jalios:refresh', ajaxRefreshCallback);
    $(document).on('change', '.create-space input[name="activateSync"]', function(event){
      $(".create-space .sync-mode-picker").toggleClass("hide");
      if($(event.target).val() === 'false'){
        $(".create-space .sync-mode-picker input:checkbox").prop('checked', false);
      }
    });
    
    JcmsLogger.info('CollaborativeSpace Plugin', 'Init createSpace');
  };
  
  /**
   * Handle Ajax-Refresh Event.<br>
   * Handle Access/Signup slave initialization.
   */
  var ajaxRefreshCallback = function(event){
    
    // Handle an Ajax-Refresh After
    var refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){ return; }
    
    var $formStep = jQuery('INPUT:hidden[name=formStep]');
    
    if (!$formStep.exists()) {
      return;
    }
    
    var formStep =  $formStep && $formStep[0] ? $formStep[0].value : -1;
        
    if (formStep == 1) {
      $.JCMS.jcmsplugin.cs.CreateSpaceUtils.initAccessSignupCompatibility();
    }
  }

  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.JCMS) { $.JCMS = {}; }
  if (!$.JCMS.jcmsplugin) { $.JCMS.jcmsplugin = {}; }
  if (!$.JCMS.jcmsplugin.cs) { $.JCMS.jcmsplugin.cs = {};}

  /**
   * CollaborativeSpace creation modal utils.
   * 
   * @namespace $.JCMS.jcmsplugin.cs.CreateSpaceUtils
   */
  $.JCMS.jcmsplugin.cs.CreateSpaceUtils = {
    
    initAccessSignupCompatibility: function() {
      var accessPolicies = jQuery("#jalios-modal FORM[name='modalForm'] [name='accessPolicy']");
      var signupPolicies = jQuery("#jalios-modal FORM[name='modalForm'] [name='signupPolicy']");
      
      $.JCMS.jcmsplugin.cs.AccessSignupUtils.checkFirstAccess = true;
      $.JCMS.jcmsplugin.cs.AccessSignupUtils.initAccessSignupCompatibility(accessPolicies, signupPolicies);
    }
  }
  
  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function($) {
    register();
  });

}(window.jQuery);
