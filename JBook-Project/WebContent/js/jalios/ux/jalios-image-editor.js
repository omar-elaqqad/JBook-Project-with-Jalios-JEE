!function ($) {

  var zoom_defaults = {
    minZoom: 0.1,
    maxZoom: 1,
    initialZoom: 0.8,
    targetHeight: 0.3
  }
  var cropper_defaults = {
    viewMode: 0,
    preview: '.img-preview',
    responsive: true,
    aspectRatio: NaN,
    autoCropArea: 1.0,
    checkOrientation: true,
    crop: function(e) {
      $.console.log("No crop function declared in image editor");
    },
    zoom: function(e) {
      let resetZoom = null;
      if (e.ratio < zoom_defaults.minZoom) {
        resetZoom = zoom_defaults.minZoom;
      }
      else if (e.ratio > zoom_defaults.maxZoom) {
        resetZoom = zoom_defaults.maxZoom;
      }
      if (resetZoom != null) {
        e.preventDefault();
        $(this).cropper('zoomTo', resetZoom);
      }
    },
    cropResultWrapper: ".crop-results-wrapper"
  }
  
  // Register
  var setup = function(addedOptions){
    var $cropperWrapper = $(".cropper-wrapper");

    //Wait for images to be loaded
    $cropperWrapper.imagesLoaded(function(){
      var elementData = $('#cropImgArea').data();
      var options = $.extend({}, cropper_defaults, elementData);      

      var $resultWrapper = $(options.cropResultWrapper);
      
      var customOptions = {
        crop: function(e) {
          var cropData = $(e.target).data('cropper').getData(true);
          // Output the result data for cropping image.
          
          $resultWrapper.find('.image-editor-img-width').val(cropData.width);
          $resultWrapper.find('.image-editor-img-height').val(cropData.height);
          $resultWrapper.find('INPUT[name=x1]').val(cropData.x);
          $resultWrapper.find('INPUT[name=x2]').val(cropData.x + cropData.width);
          $resultWrapper.find('INPUT[name=y1]').val(cropData.y);
          $resultWrapper.find('INPUT[name=y2]').val(cropData.y + cropData.height);
          $resultWrapper.find('INPUT[name=scaleX]').val(cropData.scaleX);
          $resultWrapper.find('INPUT[name=scaleY]').val(cropData.scaleY);          
          $resultWrapper.find('INPUT[name=rotate]').val(cropData.rotate);
        },
        built: function () {

          const cropOptions = $(this).data('cropper').options;

          // Free Ratio - adjust zoom + cropping area
          if (typeof cropOptions.aspectRatio === 'number' && isNaN(cropOptions.aspectRatio)) {
            const canvasData = $(this).cropper('getCanvasData');
            const cropBoxData = $(this).cropper('getCropBoxData');

            // Zoom out a bit to give perspective and ease transformations
            $(this).cropper('zoomTo', zoom_defaults.initialZoom * $(".cropper-container").height() / (canvasData.naturalHeight+1));

            // Select the canvas area in full
            $(this).cropper('setCropBoxData', canvasData);
          }

          //store in cropped image
          const croppedCanvas = $(this).cropper('getCroppedCanvas');
          if (croppedCanvas != null) {
            $(this).data('jalios-cropped-image', croppedCanvas.toDataURL("image/jpeg"));
          }

          $(".image-editor-loader-wrapper").removeClass("in").addClass("hide");
        }
      }
      
      options = $.extend({}, options, customOptions);      
      options = $.extend({}, options, addedOptions); 
      
      $('#cropImgArea').cropper(options);
    });    

  }
  
  var handleCropperMethod = function(event) {
    var $this = $(this);
    var data = $this.data();
    if ($this.prop('disabled') || $this.hasClass('disabled')) {
      return;
    }
    
    var $croppedImage = $('#cropImgArea');
    
    if ($croppedImage.data('cropper') && data.jaliosCropperMethod) {
      data = $.extend({}, data); // Clone a new one

      if (typeof data.target !== 'undefined') {
        $target = $(data.target);

        if (typeof data.jaliosOption === 'undefined') {
          try {
            data.jaliosOption = JSON.parse($target.val());
          } catch (e) {
            $.console.log(e.message);
          }
        }
      }
      result = $croppedImage.cropper(data.jaliosCropperMethod, data.jaliosOption, data.jaliosOption2);
      
      switch (data.jaliosCropperMethod) {
      case 'scaleX':
      case 'scaleY':
        $(this).data('jalios-option', -data.jaliosOption);
        break;
      }
    }
  }
  
  var handleCropperInit = function(event) {
    var $this = $(this);
    var name = $this.attr('name');
    var type = $this.prop('type');
    var cropBoxData;
    var canvasData;
    var options = {
      aspectRatio: NaN
    };
    
    var $image = $('#cropImgArea');
    
    if (!$image.data('cropper')) {
      return;
    }

    if (type === 'checkbox') {
      options[name] = $this.prop('checked');
      cropBoxData = $image.cropper('getCropBoxData');
      canvasData = $image.cropper('getCanvasData');

      options.built = function () {
        $image.cropper('setCropBoxData', cropBoxData);
        $image.cropper('setCanvasData', canvasData);
      };
    } else if (type === 'radio') {
      options[name] = $this.val();
    }
    
    $(".image-editor-loader-wrapper").removeClass("hide").addClass("in");
    $image.cropper('destroy');
    setup(options);
  }
  
  var handleCreateNew = function(event) {
    var $target = $(event.target);
    
    var documentTitle = $target.data("jalios-image-title");
    var promptTitle = $target.data("jalios-prompt-title");
    $.jalios.ui.Modal.prompt(promptTitle , function(value){
      if (value === false){ 
        return; 
      }
      
      var $form = $target.closest("FORM");
      
      var input = $("<input>")
      .attr("type", "hidden")
      .attr("name", "opCropNew").val("true");
      var inputFilename = $("<input>")
      .attr("type", "hidden")
      .attr("name", "title").val(value);      

      $form.append($(input));
      $form.append($(inputFilename));
      $form.submit();
    }, documentTitle);
  }
  
  var handleAjaxRefreshInit = function(event) {
    var refresh = $.jalios.Event.match(event,'refresh','after')
    
    if (!refresh){ return; }
    
    setup();
  }
  
  // Plugin initialization on DOM ready
  var register = function() {
    $(".image-editor").on("click", "[data-jalios-cropper-method]", handleCropperMethod);
    $(".image-editor").on("change", "[name=aspectRatio]", handleCropperInit);
    $(".image-editor").on("click", ".create-new-image", handleCreateNew);
    $(document).on('jalios:refresh', handleAjaxRefreshInit);
    setup();
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
  
}(window.jQuery);