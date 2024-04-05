/**
 * -----------------------------------------------------------------
 *
 *  JavaScript for CollaborativeSpace slave accessPolicy and signupPolicy fields.
 * 
 * -----------------------------------------------------------------
 */ 

!function ($) {
  
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.JCMS) { $.JCMS = {}; }
  if (!$.JCMS.jcmsplugin) { $.JCMS.jcmsplugin = {}; }
  if (!$.JCMS.jcmsplugin.cs) { $.JCMS.jcmsplugin.cs = {};}

  /**
   * CollaborativeSpace access/signup utils.
   * 
   * @namespace $.JCMS.jcmsplugin.cs.AccessSignupUtils
   */
  $.JCMS.jcmsplugin.cs.AccessSignupUtils = {
    checkFirstAccess: false,  // Weither to check a default access radio if none is checked by default
    
    initAccessSignupCompatibility: function(accessPolicies, signupPolicies) {
      
      /*
       * If 0 : illegalState
       * If 1 : hidden input
       * If 2 or 3 : radio inputs
       */

      if (!accessPolicies || accessPolicies.length == 0) {
        return;
      }
      
      var multipleSignup = signupPolicies.length > 1;
      
      //var slavedAccess = null;
      if (accessPolicies.length == 1) {
        // Slaving on first and alone access hidden input
        slavedAccess = accessPolicies[0];
      } else if (accessPolicies.length > 1) {
        var isAccessChecked = new Boolean();
        jQuery.each(accessPolicies, function(index, radio){
          // If multiple access choice, init event handlers for slaving inputs
          if (multipleSignup) {
            radio.on('click', function(event) {
              var accessPolicy = this.value;
              $.JCMS.jcmsplugin.cs.AccessSignupUtils.slaveAccessSignupCompatibility(signupPolicies, accessPolicy);
            });
          }
          // Here: is there always a checked access ?
          if (radio.checked == true) {
            isAccessChecked = true;
            slavedAccess = radio;
          }
        });
        // has an access input been checked within this configuration ?
        // if not, fallback to first access of the list
        if (isAccessChecked != true) {
          slavedAccess = accessPolicies[0];
        }
      }
      
      if (slavedAccess != null && $.JCMS.jcmsplugin.cs.AccessSignupUtils.checkFirstAccess == true) {
        slavedAccess.checked = true;
        $.JCMS.jcmsplugin.cs.AccessSignupUtils.slaveAccessSignupCompatibility(signupPolicies, slavedAccess.value);
      }
      JcmsLogger.info('CollaborativeSpace Plugin', 'Init access/signup slaving');
    },  // Links access 'radio' change event on Slaving method
    
    slaveAccessSignupCompatibility: function(signupPolicies, accessPolicy) {
      
      /*
       * If 0 : illegalState
       * If 1 : hidden input
       * If 2 or 3 : radio inputs
       */
      
      if (signupPolicies.length == 0 || signupPolicies.length == 1 || accessPolicy == null) {
        return;
      }

      var free    = null;
      var request = null;
      var admin   = null;
      var isSignupChecked = new Boolean();
      jQuery.each(signupPolicies, function(index, radio){
        // If multiple signup choice, retrieve input by value
        if ("free" == radio.value) {
          free = radio;
        } else if ("request" == radio.value) {
          request = radio;
        } else if ("admin" == radio.value) {
          admin = radio;
        }
        if (radio.checked == true) {
          isSignupChecked = true;
        }
      });

      if ("public" == accessPolicy || "private" == accessPolicy) {
        if (free)     { jQuery(free).prop('disabled', false);     }
        if (request)  { jQuery(request).prop('disabled', false);  }
        if (admin)    { jQuery(admin).prop('disabled', false);    }
      } else if ("secret" == accessPolicy) {
        jQuery(admin).prop('disabled', false);
        admin.checked = true;
        if (free)     { jQuery(free).prop('disabled', true);    }
        if (request)  { jQuery(request).prop('disabled', true); }
      }
      
      // Finally, ensure one radio is checked
      if (isSignupChecked != true) {
        if (free)         { free.checked = true;    }
        else if (request) { request.checked = true; }
        else if (admin)   { admin.checked = true;   }
      }
    }  // When given accessPolicy is chosen, the given signupPolicies are updated (enabled / disabled)
  };
  
}(window.jQuery);
