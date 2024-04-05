/**
 * Form related methods
 */
!(function($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  // ==========================================
  //  $.jalios.smartPhone (Forms)
  // ==========================================

  $.jalios.smartPhone.Forms = {
    dataURLtoFile: function(dataurl, filename) {
      var arr = dataurl.split(","),
        mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]),
        n = bstr.length,
        u8arr = new Uint8Array(n);
      while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
      }
      return new File([u8arr], filename, { type: mime });
    },

    /**
     * Gets a FormData object from an HTML Form object. The purpose of this method is
     * to replace <input type="file">'s normal data with the reduced version of image, if any
     *
     * @param form The HTML form from which the FormData should be created
     */
    getFormData: function(form) {
      if (!window.FileReader) {
        // Filereader not supported
        return new FormData(form);
      }

      var formData = new FormData();
      $(form)
        .find(":input")
        .each(function(unusedParam, element) {
          if (
            $(element).attr("type") === "button" ||
            $(element).attr("type") === "submit"
          ) {
            return;
          } else if ($(element).attr("type") === "file") {
            if ($(element).data("image-data-content")) {
              formData.append(
                $(element).attr("name"),
                $(element).data("image-data-content"),
                $(element).data("image-data-filename")
              );
              formData.append("resized", "true");
            } else {
              // Not an image
              formData.append($(element).attr("name"), element.files[0]);
            }
          } else {
            var isCheckbox = $(element).attr("type") === "checkbox";
            var isRadio = $(element).attr("type") === "radio";

            var appendCommonInput =
              ((isCheckbox || isRadio) && $(element).is(":checked")) ||
              (!isCheckbox && !isRadio);

            if (appendCommonInput) {
              formData.append($(element).attr("name"), $(element).val());
            }
          }
        });

      var fileData = $(form).data("jalios-form-file");
      if (fileData) {
        formData.append("documents", fileData);
      }
      return formData;
    },

    /**
     * Changes one or more date+time widgets into date widgets
     * @param $element A jQuery object, or set of objects
     */
    changeToDate: function($element) {
      $element.each(function(index, element) {
        var dateWidgets = $element.find(".dateChooser-wrapper");
        var timeWidgets = $element.find(".timeChooser-wrapper");
        var dateTime = $element.find(".dateTime");

        $(element)
          .find(".date-time-wrapper")
          .removeClass("ui-grid-a");
        dateTime.val($element.find(".dateChooser").val()); // Now we're date only, take the date part
        dateWidgets.removeClass("ui-block-a");
        timeWidgets
          .addClass("timeChooser-wrapper-hidden")
          .removeClass("ui-block-b");
      });
    },

    /**
     * Changes one or more date widgets into date+time widgets
     * @param $element A jQuery object, or set of objects
     */
    changeToDateTime: function($element) {
      $element.each(function(index, element) {
        var dateWidgets = $element.find(".dateChooser-wrapper");
        var timeWidgets = $element.find(".timeChooser-wrapper");
        var dateTime = $element.find(".dateTime");

        $(element)
          .find(".date-time-wrapper")
          .addClass("ui-grid-a");
        dateWidgets.addClass("ui-block-a");
        timeWidgets.val(""); // Reset time
        dateTime.val(""); // Reset the date+time, because user must select time
        timeWidgets
          .removeClass("timeChooser-wrapper-hidden")
          .addClass("ui-block-b");
      });
    }
  };
})(window.jQuery);
