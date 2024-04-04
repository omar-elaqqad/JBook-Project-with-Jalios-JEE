!(function ($) {
  var ps = null;
  var register = function () {
    $(window).bind('storage', onStorageUpdate);

    $('body').tooltip({
      selector: '[data-toggle=tooltip]'
    });

    $(document).on('click', '.js-jportal-preview-mode-rotate', function (event) {
      $('#jportalPreviewIframe').toggleClass('is-landscape');
      $('.js-jportal-preview-mode-rotate').toggleClass('is-active');
    });

    $(document).on('click', '.js-jportal-preview-mode-smartphone', function (event) {
      removePreviewClassOnIframe();
      removeActiveClassOnPreviewModeButtons();
      $('.js-jportal-preview-mode-smartphone').addClass('is-active');
      $('.jportal-preview-mode-rotate').removeClass('disabled');
      $('#jportalPreviewIframe').addClass('jportal-preview-mode-smartphone');
      updatePerfectScrollbar();
    });

    $(document).on('click', '.js-jportal-preview-mode-tablet', function (event) {
      removePreviewClassOnIframe();
      removeActiveClassOnPreviewModeButtons();
      $('.js-jportal-preview-mode-tablet').addClass('is-active');
      $('.jportal-preview-mode-rotate').removeClass('disabled');
      $('#jportalPreviewIframe').addClass('jportal-preview-mode-tablet');
      updatePerfectScrollbar();
    });

    $(document).on('click', '.js-jportal-preview-mode-screen', function (event) {
      removePreviewClassOnIframe();
      removeActiveClassOnPreviewModeButtons();
      $('.js-jportal-preview-mode-screen').addClass('is-active');
      $('#jportalPreviewIframe').addClass('jportal-preview-mode-screen');
      destroyPerfectScrollbar();
    });

    $(document).on('click', '.js-jportal-preview-mode-largescreen', function (event) {
      removePreviewClassOnIframe();
      removeActiveClassOnPreviewModeButtons();
      $('.js-jportal-preview-mode-largescreen').addClass('is-active');
      $('#jportalPreviewIframe').addClass('jportal-preview-mode-largescreen');
      destroyPerfectScrollbar();
    });

    $(document).on('click', '.js-toggle-topbar', onJPortalToggleTopbarClickHandler);
    $('#jportalPreviewIframe').load(function () {
      const contents = $(this).contents();
      let topbarOverlay = $(Handlebars.compile($('#topbar-preview-overlay').html())());
      contents.find('.topbar').prepend(topbarOverlay);
    });
  };

  const onJPortalToggleTopbarClickHandler = function (event) {
    $('.jportal-preview').toggleClass('hide-topbar');
  };

  var updatePerfectScrollbar = function () {
    if (ps != null) {
      ps.update();
    } else {
      ps = new PerfectScrollbar($('#jportalPreviewIframe').contents().find('html')[0]);
    }
  };
  var destroyPerfectScrollbar = function () {
    if (ps != null && ps != undefined) {
      ps.destroy();
      ps = null;
      //  $("#jportalPreviewIframe").contents().find("html").removeClass("ps");
    }
  };

  var removeActiveClassOnPreviewModeButtons = function () {
    $('.js-jportal-preview-mode-largescreen').removeClass('is-active');
    $('.js-jportal-preview-mode-screen').removeClass('is-active');
    $('.js-jportal-preview-mode-tablet').removeClass('is-active');
    $('.js-jportal-preview-mode-smartphone').removeClass('is-active');
  };

  var removePreviewClassOnIframe = function () {
    $('#jportalPreviewIframe').removeClass('jportal-preview-mode-smartphone');
    $('#jportalPreviewIframe').removeClass('jportal-preview-mode-tablet');
    $('#jportalPreviewIframe').removeClass('jportal-preview-mode-screen');
    $('#jportalPreviewIframe').removeClass('jportal-preview-mode-largescreen');
    $('.jportal-preview-mode-rotate').addClass('disabled');
  };

  var onStorageUpdate = function (event) {
    try {
      var key = event.originalEvent.key;

      /**
       * TAB FOCUS
       */
      if (key == 'jportal.sync.preview.structure') {
        var newValue = event.originalEvent.newValue;
        var structure = JSON.parse(newValue);
        var jportalId = $('.jportal-preview').data('jalios-jportal');
        if (structure.jportal == jportalId) {
          $('BODY').addClass('jportal-overlay-active');
          var $overlay = $('.jportal-overlay');
          $overlay.removeClass('hide').addClass('is-active');
          $('#jportalPreviewIframe').one('load', function () {
            $('BODY').removeClass('jportal-overlay-active');
            var $overlay = $('.jportal-overlay');
            $overlay.one($.support.transition.end, function () {
              $overlay.addClass('hide');
            });
            $overlay.removeClass('is-active');
          });
          $('#jportalPreviewIframe').attr('src', $('#jportalPreviewIframe').attr('src'));
        }
      }
    } catch (e) {
      // do nothing
    }
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    register();
  });
})(window.jQuery);
