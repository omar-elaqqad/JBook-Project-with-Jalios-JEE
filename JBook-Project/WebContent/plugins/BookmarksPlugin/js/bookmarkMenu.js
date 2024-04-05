!function($) {
	var bookmarkSelectFolderCallBack = function(event){
		if(event.target.value == "new-folder"){
	      $(".bookmark-new-folder").slideDown("fast");
		}else{
	      $(".bookmark-new-folder").slideUp("fast");
		}
	}
	
	var register = function() {
	  $(document).on("change",".bookmark-select-folder", bookmarkSelectFolderCallBack);
	}		
	// ------------------------------------------
	// DOM READY CODE
	// ------------------------------------------
	$(document).ready(function($) {
		register();
	});
}(window.jQuery);