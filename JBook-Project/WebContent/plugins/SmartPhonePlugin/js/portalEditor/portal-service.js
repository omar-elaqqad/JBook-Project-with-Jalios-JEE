!(function($) {
  // Namespace
  if (!$.plugin) {
    $.plugin = {};
  }
  if (!$.plugin.SmartphonePortalApp) {
    $.plugin.SmartphonePortalApp = {};
  }

  $.plugin.SmartphonePortalApp.service = (function() {
    // Instance stores a reference to the Singleton
    var instance;

    function init() {
      var serviceUrl =
        "plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditorActions.jsp";
      return {
        // Public methods and variables
        savePortalStructure: function(
          portalId,
          portalStructure,
          callback,
          onError
        ) {
          let data = {};
          data.structure = portalStructure;
          data.portalId = portalId;
          data.opSavePortalStructure = true;
          $.ajax({
            dataType: "json",
            url: serviceUrl,
            type: "POST",
            data: data,
            success: callback,
            error: onError,
            traditional: true
          });
        },

        revertPortalStructure: function(
          portalId,
          portalStructureId,
          callback,
          onError
        ) {
          let data = {};
          data.structureId = portalStructureId;
          data.portalId = portalId;
          data.opRevertVersion = true;
          $.ajax({
            dataType: "json",
            url: serviceUrl,
            type: "POST",
            data: data,
            success: callback,
            error: onError,
            traditional: true
          });
        },

        getPortalStructure: function(portalId, callback, onError) {
          let data = {};
          data.portalId = portalId;
          data.opLoadPortalStructure = true;
          $.ajax({
            dataType: "json",
            type: "POST",
            url: serviceUrl,
            data: data,
            success: callback,
            error: onError,
            traditional: true
          });
        }
      };
    }

    return {
      // Get the Singleton instance if one exists
      // or create one if it doesn't
      getInstance: function() {
        if (!instance) {
          instance = init();
        }

        return instance;
      }
    };
  })();
})(window.jQuery);
