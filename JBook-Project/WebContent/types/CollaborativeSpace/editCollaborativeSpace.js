/**
 * -----------------------------------------------------------------
 *
 *  JavaScript for generated CollaborativeSpace edition.
 * 
 * -----------------------------------------------------------------
 */ 

!function ($) {
  
  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  /* Do stuff on DOM Ready */
  var init = function() {
    var accessPolicies = jQuery(".CollaborativeSpace [name='accessPolicy']");
    var signupPolicies = jQuery(".CollaborativeSpace [name='signupPolicy']");
    $.JCMS.jcmsplugin.cs.AccessSignupUtils.initAccessSignupCompatibility(accessPolicies, signupPolicies);
    JcmsLogger.info('CollaborativeSpace Plugin', 'Init editCollaborativeSpace');
  }

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function($) {
    init();
  });

}(window.jQuery);