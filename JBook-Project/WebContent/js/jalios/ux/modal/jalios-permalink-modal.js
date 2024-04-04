!(function ($) {

  const copy = function () {
    var copyText = document.querySelector(".permalink-modal .js-share-url");
    copyText.select();
    document.execCommand("copy");
    if (toastr) {
      toastr.options = {
        positionClass: "toast-top-center"
      };

      toastr.info($(".permalink-modal .btn-copy-link").data("jalios-toastr-label"));
    }
    $.jalios.ui.Modal.close(false);
  }

  const register = function () {
    //Using native binding instead of jquery since security concerns are not handled when using
    // jquery event binding (See https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Interact_with_the_clipboard)
    document.querySelector(".permalink-modal .btn-copy-link").addEventListener("click", copy);
    
    jQuery('.permalink-modal .js-share-url').select();
  }

  $(document).on('jalios:ready', register);

})(window.jQuery);
