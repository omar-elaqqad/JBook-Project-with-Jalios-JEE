/**
 * -----------------------------------------------------------------
 *
 *  JavaScript for CollaborativeSpace settings page.
 * 
 * -----------------------------------------------------------------
 */ 

!function ($) {
  
  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  let _init = false;
  let $opacitySlider;
  
  /* Do stuff on DOM Ready */
  let register = function() {
    if (_init) {
      return;
    }
        
    _init = true;

    if ($('.cs-settings-nav .info-tab').hasClass('active')) {
      // Handle access/signup field slaving
      $.JCMS.jcmsplugin.cs.SettingsUtils.initAccessSignupCompatibility();
    }
    
    if ($('.cs-settings-nav .look-tab').hasClass('active')) {
      $('INPUT:text[name=header]').on("change", $.JCMS.jcmsplugin.cs.SettingsUtils.refreshHeader);

      initOpacitySlider();
      initChoosers();
      $('INPUT:submit[name=opUpdate]').on("click", onOpUpdate);
    }
    
    initMobilePortlets();
    $(document).on("jalios:refresh", function(event){
      // Check triggered event is "after"
      if (event.refresh.type !== "after" || (!event.refresh.options || !event.refresh.options.params) ) {
        return;
      }
      initMobilePortlets();
    });
    
      $(document).on('change', '.cs-settings input[name="activateSync"]', function(event){
        $(".cs-settings .sync-mode-picker").toggleClass("hide");
        if($(event.target).val() === 'false'){
          $(".cs-settings .sync-mode-picker input:checkbox").prop('checked', false);
        }
      });
    
  }; // register
  
  const initMobilePortlets = function() {
    $(".mobile-portlets .mobile-portlet-delete").on("click", function(event) {
      $(event.currentTarget).closest(".mobile-portlet").remove();
    });
    
    const portlets = $(".ajax-refresh-div >.mobile-portlet.added-portlet").detach(); 
    portlets && $(".mobile-portlets").append(portlets);
    
    $(".mobile-portlets").sortable({
      handle: ".mobile-portlet-drag",
      cancel: '',
      tolerance: "pointer",
      containment: "parent"
    });
  }
  
  let onOpUpdate = function(event) {
    return submitForm();
  }; // onOpUpdate
  
  /**
   * Submits the Form with the mirrored header (base64) as an image file if any.
   */
  let submitForm = function() {
    if ($('INPUT:radio[name=headerMirror]:checked').val() === "no-mirror") {
      // Mirror option selected to "none"
      return true;
    }
    if (!$.JCMS.jcmsplugin.cs.HeaderUtils.canvas) {
      // No canvas / mirror header to POST
      return true;
    }
    
    // FIXME: remove arrow function
    $.JCMS.jcmsplugin.cs.HeaderUtils.canvas.toBlob(function(blob) {
      let file = new File([blob], "image.png");
      
      // Serialize the Form to FormData
      let formdata = new FormData($('.cs-settings FORM#settingsForm')[0]);
      formdata.append("opUpdate", "true");
    
      // Append the mirror image header to FormData
      formdata.append("mirroredHeader", file);
    
      $.ajax({
         url: "plugins/CollaborativeSpacePlugin/jsp/settings.jsp",
         type: "POST",
         data: formdata,
         processData: false,
         contentType: false,
         complete: function(data){
           $.jalios.Browser.reload();
         }
      });
      return false;
    });
    return false;
  }; // submitForm
  
  let hexToRgb = function(hex) {
    let result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
      r: parseInt(result[1], 16),
      g: parseInt(result[2], 16),
      b: parseInt(result[3], 16)
    } : null;
  }; // hexToRgb
  
  let initOpacitySlider = function() {
    $opacitySlider = $('.csp-tabs-opacity-slider').slider();
   
    // Live update when slider changes
    $opacitySlider.on("change", function(event) {
      let opacity = event && event.value && event.value.newValue ? event.value.newValue : null;
      refreshTabsBgColor(null, opacity);
    });
  }; // initOpacitySlider
  
  let refreshTabsBgColor = function(newBgColor, newOpacity) {
    let opacity = newOpacity;
    if ($.JCMS.jcmsplugin.cs.SettingsUtils.isCondensed()) {
      $('#cs-header-tabs UL.nav-tabs').css("background-color", "");
      return;
    }
    
    if (!opacity) {
      // Read it from input
      let $input = $("INPUT[name='headerTabsOpacity']");
      opacity = $input.val();
    }
    let bgColorHex = newBgColor;
    if (!bgColorHex) {
      // Read it from input
      let $input = $("INPUT[name='headerTabsBgColor']");
      bgColorHex = $input.val();
    }
    if (!bgColorHex) {
      // When bgColor input is empty, we fallback on white
      bgColorHex = "#000000";
    }
    // convert bgColor hex to RGB
    let rgb = hexToRgb(bgColorHex);
    $('#cs-header-tabs UL.nav-tabs').css("background-color", "rgba("+rgb.r+", "+rgb.g+", "+rgb.b+", "+opacity / 100+")");
  }; // refreshTabsBgColor
  
  let initChoosers = function() {
    initBgColorChooser();
    initColorChooser();
    initTabsColorChooser();
    initTabsBgColorChooser();
    initImageChooser();
    initImagePositionChooser();
    initImageRepeatChooser();
    initImageMirrorChooser();
    initCondensedChooser();
  }; // initChoosers

  let initBgColorChooser = function() {
    updateOnChooserChange($('.cs-color-chooser.bgcolor-chooser .control-color'), function() {
      let color = $(this).val();
      let $header = $('#cs-header');
      // Use a fakeDiv for comparison since hex color is changed to an rgb color syntax
      if ($header.css('background-color') == $('<div>').css('background-color', color).css('background-color')) {
        // Return if already applied
        return;
      }
      $header.css('background-color', color);
    });
    $(".cs-color-chooser.bgcolor-chooser [data-jalios-action='widget:clear']").on('click', function() {
      // Remove the <style> markup
      $('#cs-style-bgColor').remove();
      let $header = $('#cs-header');
      $header.css('background-color', "");
    });
  }; // initBgColorChooser

  let initColorChooser = function() {
    updateOnChooserChange($('.cs-color-chooser.header-title-color-chooser .control-color'), function() {
      // Remove the <style> markup
      $('#cs-style-title-color').remove();
      let color = $(this).val();
      let $headerTitle = $('#cs-header-title');
      // cannot compare since Theme LESS rules may continue to apply on child elements
      $headerTitle.css('color', color);
      $headerTitle.find('A').css('color', color);
    });
    $(".cs-color-chooser.header-title-color-chooser [data-jalios-action='widget:clear']").on('click', function() {
      // Remove the <style> markup
      $('#cs-style-title-color').remove();
      let $headerTitle = $('#cs-header-title');
      $headerTitle.css('color', "");
      $headerTitle.find('A').css('color', "");
    });
  }; // initColorChooser

  let initTabsColorChooser = function() {
    updateOnChooserChange($('.cs-color-chooser.tabs-color-chooser .control-color'), function() {
      let color = $(this).val();
      let $tabsColor = $('#cs-header-tabs UL.nav-tabs > LI > A');
      // Use a fakeDiv for comparison since hex color is changed to an rgb color syntax
      if ($tabsColor.css('color') == $('<div>').css('color', color).css('color')) {
        // Return if already applied
        return;
      }
      $tabsColor.css('color', color);
    });
    $(".cs-color-chooser.tabs-color-chooser [data-jalios-action='widget:clear']").on('click', function() {
      // Remove the <style> markup
      $('#cs-style-tabs-color').remove();

      let $tabsColor = $('#cs-header-tabs UL.nav-tabs > LI > A');
      $tabsColor.css('color', "");
    });
  }; // initTabsColorChooser

  let initTabsBgColorChooser = function() {
    updateOnChooserChange($('.cs-color-chooser.tabs-bgcolor-chooser .control-color'), function() {
      // Remove the <style> markup
      $('#cs-style-tabs-bgColor').remove();
      let color = $(this).val();
      let $tabs = $('#cs-header-tabs UL.nav-tabs');
      // Use a fakeDiv for comparison since hex color is changed to an rgb color syntax
      if ($tabs.css('background-color') == $('<div>').css('background-color', color).css('background-color')) {
        // Return if already applied
        return;
      }
      refreshTabsBgColor(color, null);
    });
    $(".cs-color-chooser.tabs-bgcolor-chooser [data-jalios-action='widget:clear']").on('click', function() {
      // Remove the <style> markup
      $('#cs-style-tabs-bgColor').remove();
      let $tabs = $('#cs-header-tabs UL.nav-tabs');
      $tabs.css('background-color', "");
      // Note: when clearing bgColor, need to force to white because bgColor input 
      // won't be emptied at time of this call
      refreshTabsBgColor("#FFFFFF", null);
    });
  }; // initTabsBgColorChooser

  let initImageChooser = function() {
    $('.header-existing-background-image-chooser IMG[data-jalios-csp-settings-header-url]:not([data-jalios-csp-settings-header-url=""])').on('click', function() {
      let url = $(this).data('jalios-csp-settings-header-url');
      $.JCMS.jcmsplugin.cs.SettingsUtils.updateHeader(url);
    });
  }; // initImageChooser
  
  let initImagePositionChooser = function() {
    $('.csp-header-position').on('click', function (event) {
      let $target = $(this);
      let posX = $target.data('jalios-csp-header-position-x');
      let posY = $target.data('jalios-csp-header-position-y');
      $('#cs-header').css('background-position-x', posX).css('background-position-y', posY);
      
      $('.csp-header-position').removeClass('active');
      $target.addClass('active');
      
      $("INPUT[name='headerPosX']").val(posX);
      $("INPUT[name='headerPosY']").val(posY);
    });    
  }; // initImagePositionChooser

  let initImageRepeatChooser = function() {
    $('INPUT:radio[name=headerRepeat]').on('change', updateHeaderRepeat);    
  }; // initImageRepeatChooser
  
  let updateHeaderRepeat = function() {
    $('#cs-header').css('background-repeat', $('INPUT:radio[name=headerRepeat]:checked').val());
  }; // updateHeaderRepeat

  let initImageMirrorChooser = function() {
    $('INPUT:radio[name=headerMirror]').on('change', udpateHeaderMirror);    
  }; // initImageMirrorChooser

  let udpateHeaderMirror = function() {
    let $target = $('INPUT:radio[name=headerMirror]:checked');
    let mirrorBoth = $target.val() === "mirror";
    let mirrorX = mirrorBoth || $target.val() === "mirror-x";
    let mirrorY = mirrorBoth || $target.val() === "mirror-y";
    
    // Update the "mirroring" CSS classes on header
    $('#cs-header').removeClass('cs-header-mirror');
    $('#cs-header').removeClass('cs-header-mirror-x');
    $('#cs-header').removeClass('cs-header-mirror-y');
    
    let src = $.JCMS.jcmsplugin.cs.SettingsUtils.getHeader();
    // Changed to "no mirror"?
    if (!mirrorX && !mirrorY) {
      // Then reset mirror
      $('#cs-header').css({
        'background-image' : 'url('+src+')'
      });
      return;
    }
    
    if (mirrorBoth) {
      $('#cs-header').addClass('cs-header-mirror');
    } else if (mirrorX) {
      $('#cs-header').addClass('cs-header-mirror-x');
    } else if (mirrorY) {
      $('#cs-header').addClass('cs-header-mirror-y');
    }

    $.JCMS.jcmsplugin.cs.HeaderUtils.initMirror(
      src, 
      {
        mirrorX : mirrorX,
        mirrorY : mirrorY
      }
    );
    
    // Refresh "repeat" state
    updateHeaderRepeat();
  }; // udpateHeaderMirror

  let initCondensedChooser = function() {
    $('INPUT:radio[name=headerCondensed]').on('change', function (event) {
      let $target = $(this);
      refreshTabsBgColor(null, null);
      if ($target.val() === "true") {
        $.JCMS.jcmsplugin.cs.SettingsUtils.refreshHeader();
        $('.cs-portal').addClass('cs-is-condensed');
        // Always ensure default tab will be visible if condensed mode if switched
        $('.settings-header-nav-tabs LI[role=presentation]:first A').trigger('click');
      } else {
        $('.cs-portal').removeClass('cs-is-condensed');
        $.JCMS.jcmsplugin.cs.SettingsUtils.refreshHeader();
      }
    });    
  }; // initCondensedChooser

  let updateOnChooserChange = function($colorChooser, callback) {
    $colorChooser.on('change', callback);
  }; // updateOnChooserChange

  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.JCMS) { $.JCMS = {}; }
  if (!$.JCMS.jcmsplugin) { $.JCMS.jcmsplugin = {}; }
  if (!$.JCMS.jcmsplugin.cs) { $.JCMS.jcmsplugin.cs = {};}

  /**
   * CollaborativeSpace settings utils.
   * 
   * @namespace $.JCMS.jcmsplugin.cs.SettingsUtils
   */
  $.JCMS.jcmsplugin.cs.SettingsUtils = {

    initAccessSignupCompatibility: function() {
      let accessPolicies = $("INPUT[name='accessPolicy']");
      let signupPolicies = $("INPUT[name='signupPolicy']");
      $.JCMS.jcmsplugin.cs.AccessSignupUtils.initAccessSignupCompatibility(accessPolicies, signupPolicies);
    },

    /**
     * Get the currently selected header image.
     */
    getHeader: function () {
      let src = $('.header-background-image-chooser INPUT:text[name="header"]').val();
      return src;
    },
    
    updateTheme: function(theme) {
      
      // Compliance with header's image: (do this first, before theme color is set)
      // -------------------------------
      // Reset bgColor
      $.JCMS.jcmsplugin.cs.SettingsUtils.resetBgColor();
      $.JCMS.jcmsplugin.cs.SettingsUtils.resetTitleColor();
      $.JCMS.jcmsplugin.cs.SettingsUtils.resetTabsColor();
      $.JCMS.jcmsplugin.cs.SettingsUtils.resetTabsBgColor();

      
      // Update live theme
      let $portal = $('.cs-portal');
      let classes = $portal[0].className.split(/\s+/);
      for (let i=0 ; i<classes.length; i++){
        // Remove all current theme classes
        if (classes[i].startsWith("cs-theme-")) {
          $portal.removeClass(classes[i])
          break;
        }
      }
      // Add selected theme class on Portal (for live update)
      $portal.addClass(theme);
      
      // Update FORM selected color
      $(".theme-color-list LI").each(function() {
        $( this ).removeClass("active");
      });
      $(".theme-color-list LI." + theme).addClass("active");
      
      // Reset opacity to default
      $.JCMS.jcmsplugin.cs.SettingsUtils.setTabsOpacity(20);
    },
    
    /**
     * Updates the CS header given available image options.
     */
    refreshHeader: function () {
      // Refresh image
      {
        // no image
        let isNoImage = $("#header0").attr("checked") === true;
        let isCondensed = $.JCMS.jcmsplugin.cs.SettingsUtils.isCondensed();
        if (isNoImage || isCondensed) {
          // Reset live header image
          $.JCMS.jcmsplugin.cs.SettingsUtils.updateHeader(null);
          return;
        }
        let src = $.JCMS.jcmsplugin.cs.SettingsUtils.getHeader();
        $.JCMS.jcmsplugin.cs.SettingsUtils.updateHeader(src);
      }
    },
    
    /**
     * Updates the CS header by given image src/url.
     */
    updateHeader: function (url) {
      let $header = $('#cs-header');
      if (!url) {
        $header.css('background-image', '');
        $header.removeClass("cs-custom-header");
        return;
      }
      // Sync selected url with the image chooser input (for display, save)
      $(".cs-settings [name='header']").val(url);
      udpateHeaderMirror();
      $header.css('background-image', 'url(' + url + ')');
      $header.addClass("cs-custom-header");
    },
    
    resetBgColor: function () {
      let $input = $('[name="headerBgColor"]');
      $input.closest('.widget-content').find('[data-jalios-action="widget:clear"]').click();
    },
    
    resetTitleColor: function () {
      let $input = $('[name="headerTitleColor"]');
      $input.closest('.widget-content').find('[data-jalios-action="widget:clear"]').click();
    },
    
    resetTabsColor: function () {
      let $input = $('[name="headerTabsColor"]');
      $input.closest('.widget-content').find('[data-jalios-action="widget:clear"]').click();
    },
    
    resetTabsBgColor: function () {
      let $input = $('[name="headerTabsBgColor"]');
      $input.closest('.widget-content').find('[data-jalios-action="widget:clear"]').click();
    },
    
    setTabsOpacity: function (opacity) {
      if ($opacitySlider) {
        $opacitySlider.slider("setValue", opacity);
        // Then refresh
        refreshTabsBgColor(null, null);
      }
    },
    
    isCondensed: function () {
      return $('INPUT:radio[name=headerCondensed]:checked').val() === "true";
    }
  };
  
  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function($) {
    register();
  });
  
  
  /**
    HANDLE JMOBILE FORCE SMARTPHONE SESSION ATTRIBUTE IN PREVIEW
  **/
  
  const removeSmartphoneSessionAttribute = function(){
    $.ajax({
      url: "plugins/CollaborativeSpacePlugin/jsp/portal/collaborativeSpaceActions.jsp",
      data: {
        opRemoveJMobileSessionAttribute: true
      }
    });
  }
  
  const registerIFrameLoadedEventToRemoveSessionAttribute = function(){
    $("#mobile-preview-frame").on('load', removeSmartphoneSessionAttribute);
  }
  
  /*
  *  Register the event on first load and when the jsp is refreshed.
  */
  registerIFrameLoadedEventToRemoveSessionAttribute();
  
  $(document).on("jalios:refresh", function(event){
      if (event.refresh.type !== "after") {
        return;
      }
      if(!event.refresh  || !event.refresh.options || !event.refresh.options.params.mobilePortlets){
        return;
      }
      registerIFrameLoadedEventToRemoveSessionAttribute();
    });
 

}(window.jQuery);
