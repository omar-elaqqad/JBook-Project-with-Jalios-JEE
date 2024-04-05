!(function($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  // ==========================================
  //  $.jalios.smartPhone.Ajax
  // ==========================================

  /**
   * Call Ajax-Refresh on given element
   */
  $.fn.refresh = function() {
    return this.each(function() {
      $.jalios.smartPhone.Ajax.refresh($(this));
    });
  };

  $.jalios.smartPhone.Ajax = {
    refresh: function($elm) {
      var $target = $elm;

      var $form = $target.closest("FORM");
      var $targetComponent = $.jalios.smartPhone.Ajax.findRefreshTarget(
        $target
      );
      var params = $.jalios.smartPhone.Ajax.resolveParams(
        $target.get(0),
        $form.get(0)
      );

      //Trigger event before performing ajax request
      $.jalios.smartPhone.Util.trigger("before", event, $target, "", "");

      var processAjaxData = true;
      if (params instanceof FormData) {
        processAjaxData = false;
      }

      $(".ui-loader").loader("show");

      $.ajax({
        url: $.jalios.smartPhone.Ajax.resolveUrl($target.get(0), $form.get(0)),
        data: params,
        type: $.jalios.smartPhone.Ajax.resolveMethod(
          $target.get(0),
          $form.get(0)
        ),
        contentType: $.jalios.smartPhone.Ajax.resolveAjaxRefreshContentType(
          processAjaxData
        ),
        processData: processAjaxData
      }).then(function(response) {
        //Replace the targetComponent with the response
        var component = $.parseHTML(response, undefined, true);

        // handle deduplication
        if ($target.data("ajax-deduplication-target")) {
          component = $.jalios.smartPhone.Ajax.deduplicateAjaxResponse(
            component,
            $target
          );
        }

        var $component = $(component);
        if ($target.data("jalios-ajax-refresh-inner") === true) {
          $targetComponent.html($component);
        } else {
          $targetComponent.eq(0).replaceWith($component);
        }

        $.jalios.smartPhone.Util.enhanceComponent($component);

        $target.get(0).submitting = false;

        $.jalios.smartPhone.Util.smartFocus(event);

        //Trigger event after performing ajax request
        $.jalios.smartPhone.Util.trigger("after", event, $target, "", "");

        $(".ui-loader").loader("hide");

        // Re-initialise image uploader
        $.jalios.smartPhone.Util.initImageUploader($component);

        if ($target.data("jalios-remove-ajax-refresh-wrapper") === true) {
          $component.each(function(idx, element) {

            if ($(element).is(".ajax-refresh-wrapper")) {
              $(element)[0].replaceWith(...$(element)[0].childNodes);
            }
          });
        }

        return;
      });
    },

    resolveParams: function(target, form) {
      var $target = $(target);
      var $form = $(form);
      var isForm = $form.length > 0;

      var isFormParams =
        $target.data("jalios-ajax-params-form") &&
        $target.data("jalios-ajax-params");

      if (isFormParams) {
        var formParamsSelector = $target.data("jalios-ajax-params-form");
        var $activePage = $target.closest(".ui-page");
        var formData = $.jalios.smartPhone.Forms.getFormData(
          $(formParamsSelector, $activePage)
        );
        if ($target.data("jalios-ajax-params")) {
          var ajaxParamsData = $target.data("jalios-ajax-params");
          $.each(ajaxParamsData, function(key, val) {
            formData.append(key, val);
          });
          return formData;
        }
      } else if ($target.data("jalios-ajax-params")) {
        return $.param($target.data("jalios-ajax-params"));
      } else if (isForm) {
        var formData = $.jalios.smartPhone.Forms.getFormData(form);
        if ($target.is("BUTTON, INPUT[type='submit']")) {
          formData.append($target.attr("name"), $target.val());
        }
        return formData;
      }

      return "";
    },

    resolveAjaxRefreshContentType: function(processAjaxData) {
      if (!processAjaxData) {
        return false;
      }
      return "application/x-www-form-urlencoded; charset=UTF-8";
    },

    resolveMethod: function(target, form) {
      var $target = $(target);
      var $form = $(form);
      var isForm = $form.length > 0;

      var methodType = $target.data("jalios-ajax-method");

      if (methodType) {
        return methodType;
      }

      if (isForm && $form.eq(0).attr("method")) {
        return $form.eq(0).attr("method");
      } else if (isForm) {
        return "post";
      }

      return "get";
    },

    findRefreshTarget: function($target) {
      if ($target.data("jalios-ajax-target")) {
        return $($target.data("jalios-ajax-target"));
      }

      var $listView = $target.closest(".ui-listview-showmore");
      if ($listView.length > 0) {
        return $listView.eq(0);
      }

      var $ajaxRefreshWrapper = $target.closest(".ajax-refresh-wrapper");
      if ($ajaxRefreshWrapper.length > 0) {
        return $ajaxRefreshWrapper.eq(0);
      }

      //return self
      return $target;
    },

    resolveUrl: function(target, form) {
      if ($(target).data("jalios-ajax-action")) {
        return $(target).data("jalios-ajax-action");
      }

      if ($(form).length > 0) {
        return $(form)
          .eq(0)
          .attr("action");
      }

      if ($(target).is("A[href]")) {
        return $(target).attr("href");
      }

      var ajaxRefreshWrapper = $(target).closest(".ajax-refresh-wrapper");
      if (ajaxRefreshWrapper.data("jalios-ajax-action")) {
        return ajaxRefreshWrapper.data("jalios-ajax-action");
      }

      return "";
    },

    deduplicateAjaxResponse: function(response, $target) {
      var $response = $(response);
      var activePage = $target.closest(".ui-page");

      $target = $($target.data("ajax-deduplication-target"), activePage);
      if ($target.length === 0) {
        return response; // Selector in "data-ajax-deduplication-target" is invalid ?
      }

      var $targetChildren = $target.children();
      var elementsToKeep = [];

      $response.each(function(index, responseElement) {
        // For each element in response...

        var $responseElement = $(responseElement);
        var responseElementId = $responseElement.data("jalios-dataid");
        if (!responseElementId) {
          // This response element has no data-jalios-dataid. It will be kept (i.e show more button, comments, #text notes, ...)
          elementsToKeep.push($responseElement.get(0));
          return;
        }

        var keepResponseElement = true;
        $targetChildren.each(function(index, targetElement) {
          var $targetElement = $(targetElement);
          var targetElementId = $targetElement.data("jalios-dataid");
          if (!targetElementId) {
            // This target element has no data-jalios-dataid. "return" to scan the next target element
            return;
          }

          if (targetElementId === responseElementId) {
            keepResponseElement = false;
          } else {
          }
        });
        if (keepResponseElement) {
          elementsToKeep.push($responseElement.get(0));
        }
      });

      return elementsToKeep;
    }
  };
})(window.jQuery);
