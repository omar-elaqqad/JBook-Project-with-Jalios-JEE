!function ($) {

  var refreshLinkType = function () {
    let selectedLinkType = $("SELECT[name=linkType]").find(":selected");

    if ($(selectedLinkType).val() == "content") {
      $("INPUT[name=categorylink]:checked").each(function (idx, element) {
        $(element).prop("checked", false);
      });
      $(".categorylink").val("");
      $(".widget-name-publicationLink").removeClass("hide");
      $(".widget-name-categorylink").addClass("hide");
      $(".widget-name-linkLabel").removeClass("hide");
    } else if ($(selectedLinkType).val() == "category") {
      $(".widget-name-publicationLink").addClass("hide");
      $(".widget-name-categorylink").removeClass("hide");
      $(".widget-name-linkLabel").removeClass("hide");
      $(".publicationLink").val("");
    } else {
      $(".publicationLink").val("");
      $(".linkLabel").val("");
      $("INPUT[name=categorylink]:checked").each(function (idx, element) {
        $(element).prop("checked", false);
      });
      $(".categorylink").val("");
      $(".widget-name-publicationLink").addClass("hide");
      $(".widget-name-categorylink").addClass("hide");
      $(".widget-name-linkLabel").addClass("hide");
    }
  };

  var refreshPercentage = function () {
    let selectedPercentage = $("INPUT[name=percentage]:checked");

    if ($(selectedPercentage).val() == "true") {
      $(".widget-name-targetValue").addClass("hide");
      $(".widget-name-unit").addClass("hide");
    } else {
      $(".widget-name-targetValue").removeClass("hide");
      $(".widget-name-unit").removeClass("hide");
    }
  };

  var refreshCustom = function () {
    let selectedCustom = $("INPUT[name=indicatorType]:checked");
    if ($(selectedCustom).val() === "MANUAL") {
      let metric = $("SELECT[name=metric]");
      $(metric).val('');
      $(".metric-editor").remove();
    }
  };

  var init = function () {
    refreshPercentage();
    refreshLinkType();
    refreshCustom();
  };


  var register = function () {

    $(document).on('click', '.card-choice-item', function (event) {
      let mode = $(event.currentTarget).data("jalios-indicator-type");
      $(".card-choice-item").removeClass("active");
      $(".card-choice-item").find("input").prop("checked", false);
      $(event.currentTarget).addClass("active");
      $(event.currentTarget).find("input").prop("checked", "checked").trigger("change");
      $(".indicator-type-fields").addClass("hide");
      $(".indicator-type-fields-" + mode).removeClass("hide");
    });

    $(document).on("input change propertychange", ".indicator-metric-params :input", function (event) {

      let jsonArray = {};
      $(".indicator-metric-params :input").each(function (idx, element) {
        if ($(element).is(':radio') || $(element).is(':checkbox')) {
          if ($(element).is(':checked')) {
            jsonArray[$(element).attr("name")] = $(element).val();
          }
        }

        if ($(element).is('select')) {
          let selectedOption = $(element).find(":selected");
          jsonArray[$(element).attr("name")] = $(selectedOption).val();
        }

        if ($(element).hasClass("form-control-value")) {
          jsonArray[$(element).attr("name")] = $(element).val();
        }

        if ($(element).hasClass("duration")) {
          jsonArray[$(element).attr("name")] = $(element).val();
        }

        if ($(element).hasClass("control-timezone")) {
          jsonArray[$(element).attr("name")] = $(element).val();
        }
      });

      $("INPUT[name=metricParameters]").val(JSON.stringify(jsonArray));
    });

    $(document).on("input change propertychange", "INPUT[name=percentage]", function (event) {
      refreshPercentage();
    });

    $(document).on("input change propertychange", "SELECT[name=linkType]", function (event) {
      refreshLinkType();
    });

    $(document).on("input change propertychange", "INPUT[name=indicatorType]", function (event) {
      let selectedCustom = $("INPUT[name=indicatorType]:checked");
      if ($(selectedCustom).val() === "MANUAL") {
        $("INPUT[name=metricParameters]").val("");
        refreshCustom();
      }
    });
    init();
  };

  $(document).ready(function ($) {
    register();
    $(document).on('jalios:refresh', function (event) {
      if (event.refresh.type === "after") {
        if ($(event.refresh.target).is(".typeahead-menu")) {
          return;
        }
        init();
      }
    });
  });

}(window.jQuery);
