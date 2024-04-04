!(function ($) {

  const copyMessage = function () {
    copy(".btn-public-link-copy .content-to-copy .message");
  }

  const copyLink = function () {
    copy(".btn-public-link-copy .content-to-copy .link");
  }

  const copyUrl = function () {
    copy(".btn-public-link-copy .content-to-copy .url");
  }
  

  const copy = function (content) {
    var content = document.querySelector(content);
    
    var range = document.createRange();
    range.selectNode(content);
    window.getSelection().removeAllRanges();
    window.getSelection().addRange(range);
    document.execCommand("copy");
    window.getSelection().removeAllRanges();
    
    
    if (toastr) {
      toastr.options = {
        positionClass: "toast-top-center"
      };

      toastr.info($(content).data("jalios-toastr-text"));
    }
  }
  
  const init = function () {
    
    $(".btn-public-link-copy .copy-message").off("click", copyMessage);
    $(".btn-public-link-copy .copy-link").off("click", copyLink);
    $(".btn-public-link-copy .copy-url").off("click", copyUrl);
    
    $(".btn-public-link-copy .copy-message").on("click", copyMessage);
    $(".btn-public-link-copy .copy-link").on("click", copyLink);
    $(".btn-public-link-copy .copy-url").on("click", copyUrl);
  }

  const register = function () {
    init();
    $(document).on("jalios:refresh", init);
  }

  $(document).on("jalios:ready", register);

})(window.jQuery);