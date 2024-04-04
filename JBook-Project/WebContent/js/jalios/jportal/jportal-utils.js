!(function ($) {

  //Namespace
  if (!$.jalios) {
    $.jalios = {};
  };

  if (!$.jalios.jportal) {
    $.jalios.jportal = {};
  };

  if (!$.jalios.jportal.utils) {
    $.jalios.jportal.utils = {};
  };

  $.jalios.jportal.utils = {
    getJPortalId: function() {
      return $(".jportal-wrapper").data("jportal-id");
    },
    
    refreshJPortalCSS: function() {
      $.ajax({
        url: "jcore/jportal/action/jportalCSS.jsp?jportal=" + $.jalios.jportal.utils.getJPortalId(),
      }).done(function( data ) {
        $("style[data-jalios-jportal-style]").html(data);
      });
    }
  }


  $(document).ready(function () {
    $(document).on("jalios:refresh", function(event){
        if (event.refresh.type === "before" && event.refresh.url == "jcore/portal/ajaxPortal.jsp") {
          event.refresh.options.params.Portal = $.jalios.jportal.utils.getJPortalId();
          if($(event.refresh.target).closest(".jportal-wrapper").exists()){
            event.refresh.options.params.refreshJPortalPortlet = true;
          }
        }
    });
  });

  
})(window.jQuery);
