!(function ($) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  let lastFocusedElement;
  const focusableElementsString = "a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, *[tabindex], *[contenteditable]";

  //https://github.com/gdkraus/accessible-modal-dialog/blob/master/modal-window.js
  const register = function () {
    $(".topbar-menu").on("show.bs.dropdown", function (event) {
      lastFocusedElement = document.activeElement;
    });

    $(document).on("shown.bs.dropdown", function (event) {
      lastFocusedElement = document.activeElement;
      let $dropdown = $(event.target).closest(".dropdown-topbar").find(".dropdown-menu");
      let focusInformation = $.jalios.a11y.getFocusInformation($dropdown);
      let $focusableElements = focusInformation.$focusableElements;
      $($focusableElements[0]).focus();
      $(focusInformation.lastFocusableElement).on('keydown.bs.modal', function (ev) {
          if (ev.keyCode === 9 && !(ev.shiftKey | ev.ctrlKey | ev.metaKey | ev.altKey)) { // TAB pressed
              ev.preventDefault();
              focusInformation.firstFocusableElement.focus();
          }
      });
      $(focusInformation.firstFocusableElement).on('keydown.bs.modal', function (ev) {
          if (ev.keyCode === 9 && ev.shiftKey) { // SHIFT-TAB pressed
              ev.preventDefault();
              $(focusInformation.lastFocusableElement).focus();
          }
      });
    });
  }

  $(document).ready(function () {
    register();
  });

})(jQuery, window, document);