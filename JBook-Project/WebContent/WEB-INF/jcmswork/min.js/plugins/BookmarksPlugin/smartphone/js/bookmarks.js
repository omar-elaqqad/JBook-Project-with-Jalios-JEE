!(function(b){var a=function(){b(document).on("tap",".js-bookmarks-action",function(d){d.preventDefault();d.stopPropagation();if(b(d.currentTarget).hasClass("is-bookmarked")){let message=b(d.currentTarget).data("jalios-action-bookmark-delete-message");c("opBookmarkDelete",message,d)}else{let message=b(d.currentTarget).data("jalios-action-bookmark-add-message");c("opBookmarkAdd",message,d)}});function c(f,e,d){b(d.currentTarget).toggleClass("is-bookmarked");let pubId=b(d.currentTarget).data("jalios-pubid");let actionUrl=b(d.currentTarget).data("jalios-action-url");b(".topbar-menu-dropdown ").popup("close");b.jalios.smartPhone.Toastr.show(e);let data={};data.dataId=pubId;data.changeTab="tabData";data[f]=true;b.ajax({method:"POST",url:actionUrl,data:data})}};b(document).ready(a)})(window.jQuery);