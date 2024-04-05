! function ($) {
	
	// ------------------------------------------	
	// Private functions
	// ------------------------------------------
	
	const addJaliosRefreshHandler = function () {
		$(document).on("jalios:refresh", function (event) {
			var $container = event.refresh.target;
			if ($container.hasClass("sidebar-bookmarks") && event.refresh.type === "after") {
				$container.find(".breadcrumb li:first a").focus();
			}
		});
	}
	
	const register = function () {
		addJaliosRefreshHandler();
	};
	
	// ------------------------------------------	
	// DOM READY CODE
	// ------------------------------------------

	$(document).ready(function($) {
		register();
	});
	
} (window.jQuery);