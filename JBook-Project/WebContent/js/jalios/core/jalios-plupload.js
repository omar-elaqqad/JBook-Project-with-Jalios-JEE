!function ($) {

  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------
  
  var runtimes    = 'html5,flash,silverlight,gears,browserplus';
  var flashUrl    = $.jalios.Http.getContextPath()+'/js/lib/plupload-1.5.8/js/plupload.flash.swf';
  var silverUrl   = $.jalios.Http.getContextPath()+'/js/lib/plupload-1.5.8/js/plupload.silverlight.xap';
  var ajaxUrl     = $.jalios.Http.getContextPath()+'/jcore/plupload.jsp';
  var filters     = $.jalios.Properties.get("plupload-filters");
  for ( filterName in filters ) {
    var filter = filters[filterName];
    filter.title = $.jalios.I18N.glp("plupload-filters." + filterName) + " (" + filter.extensions + ")";
  }
  
  var isReady = false;
  var ready = function(){
  
    // Must wait for all plupload stuff to init things
    if (isReady){ return; }
    isReady = true;
    
    // Register to other ajax-refresh
    $(document).on('jalios:refresh', function(event){
      var refresh = $.jalios.Event.match(event, 'refresh', 'after');
      if (!refresh){ return; }
      setup();
    });
    
    // Then setup plupload
    setup();
  };
  
  var setup = function() {
    // Add support for mime types not provide by default installation of Plupload
    // cf https://www.plupload.com/docs/v2/Frequently-Asked-Questions#cannot-select-file-format
    if (typeof(plupload) !== 'undefined' && plupload.mimeTypes) {
      plupload.mimeTypes['ico'] = 'image/x-icon';
      plupload.mimeTypes['webp'] = 'image/webp';
      plupload.mimeTypes['mpd'] = 'application/dash+xml';
      plupload.mimeTypes['m3u8'] = 'application/x-mpegurl';
      plupload.mimeTypes['ts'] = 'video/mp2t';
    }
    
    $('DIV.plupload').jcmsPlupload();
  };
  
  $.fn.jcmsPlupload = function() {
    this.each(function() {
      var $this = $(this);
      var clazz = $this.attr('class');

      // Already initialized
      if ($this.data('plupload')){ return; }
      if ($this.parent().closest('DIV.plupload').exists()){ return; }

      if (!$this.hasClass("plupload-single")) {
        $this.hide();
      }
      
      // General settings
      var config = {
        url : ajaxUrl,
        runtimes : runtimes,
        /*max_file_size : '2000mb',*/
        
        multipart : true,
        required_features: 'multipart',
        multipart_params: {},
        
        headers: {'X-Jcms-Plupload': 'true'},
        
        preinit: function(uploader) {
          uploader.bind('PostInit', $.proxy(bindPostInit, $this[0]));
        },
        
        init: function(uploader) { // Hook to bind functions
          $this.data('plupload', uploader); // Store plupload for later
          uploader.bind('FileUploaded', $.proxy(bindFileUploaded, $this[0]));
          uploader.bind('FilesAdded', $.proxy(bindFilesAdded, $this[0]));
          uploader.bind('FilesRemoved', $.proxy(bindFilesRemoved, $this[0]));

          // Trigger an event to update current element or uploader stored in data attribute 'plupload' during plupload initialization
          var event = $.Event('jalios:plupload');
          event.plupload = {};
          event.plupload.type = 'init';
          event.plupload.target = $this;
          $(document).trigger(event);
        },
        
        flash_swf_url : flashUrl,
        silverlight_xap_url : silverUrl
      };

      // Filter Media
      for ( filterName in filters ) {
        if ($this.hasClass('plupload-filter-' + filterName )) {
          config.filters = [ filters[filterName] ];
        }
      }
      
      // Single file
      if ($this.hasClass("plupload-single")) {
        config.multi_selection = false;
        config.max_file_count = 1;
      }
      
      // Resize Images
      var resize = clazz.match(/plupload-resize-(\d+)x(\d+)x(\d+)/);
      if (resize && resize.length > 1){ 
        config.resize = {width : resize[1], height : resize[2], quality : resize[3]};
      }
      
      // Set field name
      var field = clazz.match(/plupload-field-(\w+)/); // FIXME: Should be overrided by Widget
      if (field){ config.multipart_params.field = field[1]; }
      
      // Token Ajax
      var ajaxId = document.body.id ;// Do not wrap request !
      var token  = clazz.match(/plupload-token-(\w+)/);
      config.multipart_params.token = token || ajaxId;
      $this.closest('FORM').append('<input name="plupload-token" type="hidden" value="'+(token || ajaxId)+'"/>');
      
      // Find Plupload Submit
      $this.closest('FORM').find('.plupload-submit').on('click', autostart);
      
      // Build Plupload
      $this.pluploadQueue(config);
      $(".plupload_add", $this).prepend("<span class='jalios-icon plupload_add-icon'></span>");
      
      // Prevent to leave the page if there are files being uploaded
      $(window).on('beforeunload', function() {
        var pluploadData = $this.data('plupload');
        if (!pluploadData) {
          return;
        }
        $.console.log('Plupload state: ', pluploadData);
        var isUploading = pluploadData && pluploadData.state && plupload.STOPPED !== pluploadData.state;
        if(isUploading) {
          // If there is an upload in progress, notify the user to avoid leaving the page without confirmation.
          return 'Are you sure you want to leave?';
        }
        return;
      });
    });
  };
  
  var bindPostInit = function() {
    var $this = $(this);
    
    if (!$this.hasClass("plupload-single")) {
      if (!$this.is(':visible')) {
        $this.slideDown();
      }
    }

    if($this.hasClass("plupload-single") && $this.hasClass('plupload-multivalued')) {
      // Append the remove action
      $this.find('.plupload_filelist_footer .plupload_file_action').append('<a href="#" data-jalios-action="widget:clear" class="action-remove jalios-icon remove glyphicons-remove-2"></a>');
    }
  };
  
  // JCMS-6783 - disable title when multiple files selected
  var toggleTitleDisabledState = function($pluploadElm, up) {
    var disableTitle = up.files.length > 1;
    var $form = $pluploadElm.closest('form');
    $form.find('.widget-name-title').toggleClass('disabled', disableTitle);
    // JCMS-8347 - only disable text input (not hidden input)
    $form.find('input[name="title"][type="text"]').prop('disabled', disableTitle);
  };
  
  var bindFileUploaded = function(up, file, response){
    $(this).append('<input name="'+up.settings.multipart_params.field+'" type="hidden" value="MultipartUpload"/>');
  };
  
  var bindFilesAdded = function(up, files) {
    var $this = $(this);

    // Delete the excess files
    var max = up.settings.max_file_count;
    while(up.files.length > max) {
      if(up.files.length > max) {
        up.removeFile(up.files[max]);
      }
    }

    // Append the filename when it is a single file
    if (max == 1) { // Single File
      $.each(files, function (i, file) {
        var $fileListFooter = $this.find('.plupload_filelist_footer');
        var $filenameContainer = $fileListFooter.find('.plupload_filename');
        if($filenameContainer.length == 0) {
          $filenameContainer = $('<div class="plupload_filename"></div>').insertAfter($fileListFooter.find('.plupload_file_size')); 
        }
        $filenameContainer.html('<span>' + file.name + '</span>');
        
        // Display the remove action
        $fileListFooter.find('.plupload_file_action .action-remove').css('display', 'block');
      });
    }

    toggleTitleDisabledState($this, up);
    $('.plupload-submit').show();
  };
  
  var bindFilesRemoved = function(up, files) {
    var $this = $(this);
    
    // Remove the filename when it is a single file
    var max = up.settings.max_file_count;
    if (max == 1) {// Single File
      var $fileListFooter = $this.find('.plupload_filelist_footer');
      var $filenameContainer = $fileListFooter.find('.plupload_filename');
      $filenameContainer.remove();

      // Hide the remove action
      $fileListFooter.find('.plupload_file_action .action-remove').css('display', '');
    }

    toggleTitleDisabledState($this, up);
    if (up.files.length == 0) {
      $('.plupload-submit').hide();
    }
  };

  var autostart = function(event) {
    var trigger    = event.currentTarget;
    var $container = $(trigger).closest('FORM').find('DIV.plupload');
    $container.each(function() {
      var $this = $(this);
      var plupload = $this.data('plupload');

      if (!plupload) { return; } 
      
      // Bind complete
      if (!$this.data('p-init')) {
        $this.data('p-init', true);
        plupload.bind('UploadComplete', function(up, files) {
          if (up.total.queued == 0){
            $.jalios.DOM.follow(trigger);
          }
        });
      }
      
      // Start upload
      if (plupload.total.queued != 0) {
        plupload.start();
        event.preventDefault();
        event.stopPropagation();
        return false;
      }
    });
  };
  
  var refresh = function(event) {
    // Handle an Ajax-Refresh Serialize to remove input added  
    var refreshSerialize = jQuery.jalios.Event.match(event, 'refresh', 'serialize'); 
    if (refreshSerialize) { 
      $('#plupload-inline INPUT[name^="plupload-inline"]').remove();
      $('#plupload-inline INPUT[name="filename"]').remove();
    }
  };
  jQuery(document).on('jalios:refresh', refresh);

  
  // ------------------------------------------
  //  READY
  // ------------------------------------------
  
  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', ready);
  
}(window.jQuery);