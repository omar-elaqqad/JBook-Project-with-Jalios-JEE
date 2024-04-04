/**
 * -----------------------------------------------------------------
 *
 *  This file is used in the edition page of a Publication to switch image and description of templates
 *  See work/doEditCommonTemplates.jsp
 * -----------------------------------------------------------------
 */ 

!function ($) {

  var register = function(){
    $(document).on("change", ".template-wrapper .template-chooser" ,function() {
      //Retrieve selected value
      var jspPath = $("option:selected", this).data("jalios-path");
      var selectValue = $("option:selected", this).val();
      selectValue = "." + selectValue.replace('.','\\.');
      
      var $wrapper = $(this).closest(".template-wrapper");
      
      //Replace image 
      var jpgPath = jspPath.replace('.jsp', '.png');
      $(".template-image", $wrapper).attr("src", jpgPath);
      
      $(".template-image", $wrapper)
      .one('error', function() { 
          var jpgPath = jspPath.replace('.jsp', '.jpg');
          $(".template-image", $wrapper).attr("src", jpgPath);
      })
      
      $(".ttPath", $wrapper).html(jspPath);
      
      //Replace description
      $(".template-description-item", $wrapper).hide();
      $(selectValue, $wrapper).show();
    });
    
    //Handle missing image of a template
    $(".template-wrapper .template-image").error(function() {
      $(this).attr("src","images/jalios/layout/bg/thumbnailBroken.gif");
    });    
    
  }
    
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);