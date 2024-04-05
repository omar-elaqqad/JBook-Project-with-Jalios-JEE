/**
 * -----------------------------------------------------------------
 *
 *  JavaScript for CollaborativeSpace header mirroring.
 * 
 * -----------------------------------------------------------------
 */

!function($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------

  let _init = false;
  let img;
  let $header = $('#cs-header');

  let mirrorHeader = function(params) {
    if (!params) { return; }
    if (!params.mirrorX && !params.mirrorY) {
      return; 
    }
    
    let canvas = $('<CANVAS>')[0];
    let ctx = canvas.getContext("2d");
    
    if ($.JCMS.jcmsplugin.cs.HeaderUtils._debug) {
      $('.cs-body CANVAS.header-canvas').remove();
      $('.cs-body').prepend(canvas);
      $(canvas).css('outline', '2px solid blue');
      $(canvas).addClass('header-canvas');
    }
    
    canvas.width = img.width * (params.mirrorX ? 2 : 1);
    canvas.height = img.height * (params.mirrorY ? 2 : 1);
    ctx.drawImage(img,0,0);

    // Draw mirrorY image
    if (params.mirrorY) {
      ctx.scale(1, -1);
      ctx.translate(0, -img.height);
      ctx.drawImage(img, 0, -img.height, img.width, img.height);
      // Restore
      ctx.translate(0, img.height);
      ctx.scale(1, -1);
    }

    // Draw mirrorX image
    if (params.mirrorX) {
      ctx.scale(-1, 1);
      ctx.translate(-img.width, 0);
      ctx.drawImage(img, -img.width, 0, img.width, img.height);
      // Restore
      ctx.scale(-1, 1);
      ctx.translate(-img.width, 0);
    }
    
    // MirrorX + mirrorY?
    if (params.mirrorX && params.mirrorY) {
      ctx.scale(-1, -1);
      ctx.translate(-img.width, -img.height);
      ctx.drawImage(img, -img.width, -img.height, img.width, img.height);
    }

    let dataURL = canvas.toDataURL();
    $header.css({
      'background-image' : 'url('+dataURL+')'
    });
    
    $.JCMS.jcmsplugin.cs.HeaderUtils.canvas = canvas;
  }; // mirrorHeader

  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.JCMS) { $.JCMS = {}; }
  if (!$.JCMS.jcmsplugin) { $.JCMS.jcmsplugin = {}; }
  if (!$.JCMS.jcmsplugin.cs) { $.JCMS.jcmsplugin.cs = {};}

  $.JCMS.jcmsplugin.cs.HeaderUtils = {

    _debug : false,
    
    canvas : null, 
    
    /**
     * Init header mirroring given params 
     */
    initMirror: function(src, params) {
      img = new Image();
      // Bind callback when image will be available
      $(img).on('load', function(event) {
        mirrorHeader(params);
      });
      // Load image
      img.src = src;
    },
    
    /**
     * Return which mirroring action should be applied on header
     * regarding the current saved state (ie, #cs-header CSS classes) 
     */
    getMirrorParams : function() {
      let $header = $('#cs-header');
      let mirrorBoth = $header.hasClass('cs-header-mirror');
      let mirrorX = mirrorBoth || $header.hasClass('cs-header-mirror-x');
      let mirrorY = mirrorBoth || $header.hasClass('cs-header-mirror-y');
      return {
        mirrorX : mirrorX,
        mirrorY : mirrorY
      };
    }
  };
    
  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  /* Do stuff on DOM Ready */
  // Move register after all other functions
  let register = function() {
    if (_init) {
      return;
    }
    _init = true;
    
    // Get the currently saved, thus applied, background-image
    // slice => remove the "url('" prefix and "')' suffix "of background-image attr
    JcmsLogger.info('CollaborativeSpace Plugin', 'Init header mirroring');
  }; // register

  $(document).ready(function($) {
    register();
  });

}(window.jQuery);
