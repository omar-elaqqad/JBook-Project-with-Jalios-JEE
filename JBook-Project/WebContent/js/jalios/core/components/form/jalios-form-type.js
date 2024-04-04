!function ($) {

  const formatState = function (state) {
    if (!state.id) {
      return state.text;
    }
    if (!document.getElementById("hdb-form-type")) {
      return state.text;
    }
    var source = document.getElementById("hdb-form-type").innerHTML;
    var template = Handlebars.compile(source);
    var imgHtml = $(state.element).data("jalios-icon");
    var state = template({
      state: state,
      imgHtml: imgHtml
    });
    return $(state); // Return jquery object in order to avoid select2 html escape
  };

  const formatSelected = function (state) {
    if (!state.id) {
      return state.text;
    }
    if (!document.getElementById("hdb-form-type-selected")) {
      return state.text;
    }

    var source = document.getElementById("hdb-form-type-selected").innerHTML;
    var template = Handlebars.compile(source);
    var imgHtml = $(state.element).data("jalios-icon");
    var state = template({
      state: state,
      imgHtml: imgHtml
    });
    return $(state); // Return jquery object in order to avoid select2 html escape
  };

  const SELECT2_TYPE_DEFAULT_OPTS = {
    theme: "bootstrap field-type",
    templateResult: formatState,
    templateSelection: formatSelected,
    minimumResultsForSearch: 4,
    language: document.documentElement.lang
  };

  const initTypeInputs = function () {
    $(".select2-type").each(function (idx, element) {
      let $element = $(element);
      
      if ($element.closest(".js-select2-disabled").exists()) {
        return;
      }
      
      let options = $.extend({}, SELECT2_TYPE_DEFAULT_OPTS, $element.data("jalios-select2-options"));
      $element.css("visibility", "hidden");
      $element.select2(options);
      $element.on('select2:select', function (event) {
        $element.closest(".input-group").find(".input-group-btn").removeClass("hide");
      });
    });
  }

  $(document).ready(function () {
    initTypeInputs();
    $(document).on("click", ".js-type-clear", function (event) {
      let $inputGroup = $(event.currentTarget).closest(".input-group");
      $inputGroup.find("SELECT").val(null).trigger('change');
      $inputGroup.find(".input-group-btn").addClass("hide");
    });
    $(document).on("input change propertychange", ".js-unique-value", function (event) {
      let $select = $(event.currentTarget);
      let $wrapper = $select.parent();
      let $uniqueValueInput = $wrapper.find(".js-unique-value-input");
      let separator = $uniqueValueInput.data("jalios-type-value-separator") ? $uniqueValueInput.data("jalios-type-value-separator") : " ";
      if (Array.isArray($select.val())) {
        $uniqueValueInput.val($select.val().join(separator));
      } else {
        $uniqueValueInput.val($select.val());
      }
    });
    $(document).on("jalios:field", function(event) {
      if (event.field.type === "addedField") {
        if (event.field.clones) {
          event.field.clones.forEach(function(element) {
            $(element).find(".form-control").removeClass("select2-hidden-accessible");
            $(element).find(".select2-container").remove();
          })
          initTypeInputs();
        }
      }
    });
    
    $(document).on('jalios:refresh', function (event) {
      let refresh = $.jalios.Event.match(event, 'refresh', 'after');
      if (!refresh || !refresh.target) { return; }
      initTypeInputs();
    });
  });
}(window.jQuery);