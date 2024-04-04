(function ($, window, document, undefined) {
  // =======================================================================
  // ********************** VARIABLES **************************
  // =======================================================================
  var jportal, utils;

  // =======================================================================
  // ********************** CONSTANTS **************************
  // =======================================================================
  var EVENT_JPORTLET_UPDATE = 'JPORTLET_UPDATE';

  var JPORTAL_COMPONENT_TYPE_JBLOCK = 'LAYOUT_JBLOCK',
    JPORTAL_DATA_COMPONENT_TYPE_PORTLET = 'PORTLET',
    JPORTAL_DATA_COMPONENT_TYPE = 'jalios-jportal-component-type',
    JPORTAL_DATA_COMPONENT_ID = 'jalios-jportal-component-id';

  var GRID_SIZE = 12,
    GRID_COL_MD_PREFIX = 'col-md-',
    GRID_COL_DEFAULT_PREFIX = GRID_COL_MD_PREFIX,
    GRID_PREFIX_REGEX = new RegExp('^' + GRID_COL_MD_PREFIX, 'gi');

  var _inputTimeout = null;

  // =======================================================================
  // ********************** INIT **************************
  // =======================================================================

  var initComponents = function () {
    jportal = new JPortal($('.jportal-wrapper'));
    jportal.initJBlocks();
    jportal.updateUi();
    JPortalUtils.updateJPortalCustomCss();
  };

  // =======================================================================
  // ********************** DRAG / DROP / RESIZE **************************
  // =======================================================================
  const initDraggableAndDroppable = function () {
    initDraggable();
    initDroppable();
    initResizable();
  };

  var initResizable = function () {
    $('.ui-resizable-handle').remove();
    var resizableEl = $('.jportal-block').not(':last-child'),
      columnWidth,
      fullWidth,
      totalCol,
      maxColumn;

    resizableEl.resizable({
      handles: 'e',
      start: function (event, ui) {
        $('.jportal-block').addClass('no-jblock-transition');
        var target = ui.element;
        var next = target.next();
        var jblockTarget = $(target).data('jalios-jblock');
        var jblockNext = $(next).data('jalios-jblock');
        var targetCol = jblockTarget.getBlockSize(GRID_COL_DEFAULT_PREFIX),
          nextCol = jblockNext.getBlockSize(GRID_COL_DEFAULT_PREFIX);
        fullWidth = $(ui.element).closest('.jportal-block-line').width();
        columnWidth = fullWidth / GRID_SIZE;
        totalCol = targetCol + nextCol;
        maxColumn = totalCol - 2;
        $(target).resizable('option', 'grid', [columnWidth, 0]);
      },
      resize: function (event, ui) {
        var target = ui.element,
          next = target.next(),
          targetColumnCount = Math.ceil(target.width() / columnWidth);

        targetColumnCount = targetColumnCount >= maxColumn ? maxColumn : targetColumnCount;
        targetColumnCount = targetColumnCount < 2 ? 2 : targetColumnCount;
        var nextColumnCount = totalCol - targetColumnCount;

        $(target).data('jalios-jblock').updateSize(targetColumnCount);
        $(target).css('width', '');
        $(next).data('jalios-jblock').updateSize(nextColumnCount);
        elementQuery();
      },

      stop: function (event, ui) {
        jportal.registerNewAction();
        $('.jportal-block').removeClass('no-jblock-transition');
      }
    });
  };

  var $dragClone;

  var initDraggable = function () {
    $('.jportal-block:not(.jportal-block-main)').draggable({
      handle: '.jportal-block-header',
      appendTo: 'body',
      start: function (_event, ui) {
        $dragClone = ui.helper.clone();
        $dragClone.addClass('jblock-helper-clone');
        $('BODY').prepend($dragClone);
      },
      drag: function (e, ui) {
        $dragClone.css('left', ui.helper.offset().left);
        $dragClone.css('top', ui.helper.offset().top);
      },
      stop: function (_event, _ui) {
        $('.jblock-helper-clone').remove();
      },
      containment: 'body',
      scrollSensitivity: 100,
      scrollSpeed: 30,
      appendTo: '.jportal-wrapper',
      helper: function () {
        return "<div class='jblock-helper'></div>";
      },
      cursorAt: {
        left: 20,
        top: 5
      },
      cursor: 'move'
    });

    $('.is-draggable').draggable({
      cursorAt: {
        left: 20,
        top: 5
      },
      containment: 'body',
      refreshPositions: true,
      appendTo: '.jportal-wrapper',
      scrollSensitivity: 100,
      scrollSpeed: 30,
      helper: function () {
        return "<div class='jblock-helper'></div>";
      },
      cursor: 'move',
      start: function (_e, ui) {
        $dragClone = ui.helper.clone();
        $dragClone.addClass('jblock-helper-clone');
        $('BODY').prepend($dragClone);
      },

      drag: function (_e, ui) {
        $dragClone.css('left', ui.helper.offset().left);
        $dragClone.css('top', ui.helper.offset().top);
      },
      stop: function (_event, _ui) {
        $('.jblock-helper-clone').remove();
      }
    });
  };

  var initDroppable = function () {
    $('.jportal-drop-block').droppable({
      accept: '.jportal-component, .jportal-block',
      over: function (event, ui) {
        $(this).addClass('jblock-drag-over');
      },
      out: function (event, ui) {
        $(this).removeClass('jblock-drag-over');
      },
      drop: onBlockDroppedHandler,
      tolerance: 'pointer'
    });
  };

  // =======================================================================
  // ********************** EVENTS *****************************************
  // =======================================================================
  const onJPortalHistoryLinkClickHandler = function (event) {
    jportal.displayOverlay();
    JPortalUtils.saveStructure(function () {
      $.ajax({
        url: 'jcore/jportal/history/jportalHistory.jsp',
        method: 'post',
        data: {
          jPortal: jportal.getId()
        }
      }).done(function (data) {
        $('BODY').append(data);
        jportal.scrollTop();
        $('BODY').addClass('jportal-history-active');
        $('.jportal-history-item').first().addClass('history-selected');
        $('#jportalHistoryIframe').one('load', function () {
          jportal.hideOverlay();
        });
      });
    });
  };

  const onJPortalShowPreviewNewWindowClickHandler = function (event) {
    $(event.currentTarget).tooltip('hide');
  };

  const onJPortalShowPreviewClickHandler = function (event) {
    event.stopPropagation();
    event.preventDefault();
    jportal.displayOverlay();
    JPortalUtils.saveStructure(function () {
      $.ajax({
        url: 'jcore/jportal/preview/jportalPreview.jsp',
        method: 'post',
        data: {
          jPortal: jportal.getId()
        }
      }).done(function (data) {
        $('BODY').append(data);
        jportal.scrollTop();
        $('BODY').addClass('jportal-preview-active');
        $('#jportalPreviewIframe').one('load', function () {
          jportal.hideOverlay();
        });
      });
    });
  };

  const onJPortalHistoryCloseClickHandler = function (event) {
    $('.jportal-history').remove();
    $('BODY').removeClass('jportal-history-active');
  };

  const onJportalPreviewCloseHandler = function (event) {
    if($('BODY').hasClass('jportal-preview-active')){
      event.preventDefault();
      $('.jportal-preview').remove();
      $('BODY').removeClass('jportal-preview-active');
    }
  };

  const onJPortalHistoryItemClickHandler = function (event) {
    $('.jportal-history-revert').attr('disabled', 'disabled');
    $('.jportal-history-item').removeClass('history-selected');
    var $target = $(event.target).closest('.jportal-history-item');
    var structureId = $target.data('jalios-structure-id');
    var jportalUrl = $target.data('jalios-jportal-url');

    $target.addClass('history-selected');
    $('.js-jportal-version-rename').attr(
      'href',
      'jcore/jportal/history/doJPortalHistoryVersionRenameModal.jsp?jportalStructureId=' + structureId
    );
    $('#jportalHistoryIframe').off('load');
    $('#jportalHistoryIframe').on('load', function () {
      $('.jportal-history-revert').removeAttr('disabled');
    });
    $('#jportalHistoryIframe').attr('src', jportalUrl + '?preview=true&structureId=' + structureId);
    $(".jportal-revert-form INPUT[name='structureId']").val(structureId);
  };

  const onPortletSelectionHandler = function (event) {
    jportal.resetSidebar();

    let currentEditedBlock = jportal.getCurrentEditedPortletBlock();
    if (!currentEditedBlock || currentEditedBlock.removed) {
      return;
    }

    // var $targetDrop = $(event.target);
    let portletId = $(event.currentTarget).data(JPORTAL_DATA_COMPONENT_ID);
    if (!portletId) {
      return;
    }
    let componentTitle = $(event.currentTarget).find('.jportal-component-label').text();

    // Update title and portlet id
    currentEditedBlock.setJPortlet(portletId, componentTitle);
    if (jportal.isShowContentMode()) {
      currentEditedBlock.loadPortlet();
    }

    jportal.setCurrentEditedBlockPicked();
    jportal.registerNewAction();
  };

  const onSaveJPortalStructureClickHandler = function (event) {
    JPortalUtils.saveStructure();
  };

  const onJPortalHistoryRevertClickHandler = function (event) {
    event.preventDefault();
    event.stopPropagation();
    $.jalios.ui.Modal.confirm($('#jportalHistoryIframe').data('jalios-confirm-text'), function () {
      $('.jportal-revert-form').submit();
    });
  };
  var onToggleJPortletContentClickHandler = function (event) {
    jportal.toggleJPortletContent();
  };

  var onJPortletUiChangeHandler = function (event) {
    var blockId = $('.jportlet-sidebar').data('block-id');
    var jblock;
    if (blockId) {
      jblock = JPortalUtils.getJBlockFromId(blockId);
    } else {
      jblock = jportal.getMainJBlock();
    }

    JPortalUtils.updateJBlockParametersFromSidebar(jblock);
  };

  var onJPortalUiChangeHandler = function (event) {
    // Ignore any event from a form
    if ($(event.currentTarget).closest('form').length) {
      return;
    }
    JPortalUtils.updateJPortalParametersFromSidebar();
  };

  var onJaliosRefreshHandler = function (event) {
    var $updateStatus;
    if (event.refresh.type == 'before') {
      // if ($(event.refresh.options.trigger).hasClass("btn-jportal-publish")) {
      //   jportal.displayOverlay();
      // }
    }
    if (event.refresh.type == 'after') {
      $updateStatus = $(event.refresh.target);
      if ($updateStatus.hasClass('jportal-editor-sidebar') && jportal) {
        if (
          event.refresh.options &&
          event.refresh.options.params &&
          !event.refresh.options.params['portletClassName']
        ) {
          jportal.removeCurrentEditedPortletBlock();
        }
      }
      if (
        $updateStatus.hasClass('portlet-list') ||
        $updateStatus.hasClass('jportal-editor-sidebar') ||
        $updateStatus.hasClass('jportal-sidebar')
      ) {
        initDraggable();
        if (event.refresh.options.params.blockId) {
          // Opening of jportlet sidebar editor, update fields value from json data on jportlet
          JPortalUtils.updateComponentSidebarInputs('.jportal-editor-sidebar');
          JPortalUtils.displayOverlayAroundJBlock(event.refresh.options.params.blockId);
        } else {
          JPortalUtils.removeOverlayAroundJBlock();
          JPortalUtils.updateJPortalSidebarInputs();
          // Reset scrollbar
          jportal.resetSidebarScrollbar();
        }
        jportal.isInitialized = true;
      }

      var updateOptions = event.refresh.options;
      if (
        updateOptions &&
        updateOptions.params &&
        updateOptions.params.opUpdate == 'true' &&
        updateOptions.params.jportalStructureId
      ) {
        // Rename history item
        $('.history-selected .jportal-history-item-title').text(updateOptions.params.customTitle);
        // Close Modal
        $.jalios.ui.Modal.close(true);
      }
    }
  };

  const onJPortletDropHandler = function (event, $component) {
    let portletClassName = $component.data('jaliosPortletClassname');

    jportal.displaySidebarLoading();
    // Refresh sidebar
    $('.jportal-editor-sidebar')
      .data('sidebar')
      .open({
        url:
          'jcore/jportal/commonSidebar/doJPortalSidebar.jsp?portletClassName=' +
          portletClassName +
          '&jPortal=' +
          jportal.getId() +
          '&displayReturnCaret=true'
      });

    var $targetDrop = $(event.target);
    var block = JPortalUtils.createBlock(12);
    let jblock;

    // New JBlock dropped on a line
    if ($targetDrop.parent().hasClass('jportal-block-line')) {
      jblock = JPortalUtils.addJBlockOnLineTargetDrop($targetDrop, block);
    } else if ($targetDrop.hasClass('drop-center')) {
      jblock = JPortalUtils.addJBlockOnCenterTargetDrop($targetDrop, block);
    } else {
      jblock = JPortalUtils.addJBlockOnSideTargetDrop($targetDrop, block);
    }

    // Transform jblock as portlet placeholder
    jblock.updateAsPortletPlaceholder($component);
    jportal.setCurrentEditedPortletBlock(jblock);
  };

  var onJBlockDropHandler = function (event, ui) {
    var $targetDrop = $(event.target);
    var block = JPortalUtils.createBlock(12);
    var targetBlock, targetJBlock, jblock, targetLine;

    // New JBlock dropped on a line
    if ($targetDrop.parent().hasClass('jportal-block-line')) {
      JPortalUtils.addJBlockOnLineTargetDrop($targetDrop, block);
    } else if ($targetDrop.hasClass('drop-center')) {
      JPortalUtils.addJBlockOnCenterTargetDrop($targetDrop, block);
    } else {
      JPortalUtils.addJBlockOnSideTargetDrop($targetDrop, block);
    }

    jportal.registerNewAction();
  };

  const onComponentDroppedHandler = function (event, ui) {
    var $component = $(ui.draggable);
    if ($component.data(JPORTAL_DATA_COMPONENT_TYPE) === JPORTAL_DATA_COMPONENT_TYPE_PORTLET) {
      onJPortletDropHandler(event, $component);
    } else if ($component.data(JPORTAL_DATA_COMPONENT_TYPE) === JPORTAL_COMPONENT_TYPE_JBLOCK) {
      onJBlockDropHandler(event, ui);
      jportal.registerNewAction();
    }
  };

  const onJblockDroppedHandler = function (event, ui) {
    var jblock = ui.draggable.data('jalios-jblock');
    var currentLine = $(ui.draggable).closest('.jportal-block-line');
    var targetDrop = $(event.target);
    var targetLine = $(targetDrop).closest('.jportal-block-line');
    var targetBlock = $(targetDrop).closest('.jportal-block');
    var targetJBlock = $(targetBlock).data('jalios-jblock');
    var targetParentBlock = $(targetBlock).closest('.jportal-block-line').parent();
    var targetParentJBlock = $(targetParentBlock).data('jalios-jblock');
    var currentParentBlock = ui.draggable.closest('.jportal-block-line').parent();
    var currentParentJBlock = $(currentParentBlock).data('jalios-jblock');

    $(ui.draggable).removeAttr('style');

    // DROPPED ON LINE
    if (targetDrop.hasClass('drop-center')) {
      // Remove drop center
      $(targetDrop).remove();
      // Add block
      $(targetBlock).append(ui.draggable);
      // Add virtual line on block
      targetJBlock.addVirtualLine();
      JPortalUtils.computeBlocksSize(targetBlock.find('.jportal-block-line:first'));
      JPortalUtils.computeBlocksSize(currentLine);
    } else if (targetDrop.parent().hasClass('jportal-block-line')) {
      var line = JPortalUtils.createLine();
      line.append(ui.draggable);
      if ($(targetDrop).hasClass('drop-top')) {
        $(line).insertBefore(targetLine);
      } else if ($(targetDrop).hasClass('drop-bottom')) {
        $(line).insertAfter(targetLine);
      }

      // Compute blocks size
      JPortalUtils.computeBlocksSize(currentLine);
      JPortalUtils.computeBlocksSize(line);
    } else {
      // DROPPED ON LEFT / RIGHT
      if ($(targetDrop).hasClass('drop-right')) {
        $(ui.draggable).insertAfter(targetBlock);
      } else if ($(targetDrop).hasClass('drop-left')) {
        $(ui.draggable).insertBefore(targetBlock);
      }
      // Compute blocks size
      if (!currentLine.is(targetLine)) {
        JPortalUtils.computeBlocksSize(currentLine);
        JPortalUtils.computeBlocksSize(targetLine);
      }
    }

    jportal.registerNewAction();
  };

  var onBlockDroppedHandler = function (event, ui) {
    $('.jportal-drop-block').removeClass('jblock-drag-over');

    if (ui.draggable.hasClass('jportal-component')) {
      onComponentDroppedHandler(event, ui);
    } else {
      onJblockDroppedHandler(event, ui);
    }
    initDraggableAndDroppable();
  };

  // =======================================================================
  // ********************** UTILITYS ***************************************
  // =======================================================================
  var addConstantPropertyOnObject = function (obj, constant_name, constant_value) {
    Object.defineProperty(JPortalTemplates, constant_name, {
      value: constant_value,
      writable: false,
      enumerable: true,
      configurable: true
    });
  };

  // =======================================================================
  // ***********************************************************************
  // ******************* JPORTAL OBJECTS ***********************************
  //* **********************************************************************
  // =======================================================================

  // =======================================================================
  // ********************** JPORTALTEMPLATE ********************************
  // =======================================================================
  var JPortalTemplates = {};
  addConstantPropertyOnObject(JPortalTemplates, 'JPORTAL_BLOCK', Handlebars.compile($('#jportal-block').html()));
  addConstantPropertyOnObject(
    JPortalTemplates,
    'JPORTAL_BLOCK_LINE',
    Handlebars.compile($('#jportal-block-line').html())
  );
  addConstantPropertyOnObject(JPortalTemplates, 'JPORTLET', Handlebars.compile($('#jportlet').html()));
  addConstantPropertyOnObject(
    JPortalTemplates,
    'JPORTAL_BLOCK_INNER_TEMPLATE',
    Handlebars.compile($('#jportal-block-inner-template').html())
  );

  addConstantPropertyOnObject(
    JPortalTemplates,
    'BLOCK_PORTLET_DROPDOWN_EDIT_ITEM',
    Handlebars.compile($('#block-portlet-dropdown-edit-item').html())
  );
  addConstantPropertyOnObject(
    JPortalTemplates,
    'JBLOCK_DROP_CENTER',
    Handlebars.compile($('#jblock-drop-center').html())
  );
  addConstantPropertyOnObject(
    JPortalTemplates,
    'JPORTAL_STRUCTURE',
    Handlebars.compile($('#jportal-structure').html())
  );

  // =======================================================================
  // ********************** JPORTALUTILS **********************************
  // =======================================================================
  var JPortalUtils = {
    // Custom css change
    customCssTimer: null,
    handleJPortalCustomCssChange: function () {
      if (JPortalUtils.customCssTimer != null) {
        clearTimeout(JPortalUtils.customCssTimer);
      }

      JPortalUtils.customCssTimer = setTimeout(function () {
        JPortalUtils.updateJPortalCustomCss();
      }, 1000);
    },

    getAnimationTime: function (animation) {
      if (animation == 'slow') {
        return 800;
      } else if (animation == 'default') {
        return 400;
      } else if (animation == 'fast') {
        return 200;
      }
      return 400;
    },

    isEmpty: function (value) {
      if (value == null || value == '' || value == ' ' || value == undefined || value == 'null') {
        return true;
      }
      return false;
    },

    updateTopbar: function (displayTopbar) {
      if (displayTopbar) {
        $('.topbar').removeClass('hide');
        $('.jportal-wrapper').addClass('is-topbar-displayed');
      } else {
        $('.topbar').addClass('hide');
        $('.jportal-wrapper').removeClass('is-topbar-displayed');
      }
    },

    updateJPortalCustomCss: function () {
      // Search <style> for given jblock and remove it
      var $style = $("style[data-id='" + jportal.getId() + "']");
      if ($style.length) {
        $style.remove();
      }
      // Add new <style> with custom css in DOM
      $("<style type='text/css' data-id='" + jportal.getId() + "'>" + jportal.getCustomCss() + '</style>').appendTo(
        'head'
      );
    },
    // Handle block selection
    removeOtherSelectionIfBlockIsSelection: function (jblock) {
      if (jblock.getOptions()) {
        var options = jblock.getOptions();
        if (options.isPortletSelection === 'true') {
          // remove portlet selection css class on others block
          $('.jportal-block').each(function (index, element) {
            if ($(element).data('id') != jblock.getId()) {
              $(element).data('jalios-jblock').setPortletSelection(false);
            }
          });
        }
      }
    },
    triggerJPortalUpdateInStorage: function () {
      var structure = {};
      structure.data = new Date().getTime();
      structure.jportal = jportal.getId();
      localStorage['jportal.sync.preview.structure'] = JSON.stringify(structure);
    },

    // Takes input values from sidebar and add it as data on the jblock
    updateJBlockParametersFromSidebar: function (jblock) {
      // JBlock UI Object
      JPortalUtils._updateJsonDataFromSidebar('.jblock-ui', jblock, 'jalios-ui');
      // JBlock Options Object
      JPortalUtils._updateJsonDataFromSidebar('.jblock-options', jblock, 'jalios-options');
      // JBlock CSS properties
      JPortalUtils._updateJsonCssDataFromSidebar('.jportal-editor-sidebar', jblock);
      // JPortlet CSS initProperties
      JPortalUtils._updateJsonPortletCssDataFromSidebar('.jportal-editor-sidebar', jblock);
      // Handle Block selection
      JPortalUtils.removeOtherSelectionIfBlockIsSelection(jblock);
      JPortalUtils.displayOrHidePortletSectionHeadersOption(jblock);
      // Refresh jblock
      jblock.updateUi();

      // Trigger new action to save structure
      jportal.registerNewAction();
    },

    updateJPortalParametersFromSidebar: function () {
      // JPortal UI Object
      JPortalUtils._updateJsonDataFromSidebar('.jportal-parameters', jportal, 'jalios-ui');
      // Save CSS properties
      JPortalUtils._updateJsonCssDataFromSidebar('.jportal-parameters', jportal);
      // Update Custom CSS
      JPortalUtils.handleJPortalCustomCssChange();
      // Update jportal UI
      jportal.updateUi();
      // Trigger new action to save structure
      jportal.registerNewAction();
    },

    displayOrHidePortletSectionHeadersOption: function (jblock) {
      let isSelection = jblock.getOptions() && jblock.getOptions().isPortletSelection;
      if (isSelection === true || isSelection === 'true') {
        $('.js-selection-headers-toggle').show();
      } else {
        $('.js-selection-headers-toggle').hide();
      }
    },

    _updateChainedInputs: function () {
      $('.input-group-chained').each(function (index, element) {
        var inputValue = -1;
        var isSameInput = true;
        $(element)
          .find('.jblock-css')
          .each(function (i, e) {
            if (inputValue == -1) {
              inputValue = $(e).val();
            }
            var eVal = $(e).val();
            if (inputValue != eVal) {
              isSameInput = false;
            }
          });
        var $inputGroupAddon = $(element).find('.input-group-addon');
        if (isSameInput) {
          $inputGroupAddon.addClass('is-chained');
        } else {
          $inputGroupAddon.removeClass('is-chained');
        }
        $(element).find('.input-chainer').prop('checked', isSameInput);
      });
    },

    // Agregate all css properties in JSON
    _updateJsonCssDataFromSidebar: function (target, elem) {
      var css = {};
      $(target + ' .jblock-css').each(function (index, element) {
        var attrName = $(element).attr('NAME');
        css[attrName] = $(element).val();
      });
      var uiData = elem.$element.data('jalios-ui');
      uiData = uiData || {};
      uiData['css'] = css;
      elem.$element.data('jalios-ui', uiData);
    },

    // Agregate all css properties in JSON
    _updateJsonPortletCssDataFromSidebar: function (target, elem) {
      var css = {};
      $(target + ' .jportlet-css').each(function (index, element) {
        var attrName = $(element).attr('NAME');
        css[attrName] = $(element).val();
      });
      var jportletData = elem.$element.data('jalios-jportlet');
      jportletData = jportletData || {};
      jportletData.ui = jportletData.ui || {};
      jportletData.ui['css'] = css;
      elem.$element.data('jalios-jportlet', jportletData);
    },

    // Create JSON of given object
    _updateJsonDataFromSidebar: function (selector, jblock, dataName) {
      var dataObject;
      if (jblock.$element.data(dataName)) {
        dataObject = jblock.$element.data(dataName);
      } else {
        dataObject = {};
      }

      // Find all input value, exclude css properties
      $(selector)
        .find('INPUT, SELECT, TEXTAREA')
        .not('.jblock-css, .jportlet-css')
        .each(function (index, element) {
          var attrName = $(element).attr('NAME');
          var attrType = $(element).attr('TYPE');
          if (!JPortalUtils.isEmpty(attrName)) {
            if (attrType == 'radio' && $(element).prop('checked')) {
              dataObject[attrName] = $(element).val();
            } else if (attrType == 'checkbox') {
              var checkboxNumber = $("INPUT[type='checkbox'][name='" + attrName + "']").length;
              if (checkboxNumber > 1) {
                var currentTable = dataObject[attrName];
                if (JPortalUtils.isEmpty(currentTable)) {
                  currentTable = [];
                }
                var $element = $(element);
                var valueIndex = currentTable.indexOf($element.val());
                if (valueIndex == -1 && $element.is(':checked')) {
                  currentTable.push($(element).val());
                  dataObject[attrName] = currentTable;
                } else if (valueIndex > -1 && !$element.is(':checked')) {
                  currentTable.splice(valueIndex, 1);
                }
              } else {
                dataObject[attrName] = $(element).is(':checked');
              }
            } else if (attrType != 'radio') {
              dataObject[attrName] = $(element).val();
            }
          }
        });

      jblock.$element.data(dataName, dataObject);
      return dataObject;
    },

    updateJPortalSidebarInputs: function () {
      // Main Block
      var jblock = jportal.getMainJBlock();
      var ui = jblock.getUi();
      var options = jblock.getOptions();

      JPortalUtils._updateInputs('.jblock-parameters.jblock-ui', ui);
      if (ui != null) {
        JPortalUtils._updateInputs('.jblock-parameters', ui.css);
      }
      JPortalUtils._updateInputs('.jblock-parameters.jblock-options', options);

      // JPortal
      var jportalUi = jportal.getUi();
      JPortalUtils._updateInputs('.jportal-parameters', jportalUi);
      if (jportalUi != null) {
        JPortalUtils._updateInputs('.jportal-parameters', jportalUi.css);
      }

      // Init css editor

      ace.require('ace/ext/language_tools');
      var editor = ace.edit($('.jblock-custom-css').attr('id'));
      editor.getSession().setMode('ace/mode/css');
      editor.setAutoScrollEditorIntoView(true);
      editor.getSession().setTabSize(2);
      editor.getSession().setUseSoftTabs(true);
      editor.setOption('maxLines', 30);
      editor.setOption('minLines', 10);
      editor.setOption('enableBasicAutocompletion', true);

      editor.getSession().on('change', function () {
        var changeValue = editor.getSession().getValue();
        $('.ace-custom-css').val(changeValue);
      });

      var jsEditor = ace.edit($('.jblock-custom-js').attr('id'));
      jsEditor.getSession().setMode('ace/mode/javascript');
      jsEditor.setAutoScrollEditorIntoView(true);
      jsEditor.getSession().setTabSize(2);
      jsEditor.getSession().setUseSoftTabs(true);
      jsEditor.setOption('maxLines', 30);
      jsEditor.setOption('minLines', 10);
      jsEditor.setOption('enableBasicAutocompletion', true);

      jsEditor.getSession().on('change', function () {
        var changeValue = jsEditor.getSession().getValue();
        $('.ace-custom-js').val(changeValue);
      });
    },

    // Update sidebar inputs from jblock data values
    updateComponentSidebarInputs: function (target) {
      var blockId = $('.jportlet-sidebar').data('block-id');
      var jblock = JPortalUtils.getJBlockFromId(blockId);
      var ui = jblock.getUi();
      var jportletUi = jblock.getJPortletUi();
      var options = jblock.getOptions();

      JPortalUtils._updateInputs(target, ui);
      if (ui != null) {
        JPortalUtils._updateInputs(target, ui.css);
      }
      if (jportletUi) {
        JPortalUtils._updateInputs(target, jportletUi.css);
      }

      JPortalUtils._updateInputs(target, options);

      JPortalUtils._updateChainedInputs();

      // Show or hide display headers if block is selection or not
      JPortalUtils.displayOrHidePortletSectionHeadersOption(jblock);
    },

    _updateInputs: function (target, json) {
      try {
        $.each(json, function (key, value) {
          if (typeof value === 'boolean' || value == 'true' || value == 'false') {
            if ($(target + " INPUT[name='" + key + "']").length > 1) {
              // Radio box
              $(target + " INPUT[name='" + key + "'][value='" + value + "']").prop('checked', true);
            } else {
              // Checkbox
              $(target + " INPUT[name='" + key + "']").prop('checked', value);
            }
          } else if ($(target + " INPUT[name='" + key + "']").length) {
            var targetTest = $(target + " INPUT[name='" + key + "']");
            //checkbox list values
            if (targetTest.length > 1 && targetTest[0].type == 'checkbox' && !JPortalUtils.isEmpty(value)) {
              $(targetTest).each(function (index, element) {
                if (value.indexOf(element.value) > -1) {
                  $(element).prop('checked', true);
                }
              });
            } else {
              $(target + " INPUT[name='" + key + "']").val(value);
            }
          } else if ($(target + " SELECT[name='" + key + "']").length && value != null) {
            $(target + " SELECT[name='" + key + "']").val(value);
          } else if ($(target + " TEXTAREA[name='" + key + "']").length) {
            $(target + " TEXTAREA[name='" + key + "']").val(value);
          }
        });
      } catch (e) {
        $.console.log(e);
      }
    },

    getJBlockFromPortletId: function (portletId) {
      var jblock;
      $('.jportal-block').each(function (index, element) {
        jblock = $(element).data('jalios-jblock');
        var jblockPortletId = jblock.getPortletId();
        if (portletId === jblockPortletId) {
          return false;
        }
      });
      return jblock;
    },

    getJblockDefaultTitle: function () {
      return jportal.$element.find('.jportal-wrapper-inner').data('jalios-cell-title');
    },

    getJBlockFromId: function (blockId) {
      var jblock = null;
      $('.jportal-block').each(function (index, element) {
        if ($(element).data('id') == blockId) {
          jblock = $(element).data('jalios-jblock');
          return;
        }
      });
      return jblock;
    },

    displayOverlayAroundJBlock: function (blockId) {
      JPortalUtils.removeOverlayAroundJBlock();
      var jblock = JPortalUtils.getJBlockFromId(blockId);
      jblock.$element.addClass('jportal-block-overlay-edition');
    },

    removeOverlayAroundJBlock: function () {
      $('.jportal-block.jportal-block-overlay-edition').removeClass('jportal-block-overlay-edition');
    },

    computeBlocksSize: function (line) {
      // If we are initializing jportal, ignore computeBlocksSize
      if (!jportal.isInitialized) {
        return;
      }
      var parentBlock = $(line).closest('.jportal-block');
      var parentJBlock = $(parentBlock).data('jalios-jblock');

      // Get number of blocks
      var lineBlocks = $(line).find('> .jportal-block');
      if (lineBlocks.length == 0) {
        $(line).remove();
      } else {
        var blockNum = lineBlocks.length;
        if (blockNum != 0) {
          var blockSize = Math.floor(GRID_SIZE / blockNum);
          var lastBlockSize = blockSize;
          // If space remaining, add rest
          if (GRID_SIZE % blockNum !== 0) {
            lastBlockSize = blockSize + (GRID_SIZE % blockNum);
          }

          for (var i = 0; i < lineBlocks.length; i++) {
            var jblock = $(lineBlocks[i]).data('jalios-jblock');
            if (i == lineBlocks.length - 1) {
              jblock.updateSize(lastBlockSize);
            } else {
              jblock.updateSize(blockSize);
            }
          }
        }
      }

      if ($(parentBlock).find('.jportal-block-line').length == 0) {
        parentJBlock.addDNDArea();
      }
    },

    createBlock: function (blockSize, id) {
      var blockId = id == null ? JPortalUtils.generateRandomID() : id;
      var html = JPortalTemplates.JPORTAL_BLOCK({
        'grid-md-size': blockSize,
        'block-id': blockId
      });
      return $(html);
    },

    createStructure: function (structureType) {
      var html = JPortalTemplates.JPORTAL_STRUCTURE({
        'structure-type': structureType
      });

      return $(html);
    },

    createDropCenter: function () {
      var html = JPortalTemplates.JBLOCK_DROP_CENTER();
      return $(html);
    },

    createPortletMenu: function (portletId, blockId) {
      var html = JPortalTemplates.BLOCK_PORTLET_DROPDOWN_EDIT_ITEM({
        'portlet-id': portletId,
        'block-id': blockId
      });
      return $(html);
    },

    createBlockInnerTemplate: function (blockId) {
      var html = JPortalTemplates.JPORTAL_BLOCK_INNER_TEMPLATE({
        'block-id': blockId
      });
      return $(html);
    },

    createPortlet: function (title) {
      var html = JPortalTemplates.JPORTLET({
        title: title
      });
      return $(html);
    },

    createLine: function () {
      var html = JPortalTemplates.JPORTAL_BLOCK_LINE();
      return $(html);
    },

    addJBlockOnCenterTargetDrop: function ($targetDrop, block, ignoreBlockSize) {
      var targetBlock = $targetDrop.closest('.jportal-block');
      var targetJBlock = targetBlock.data('jalios-jblock');
      // Remove drop center
      $targetDrop.remove();
      // Add block
      targetBlock.append(block);
      jblock = new JBlock(block);
      jblock.addDNDArea();
      // Add virtual line on block
      targetJBlock.addVirtualLine();
      if (!ignoreBlockSize) {
        JPortalUtils.computeBlocksSize(targetBlock.find('.jportal-block-line:first'));
      }

      return jblock;
    },

    addJBlockOnLineTargetDrop: function ($targetDrop, block, ignoreBlockSize) {
      var targetLine = $targetDrop.closest('.jportal-block-line');
      var line = JPortalUtils.createLine();
      line.append($(block));
      if ($targetDrop.hasClass('drop-top')) {
        $(line).insertBefore(targetLine);
      } else if ($targetDrop.hasClass('drop-bottom')) {
        $(line).insertAfter(targetLine);
      }
      jblock = new JBlock(block);
      jblock.addDNDArea();
      if (!ignoreBlockSize) {
        JPortalUtils.computeBlocksSize(line);
      }
      return jblock;
    },

    addJBlockOnSideTargetDrop: function ($targetDrop, block, ignoreBlockSize) {
      var targetBlock = $targetDrop.closest('.jportal-block');
      var targetLine = $targetDrop.closest('.jportal-block-line');
      if ($targetDrop.hasClass('drop-right')) {
        $(block).insertAfter(targetBlock);
      } else if ($targetDrop.hasClass('drop-left')) {
        $(block).insertBefore(targetBlock);
      }
      jblock = new JBlock(block);
      jblock.addDNDArea();
      if (!ignoreBlockSize) {
        JPortalUtils.computeBlocksSize(targetLine);
      }
      return jblock;
    },

    saveStructure: function (callback) {
      if (!jportal.hasStructureChanged()) {
        if (typeof callback === 'function') {
          callback();
        }
        return;
      }

      if (jportal.saveTimer) {
        clearTimeout(jportal.saveTimer);
      }

      var newJson = jportal.convertDOMtoJSON();
      jportal.jsonStructure = JSON.stringify(newJson);

      $.ajax({
        url: 'jcore/jportal/action/saveJPortalStructure.jsp',
        method: 'post',
        data: {
          jPortal: jportal.id,
          jPortalStructure: jportal.jsonStructure,
          opSaveStructure: true
        }
      }).done(function (data) {
        if (data.actionStatus === 'OK') {
          $.console.log('Structure saved');
          toastr.success(data.message);

          // Show history button if first save
          $('.jportal-history-link').removeClass('hide');

          JPortalUtils.triggerJPortalUpdateInStorage();

          var dateFormat = $.jalios.ui.Widget.Date.getDateFormat();
          var formatedDate = moment(new Date()).format(dateFormat);
          $('.jportal-last-save-date').text(formatedDate);
          if (!jportal.hasStructureChanged()) {
            jportal.registerNewAction();
          }
        } else if (data.actionStatus === 'ERROR') {
          toastr.options = {
            positionClass: 'toast-top-center'
          };
          toastr.error(data.message);
          $.console.log('An error occured when saving JPortal Structure');
          $.console.log('actionStatus : ' + data.actionStatus + ', message : ' + data.message);
        }
        $.console.log(data);
        if (typeof callback === 'function') {
          callback();
        }
      });
    },

    generateRandomID: function () {
      return '_' + Math.random().toString(36).substr(2, 9);
    }
  };

  // =======================================================================
  // ********************** JBLOCK *****************************************
  // =======================================================================
  var JBlock = function (element) {
    this.setDefaultTitle(JPortalUtils.getJblockDefaultTitle());
    this.$element = $(element);
    if (!this.$element.data('id')) {
      this.$element.data('id', JPortalUtils.generateRandomID());
    }
    this.id = this.$element.data('id');
    this.init();
  };

  JBlock.prototype.destroyAnimation = function () {
    this.$element.removeAttr('data-aos');
    this.$element.removeAttr('data-aos-duration');
    this.$element.removeClass('aos-animate');
  };

  JBlock.prototype.init = function () {
    var that = this;
    this.$element.data('jalios-jblock', that);

    this.$element.prepend(JPortalUtils.createBlockInnerTemplate(that.id));

    // init sub JBlock
    this.$element.find(' > .jportal-block').each(function (index, element) {
      var jBlock = new JBlock(element);
    });

    this.addVirtualLine();

    if (this.$element.data('jalios-jportlet')) {
      var jportlet = this.$element.data('jalios-jportlet');
      if (jportlet.id != null) {
        this.setJPortlet(jportlet.id, jportlet.title);
      }
    }

    var deleteLink = this.$element.find('.jblock-delete:first');
    $(deleteLink).on('click', function (event) {
      // if current block doesn't have any children do not show confirm to user

      if (that.$element.find('.jportal-block').exists() || that.$element.hasClass('has-jportlet')) {
        $.jalios.ui.Modal.confirm($(deleteLink).data('jalios-confirm-text'), function () {
          that.$element.one($.support.transition.end, function (e) {
            that.remove();
            initDraggableAndDroppable();
            jportal.updateHeaderFooter();
            jportal.registerNewAction();
          });

          that.$element.find('.jportal-block-header').empty().css('height', '40px');
          that.$element.css('width', '0px');
        });
      } else {
        that.$element.one($.support.transition.end, function (e) {
          that.remove();
          initDraggableAndDroppable();
          jportal.updateHeaderFooter();
          jportal.registerNewAction();
        });

        that.$element.find('.jportal-block-header').empty().css('height', '40px');
        that.$element.css('width', '0px');
      }
    });

    this.updateUi();

    // On jportlet update, check if there's a portlet, and refresh it if
    // jportlet is in current block
    jportal.$element.on(EVENT_JPORTLET_UPDATE, function (event) {
      if (that.$element.data('jalios-jportlet')) {
        var jportlet = that.$element.data('jalios-jportlet');
        var portletId = jportlet.id;
        if (portletId == event.id) {
          jportlet.title = event.portletName;
          that.setDefaultTitle(JPortalUtils.getJblockDefaultTitle() + ' - ' + jportlet.title);
          that.$element.data('jalios-jportlet', jportlet);
          jportal.registerNewAction();
          JPortalUtils.triggerJPortalUpdateInStorage();
          that.$element.find('.jportal-block-inner:first').displayLoading();
          that.loadPortlet(function () {
            that.$element.find('.ajax-loading-component').remove();
          });
          that.updateUi();
        }
      }
    });
  };

  JBlock.prototype.applyData = function (data) {
    if (data) {
      var that = this;
      this.setUi(data.ui);
      this.setOptions(data.options);
      this.setJPortletData(data.jportlet);

      if (jportal.isShowContentMode()) {
        this.loadPortlet();
      }

      // Apply jblocks recursif
      let lineSize = 0;
      $.each(data.jblocks, function (index, value) {
        var block = JPortalUtils.createBlock(value.ui.gridSizeMd, value.id);
        var $targetDrop;
        var jblock;
        // If has no drop center, add block on right
        if (lineSize === 12) {
          // add block on the bottom
          $targetDrop = that.$element.find('>.jportal-block-inner >.jportal-block-line:last-child >.drop-bottom');
          jblock = JPortalUtils.addJBlockOnLineTargetDrop($targetDrop, block, true);
          lineSize = jblock.getBlockSize(GRID_COL_DEFAULT_PREFIX);
        } else if (that.$element.find('>.jportal-block-inner >.drop-center').length) {
          $targetDrop = that.$element.find('>.jportal-block-inner >.drop-center');
          jblock = JPortalUtils.addJBlockOnCenterTargetDrop($targetDrop, block, true);
          lineSize += jblock.getBlockSize(GRID_COL_DEFAULT_PREFIX);
        } else {
          // Add block on the right
          $targetDrop = that.$element.find(
            '>.jportal-block-inner >.jportal-block-line >.jportal-block:last >.drop-right'
          );
          jblock = JPortalUtils.addJBlockOnSideTargetDrop($targetDrop, block, true);
          lineSize += jblock.getBlockSize(GRID_COL_DEFAULT_PREFIX);
        }
        jblock.applyData(value);
      });
      this.updateUi();
    }
  };

  JBlock.prototype.setUi = function (ui) {
    this.$element.data('jalios-ui', ui);
  };

  JBlock.prototype.setOptions = function (options) {
    this.$element.data('jalios-options', options);
  };

  JBlock.prototype.setJPortletData = function (jportlet) {
    if (jportlet != null && jportlet.id != null) {
      this.setJPortlet(jportlet.id, jportlet.title);
    }
  };

  JBlock.prototype.setCustomClass = function (customClass) {
    if (customClass == null) {
      customClass = '';
    }
    customClass += ' jportal-block-inner';

    this.$element.find('.jportal-block-inner:first').attr('class', customClass);
  };

  JBlock.prototype.updateUi = function () {
    var options = this.getOptions();
    if (options) {
      // Portlet Selection
      this.setPortletSelection(options.isPortletSelection);
    } else {
      this.updateTitle(this.defaultTitle);
    }

    // JPORTLET UI
    var jportletUi = this.getJPortletUi();
    if (jportletUi && jportletUi.css) {
      this._updateJPortletCss(jportletUi.css);
    }

    // JBLOCK UI
    var jblockUI = this.getUi();
    if (jblockUI) {
      // Custom class
      this.setCustomClass(jblockUI.customClass);

      // CSS
      var css = jblockUI.css;
      var $elem;
      if (this.getPortletId() != null) {
        $elem = this.$element.find('.jportlet:first');
      } else {
        $elem = this.$element.find('.jportal-block-inner:first');
      }

      $elem.removeAttr('style');
      var $portletChild = null;

      // Vertical-Horizontal center
      if (this.getPortletId() != null) {
        $portletChild = $elem.find('.Portlet:first');
        $portletChild.removeAttr('style');
        if (!JPortalUtils.isEmpty(jblockUI.verticalAlign)) {
          $elem.css('display', 'flex');
          $elem.css('align-items', jblockUI.verticalAlign);
        }
        if (!JPortalUtils.isEmpty(jblockUI.horizontalAlign)) {
          $elem.css('display', 'flex');
          $elem.css('justify-content', jblockUI.horizontalAlign);
        }
      }

      // Handle animations
      if (JPortalUtils.isEmpty(jblockUI.animation)) {
        this.destroyAnimation();
      } else {
        var currentAnimation = this.$element.attr('data-aos');
        var currentAnimationTime = this.$element.attr('data-aos-duration');
        if (
          currentAnimation != jblockUI.animation ||
          currentAnimationTime != JPortalUtils.getAnimationTime(jblockUI.animationDuration)
        ) {
          this.$element.attr('data-aos', jblockUI.animation);
          this.$element.attr('data-aos-duration', JPortalUtils.getAnimationTime(jblockUI.animationDuration));
          this.$element.removeClass('aos-animate');
          this.$element.addClass('hide');
          var that = this;
          setTimeout(function () {
            that.$element.removeClass('hide');
            that.$element.addClass('aos-animate');
          }, 800);
        }
      }

      // Proceed css map
      if (css == null) {
        return;
      }

      for (var key in css) {
        if (css.hasOwnProperty(key)) {
          var value = css[key];
          key = key
            .split(/(?=[A-Z])/)
            .join('-')
            .toLowerCase();
          // specific case width & imgHeight
          if (key == 'width' && !JPortalUtils.isEmpty(value)) {
            $portletChild.css(key, value);
            $elem.css('display', 'flex');
            $elem.css('overflow', 'auto');
          } else if (key == 'height' && !JPortalUtils.isEmpty(value)) {
            var $portletChild = $elem.find('.Portlet:first');
            $portletChild.css(key, value);
            $elem.css('overflow', 'auto');
          } else {
            // Specific case background-image
            if (key == 'background-image' && value != '') {
              value = 'url(' + value + ')';
            }
            if (!isNaN(value)) {
              value += 'px';
            }
            if ($portletChild != null) {
              $portletChild.css(key, value);
            } else {
              $elem.css(key, value);
            }
          }
        }
      }
    }
  };

  JBlock.prototype._updateJPortletCss = function (jportletUi) {
    if (jportletUi.jaliosSkinHeaderPrimary) {
      var $headerPrimary = this.$element.find('.jportlet .portlet-header-primary');
      if ($headerPrimary.length) {
        $headerPrimary.css('color', jportletUi.jaliosSkinHeaderPrimary);
      }
    }

    if (jportletUi.jaliosSkinHeaderSecondary) {
      var $headerSecondary = this.$element.find('.jportlet .portlet-header-secondary');
      if ($headerSecondary.length) {
        $headerSecondary.css('background-color', jportletUi.jaliosSkinHeaderSecondary);
      }
    }
    /*
    if (jportletUi.jaliosSkinBodyPrimary) {
      var $panelBody = this.$element.find('.jportlet .portlet-body-primary');
      if ($panelBody.length) {
        $panelBody.css('color', jportletUi.jaliosSkinBodyPrimary);
      }
    }
    if (jportletUi.jaliosSkinBodySecondary) {
      var $panelBody = this.$element.find('.jportlet .portlet-body-secondary');
      if ($panelBody.length) {
        $panelBody.css('background-color', jportletUi.jaliosSkinBodySecondary);
      }
    }*/
  };

  JBlock.prototype.setPortletSelection = function (isPortletSelection) {
    var options = this.getOptions() || {};

    if (isPortletSelection === 'true' || isPortletSelection === true) {
      options.isPortletSelection = true;
    } else {
      options.isPortletSelection = false;
    }

    this.updateOptions(options);
    this.updatePortletSelectionClass();
  };

  JBlock.prototype.updatePortletSelectionClass = function () {
    if (this.getOptions().isPortletSelection) {
      this.$element.addClass('is-portlet-selection');
      if (this.getId() != jportal.getMainJBlock().getId()) {
        var titleSelection = 'Selection';
        if (!JPortalUtils.isEmpty(this.getJPortlet()) && !JPortalUtils.isEmpty(this.getJPortlet().title)) {
          titleSelection += ' - ' + this.getJPortlet().title;
        }
        this.updateTitle(titleSelection);
      }
    } else {
      this.$element.removeClass('is-portlet-selection');
      this.updateTitle(this.defaultTitle);
    }
  };

  JBlock.prototype.setDefaultTitle = function (title) {
    this.defaultTitle = title;
  };

  JBlock.prototype.updateTitle = function (title) {
    this.$element.find('.block-title:first').text(title);
    this.$element.find('.block-title:first').attr('title', title);
  };

  JBlock.prototype.updateOptions = function (options) {
    this.$element.data('jalios-options', options);
  };

  JBlock.prototype.getBlockSize = function (sizePrefix) {
    var elementClass = this.$element.attr('class').split(' ');
    // Size of the block
    for (var i = 0; i < elementClass.length; i++) {
      if (elementClass[i].startsWith(sizePrefix)) {
        var gridSize = elementClass[i].substring(sizePrefix.length, elementClass[i].length);
        return parseInt(gridSize, 10);
      }
    }
    return 0;
  };

  JBlock.prototype.loadPortlet = function (callback) {
    if (this.getPortletId()) {
      var that = this;
      var portletId = this.getPortletId();
      this.$element.removeClass('has-jportlet');
      this.$element.find('.jportal-block-inner:first').displayLoading();
      $.jalios.AjaxRefresh.triggerRefreshEvent(
        $.jalios.AjaxRefresh.RefreshEventType.BEFORE,
        'types/JPortal/displayJPortlet.jsp',
        that.$element
      );
      $.ajax({
        url: 'types/JPortal/displayJPortlet.jsp',
        method: 'post',
        data: {
          jPortal: jportal.getId(),
          portletId: portletId
        }
      }).done(function (data) {
        if (jportal.isShowContentMode()) {
          that.$element.find('.jportlet:first').html(data);
          that.updateUi();
          that.$element.addClass('has-jportlet');
          that.$element.find('.ajax-loading-component').remove();
        }
        if (typeof callback === 'function') {
          callback();
        }
        elementQuery();
        $.jalios.AjaxRefresh.triggerRefreshEvent(
          $.jalios.AjaxRefresh.RefreshEventType.AFTER,
          'types/JPortal/displayJPortlet.jsp',
          that.$element
        );
      });
    }
  };

  JBlock.prototype.setJPortlet = function (portletId, portletName) {
    var jportlet = this.getJPortlet() || {};
    jportlet.id = portletId;
    jportlet.title = portletName;

    this.$element.data('jalios-jportlet', jportlet);
    var portlet = JPortalUtils.createPortlet(portletName);
    this.$element.find('.jportal-block-inner:first').append(portlet);
    this.$element.find('.drop-center:first').remove();
    this.$element.addClass('has-jportlet');
    var $blockMenu = $(this.$element).find('.jblock-edit:first');
    $blockMenu.replaceWith(JPortalUtils.createPortletMenu(portletId, this.id));

    this.setDefaultTitle(JPortalUtils.getJblockDefaultTitle() + ' - ' + jportlet.title);

    this.updateUi();
  };

  JBlock.prototype.getJPortlet = function () {
    return this.$element.data('jalios-jportlet');
  };
  JBlock.prototype.getPortletId = function () {
    var jportlet = this.getJPortlet();
    if (jportlet) {
      return jportlet.id;
    } else {
      return null;
    }
  };

  JBlock.prototype.getId = function () {
    return this.id;
  };

  JBlock.prototype.getUi = function () {
    return this.$element.data('jalios-ui');
  };

  JBlock.prototype.getOptions = function () {
    return this.$element.data('jalios-options');
  };

  JBlock.prototype.getJPortlet = function () {
    return this.$element.data('jalios-jportlet');
  };

  JBlock.prototype.getJPortletUi = function () {
    var jportlet = this.getJPortlet();
    if (jportlet) {
      return jportlet.ui;
    }
    return null;
  };

  JBlock.prototype.removeContent = function () {
    this.$element.find('.jportlet:first').remove();
    var jportlet = this.$element.data('jalios-jportlet');
    this.setJPortlet(jportlet.id, jportlet.title);
  };

  // Remove current block
  JBlock.prototype.remove = function () {
    // If the block we remove contains a temporary portlet block, we remove it
    if (this.$element.find('.js-portlet-placeholder').length > 0) {
      let currentEditedPortletBlock = jportal.getCurrentEditedPortletBlock();
      currentEditedPortletBlock.remove();
    }
    var line = this.$element.closest('.jportal-block-line');
    this.$element.remove();
    JPortalUtils.computeBlocksSize(line);

    // If it's portlet block (adding new portlet), we refresh the sidebar
    if (this.$element.hasClass('js-portlet-placeholder')) {
      jportal.resetSidebar();
    }
    this.removed = true;
  };

  JBlock.prototype.addVirtualLine = function () {
    var that = this;
    if (this.$element.find('.jportal-block').length > 0) {
      line = JPortalUtils.createLine();

      this.$element.find('> .jportal-block-inner').append(line);
      var lineSize = 0;
      this.$element.find('> .jportal-block ').each(function (index, element) {
        if (lineSize == 12) {
          // Create a new line
          lineSize = 0;
          line = JPortalUtils.createLine();
          that.$element.find('> .jportal-block-inner').append(line);
        }
        var jblock = $(element).data('jalios-jblock');
        var size = jblock.getBlockSize(GRID_COL_DEFAULT_PREFIX);
        lineSize += size;
        $(line).append(element);
      });
      initDroppable();
    }
  };

  JBlock.prototype.addDNDArea = function () {
    this.$element.find('.jportal-block-inner:first').append(JPortalUtils.createDropCenter());
    initDroppable();
  };

  //Update the size of the block
  JBlock.prototype.updateSize = function (size) {
    this.$element.removeClass(function (index, className) {
      var elementClass = className.split(' ');
      for (var i = 0; i < elementClass.length; i++) {
        if (elementClass[i].startsWith(GRID_COL_DEFAULT_PREFIX)) {
          return elementClass[i];
        }
      }
    });
    this.$element.addClass(GRID_COL_DEFAULT_PREFIX + size);
  };

  JBlock.prototype.updateAsPortletPlaceholder = function ($component) {
    this.updateTitle($component.data('jalios-jportal-portlet-name'));
    this.$element.find('.jportal-jblock-header').css('background-color', '#e91e63');
    this.$element.find('.jportal-jblock-header').css('color', '#fff');
    this.$element.find('.jportal-jblock-header .js-handle').hide();
    this.$element.find('.jportal-jblock-header .jblock-edit').hide();
    this.$element.addClass('js-portlet-placeholder');
  };

  JBlock.prototype.removePortletPlaceholderSpecification = function () {
    this.$element.find('.jportal-jblock-header').css('background-color', '');
    this.$element.find('.jportal-jblock-header').css('color', '');
    this.$element.find('.jportal-jblock-header .js-handle').show();
    this.$element.find('.jportal-jblock-header .jblock-edit').show();
    this.$element.removeClass('js-portlet-placeholder');
  };

  // =======================================================================
  // ********************** JPORTAL*****************************************
  // =======================================================================
  var JPortal = function (element) {
    this.$element = $(element);
    this.init();
  };

  JPortal.prototype.init = function () {
    this.displayOverlay();
    this.handlePendingOverlay(this, 600);

    this.id = this.$element.data('jalios-jportal-id');
    this.$element.data('jportal', this);
  };

  JPortal.prototype.displaySidebarLoading = function () {
    $('.jportal-sidebar .sidebar-tab-content').displayLoading();
  };

  JPortal.prototype.scrollTop = function () {
    this.$element.scrollTop(0);
    window.scrollTo(0, 0);
  };

  JPortal.prototype.getSidebarScrollbar = function () {
    return this.ps;
  };

  JPortal.prototype.resetSidebarScrollbar = function () {
    $('.jportal-editor-sidebar .sidebar-body').scrollTop(0);
  };

  JPortal.prototype.getCustomCss = function () {
    if (this.getUi()) {
      return this.getUi().customCss;
    } else {
      return '';
    }
  };

  JPortal.prototype.handlePendingOverlay = function (jportal, time) {
    setTimeout(function () {
      if (jportal.isInitialized) {
        // Hide or show topbar depending on the settings
        var displayTopbar = $("INPUT[name='displayTopbar']:checked").val() == 'true';
        JPortalUtils.updateTopbar(displayTopbar);

        $('.sidebar-overlay').removeClass('is-first-load');
        $('.jportal-edition').removeClass('hide');

        //Remove Overlay
        jportal.hideOverlay();
      } else {
        jportal.handlePendingOverlay(jportal, 200);
      }
    }, time);
  };

  JPortal.prototype.displayOverlay = function () {
    $('BODY').addClass('jportal-overlay-active');
    var $overlay = $('.jportal-overlay');
    $overlay.removeClass('hide').addClass('is-active');
  };

  JPortal.prototype.hideOverlay = function () {
    $('BODY').removeClass('jportal-overlay-active');
    var $overlay = $('.jportal-overlay');
    $overlay.one($.support.transition.end, function () {
      $overlay.addClass('hide');
    });
    $overlay.removeClass('is-active');
  };

  JPortal.prototype.updateUi = function () {
    var that = this;
    if (this.getUi()) {
      var ui = this.getUi();

      // Update Header & Footer class
      var $innerWrapper = this.$element.find('.jportal-wrapper-inner');
      $innerWrapper.removeClass('container');
      $innerWrapper.removeClass('container-fluid');
      $innerWrapper.addClass(ui.container);
      this.updateHeaderFooter();

      var css = ui.css;
      if (css == null) {
        return;
      }

      var $body = $('BODY');
      $body.removeAttr('style');

      for (var key in css) {
        if (css.hasOwnProperty(key)) {
          var value = css[key];
          key = key
            .split(/(?=[A-Z])/)
            .join('-')
            .toLowerCase();
          // Specific case background-image
          if (key == 'background-image' && value != '') {
            value = 'url(' + value + ')';
          }
          if (!isNaN(value)) {
            value += 'px';
          }
          $body.css(key, value);
        }
      }
    }
  };

  JPortal.prototype.updateHeaderFooter = function () {
    var ui = this.getUi();
    // Create or delete Header
    if ((ui.displayHeader == 'false' || ui.displayHeader === false) && $('.jportal-header').length) {
      $('.jportal-header').remove();
    } else if ((ui.displayHeader == 'true' || ui.displayHeader === true) && $('.jportal-header').length === 0) {
      this._addStructure('header', 'HEADER');
    } else if ((ui.displayHeader == 'true' || ui.displayHeader === true) && $('.jportal-header').length) {
      if ($('.jportal-header').find('.jportal-block').length === 0) {
        ui.displayHeader = false;
        ui.jblockHeader = null;
        $('.jportal-header').remove();
      }
    }

    // Create or delete footer
    if ((ui.displayFooter == 'false' || ui.displayFooter === false) && $('.jportal-footer').length) {
      $('.jportal-footer').remove();
    } else if ((ui.displayFooter == 'true' || ui.displayFooter === true) && $('.jportal-footer').length === 0) {
      this._addStructure('footer', 'FOOTER');
    } else if ((ui.displayFooter == 'true' || ui.displayFooter === true) && $('.jportal-header').length) {
      if ($('.jportal-footer').find('.jportal-block').length === 0) {
        ui.displayFooter = false;
        ui.jblockFooter = null;
        $('.jportal-footer').remove();
      }
    }

    initDraggableAndDroppable();
  };

  JPortal.prototype._addStructure = function (structureType, title) {
    var ui = this.getUi();
    var id = null;
    if (structureType === 'footer') {
      JPortalUtils.createStructure(structureType).insertAfter(this.$element.find('.jportal-wrapper-inner'));
      if (ui.jblockFooter) {
        id = ui.jblockFooter.id;
      }
    } else if (structureType === 'header') {
      JPortalUtils.createStructure(structureType).insertBefore(this.$element.find('.jportal-wrapper-inner'));
      if (ui.jblockHeader) {
        id = ui.jblockHeader.id;
      }
    }

    var $block = JPortalUtils.createBlock(12, id);
    $block.addClass('jblock-structured-' + structureType);
    $('.jportal-' + structureType).append($block);

    var jblock = new JBlock($block);
    jblock.addDNDArea();

    if (structureType === 'footer') {
      jblock.applyData(ui.jblockFooter);
    } else if (structureType === 'header') {
      jblock.applyData(ui.jblockHeader);
    }
    jblock.updateUi();

    this._initStructuredJBlock('.jblock-structured-' + structureType);
  };

  JPortal.prototype.getMainJBlock = function () {
    return this.$element.find('.jportal-block-main').data('jalios-jblock');
  };

  JPortal.prototype.initJBlocks = function () {
    // Init main block
    this.$element.find('.jportal-block:first').addClass('jportal-block-main');

    // Init JBlocks
    var lineSize = 0;
    this.$element.find('.row > .jportal-block').each(function (index, element) {
      new JBlock(element);
    });

    this._initStructuredJBlock('.jportal-block-main');

    this.$element.find('.jportal-block > .jportal-block-inner').each(function (index, element) {
      if ($(element).find('.jportal-block-line').length == 0 && $(element).find('.jportlet').length == 0) {
        var jblock = $(element).parent().data('jalios-jblock');
        jblock.addDNDArea();
      }
    });
    this.jsonStructure = JSON.stringify(this.convertDOMtoJSON());
  };

  JPortal.prototype._initStructuredJBlock = function (target) {
    $(target).addClass('jblock-structured');
    this.$element.find(target).wrap("<div class='jportal-block-line'></div>");
    this.$element.find(target + ' .drop-right:first').remove();
    this.$element.find(target + ' .drop-left:first').remove();
    this.$element.find(target + ' .jblock-delete:first').remove();
    this.$element.find(target + ' .jportal-block-header:first >SPAN').remove();
    this.$element.find(target + ' .jportal-block-header:first').css('cursor', 'inherit');
  };

  JPortal.prototype.hasStructureChanged = function () {
    var newJson = this.convertDOMtoJSON();
    if (this.jsonStructure === JSON.stringify(newJson)) {
      return false;
    }
    return true;
  };
  JPortal.prototype.registerNewAction = function () {
    if (this.hasStructureChanged()) {
      $('#saveJPortal').removeAttr('disabled');
      $('.btn-jportal-publish').attr('disabled', 'disabled');
      if (this.saveTimer) {
        clearTimeout(this.saveTimer);
      }
      this.saveTimer = setTimeout(JPortalUtils.saveStructure, 5000);
    } else {
      $('#saveJPortal').attr('disabled', 'disabled');
      $('.btn-jportal-publish').removeAttr('disabled');
      if (this.saveTimer) {
        clearTimeout(this.saveTimer);
      }
    }
  };

  JPortal.prototype.getId = function () {
    return this.id;
  };

  JPortal.prototype.isShowContentMode = function () {
    return $('BODY').hasClass('is-show-content-mode');
  };

  JPortal.prototype.toggleJPortletContent = function () {
    $('.jportal-action-show-content  >SPAN').toggleClass('hide');
    if (this.isShowContentMode()) {
      $('BODY').removeClass('is-show-content-mode');
      $('.jportal-block').each(function (index, element) {
        if ($(element).data('jalios-jportlet')) {
          var jportletData = $(element).data('jalios-jportlet');
          if (jportletData.id != null) {
            $(element).data('jalios-jblock').removeContent();
          }
        }
      });
    } else {
      $('BODY').addClass('is-show-content-mode');
      $('.jportal-block').each(function (index, element) {
        if ($(element).data('jalios-jportlet')) {
          $(element).data('jalios-jblock').loadPortlet();
        }
      });
    }
  };

  JPortal.prototype.convertDOMtoJSON = function () {
    var firstBlock = this.$element.find('.jportal-block-main');
    var jBlocks = [this.createJSONBlock(firstBlock)];
    var json = {
      jBlocks: jBlocks,
      ui: this.getUi()
    };
    return json;
  };

  JPortal.prototype.createJSONBlock = function (element) {
    var $element = $(element);

    // Iterate through all blocks of the jblock
    var JBlocks = [];
    var that = this;
    $element.find('>.jportal-block-inner > .jportal-block-line > .jportal-block').each(function (index, element) {
      var block = that.createJSONBlock(element);
      JBlocks.push(block);
    });
    var jblock = $element.data('jalios-jblock');
    var ui = jblock.getUi() || {};
    ui.gridSizeMd = jblock.getBlockSize(GRID_COL_DEFAULT_PREFIX);
    var block = {
      id: jblock.getId(),
      ui: ui,
      options: jblock.getOptions(),
      jportlet: jblock.getJPortlet(),
      jblocks: JBlocks
    };
    return block;
  };

  JPortal.prototype.getUi = function () {
    var ui = this.$element.data('jalios-ui');
    if (this.$element.find('.jportal-header .jportal-block:first').length) {
      var headerBlock = this.$element.find('.jportal-header .jportal-block:first');
      var headerJSonBlock = this.createJSONBlock(headerBlock);
      ui.jblockHeader = headerJSonBlock;
    }

    if (this.$element.find('.jportal-footer .jportal-block:first').length) {
      var footerBlock = this.$element.find('.jportal-footer .jportal-block:first');
      var footerJSonBlock = this.createJSONBlock(footerBlock);
      ui.jblockFooter = footerJSonBlock;
    }

    return ui;
  };

  JPortal.prototype.getCurrentEditedPortletBlock = function () {
    return this.currentEditedBlock;
  };

  JPortal.prototype.setCurrentEditedPortletBlock = function (jblock) {
    this.removeCurrentEditedPortletBlock();
    this.currentEditedBlock = jblock;
  };

  JPortal.prototype.removeCurrentEditedPortletBlock = function () {
    if (this.currentEditedBlock && !this.currentEditedBlock.removed) {
      this.currentEditedBlock.remove();
      initDraggableAndDroppable();
      this.updateHeaderFooter();
    }
  };

  JPortal.prototype.resetSidebar = function () {
    this.displaySidebarLoading();
    $; /*('.sidebar-tab-content').refresh({
      params: {
        jPortal: this.id
      }
    });*/

    $('.jportal-editor-sidebar')
      .data('sidebar')
      .open({
        url: 'jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=' + jportal.getId()
      });
  };

  JPortal.prototype.setCurrentEditedBlockPicked = function () {
    this.currentEditedBlock.removePortletPlaceholderSpecification();
    this.currentEditedBlock = undefined;
  };

  // =======================================================================
  // ********************** EVENTS REGISTER ********************************
  // =======================================================================
  var registerEvents = function () {
    $(document).on('click', '#saveJPortal', onSaveJPortalStructureClickHandler);
    $(document).on('click', '.js-jportal-history-close', onJPortalHistoryCloseClickHandler);
    $(document).on('click', '.js-jportal-preview-close', onJportalPreviewCloseHandler);
    $(document).on('click', '.jportal-history-revert', onJPortalHistoryRevertClickHandler);
    $(document).on('click', '.js-jportal-show-content', onToggleJPortletContentClickHandler);
    $(document).on('click', '.jportal-history-link', onJPortalHistoryLinkClickHandler);
    $(document).on('click', 'a.jportal-show-preview', onJPortalShowPreviewClickHandler);
    $(document).on('click', 'a.jportal-show-preview-new-window', onJPortalShowPreviewNewWindowClickHandler);
    $(document).on('click', '.jportal-history-item', onJPortalHistoryItemClickHandler);
    $(document).on('click', '.jportal-component-portlet', onPortletSelectionHandler);
    $(document).on('jalios:refresh', onJaliosRefreshHandler);

    $(document).on('shown.bs.tab', function (e) {
      jportal.resetSidebarScrollbar();
    });
    $(document).on('change', "INPUT[name='displayTopbar']", function (e) {
      var displayTopbar = $("INPUT[name='displayTopbar']:checked").val() == 'true';
      JPortalUtils.updateTopbar(displayTopbar);
    });

    $(window).on('beforeunload', function () {
      JPortalUtils.saveStructure();
      $.ajax({
        url: 'jcore/jportal/action/unlockJPortal.jsp',
        data: {
          jPortal: jportal.getId()
        }
      });
    });
    // JPortal UI change handler
    $(document).on('change paste keyup', '.jportal-parameters :input', onJPortalUiChangeHandler);
    // JPortlet - JBlock UI change handler
    $(document).on('change paste keyup', '.jblock-parameters :input', onJPortletUiChangeHandler);
  };

  // =======================================================================
  // ********************** DOCUMENT READY *********************************
  // =======================================================================
  $(document).ready(function () {
    registerEvents();
    initComponents();
    initDraggableAndDroppable();

    $(document).on('show.jalios.sidebar', function (event) {
      if (!$(event.target).hasClass('jportal-editor-sidebar')) {
        return;
      }
      $(event.target).addClass('is-open');
      elementQuery();
      $('BODY').addClass('is-jportal-sidebar-opened');
    });
    $(document).on('shown.jalios.sidebar', function (event) {
      if (!$(event.target).hasClass('jportal-editor-sidebar')) {
        return;
      }
      $(event.target).addClass('is-open');
    });
    $(document).on('start-hide.jalios.sidebar', function (event) {
      if (!$(event.target).hasClass('jportal-editor-sidebar')) {
        return;
      }
      $('BODY').removeClass('is-jportal-sidebar-opened');
      $(event.target).removeClass('is-open');
    });
    $(document).on('start-hide.jalios.sidebar', function (event) {
      elementQuery();
    });

    // Init and open sidebar
    $('.jportal-sidebar-opener').click();

    $('[data-toggle="tooltip"]').tooltip();

    jportal.toggleJPortletContent();
  });
})(jQuery, window, document);
