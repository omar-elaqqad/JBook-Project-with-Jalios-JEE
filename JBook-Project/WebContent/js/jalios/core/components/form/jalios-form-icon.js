!function ($) {

  const ICON_CHOOSER_MODAL_URL = "jcore/field/control/iconChooserModal.jsp";

  $.jalios.ui.icon = {
    updateIcon: function(domElementId, iconSrc) {
      $("#" + domElementId).val(iconSrc);
      $.ajax({
        url: "jcore/field/control/iconPreview.jsp",
        data: {
          iconPreviewValue: iconSrc
        }
      }).done(function(html) {
        $("#" + domElementId).closest(".jalios-input-group").find(".icon-preview").replaceWith(html);
      });
    }
  }

  $(document).ready(function () {
    $(document).on("click", ".icon-chooser-option", function(event) {
      const $trigger = $(event.currentTarget);
      const val = $trigger.data("jalios-icon-key");
      $(".icon-chooser-option.active").removeClass("active").attr("aria-selected", false);
      $trigger.addClass("active").attr("aria-selected", true);
      
      $trigger.closest(".icon-chooser-wrapper").find(".js-icon-chooser-value").val(val);
    })
    $(document).on("click", ".icon-chooser-actions .js-search-cancel", function(event) {
      const $trigger = $(event.currentTarget);
      $trigger.closest(".icon-chooser-search").find(".form-control").val("");
      $trigger.closest(".icon-chooser-search").find(".form-control").trigger("change");
    })
    $(document).on("click", ".open-choose-icon-modal", function(event) {
      const $trigger = $(event.currentTarget);
      const options = $trigger.data("jalios-icon-chooser-options");
      $.jalios.ui.Modal.openFromUrl(ICON_CHOOSER_MODAL_URL,{
        params: {
          iconPropPrefix: options.iconPropPrefix,
          domElementId: $trigger.closest(".jalios-input-group").find(".form-control").attr("id")
        }
      });
    });
  });
}(window.jQuery);