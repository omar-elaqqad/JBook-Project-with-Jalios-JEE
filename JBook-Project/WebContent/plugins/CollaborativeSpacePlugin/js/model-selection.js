!(function ($) {
  /* Do stuff on DOM Ready */
  const register = function () {};

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    $(document).on('change', '.model-selection input[type=radio]', function (event) {
      const $model = $(event.target);
      $model.closest('.model-selection').find('.model_wrapper').removeClass('model-selected');
      $model.closest('.model_wrapper').addClass('model-selected');

      const isSync = $model.data('is-sync-required'); //sync-mode-picker

      if (isSync) {
        $model.closest('form').find('.widget-name-activateSync').addClass('hide');
        $model.closest('form').find('.sync-mode-picker').addClass('hide');
      } else {
        $model.closest('form').find('.widget-name-activateSync').removeClass('hide');

        const syncVal = $model.closest('form').find("input[name='activateSync']:checked").val();
        if (syncVal === 'true') {
          $model.closest('form').find('.sync-mode-picker').removeClass('hide');
        }
      }
    });
  });
})(window.jQuery);
