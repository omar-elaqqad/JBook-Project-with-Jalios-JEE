!(function ($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.spectrum) {
    $.jalios.spectrum = {};
  }

  $.jalios.spectrum.init = function () {
    destroySpectrum();
    initSpectrum();
  };

  const JaliosSpectrum = (function () {
    function JaliosSpectrum(element) {
      let $element = $(element);
      let options = $element.data('jalios-spectrum-options');

      addTriggerOptions(options, $element);
      $element.removeAttr('data-jalios-init-spectrum');
      $element.css('border-radius', 0);
      $element.spectrum(options);
    }

    const addTriggerOptions = function (options, $element) {
      options.change = function (color) {
        $element.trigger('input', { currentVal: color && color.toHexString() });
        $element.trigger('change', { currentVal: color && color.toHexString() });
      };
      options.hide = function (color) {
        $element.trigger({
          type: 'hide',
          color: color && color.toHexString()
        });
      };
    };

    return JaliosSpectrum;
  })();

  const destroySpectrum = function () {
    $('.spectrum').each(function (_index, element) {
      $(element).spectrum('destroy');
      $(element).attr('data-jalios-init-spectrum', 'true');
    });

    $('.sp-container').remove();
  };

  const initSpectrum = function (options) {
    $('[data-jalios-init-spectrum="true"]').each(function (_index, element) {
      new JaliosSpectrum(element);
    });
  };
})(window.jQuery);
