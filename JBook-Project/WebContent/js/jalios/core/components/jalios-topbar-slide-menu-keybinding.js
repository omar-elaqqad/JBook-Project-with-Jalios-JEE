! function ($) {

  var enableKeysOnDropdown = function (event) {
    var $activeMenu = $(".dropdown-topbar.open");
    if (!$activeMenu.exists()) {
      return;
    }

    var focused = document.activeElement;

    if ($(focused).hasClass("web-alert-input")) {
      return;
    }

    var $activeItem = $activeMenu.find(".list-group.is-active:not('.is-parent') .list-group-item.active:not('.slide-menu-search-input')");
    var $activeFolder = $activeMenu.find(".list-group.is-active:not('.is-parent')");

    switch (event.keyCode) {
      case 13: // enter
        if ($(event.target).is("INPUT") || $(event.target).is(".js-skip-slide-menu-keybind")) {
          break;
        }
        event.preventDefault ? event.preventDefault() : event.returnValue = false;
        if ($activeItem.exists()) {
          $activeItem[0].click();
        } else if ($(event.target).closest(".topbar-menu").exists()){
          //Focused element
          $(event.target).click();
        }
        return false;
        break;
      case 27: // escape
        $(".dropdown-topbar.open").removeClass("open");
        var $sidebarBackdrop = $(".dropdown-overlay-backdrop");
        $sidebarBackdrop.removeClass("in");
        $sidebarBackdrop.one($.support.transition.end, function () {
          $sidebarBackdrop.removeClass("full");
        });
        $("BODY").removeClass("has-overlay");

        break;
      case 37: // left arrow
        if ($activeFolder.is(".child-menu")) {
          $activeFolder.find(".list-group-item.back").click();
        }
        break;
      case 38: // up arrow
        event.preventDefault ? event.preventDefault() : event.returnValue = false;

        if ($activeItem.exists()) {
          $activeItem.removeClass("active");
          if ($activeItem.prev(".list-group-item").exists()) {
            $activeItem.prev().addClass("active");
          } else {
            $activeMenu.find(".list-group.is-active:not('.is-parent') .list-group-item:last-child:not('.slide-menu-search-input')").addClass("active");
          }
        } else {
          $activeMenu.find(".list-group.is-active:not('.is-parent') .list-group-item:last-child:not('.slide-menu-search-input')").addClass("active");
        }
        break;
      case 39: //right arrow
        if ($activeItem.hasClass("has-child")) {
          $activeItem[0].click();
        }
        break;
      case 40: // down arrow
        event.preventDefault ? event.preventDefault() : event.returnValue = false;

        if ($activeItem.exists()) {
          $activeItem.removeClass("active");
          if ($activeItem.next(".list-group-item").exists()) {
            $activeItem.next().addClass("active");
          } else {
            $activeMenu.find(".list-group.is-active:not('.is-parent') .list-group-item:first-child:not('.slide-menu-search-input')").addClass("active");
          }
        } else {
          $activeMenu.find(".list-group.is-active:not('.is-parent') .list-group-item:first-child:not('.slide-menu-search-input')").addClass("active");
        }
        break;
    }
    event.stopPropagation()
  }


  $(document).ready(function () {
    $(document).on('keyup', enableKeysOnDropdown);
  });

}(window.jQuery);