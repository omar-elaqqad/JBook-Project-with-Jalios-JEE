!(function($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  function removeToastr() {
    $(".smartphone-toastr").animate({ "max-height": "0px" }, 500, function() {
      $(".smartphone-toastr .toastr-message").text("");
    });
  }

  let timeout = undefined;
  $.jalios.smartPhone.Toastr = {
    show: function(message) {
      if (timeout) clearTimeout(timeout);

      $(".smartphone-toastr .toastr-message").text(message);
      $(".smartphone-toastr").animate({ "max-height": "100vh" }, 500);
      timeout = setTimeout(removeToastr, 1000);
    }
  };
})(window.jQuery);
