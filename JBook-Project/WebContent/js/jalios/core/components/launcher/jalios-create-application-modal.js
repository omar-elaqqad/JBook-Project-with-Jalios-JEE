(function($, window, document, undefined) {
  
  const register = function() {
    $(document).on("change", ".js-choose-link-type", function(event){
	  updateState();
    });
    updateState();
  }
	
  const handleModalRefresh = function(event) {
    if (event.refresh.type !== "after") {
      return;
    }

    let $target = $(event.refresh.target);
    if ($target.hasClass("create-application-modal")) {
	  register();
	}
  };

  const updateState = function() {
	  let $input = $(".js-choose-link-type");
	  let val = $input.val();
	  if (val === "custom") {
	    $(".widget-name-pub").addClass("hide");
	    $(".widget-name-pub").find("input[type=text]").val("");
	    $(".widget-name-link").removeClass("hide");
	  } else if (val === "pub") {
	    $(".widget-name-pub").removeClass("hide");
	    $(".widget-name-link").addClass("hide");
	    $(".widget-name-link").find("input[type=text]").val("");
	  }
  }
  
  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).on('jalios:ready', function() {
    register();
    
    $(document).on("jalios:refresh", handleModalRefresh);
  });

})(jQuery, window, document);