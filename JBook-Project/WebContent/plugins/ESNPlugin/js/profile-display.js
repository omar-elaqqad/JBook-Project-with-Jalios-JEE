!function($) {

  let displayLoadingDelay = 1000;

  /**
   * Returns true if click occured on a Profile full display TAB link.
   */
  const validateDisplayLoading = function($trigger) {
    // is profile tab link
    let validateProfileTabLink = $trigger && $trigger.hasClass("js-tab-link");
    // is child of "esn profile full display"
    validateProfileTabLink = validateProfileTabLink
        && $trigger.parents(".member-profile-full-display").length > 0;
    let validateDisplayLoading = validateProfileTabLink;
    return validateDisplayLoading;
  }; /* EOF.validateDisplayLoading */

  /**
   * Displays a loading effect after a delay if relevant.
   */
  const handleRefreshBefore = function(event) {
    let $loadingHolder = $('.profile-body-inner');
    let $trigger = $(event.refresh.options.trigger);
    if (validateDisplayLoading($trigger)) {
      $trigger.ripple();
      setTimeout(function() {
        $loadingHolder.displayLoading();
      }, displayLoadingDelay);
    }
  }; /* EOF.handleRefreshBefore */

  const handleRefresh = function(event) {
    let refreshBefore = $.jalios.Event.match(event, 'refresh', 'before');
    if (refreshBefore) {
      handleRefreshBefore(event);
    }
  }; /* EOF.handleRefresh */

  const initDOM = function() {
    let $profile = $('#member-profile');
    if (!$profile.length) { return; }
    if (!$profile.closest('MAIN').length) {
      // No  parent <MAIN> is found
      changeElementType($profile, 'MAIN');
      // Reload profile before attr update
      $('#member-profile').attr('role', 'main');
      return;
    }
  }; /* EOF.initDOM */

  const isFocusedClick = function(event){
    if(event.type === 'click'){
      return true;
    }
    else if(event.type === 'keydown'){
      let code = event.charCode || event.keyCode;
      if((code === 32)|| (code === 13)){
        return true;
      }
    }
    else{
      return false;
    }
  }

  const changeElementType = function($elt, newType) {
    let attrs = {};
    $.each($elt[0].attributes, function(idx, attr) {
      attrs[attr.nodeName] = attr.nodeValue;
    });
    let content = $elt.contents();
    $elt.replaceWith(function() {
      let $newElt = $("<" + newType + "/>", attrs);
      $newElt.append(content)
      return $newElt;
    });
  }; /* EOF.changeElementType */

  const register = function() {
    $(document).on('jalios:refresh', handleRefresh);
    if ($(".photo-lightbox-img").exists() && $.jalios.Lightbox && typeof $.jalios.Lightbox.launchLightbox === "function") {
      $(document).on('click keydown','.member-profile-photo',  function(event) {
        if (isFocusedClick(event)) {
          $.jalios.Lightbox.launchLightbox($(".photo-lightbox-img"));
        }
      });
    } else {
      $(".member-profile-photo").removeAttr("role").removeAttr("tabindex").removeAttr("title").removeAttr("aria-label");
    }

    initDOM();
  }; /* EOF.register */

//  $(document).ready(function() {
//    register();
//  });
  $(document).on('jalios:ready', function() {
    register();
  });

}(window.jQuery);