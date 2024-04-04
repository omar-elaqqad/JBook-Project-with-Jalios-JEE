!(function ($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.launcher) {
    $.jalios.launcher = {};
  }

  if (!$.jalios.launcher.service) {
    $.jalios.launcher.service = {};
  }

  $.jalios.launcher.service = (function () {
    // Instance stores a reference to the Singleton
    var instance;
    const serviceUrl = 'jcore/launcher/applicationLauncherActions.jsp';

    function init() {
      return {
        // Public methods and variables
        getApplicationLauncher: function (callback, onError) {
          let data = {};
          data.opLoad = true;

          executeRequest(data, callback, onError, 'getApplicationLauncher');
        },

        addApplication: function (data, callback, onError) {
          if (!data) {
            return;
          }
          data.opAddApplication = true;

          executeRequest(data, callback, onError, 'addApplication');
        },

        searchApplication: function (data, callback, onError) {
          if (!data) {
            data = {
              text: ''
            };
          }
          data.opSearchApplication = true;

          executeRequest(data, callback, onError, 'searchApplication');
        },

        removeApplication: function (data, callback, onError) {
          if (!data) {
            return;
          }
          data.opRemoveApplication = true;
          executeRequest(data, callback, onError, 'removeApplication');
        },

        removeApplicationOnAllTabs: function (data, callback, onError) {
          if (!data) {
            return;
          }
          data.opRemoveApplicationOnAllTabs = true;
          executeRequest(data, callback, onError, 'removeApplicationOnAllTabs');
        },

        saveApplicationLauncher: function (data, callback, onError) {
          if (!data) {
            return;
          }

          let doubleCallback = function () {
            callback();
            $.jalios.launcher.service.getInstance().triggerEvent('saveApplicationLauncher', data);
          };

          $.ajax({
            url: 'front/memberpreference/savePreference.jsp',
            method: 'post',
            data: {
              key: 'core.application.launcher',
              value: JSON.stringify(data)
            },
            success: doubleCallback,
            error: onError
          });
        },

        triggerEvent: function (eventName, data) {
          var event = jQuery.Event('jalios.application-launcher');
          event.applicationLauncher = {};
          if (data) {
            var paramsObj = typeof data === 'object' ? data : JSON.parse(data);
            event.applicationLauncher.data = paramsObj;
          }
          event.applicationLauncher.name = eventName;
          $(document).trigger(event);
        }
      };
    }

    const executeRequest = function (data, callback, onError, actionName) {
      let doubleCallback = function (args) {
        if (args) {
          callback(args);
        } else {
          callback();
        }
        $.jalios.launcher.service.getInstance().triggerEvent(actionName, data);
      };

      $.ajax({
        type: 'POST',
        dataType: 'json',
        url: serviceUrl,
        data: data,
        success: doubleCallback,
        error: onError
      });
    };

    return {
      // Get the Singleton instance if one exists
      // or create one if it doesn't
      getInstance: function () {
        if (!instance) {
          instance = init();
        }

        return instance;
      }
    };
  })();
})(window.jQuery);
