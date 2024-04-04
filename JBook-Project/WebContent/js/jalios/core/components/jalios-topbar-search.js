(function ($, window, document, undefined) {
  var ajaxTimeout = false;
  var backupedSearch = '';
  var $searchDummy = $('.topbar-search-results-dummy');

  var _addOverlay = function () {
    $('.topbar-search-overlay').addClass('full in');
    $('BODY').addClass('has-overlay');
    $('BODY').addClass('has-search-overlay');
  };

  var _removeOverlay = function () {
    $('.topbar-search-overlay').removeClass('full in');
    $('BODY').removeClass('has-overlay');
    $('BODY').removeClass('has-search-overlay');
  };

  var _displayLoading = function () {
    $('.topbar-search-inner').each(function (index, element) {
      var $element = $(element);

      if (!$element.find('.ajax-loading-component-waves').exists()) {
        $element.html('').displayLoadingWaves();
      }
    });
  };

  var _closeAutocomplete = function () {
    _removeOverlay();
    $searchDummy.removeClass('is-searching');
    $searchDummy.addClass('hide');
    $(document).off('keydown.jalios.topbar.search');
  };

  $(document).ready(function () {
    //Move topbar under body tag
    $searchDummy.prependTo($('BODY'));

    $(document).on('click', '.topbar-search-close', function (event) {
      _closeAutocomplete();
    });
    $(document).on('keydown', function(e){
      if($(document.activeElement).is('.topbar-search-close') && (e.keyCode === 13 || e.keyCode === 32)) {
        _closeAutocomplete();
        e.preventDefault();
      }
    });    

    $(document).on('keyup', function (event) {
      switch (event.keyCode) {
        case 27: // escape
          _closeAutocomplete();

          break;
      }
    });

    $(document).on('click', '.btn-full-search', function (event) {
      var $searchForm = $('.topbar-search-wrapper FORM');
      $searchForm.submit();
    });

    $(document).on('click', '.topbar-search-overlay', function (event) {
      _closeAutocomplete();
    });

    $(document).on('input change propertychange', '.topbar-search-query', function (event) {
      var $searchInput = $(event.currentTarget);
      var $searchWrapper = $(event.currentTarget).closest('.topbar-search-wrapper');
      var ajaxUrl = $(event.currentTarget).data('jalios-ajax-refresh-url');

      var query = event.target.value;

      // Trigger behavior based on length of query text
      var minLength = $searchInput.attr('data-ac-min-length') || $.jalios.Properties.get('autocomplete-min-chars');

      if (query.length < minLength) {
        backupedSearch = '';
      }

      if (query === backupedSearch) {
        return;
      }

      if (query.length < minLength) {
        _addOverlay();
        $searchDummy.addClass('is-searching');
        $searchDummy.removeClass('hide');

        setTimeout(function () {
          _displayLoading();
          var $loadingComponent = $searchDummy.find('.topbar-search-inner .ajax-loading-component-waves');
          var minimumLengthLabel = $searchDummy.find('.topbar-search-inner').data('jalios-loading-label');
          if (!$loadingComponent.find('.loading-label').exists()) {
            $loadingComponent.append($('<SPAN/>').addClass('loading-label').text(minimumLengthLabel));
          }
        }, 400);

        return;
      } else {
        _addOverlay();
        $searchDummy.addClass('is-searching');
        $searchDummy.removeClass('hide');
        setTimeout(function () {
          _displayLoading();
        }, 400);
      }

      // Use a timeout to avoid search being performed each type a character is typed
      if (ajaxTimeout) {
        clearTimeout(ajaxTimeout);
      }

      ajaxTimeout = setTimeout(function () {
        $(document).off('keydown.jalios.topbar.search');
        backupedSearch = query;
        $.jalios.AjaxRefresh.refresh(ajaxUrl, $('.topbar-search-results-dummy .search-global'), {
          'params': {
            'autocomplete': query
          },
          'noscroll': true,
          'nohistory': true,
          callback: function () {
            let focusInformation = $.jalios.a11y.getFocusInformation($('.topbar-search-inner'));
            //$(focusInformation.firstFocusableElement).focus();

            $(document).on('keydown.jalios.topbar.search', function (keydownEvent) {
              if (
                keydownEvent.keyCode === 9 &&
                !(keydownEvent.shiftKey | keydownEvent.ctrlKey | keydownEvent.metaKey | keydownEvent.altKey)
              ) {
                // TAB pressed
                if ($(keydownEvent.target).hasClass('topbar-search-close')) {
                  // Focuse search input
                  keydownEvent.preventDefault();
                  $('#a11y-global-search').focus();
                } else if ($(keydownEvent.target).hasClass('topbar-search-query')) {
                  // Focus first search result
                  keydownEvent.preventDefault();
                  $(focusInformation.firstFocusableElement).focus();
                }
              }
              if (keydownEvent.keyCode === 13 && $(keydownEvent.target).hasClass('topbar-search-close')) {
                // Focuse search input
                _closeAutocomplete();
                keydownEvent.preventDefault();
                $('#a11y-global-search').focus();
              }
            });
            $('.topbar-search-results-wrapper').each(function (index, element) {
              new PerfectScrollbar(element, {
                suppressScrollX: true
              });
            });
          }
        });
        ajaxTimeout = false;
      }, $.jalios.Properties.get('autocomplete-chooser-timeout'));
    });
  });
})(jQuery, window, document);
