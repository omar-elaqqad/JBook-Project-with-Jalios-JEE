(function($, window, document, undefined) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.plugin) {
    $.plugin = {};
  }

  $.plugin.SmartphonePortalApp = {
    getPortalEditor: function() {
      return smartphonePortal;
    },
    getActivePortlet: function() {
      return smartphonePortal.getActiveSmartphonePortlet();
    },
    triggerEvent: function(eventName, eventParams) {
      var event = jQuery.Event("jalios.smartphone.portal");
      event.portalEditorEvent = eventName;
      event.portalEditorData = eventParams;
      $(document).trigger(event);
    },
    getPortalId: function() {}
  };

  // =======================================================================
  // ********************** VARIABLES ********************
  // =======================================================================
  var smartphonePortal, utils;

  // =======================================================================
  // ********************** CONSTANTS *********************
  // =======================================================================

  // =======================================================================
  // ********************** INIT **************************
  // =======================================================================

  var init = function() {
    smartphonePortal = new SmartphonePortal($(".mobile-portal-edition"));
  };

  // =======================================================================
  // ********************** UTILITYS ***************************************
  // =======================================================================
  var addConstantPropertyOnObject = function(
    obj,
    constant_name,
    constant_value
  ) {
    Object.defineProperty(SmartphonePortalTemplates, constant_name, {
      value: constant_value,
      writable: false,
      enumerable: true,
      configurable: true
    });
  };

  // =======================================================================
  // ***********************************************************************
  // ******************* SmartphonePortal OBJECTS ***********************************
  //* **********************************************************************
  // =======================================================================

  // =======================================================================
  // ********************** JPORTALTEMPLATE ********************************
  // =======================================================================
  var SmartphonePortalTemplates = {};
  addConstantPropertyOnObject(
    SmartphonePortalTemplates,
    "BLOCK_PORTLET",
    Handlebars.compile($("#block-portlet-template").html())
  );
  addConstantPropertyOnObject(
    SmartphonePortalTemplates,
    "EMPTY_BLOCK_PORTLET",
    Handlebars.compile($("#empty-block-portlet-template").html())
  );

  // =======================================================================
  // ********************** JPORTALUTILS **********************************
  // =======================================================================
  var SmartphonePortalUtils = {
    saveTimer: null,
    createPortlet: function(portletId, name, image) {
      var html = SmartphonePortalTemplates.BLOCK_PORTLET({
        "portlet-id": portletId,
        image: image,
        name: name
      });
      return $(html);
    },
    createEmptyPortlet: function(typeName) {
      let html = SmartphonePortalTemplates.EMPTY_BLOCK_PORTLET({
        typeName: typeName
      });
      return $(html);
    },
    triggerCreatePortletEvent: function(emptySmartphonePortlet) {
      $.plugin.SmartphonePortalApp.triggerEvent("create", {
        portlet: emptySmartphonePortlet,
        portletType: emptySmartphonePortlet.getType()
      });
    },

    updatePortalSidebarInputs: function() {
      // JPortal
      var portalUI = smartphonePortal.getUI();
      SmartphonePortalUtils.updateInputs(".portal-parameters", portalUI);
      if (portalUI != null) {
        SmartphonePortalUtils.updateInputs(".portal-parameters", portalUI.css);
      }

      // Init css editor
      ace.require("ace/ext/language_tools");
      var editor = ace.edit($(".portal-custom-css").attr("id"));
      editor.getSession().setMode("ace/mode/css");
      editor.setAutoScrollEditorIntoView(true);
      editor.getSession().setTabSize(2);
      editor.getSession().setUseSoftTabs(true);
      editor.setOption("maxLines", 30);
      editor.setOption("minLines", 10);
      editor.setOption("enableBasicAutocompletion", true);

      editor.getSession().on("change", function() {
        var changeValue = editor.getSession().getValue();
        $(".ace-custom-css").val(changeValue);
      });

      var jsEditor = ace.edit($(".portal-custom-js").attr("id"));
      jsEditor.getSession().setMode("ace/mode/javascript");
      jsEditor.setAutoScrollEditorIntoView(true);
      jsEditor.getSession().setTabSize(2);
      jsEditor.getSession().setUseSoftTabs(true);
      jsEditor.setOption("maxLines", 30);
      jsEditor.setOption("minLines", 10);
      jsEditor.setOption("enableBasicAutocompletion", true);

      jsEditor.getSession().on("change", function() {
        var changeValue = jsEditor.getSession().getValue();
        $(".ace-custom-js").val(changeValue);
      });
    },

    updateInputs: function(target, json) {
      try {
        $.each(json, function(key, value) {
          if (
            typeof value === "boolean" ||
            value == "true" ||
            value == "false"
          ) {
            if ($(target + " INPUT[name='" + key + "']").length > 1) {
              // Radio box
              $(
                target + " INPUT[name='" + key + "'][value='" + value + "']"
              ).prop("checked", true);
            } else {
              // Checkbox
              $(target + " INPUT[name='" + key + "']").prop("checked", value);
            }
          } else if ($(target + " INPUT[name='" + key + "']").length) {
            var targetTest = $(target + " INPUT[name='" + key + "']");
            //checkbox list values
            if (
              targetTest.length > 1 &&
              targetTest[0].type == "checkbox" &&
              !SmartphonePortalUtils.isEmpty(value)
            ) {
              $(targetTest).each(function(index, element) {
                if (value.indexOf(element.value) > -1) {
                  $(element).prop("checked", true);
                }
              });
            } else {
              $(target + " INPUT[name='" + key + "']").val(value);
            }
          } else if (
            $(target + " SELECT[name='" + key + "']").length &&
            value != null
          ) {
            $(target + " SELECT[name='" + key + "']").val(value);
          } else if ($(target + " TEXTAREA[name='" + key + "']").length) {
            $(target + " TEXTAREA[name='" + key + "']").val(value);
          }
        });
      } catch (e) {
        $.console.log(e);
      }
    },

    isEmpty: function(value) {
      if (
        value == null ||
        value == "" ||
        value == " " ||
        value == undefined ||
        value == "null"
      ) {
        return true;
      }
      return false;
    },

    updatePortalParametersFromSidebar: function() {
      // SmartphonePortal UI Object
      SmartphonePortalUtils.updateJsonDataFromSidebar(
        ".portal-parameters",
        smartphonePortal,
        "jalios-ui"
      );
      // Save CSS properties
      SmartphonePortalUtils.updateJsonCssDataFromSidebar(
        ".portal-parameters",
        smartphonePortal
      );
      SmartphonePortalUtils.triggerSavePortalTimer();
    },

    triggerSavePortalTimer: function() {
      if (SmartphonePortalUtils.saveTimer) {
        clearTimeout(SmartphonePortalUtils.saveTimer);
      }
      SmartphonePortalUtils.saveTimer = setTimeout(
        SmartphonePortalUtils.savePortal,
        2000
      );
    },

    // Create JSON of given object
    updateJsonDataFromSidebar: function(selector, portalObject, dataName) {
      var dataObject;
      if (portalObject.$element.data(dataName)) {
        dataObject = portalObject.$element.data(dataName);
      } else {
        dataObject = {};
      }

      // Find all input value, exclude css properties
      $(selector)
        .find("INPUT, SELECT, TEXTAREA")
        .not(".portal-css")
        .each(function(index, element) {
          var attrName = $(element).attr("NAME");
          var attrType = $(element).attr("TYPE");
          if (!SmartphonePortalUtils.isEmpty(attrName)) {
            if (attrType == "radio" && $(element).prop("checked")) {
              dataObject[attrName] = $(element).val();
            } else if (attrType == "checkbox") {
              var checkboxNumber = $(
                "INPUT[type='checkbox'][name='" + attrName + "']"
              ).length;
              if (checkboxNumber > 1) {
                var currentTable = dataObject[attrName];
                if (SmartphonePortalUtils.isEmpty(currentTable)) {
                  currentTable = [];
                }
                var $element = $(element);
                var valueIndex = currentTable.indexOf($element.val());
                if (valueIndex == -1 && $element.is(":checked")) {
                  currentTable.push($(element).val());
                  dataObject[attrName] = currentTable;
                } else if (valueIndex > -1 && !$element.is(":checked")) {
                  currentTable.splice(valueIndex, 1);
                }
              } else {
                dataObject[attrName] = $(element).is(":checked");
              }
            } else if (attrType != "radio") {
              dataObject[attrName] = $(element).val();
            }
          }
        });

      portalObject.$element.data(dataName, dataObject);
      return dataObject;
    },

    // Agregate all css properties in JSON
    updateJsonCssDataFromSidebar: function(target, elem) {
      var css = {};
      $(target + " .portal-css").each(function(index, element) {
        var attrName = $(element).attr("NAME");
        css[attrName] = $(element).val();
      });
      var uiData = elem.$element.data("jalios-ui");
      uiData = uiData || {};
      uiData["css"] = css;
      elem.$element.data("jalios-ui", uiData);
    },

    getStructure: function() {
      let portalStructure = {};
      portalStructure.portlets = smartphonePortal.getAllportlets();
      portalStructure.ui = smartphonePortal.getUI();
      return JSON.stringify(portalStructure);
    },

    savePortal: function(callback) {
      clearTimeout(SmartphonePortalUtils.saveTimer);

      let structure = SmartphonePortalUtils.getStructure();

      // Only update if structure changed
      if (structure === smartphonePortal.structure) {
        return;
      }

      // If the structure changed update it
      smartphonePortal.structure = structure;
      $.plugin.SmartphonePortalApp.service.getInstance().savePortalStructure(
        smartphonePortal.getId(),
        structure,
        function(result) {
          if (callback) {
            callback();
          }
          SmartphonePortalUtils.updatePreview();
          var dateFormat = $.jalios.ui.Widget.Date.getDateFormat();
          var formatedDate = moment(new Date()).format(dateFormat);
          smartphonePortal.updateLastSaveDate(formatedDate);
        },
        function(result) {}
      );
    },

    updatePreview: function() {
      let $iframe = $("#smartphone-portal-preview");
      $(".edition-real").displayLoading();
      $iframe[0].src = $iframe[0].src;
    }
  };

  // =======================================================================
  // ********************** SmartphoneBlock *****************************************
  // =======================================================================
  var SmartphonePortlet = function(type, name, $emptyElement) {
    this.type = type;
    this.name = name;
    this.$element = SmartphonePortalUtils.createEmptyPortlet(this.name);
    $emptyElement.replaceWith(this.$element);
    this.updateElementData();
    this.registerEvents();
    this.isEmpty = true;
  };

  SmartphonePortlet.prototype.getType = function() {
    return this.type;
  };

  SmartphonePortlet.prototype.getPortletId = function() {
    return this.portletId;
  };

  SmartphonePortlet.prototype.updatePortlet = function(portletId, name, image) {
    this.isEmpty = false;
    this.portletId = portletId;
    this.name = name;
    this.image = image;
    let $portlet = SmartphonePortalUtils.createPortlet(portletId, name, image);
    this.$element.replaceWith($portlet);
    this.$element = $portlet;
    this.updateElementData();
    this.registerEvents();
  };

  SmartphonePortlet.prototype.updatePreview = function(portletId, name, image) {
    // Keep current image if null
    if (SmartphonePortalUtils.isEmpty(image)) {
      image = this.image;
    }
    this.updatePortlet(portletId, name, image);
    SmartphonePortalUtils.savePortal();
  };

  SmartphonePortlet.prototype.registerEvents = function() {
    let that = this;
    this.$element.find(".js-portlet-delete").on("click", function(event) {
      $.jalios.ui.Modal.confirm(
        $(event.currentTarget).data("jalios-confirm-text"),
        function() {
          that.remove();
          smartphonePortal.initSortDrop();
          SmartphonePortalUtils.savePortal();

          // Only refresh sidebar if portlet is empty (currently in edition)
          if (that.isEmpty) {
            $.plugin.SmartphonePortalApp.triggerEvent("cancelPortlet");
          }
        }
      );
    });
  };

  SmartphonePortlet.prototype.remove = function() {
    this.$element.remove();
    smartphonePortal.initSortDrop();
  };

  SmartphonePortlet.prototype.getElement = function() {
    return this.$element;
  };

  SmartphonePortlet.prototype.updateElementData = function() {
    this.$element.data("smartphone-portlet", this);
  };

  // =======================================================================
  // ********************** SmartphonePortal *****************************************
  // =======================================================================
  var SmartphonePortal = function(element) {
    this.$element = $(element);
    this.init();
  };

  SmartphonePortal.prototype.init = function() {
    let that = this;
    this.isInitialized = false;
    this.displayOverlay();
    this.handlePendingOverlay(600);
    this.$editionBlocksBody = this.$element.find(".edition-blocks-body");
    this.$editionBlocks = this.$element.find(".edition-blocks");
    this.id = this.$element.data("jalios-portal-id");
    $.plugin.SmartphonePortalApp.service.getInstance().getPortalStructure(
      this.getId(),
      function(result) {
        if (result && result.data && result.data.portlets) {
          that.addPortlets(result.data.portlets);
        }
        that.initSortDrop();
        that.registerEvents();

        SmartphonePortalUtils.updatePortalSidebarInputs();
        that.isInitialized = true;

        that.structure = SmartphonePortalUtils.getStructure();
        // Remove any existing loading
        $("#smartphone-portal-preview").on("load", function() {
          $(".edition-real .ajax-loading").remove();
        });
      },
      function(error) {
        // TODO Handle loading error
      }
    );
  };

  SmartphonePortal.prototype.registerEvents = function() {
    let that = this;
    $(document).on("jalios:refresh", function(event) {
      if (
        event.refresh &&
        event.refresh.type == "after" &&
        event.refresh.options
      ) {
        var options = event.refresh.options;
        if (options.params && options.params.opUpdate == "true") {
          // If it's an update and we got a title, update of portlet so we update preview even if structure didn't change
          if (options.params.title) {
            SmartphonePortalUtils.updatePreview();
          }
          if (options.params.portalStructureId) {
            // Rename history item
            $(".history-selected .portal-history-item-title").text(
              options.params.customTitle
            );
            // Close Modal
            $.jalios.ui.Modal.close(true);
          }
        }

        if (
          options.params &&
          (options.params.returnToSidebarHome ||
            options.params.opUpdate == "true")
        ) {
          that.initSortDrop();
          SmartphonePortalUtils.updatePortalSidebarInputs();
        }
      }
    });

    $(document).on("click", "[data-smartphone-portal-action]", function(event) {
      let $target = $(event.currentTarget);
      let action = $target.data("smartphone-portal-action");
      switch (action) {
        case "display-history":
          that.displayHistory();
          break;
        case "remove-history":
          that.removeHistory();
          break;

        case "rename-history":
          that.openRenameVersionModal();
          break;
        case "history-revert":
          that.revertToOldVersion();
          break;
        case "load-history-item":
          that.loadHistoryItem($target);
          break;
        default:
      }
    });

    // Portal UI change handler
    $(document).on("change paste keyup", ".portal-parameters :input", function(
      event
    ) {
      SmartphonePortalUtils.updatePortalParametersFromSidebar();
    });
  };

  SmartphonePortal.prototype.getUI = function() {
    let ui = this.$element.data("jalios-ui");
    if (ui === "") {
      ui = null;
    }
    return ui;
  };

  SmartphonePortal.prototype.revertToOldVersion = function() {
    event.preventDefault();
    event.stopPropagation();

    let that = this;
    $.jalios.ui.Modal.confirm(
      $("#portalHistoryIframe").data("jalios-confirm-text"),
      function() {
        let structureId = $(
          ".portal-revert-form INPUT[name='structureId']"
        ).val();
        $.plugin.SmartphonePortalApp.service
          .getInstance()
          .revertPortalStructure(
            smartphonePortal.getId(),
            structureId,
            function(result) {
              // reload the portal editor page
              window.location = window.location;
            },
            function(error) {
              console.log("errror");
            }
          );
      }
    );
  };

  SmartphonePortal.prototype.openRenameVersionModal = function() {
    event.preventDefault();
    event.stopPropagation();
    let url =
      "plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalHistoryVersionRenameModal.jsp?portalStructureId=";
    let structureId = $(".portal-revert-form INPUT[name='structureId']").val();
    url += structureId;
    $.jalios.ui.Modal.openFromUrl(url);
  };

  SmartphonePortal.prototype.loadHistoryItem = function($target) {
    $(".portal-history-revert").attr("disabled", "disabled");
    $(".portal-history-item").removeClass("history-selected");

    var structureId = $target.data("jalios-structure-id");
    var portalUrl = $target.data("jalios-portal-url");

    $target.addClass("history-selected");
    $(".js-portal-version-rename").attr(
      "href",
      "plugins/SmartphonePlugin/jsp/portalEditor/doSmartphonePortalHistoryVersionRenameModal.jsp?portalStructureId=" +
        structureId
    );
    $("#portalHistoryIframe").off("load");
    $("#portalHistoryIframe").on("load", function() {
      $(".portal-history-revert").removeAttr("disabled");
    });
    $("#portalHistoryIframe").attr("src", portalUrl);
    $(".portal-revert-form INPUT[name='structureId']").val(structureId);
  };

  SmartphonePortal.prototype.updateLastSaveDate = function(formatedDate) {
    let $saveDate = this.$element.find(".portal-last-save-date");
    $saveDate.text(formatedDate);
    $saveDate.removeClass("hide");
  };

  SmartphonePortal.prototype.displayHistory = function() {
    let that = this;
    this.displayOverlay();

    $.ajax({
      url: "plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalHistory.jsp",
      method: "post",
      data: {
        smartphonePortalId: that.getId()
      }
    }).done(function(data) {
      $("BODY").append(data);
      that.scrollTop();
      $("BODY").addClass("portal-history-active");
      $(".portal-history-item")
        .first()
        .addClass("history-selected");
      $("#portalHistoryIframe").one("load", function() {
        that.hideOverlay();
      });
    });
  };

  SmartphonePortal.prototype.removeHistory = function() {
    $(".portal-history").remove();
    $("BODY").removeClass("portal-history-active");
  };

  SmartphonePortal.prototype.scrollTop = function() {
    this.$element.scrollTop(0);
    window.scrollTo(0, 0);
  };

  SmartphonePortal.prototype.handlePendingOverlay = function(time) {
    let that = this;
    setTimeout(function() {
      if (that.isInitialized) {
        //$(".sidebar-overlay").removeClass("is-first-load");
        $(".mobile-portal-edition").removeClass("hide");

        //Remove Overlay
        that.hideOverlay();
      } else {
        that.handlePendingOverlay(200);
      }
    }, time);
  };

  SmartphonePortal.prototype.displayOverlay = function() {
    $("BODY").addClass("portal-overlay-active");
    var $overlay = $(".portal-overlay");
    $overlay.removeClass("hide").addClass("is-active");
  };

  SmartphonePortal.prototype.hideOverlay = function() {
    $("BODY").removeClass("portal-overlay-active");
    var $overlay = $(".portal-overlay");
    $overlay.one($.support.transition.end, function() {
      $overlay.addClass("hide");
    });
    $overlay.removeClass("is-active");
  };

  SmartphonePortal.prototype.addPortlets = function(portlets) {
    if (portlets == undefined || portlets == null) {
      return;
    }
    let that = this;
    portlets.forEach(function(portlet) {
      that.addPortlet(portlet);
    });
  };

  SmartphonePortal.prototype.addPortlet = function(portlet) {
    let $element = this.createEmptyElement();
    let smartphonePortlet = new SmartphonePortlet("", "", $element);
    smartphonePortlet.updatePortlet(portlet.id, portlet.title, portlet.image);
  };

  SmartphonePortal.prototype.getId = function() {
    return this.id;
  };

  SmartphonePortal.prototype.getAllportlets = function() {
    let portlets = [];
    this.$element.find(".portlet-block").each(function(index, elem) {
      let smartphonePortlet = $(elem).data("smartphonePortlet");
      if (smartphonePortlet && smartphonePortlet.getPortletId()) {
        let portlet = {};
        portlet.id = smartphonePortlet.getPortletId();
        portlets.push(portlet);
      }
    });

    return portlets;
  };

  SmartphonePortal.prototype.initSortDrop = function() {
    this.initSortable();
    this.initDragable();
  };

  SmartphonePortal.prototype.getActiveSmartphonePortlet = function() {
    return this.activePortlet;
  };

  SmartphonePortal.prototype.initSortable = function() {
    let that = this;
    this.$editionBlocksBody.sortable({
      receive: function(event, ui) {
        let typeName = ui.item.find(".js-type-name").text();
        let type = ui.item.data("jalios-jmobile-portlet-class");
        let emptySmartphonePortlet = new SmartphonePortlet(
          type,
          typeName,
          ui.helper
        );
        that.setActivePortlet(emptySmartphonePortlet);
        SmartphonePortalUtils.triggerCreatePortletEvent(emptySmartphonePortlet);
      },
      placeholder: "sortable-placeholder",
      tolerance: "pointer",
      stop: function(event, ui) {
        SmartphonePortalUtils.savePortal();
      }
    });
  };

  SmartphonePortal.prototype.setActivePortlet = function(smartphonePortlet) {
    // If we have a current active portlet who is empty, remove it
    if (this.activePortlet && this.activePortlet.isEmpty) {
      this.activePortlet.remove();
    }
    this.activePortlet = smartphonePortlet;
  };

  SmartphonePortal.prototype.initDragable = function() {
    this.$element.find(".js-smartphone-portlet").draggable({
      connectToSortable: ".edition-blocks-body",
      cursorAt: {
        left: 206,
        top: 25
      },
      appendTo: "BODY",
      helper: function() {
        return "<div class='smartphone-portlet-helper'></div>";
      }
    });
  };

  SmartphonePortal.prototype.createEmptyElement = function() {
    let $element = $("<div>");
    this.$editionBlocksBody.append($element);
    return $element;
  };

  // =======================================================================
  // ********************** DOCUMENT READY *********************************
  // =======================================================================
  $(document).ready(function() {
    init();
    $("BODY").addClass("is-sidebar-opened");
  });
})(jQuery, window, document);
