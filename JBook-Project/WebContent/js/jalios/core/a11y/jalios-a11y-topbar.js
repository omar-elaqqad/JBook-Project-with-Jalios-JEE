!(function ($) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  let lastFocusedElement;
  const bindKeyboardEvents = function (event, $dropdown) {
    let focusInformation = $.jalios.a11y.getFocusInformation($dropdown);

    let $slideWrapper = $dropdown.find(".slide-wrapper");

    if ($slideWrapper.exists() && !$slideWrapper.hasClass("keyboard-initialized")) {
      $slideWrapper.on("jalios.topbar.slidemenu.transition.end jalios.topbar.slidemenu.backToMainMenu", function (event) {
        $(document).off('keydown.jalios.topbar.dropdown');
        $slideWrapper.addClass("keyboard-initialized");
        $(focusInformation.firstFocusableElement).focus();
        bindKeyboardEvents(event, $dropdown);
      });
    }

    $(focusInformation.lastFocusableElement).on('keydown.jalios.topbar.dropdown', function (keydownEvent) {
      if (keydownEvent.keyCode === 9 && !(keydownEvent.shiftKey | keydownEvent.ctrlKey | keydownEvent.metaKey | keydownEvent.altKey)) { // TAB pressed
        keydownEvent.preventDefault();
        focusInformation.firstFocusableElement.focus();
      }
    });
    $(focusInformation.firstFocusableElement).on('keydown.jalios.topbar.dropdown', function (keydownEvent) {
      if (keydownEvent.keyCode === 9 && keydownEvent.shiftKey) { // SHIFT-TAB pressed
        keydownEvent.preventDefault();
        $(focusInformation.lastFocusableElement).focus();
      }
    });
  }

  //https://github.com/gdkraus/accessible-modal-dialog/blob/master/modal-window.js
  const register = function () {
    $(document).on("shown.bs.dropdown", function (event) {
      lastFocusedElement = document.activeElement;
      let $dropdown = $(event.target).closest(".dropdown-topbar").find(".dropdown-menu");
      // If element has lazy loading elements, bind focus only after ajax / app loading
      if ($dropdown.closest(".topbar-application-launcher").exists()) {
        $(document).on("jalios.application-launcher", function (event) {
          if (event.applicationLauncher.name === "renderComplete") {
            bindKeyboardEvents(event, $dropdown);
          }
        });
      } else if ($dropdown.closest("[data-jalios-dropdown-topbar-lazy-url]").exists()) {
        $(document).on("jalios:topbar-dropdown", function (event) {
          bindKeyboardEvents(event, $dropdown);
        });
      } else {
        bindKeyboardEvents(event, $dropdown);
      }
    });

    $(document).on("hide.bs.dropdown", function (event) {
      $(document).off('keydown.jalios.topbar.dropdown');
      $(lastFocusedElement).focus();
      lastFocusedElement = undefined;
    });
  }

  $(document).ready(function () {
    register();
  });

})(jQuery, window, document);