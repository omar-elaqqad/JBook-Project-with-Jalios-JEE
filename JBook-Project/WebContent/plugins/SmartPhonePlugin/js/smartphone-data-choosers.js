/**
 * $.jalios.smartPhone.DataChooser : Provides base code for both data choosers (members, groups, publications, categories, ...) and mentions (in wiki areas)
 * lines 108+: Handles data choosers
 */
!(function($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  // ===================================================
  //  $.jalios.smartPhone (DataChooser) : public methods
  // ===================================================

  $.jalios.smartPhone.DataChooser = {
    createChooser: function(additionalCssClasses, initialValue) {
      var urls = {
        member: "plugins/SmartPhonePlugin/jsp/action/chooser/acMember.jsp",
        group: "plugins/SmartPhonePlugin/jsp/action/chooser/acGroup.jsp",
        publication:
          "plugins/SmartPhonePlugin/jsp/action/chooser/acPublication.jsp",
        category: "plugins/SmartPhonePlugin/jsp/action/chooser/acCategory.jsp",
        workspace: "plugins/SmartPhonePlugin/jsp/action/chooser/acWorkspace.jsp"
      };

      var scrollingTouch = $(".ui-page-active").is('.scrolling-touch');

      var ajaxTimeout = false;

      if (typeof additionalCssClasses !== "string") {
        additionalCssClasses = "";
      } else {
        additionalCssClasses = " " + additionalCssClasses;
      }

      if (typeof initialValue !== "string") {
        initialValue = "";
      }

      $(".ui-page-active").append(
        "" +
          '<form class="chooser-form' +
          additionalCssClasses +
          '" autocomplete="off">' +
          '  <div class="chooser">' +
          '    <div class="chooser-input-wrapper">' +
          '      <input name="q" class="chooser-input" data-role="none">' +
          '      <a href="#" class="chooser-close ui-input-clear ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all" title="Clear text">Clear text</a>' +
          "    </div>" +
          '    <div class="chooser-results-wrapper">' +
          '      <ul class="chooser-results ui-listview ui-listview-full-abstract ui-listview-full ui-listview-enhanced" data-enhance="false" data-role="listview"></ul>' +
          "    </div>" +
          "  </div>" +
          "</form>"
      );

      // Lock scrolling on body
      $("BODY").on("scroll touchmove mousewheel", function(e) {
        // Allow scrolling in results
        if ($(e.target).closest(".chooser-results").length > 0) {
          return;
        }
        e.preventDefault();
        e.stopPropagation();
        return false;
      });
      $("BODY").css("overflow", "hidden");


      $(".chooser-input")
        .focus()
        .val(initialValue); // we need to reset the value after focus to move caret at the end

      //disable the scrolling touch to avoid overlappings
      if (scrollingTouch) {
        $(".ui-page-active").removeClass("scrolling-touch");
      }

      // Handle autocomplete changes
      $(".chooser-input").on("input propertychange", function(e) {
        var form = $(e.target).closest("FORM");
        var params = $.jalios.smartPhone.Ajax.resolveParams(undefined, form);
        var processAjaxData = true;
        if (params instanceof FormData) {
          processAjaxData = false;
        }

        $(".ui-loader").loader("show");

        if (ajaxTimeout) clearTimeout(ajaxTimeout);
        ajaxTimeout = setTimeout(function() {
          $.ajax(urls[form.data("chooser-type")], {
            data: params,
            processData: processAjaxData,
            contentType: $.jalios.smartPhone.Ajax.resolveAjaxRefreshContentType(
              processAjaxData
            ),
            type: $.jalios.smartPhone.Ajax.resolveMethod(undefined, form),
            success: function(data) {
              $(".chooser-results")
                .empty()
                .append(data);
              $(".ui-loader").loader("hide");
            },
            error: function() {
              $(".chooser-results").empty();
              $(".ui-loader").loader("hide");
            }
          });
          ajaxTimeout = false;
        }, 250);
      });
    },

    desactivateChooser: function() {
      // Desactivate chooser
      $(".chooser-form").remove();
      // Unlock scroll on body
      $("BODY").off("scroll touchmove mousewheel");
      $("BODY").css("overflow", "");

      if (typeof scrollingTouch !== 'undefined') {
        $(".ui-page-active").addClass("scrolling-touch");
      }

    }
  };

  // ==========================
  // Initialization of choosers
  // ==========================

  /**
   * Initializes behavior for JCMS choosers (members, group, publication, workspaces, ...)
   */
  $(function() {
    /**
     * @param inputWrapper The jquery wrapper of the chooser -- $('.input-with-chooser-wrapper')
     */
    var emptyChooser = function(inputWrapper) {
      inputWrapper.find(".choosen-selected-id").val("");
      inputWrapper.find(".input-with-chooser").val("");
      inputWrapper.find(".ui-input-clear").remove();
      inputWrapper.find(".ui-input-text").removeClass("ui-input-has-clear");
    };

    $(document).on("click", ".input-with-chooser", function(e) {
      e.stopPropagation();

      // Create the chooser itself
      $.jalios.smartPhone.DataChooser.createChooser("autocomplete-chooser");

      // Fetching data from the input "caller": input itself, to copy them on the "chooser" form

      var callerInput = $(e.target); // The INPUT that was used to instanciate this chooser (on which the user tapped)
      var chooserForm = $(".chooser-form");
      chooserForm.data("caller-input", callerInput);
      // Fetching data from the input "caller": chooser type
      chooserForm.data("chooser-type", callerInput.data("chooser-type"));
      // Fetching data from the input "caller": data-jalios-ac-options as hidden form params
      var jaliosAcOptions = callerInput.data("jalios-ac-options");
      var jaliosAcOptionsArray;
      if (jaliosAcOptions) {
        jaliosAcOptionsArray = jaliosAcOptions.replace(/\?/, "").split("&");
        $.each(jaliosAcOptionsArray, function(i, arr) {
          arr = arr.split("=");
          chooserForm.append(
            '<input type="hidden" name="' +
              arr[0] +
              '" value="' +
              arr[1] +
              '" />'
          );
        });
      }
    });

    // Handle chooser desactivation on click on close button
    $(document).on(
      "click",
      ".autocomplete-chooser .chooser-close",
      $.jalios.smartPhone.DataChooser.desactivateChooser
    );

    // Handle clicked element fetching + chooser desactivation, on click on a result
    $(document).on("click", ".autocomplete-chooser .chooser-result", function(
      e
    ) {
      var callerInput = $(".chooser-form").data("caller-input");
      var callerInputWrapper = callerInput.closest(
        ".input-with-chooser-wrapper"
      );
      callerInputWrapper.find(".input-with-chooser").val(
        $(e.target)
          .closest(".chooser-result")
          .data("jalios-chooser-label")
      );
      callerInputWrapper.find(".choosen-selected-id").val(
        $(e.target)
          .closest(".chooser-result")
          .data("jalios-chooser-dataid")
      );

      $.jalios.smartPhone.DataChooser.desactivateChooser();

      // If not present, add a "X" (clear / remove)
      if (!callerInput.parent().hasClass("ui-input-has-clear")) {
        callerInput.after(
          '<a href="#" tabindex="-1" aria-hidden="true" class="ui-input-clear ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all" title="Clear text">Clear text</a>'
        );
        callerInput.parent().addClass("ui-input-has-clear");
      }

      // For multivalued fields, create the next one
      var inputGroup = callerInput.closest(".jalios-input-group");
      if (
        callerInput.closest(".multivalued").length !== 0 &&
        inputGroup.is(":last-child")
      ) {
        // is multivalued AND is last child
        var clone = inputGroup.clone();
        emptyChooser(clone.find(".input-with-chooser-wrapper"));
        inputGroup.after(clone);
      }
    });

    // Click on "X" empties both the hidden "id" field and the visible text
    $(document).on(
      "click",
      ".input-with-chooser-wrapper .ui-input-clear",
      function(e) {
        var inputGroup = $(e.target).closest(".jalios-input-group");

        if (inputGroup.is(":last-child")) {
          emptyChooser($(e.target).closest(".input-with-chooser-wrapper"));
        } else {
          inputGroup.remove();
        }
      }
    );
  });
})(window.jQuery);
