(function ($, window, document, undefined) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.appstore) {
    $.jalios.appstore = {};
  }

  $.jalios.appstore.addTab = function (tabName, tabNameML) {
    let counter = $('.application-default-chooser .application-nav-tab-item').length;

    let newTab = Handlebars.compile($('.application-store-tab').html());
    let newTabHTML = newTab({
      counter: counter,
      tabName: tabName,
      tabNameML: JSON.stringify(tabNameML)
    });

    $(newTabHTML).insertAfter($('.application-default-chooser .application-nav-tab-item').last());

    let newTabContent = Handlebars.compile($('.application-store-tab-content').html());
    let newTabContentHTML = newTabContent({
      counter: counter
    });

    $('.application-default-chooser .tab-content').append($(newTabContentHTML));
  };

  $.jalios.appstore.deleteTab = function (index) {
    $('.application-nav-tab-item #application-tab_' + index).remove();
    $('.application-nav-tab-item #application-tab_' + index);
  };

  $.jalios.appstore.renameActiveTab = function (name) {
    $('.app.app-appstore .application-default-chooser .application-nav-tab-item.active a').text(name);
  };

  // ------------------------------------------
  //  Private CODE
  // ------------------------------------------

  const navigateToApp = function(event) {
    event.stopPropagation();
    event.preventDefault();

    // Hide the tooltip if active
    $(event.currentTarget).find('[data-toggle="tooltip"]').tooltip('hide');

    let jsonObject = getFormDataAsJsonObject(getAppStoreFormData());
    jsonObject.displayedApplication = $(event.currentTarget).closest(".card").data('jalios-data-id');

    $(event.currentTarget).closest(".card").refresh({
      params: jsonObject,
      callback: function() {
        window.history.replaceState(history.state, "", "jcore/appstore/app/appStoreApp.jsp?displayedApplication=" + jsonObject.displayedApplication);
      }
    });
  }

  const getAppStoreFormData = function () {
    var formData = new FormData($('.js-appstore-form').get(0));
    return formData;
  };

  const getFormDataAsJsonObject = function (formData) {
    var object = {};
    var formDataEntries = formData.entries(),
      formDataEntry = formDataEntries.next(),
      pair;
    while (!formDataEntry.done) {
      pair = formDataEntry.value;
      object[pair[0]] = pair[1];
      formDataEntry = formDataEntries.next();
    }
    return object;
  };

  const serviceUrl = 'jcore/launcher/applicationLauncherActions.jsp';

  const getDefaultPreferenceAsJson = function ($defaultPreferenceWrapper) {
    let tabs = [];
    $defaultPreferenceWrapper.find('.nav-tabs .application-nav-tab-item > a').each(function (index, element) {
      let tab = {};
      let applications = [];

      tab.name = $(element).text().trim();
      let tabNameML = $(element).parent().data('jalios-tab-nameml');
      tab.nameML = tabNameML;
      let tabId = $(element).attr('href');

      $defaultPreferenceWrapper
        .find(tabId)
        .find('.launcher-application-items .input-group')
        .each(function (index, element) {
          let application = {};
          let shortcutId = $(element).find(':input.jalios-publication').val();
          if (shortcutId) {
            application.shortcutId = shortcutId;
            applications[index] = application;
          }
        });

      tab.applications = applications;
      tabs[index] = tab;
    });

    var jsonData = JSON.stringify({
      tabs: tabs
    });

    return jsonData;
  };

  const register = function () {
    initTooltips();
    initTabsSortable();

    // Disable delete button if only tab :
    if ($('.application-nav-tab-item').length <= 1) {
      $('.btn-tab-delete').addClass('hide');
    }

    $(document).on('click', '.js-change-sort', function (event) {
      let jsonObject = getFormDataAsJsonObject(getAppStoreFormData());
      jsonObject.sortMode = $(event.currentTarget).data("jalios-appstore-sort");

      $('.js-appstore-form').refresh({
        params: jsonObject
      });
    });

    $(document).on('click', '.application-hashtags .label', function (event) {
      event.stopPropagation();
      event.preventDefault();
      let dataId = $(event.currentTarget).data('jalios-data-id');
      $('.app-sidebar-section-type INPUT[value=' + dataId + ']').click();
    });

    $(document).on('keypress', '.card-appstore-layout .card-title > A', function (event) {
      if ((event.key || event.which || (event.keyCode === 32 || event.keyCode === 13))) {
        navigateToApp(event);
      }
    });
    
    $(document).on('click', '.card-appstore-layout > .card', navigateToApp);

    $(document).on('click', '.btn-tab-add-validate', function (event) {
      let tabNameML = {};
      $('.js-tab-name-ml').each(function (index, element) {
        let lang = $(element).attr('name');
        let value = $(element).val().trim();
        tabNameML[lang] = value;
      });

      let siteLang = $('HTML').attr('lang');
      let tabName = tabNameML[siteLang];

      let defaultLang = $('.tab-main-site-lang').val();
      let defaultTabName = tabNameML[defaultLang];

      if (defaultTabName == null || defaultTabName == undefined || defaultTabName.trim() == '') {
        $('.tab-langs-required-warning').removeClass('hide');
      } else {
        if (tabName == null || tabName == undefined || tabName.trim() == '') {
          tabName = defaultTabName;
        }
        $.jalios.appstore.addTab(tabName, tabNameML);
        $.jalios.ui.Modal.close(false);
      }
      handleTabDeleteDisplay();
    });

    $(document).on('click', '.btn-tab-rename-validate', function (event) {
      let tabNameML = {};
      $('.js-tab-name-ml').each(function (index, element) {
        let lang = $(element).attr('name');
        let value = $(element).val().trim();
        tabNameML[lang] = value;
      });

      let siteLang = $('HTML').attr('lang');
      let tabName = tabNameML[siteLang];

      let defaultLang = $('.tab-main-site-lang').val();
      let defaultTabName = tabNameML[defaultLang];
      if (defaultTabName == null || defaultTabName == undefined || defaultTabName.trim() == '') {
        $('.tab-langs-required-warning').removeClass('hide');
      } else {
        let $activeTabLink = $('.app.app-appstore .application-default-chooser .application-nav-tab-item.active');
        $activeTabLink.data('jalios-tab-nameml', tabNameML);

        if (tabName == null || tabName == undefined || tabName.trim() == '') {
          tabName = defaultTabName;
        }
        $activeTabLink.find('a').first().text(tabName);
        $.jalios.ui.Modal.close(false);
      }
    });

    $(document).on('keypress', '[data-jalios-appstore-action]', function(event) {
      let $focused = $(':focus');
      if ($focused.is("a")) {
        event.stopPropagation();
        return false;
      }
      if ((event.key || event.which || (event.keyCode === 32 || event.keyCode === 13))) {
        handleAppStoreAction(event);
      }
    });
    $(document).on('click', '[data-jalios-appstore-action]', handleAppStoreAction);
  };

  const handleAppStoreAction = function(event) {
    let $link = $(event.currentTarget);
    let action = $link.data('jalios-appstore-action');
    let params = $link.data('jalios-appstore-action-params');

    let service = $.jalios.launcher.service.getInstance();
    event.stopPropagation();
    event.stopImmediatePropagation();
    switch (action) {
      case 'renameActiveTab':
        let $activeTabLink = $link.closest('.application-nav-tab-item');
        let tabNameML = $activeTabLink.data('jalios-tab-nameml');

        $.jalios.ui.Modal.open($link, {
          url: 'jcore/appstore/app/modal/editTabModal.jsp?',
          params: {
            tabNameML: JSON.stringify(tabNameML)
          }
        });
        break;

      case 'deleteActiveTab':
        $.jalios.ui.Modal.confirm(I18N.glp('msg.js.confirm'), function (event) {
          let $activeTabLink = $(
            '.app.app-appstore .application-default-chooser .application-nav-tab-item.active > a'
          );
          if ($activeTabLink.length == 1) {
            let tabId = $activeTabLink.attr('href');
            $activeTabLink.parent().remove();
            $(tabId).remove();
            // Display Toastr
            if (toastr) {
              toastr.options = {
                positionClass: 'toast-top-center'
              };
              toastr.info($.jalios.appstore.i18n.tabDeleted);
            }
            // Focus first tab
            $('.app.app-appstore .application-default-chooser .application-nav-tab-item').first().find('> a').click();
            handleTabDeleteDisplay();
          }
        });
        break;

      case 'addTab':
        $.jalios.ui.Modal.open($link, {
          url: 'jcore/appstore/app/modal/addTabModal.jsp'
        });

        break;
      case 'saveDefaultPreference':
        let json = getDefaultPreferenceAsJson($link.closest('.application-default-chooser'));

        $.ajax({
          url: serviceUrl,
          method: 'post',
          data: {
            opSaveDefaultPreference: true,
            defaultPreferenceGroupId: $link.closest('.application-default-chooser').find('.departmentGroup').val(),
            defaultPreference: json
          },
          success: function (data) {
            if (toastr) {
              toastr.options = {
                positionClass: 'toast-top-center'
              };
              toastr.info($.jalios.appstore.i18n.launcherSaved);
            }
          }
        });
        break;
      case 'toggleApplicationInstall': {
        // Make a copy of params
        let data = {
          tabIndex: params.tabIndex,
          shortcutId: params.shortcutId
        };
        if ($link.hasClass('is-installed')) {
          service.removeApplication(data, function () {
            toastr.options = {
              positionClass: 'toast-top-center'
            };
            toastr.info($.jalios.appstore.i18n.appRemovedFromTab);
          });
          $link.removeClass('is-installed');
          // Remove global is-installed only if all tabs doesn't contain the current app
          if ($link.closest('.card').find('.appstore-add.is-installed').length === 0) {
            $link.closest('.card').removeClass('is-installed');
          }
        } else {
          service.addApplication(data, function () {
            toastr.options = {
              positionClass: 'toast-top-center'
            };
            toastr.info($.jalios.appstore.i18n.appInstalledInTab);
          });
          $link.addClass('is-installed');
          $link.closest('.card').addClass('is-installed');
        }
        break;
      }

      case 'uninstallApplication': {
        /* 
           We name it data2 because our javascript minifier remove braces
           The value would be declared twice and trigger a js error
        */

        let data2 = {
          shortcutId: params.shortcutId
        };

        service.removeApplicationOnAllTabs(data2, function () {
          // Remove is-installed on tabs dropdown
          $link.closest('.card').find('.appstore-add.is-installed').removeClass('is-installed');
          // Remove global is-installed
          $link.closest('.card').removeClass('is-installed');

          toastr.options = {
            positionClass: 'toast-top-center'
          };
          toastr.info($.jalios.appstore.i18n.appRemovedFromAllTabs);
        });

        break;
      }

      default:
        break;
    }
  }

  const handleTabDeleteDisplay = function () {
    if ($('.application-nav-tab-item').length <= 1) {
      $('.btn-tab-delete').addClass('hide');
    } else {
      $('.btn-tab-delete').removeClass('hide');
    }
  };

  const handleAppStoreRefresh = function (event) {
    if (event.refresh.type === 'after') {
      let $target = $(event.refresh.target);
      if ($target.hasClass('appstore') || $target.hasClass('app-store-default-setup')) {
        initTooltips();
        initTabsSortable();
        handleTabDeleteDisplay();
      }
    }
    if (event.refresh.type === 'before') {
      let $target = $(event.refresh.target);
      if ($target.hasClass('appstore') || $target.hasClass('app-store-default-setup')) {
        if (!event.refresh.options.params.sortMode) {
          event.refresh.options.params.sortMode = $('.js-change-sort:checked').val();
        }
      }
    }
  };

  const initTooltips = function () {
    $('[data-toggle="tooltip"]').tooltip({
      container: 'body'
    });
  };

  const initTabsSortable = function () {
    let $navTabs = $('.application-default-chooser .nav-tabs');
    if ($navTabs.length > 0) {
      $navTabs.sortable({
        delay: 150,
        items: '.application-nav-tab-item',
        tolerance: 'pointer',
        forceHelperSize: true,
        helper: 'clone',
        containment: $navTabs,
        cursorAt: {
          left: 30,
          top: 24
        }
      });
    }
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    register();
    $(document).on('jalios:refresh', handleAppStoreRefresh);
  });
})(jQuery, window, document);
