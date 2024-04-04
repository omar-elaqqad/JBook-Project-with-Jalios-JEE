!function ($) {

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  // Namespace
  if (!$.jalios.Utils) {
    $.jalios.Utils = {};
  }

  // Namespace
  if (!$.jalios.Utils.formdata) {
    $.jalios.Utils.formdata = {};
  }
  $.jalios.Utils.formdata = {
    getFormData: function (selector) {
      var formData = new FormData($(selector).get(0));
      return formData;
    },
    getFormDataAsJsonObject: function (formData) {
      var object = {};
      formData.forEach(function (value, key) {
        object[key] = value;
      });
      return object;
    }
  }
}(window.jQuery);