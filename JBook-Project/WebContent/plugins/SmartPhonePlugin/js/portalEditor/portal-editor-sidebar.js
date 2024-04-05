(function($, window, document, undefined) {
  // =======================================================================
  // ********************** VARIABLES **************************
  // =======================================================================
  var smartphonePortalSidebar;

  // =======================================================================
  // ********************** CONSTANTS **************************
  // =======================================================================

  // =======================================================================
  // ********************** INIT **************************
  // =======================================================================

  var init = function() {
    smartphonePortalSidebar = new SmartphonePortalSidebar(
      $(".mobile-portal-edition")
    );
    $(document).on("jalios:refresh", handleBodyRefresh);
  };

  const handleBodyRefresh = function(event) {
    if (event.refresh.type === "before") {
      if ($(event.refresh.target).hasClass("portal-sidebar-wrapper")) {
        $(".edition-sidebar").displayLoading();
      }
      return;
    }
  };

  // =======================================================================
  // ********************** SmartphonePortal *****************************************
  // =======================================================================
  var SmartphonePortalSidebar = function(element) {
    this.$element = $(element);
    this.init();
    this.initEventHandling();
    this.initActionHandling();
  };

  SmartphonePortalSidebar.prototype.init = function() {
    this.$editionBlocksBody = this.$element.find(".edition-blocks-body");
  };
  SmartphonePortalSidebar.prototype.returnToSidebarHome = function() {
    let ajaxParameters = {};
    ajaxParameters.returnToSidebarHome = true;
    ajaxParameters.smartphonePortalId = this.$element.data("jalios-portal-id");

    $.jalios.AjaxRefresh.refresh(
      "plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doEditSmartPhonePortalSidebar.jsp",
      ".portal-sidebar-wrapper", {
        params: ajaxParameters
      }
    );
  };
  SmartphonePortalSidebar.prototype.initActionHandling = function() {
    var _this = this;
    $(document).on("click", "[data-jalios-jmobile-portal-action]", function(
      event
    ) {
      event.stopPropagation();
      event.preventDefault();
      let $currentTarget = $(event.currentTarget);
      var action = $currentTarget.data("jalios-jmobile-portal-action");

      switch (action) {
        case "cancelPortletOperation":
          if (
            $.plugin.SmartphonePortalApp.getActivePortlet() &&
            $.plugin.SmartphonePortalApp.getActivePortlet().isEmpty
          ) {
            $.plugin.SmartphonePortalApp.getActivePortlet().remove();
          }
          _this.returnToSidebarHome();
          break;
        case "selectPortlet":
          let portletId = $currentTarget.data("jalios-data-id");
          let portletLabel = $currentTarget.data(
            "jalios-jmobile-portlet-label"
          );
          let portletImg = $currentTarget.find("IMG").attr("src");

          $.plugin.SmartphonePortalApp.getActivePortlet().updatePreview(
            portletId,
            portletLabel,
            portletImg
          );
          _this.returnToSidebarHome();

          break;
        case "editPortlet":
          $.plugin.SmartphonePortalApp.getPortalEditor().setActivePortlet(
            $currentTarget.closest(".portlet-block").data("smartphonePortlet")
          );
          setTimeout(function() {
            $(".edition-sidebar").displayLoading();
            $.jalios.AjaxRefresh.refresh(
              "plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doEditSmartPhonePortletSidebar.jsp",
              ".portal-sidebar-wrapper", {
                params: {
                  id: $currentTarget.data("jalios-data-id")
                }
              }
            );
          }, 10);
          break;
      }
    });
  };

  SmartphonePortalSidebar.prototype.initEventHandling = function() {
    var _this = this;

    $(document).on("jalios.smartphone.portal", function(event) {
      switch (event.portalEditorEvent) {
        case "create":
          $.jalios.AjaxRefresh.refresh(
            "plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doSmartPortalChoosePortletSidebar.jsp",
            ".portal-sidebar-wrapper", {
              params: {
                smartphonePortalId: $.plugin.SmartphonePortalApp.getPortalEditor().id,
                portletClass: event.portalEditorData.portletType
              }
            }
          );
          break;
        case "createPortlet":
          $.plugin.SmartphonePortalApp.getActivePortlet().updatePreview(
            event.portalEditorData.portletId,
            event.portalEditorData.portletLabel,
            event.portalEditorData.portletImage
          );
          setTimeout(function() {
            _this.returnToSidebarHome();
          }, 100);

          break;

        case "cancelPortlet":
          setTimeout(function() {
            _this.returnToSidebarHome();
          }, 100);
          break;
        case "updatePortlet":
          $.plugin.SmartphonePortalApp.getActivePortlet().updatePreview(
            event.portalEditorData.portletId,
            event.portalEditorData.portletLabel,
            event.portalEditorData.portletImage
          );
          break;
      }
    });
  };

  // =======================================================================
  // ********************** EVENTS REGISTER ********************************
  // =======================================================================
  var registerEvents = function() {};

  // =======================================================================
  // ********************** DOCUMENT READY *********************************
  // =======================================================================
  $(document).ready(function() {
    init();
  });
})(jQuery, window, document);