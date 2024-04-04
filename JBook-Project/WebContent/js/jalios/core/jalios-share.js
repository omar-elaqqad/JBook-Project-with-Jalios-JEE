!(function ($) {

  const copy = function () {
    var link = document.querySelector(".share-link");

    // Select the text field
    // See https://www.w3schools.com/howto/howto_js_copy_clipboard.asp
    link.select();
    link.setSelectionRange(0, 99999); // For mobile devices

    // Copy to clipboard
    navigator.clipboard.writeText(link.value);
    
    if (toastr) {
      toastr.options = {
        positionClass: "toast-top-center"
      };

      toastr.info($(".share-modal .btn-copy-link").data("jalios-toastr-text"));
    }
  }

  const init = function () {
    var btn = document.querySelector(".share-modal .btn-copy-link");
    if (btn) {
      btn.addEventListener("click", copy);
    }
  }
  
  const register = function () {
    init();
    $(document).on("jalios:refresh", init);
  }

  $(document).ready(register);


})(window.jQuery);
