!function($) {
	var checkboxCallBack = function(event){
		var countCheckbox = 0;
		$(".bookmark-list-view .table-bookmarks .bookmarks-checkbox:checkbox:checked").each(function(){
			countCheckbox++;
		});

		$(".bookmark-item-action").each(function(){
			if(countCheckbox > 0){
				$(this).removeClass("bookmark-action-disabled");
				$(this).parent().removeClass("disabled");
			}else{
				$(this).addClass("bookmark-action-disabled");
				$(this).parent().addClass("disabled");
			}
		});
	}

	var checkboxAllCallBack = function(event){
		var isChecked = $(".table-bookmarks .bookmarks-checkbox-all").first().is(":checked");
		$(".bookmark-list-view .table-bookmarks .bookmarks-checkbox:checkbox").each(function(){
			$(this).prop("checked",isChecked);
		});
		checkboxCallBack(event);

	}
	
	

	var bookmarkActionCallBack = function(event) {
		if($(this).hasClass("bookmark-action-disabled")){
			return false;
		}
		var $elm = $(event.currentTarget);
		var jsp = $elm.prop("href");

		$(".bookmark-list-view .table-bookmarks .bookmarks-checkbox:checkbox:checked").each(function(){
			jsp += "&itemIds="+this.value;
		});
		$.jalios.ui.Modal.openFromUrl(jsp);
	}

	var setupSortableAndTouchDevice = function(event) {
		// Draggable
		$(".bookmark-draggable-item").draggable({
			opacity: .50,
			helper: "clone",
			refreshPositions: true,
			revert: "invalid",
			revertDuration: 0,
			scroll: true,
			delay: 0,
			cursor: 'move'
		});

		//Droppable
		$(".bookmark-droppable").each(function () {

			$(this).droppable({
				tolerance : "pointer",
				hoverClass: "bookmark-droppable-target",
				drop: function (e, ui) {

					var bookmarkCurrentFolderId = $(ui.draggable).data("jalios-bookmark-folder_id");
					var bookmarkDataId = $(ui.draggable).data("jalios-bookmark-id");

					if($(e.target).hasClass("bookmark-separator")){
						var itemIndex = $(e.target).data("jalios-item-index");
						var jsp = "plugins/BookmarksPlugin/jsp/processAction.jsp?opReorder=true&itemIndex="+itemIndex+"&dataId="+bookmarkDataId;
						$.ajax({
							url : jsp, 
							type : 'POST',
							success : function(result){
								$('.bookmark-menu.slide-wrapper').refresh();
								$('.bookmark-list-view').refresh({params:{"bookmarkFolderId":bookmarkCurrentFolderId}});
							}
						});
					}else{
						var bookmarkTargetId = $(e.target).data("jalios-bookmark-id");
						var jsp = "plugins/BookmarksPlugin/jsp/processAction.jsp?opBookmarkFolderDrop=true&bookmarkFolderIdTarget="+bookmarkTargetId+"&dataId="+bookmarkDataId+"&bookmarkFolderId="+bookmarkCurrentFolderId;
						$.ajax({
							url : jsp, 
							type : 'POST',
							success : function(result){
								$('.bookmark-menu.slide-wrapper').refresh();
								$('.bookmark-list-view').refresh({params:{"bookmarkFolderId":bookmarkCurrentFolderId}});
							}
						});
					}
				}
			});
		});


		var msTouchEnabled = window.navigator.msMaxTouchPoints;
		var generalTouchEnabled = "ontouchstart" in document.createElement("div");

		if (msTouchEnabled || generalTouchEnabled) {
			$(".bookmark-actions").addClass("bookmark-sortable-item-touch-device");
			$(".table-bookmarks").removeClass("table-hover");
		}
	}
	
	/**
	 * Refresh bookmarks menu after a delete on bookmarks full display
	 */
	var refreshFullDisplay = function(){
		$(document).on('jalios:refresh', function(event) { 
		      
		    var refresh = $.jalios.Event.match(event,'refresh','after') 
		     
		    if (!refresh){ return; }
		     
		    var $container = event.refresh.target;
		    
		    if($container.hasClass('bookmarks-full-display') && event.refresh.options && event.refresh.options.params 
		      && (event.refresh.options.params.opBookmarkDelete === 'true' || event.refresh.options.params.opBookmarkFolderDelete === 'true')) {
		      $('.bookmark-menu').refresh();
		    }
		    
		    if ($container.hasClass('.sidebar-bookmarks')) {
					$container.find('.bookmark-breadcrumb ul  li:first').focus();
				}
		    
		    return; 
		  });
	}

	var register = function() {
		$(document).on("change",".bookmarks-checkbox-all", checkboxAllCallBack);

		$(document).on("change",".bookmarks-checkbox", checkboxCallBack);

		$(document).on("click", ".bookmark-list-view .bookmark-item-action", bookmarkActionCallBack);
	
		$(document).on("jalios:refresh", function(event){
			var refresh = $.jalios.Event.match(event, "refresh", "after");
			if (!refresh){ return; }
			var $container = event.refresh.target;

			if(!$container.hasClass("bookmark-menu") && !$container.hasClass("app-bookmark-body") && !$container.hasClass("PortletWorkspaceBookmarks")){
				return;
			}
			setupSortableAndTouchDevice();
		});
		
		refreshFullDisplay();
		setupSortableAndTouchDevice();
	}		

	// ------------------------------------------	
	// DOM READY CODE
	// ------------------------------------------

	$(document).ready(function($) {
		register();
	});


}(window.jQuery);