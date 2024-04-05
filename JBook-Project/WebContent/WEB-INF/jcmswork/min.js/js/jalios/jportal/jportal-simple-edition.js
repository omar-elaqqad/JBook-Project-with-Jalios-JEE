!(function ($) {
  const EDITION_OVERLAY_DATA = 'edition-overlay';

  let simpleEdition;

  //Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.jportal) {
    $.jalios.jportal = {};
  }

  $.jalios.jportal = {
    ...$.jalios.jportal,
    ...{
      activateSimpleEdition: () => activateSimpleEdition(),
      disableSimpleEdition: () => disableSimpleEdition(),
      toggleSimpleEdition: () => toggleSimpleEdition(),
      triggerEvent: (eventName, params) => triggerEvent(eventName, params),
    },
  };

  const triggerEvent = (eventName, params) => {
    const event = $.Event('jalios.jportal');
    if (params) {
      const paramsObj = typeof params === 'object' ? params : JSON.parse(params);
      event.params = paramsObj;
    }
    event.name = eventName;
    $('.jportal-wrapper').trigger(event);
  };

  const activateSimpleEdition = () => {
    $.fn.dropdown.clearMenus();
    if (!simpleEdition) {
      simpleEdition = new SimpleEdition();
    }

    //CSP
    $('.ui-item-edit-collaborative-space-portal-simple').css('display', 'none');

    //JPORTAL
    $('.jportal-simple-edit-menu-start').addClass('hide');
    $('.jportal-simple-edit-menu-stop').removeClass('hide');

    registerJPortalEvents();
    refreshSimpleEditionUI();
  };

  const refreshSimpleEditionUI = () => {
    createPortletsEditionOverlay();
    registerDroppable();
    registerDraggable();
    JPortalUtils.refreshCreationLink();
    JPortalUtils.refreshSlick();
  };

  const registerJPortalEvents = () => {
    $('.jportal-wrapper').on('jalios.jportal', jportalEventHandler);
  };

  const toggleSimpleEdition = (event) => {
    event && event.preventDefault();

    if (!simpleEdition) {
      activateSimpleEdition();
    } else {
      disableSimpleEdition();
    }
  };

  const removeJPortalEvents = () => {
    $('.jportal-wrapper').off('jalios.jportal', jportalEventHandler);
  };

  const jportalEventHandler = (event) => {
    if (!event || !event.name) {
      return;
    }

    switch (event.name) {
      case 'addPortlet':
        let params = event.params;
        const $block = $(`.jportal-block [data-block-id='${params.blockId}']`);
        if ($block.length === 0) {
          break;
        }
        const $targetInnerBlock = $block.find('.jportal-block-inner');
        const isEmptyBlock = $targetInnerBlock.hasClass('empty-block');
        // Empty Block
        if (isEmptyBlock) {
          _addPortletOnEmptyBlock($targetInnerBlock, params.portletId);
        } else {
          // Add block on existing portlet
          _addPortletOnExistingPortlet($block, params.portletId);
        }
        break;
    }
  };

  const _addPortletOnExistingPortlet = ($targetBlock, portletId) => {
    let $currentBlock = $(
      Templates.NEW_BLOCK_PORTLET({
        'block-id': JPortalUtils.generateRandomID(),
        size: GRID_SIZE,
        'portlet-id': portletId,
      })
    );

    // Animate block start
    $currentBlock.css('scale', '0');

    // Add overlay
    JPortalUtils.addGlobalOverlay();
    $.ajax({
      url: 'types/JPortal/displayJPortlet.jsp',
      method: 'post',
      data: {
        jPortal: JPortalUtils.getJPortal(),
        portletId: portletId,
      },
    }).done(function (data) {
      // Remove overlay
      JPortalUtils.removeGlobalOverlay();
      $currentBlock.find('.jblock-portlet').html(data);
      // Add overlay
      const $blockPortlet = $currentBlock.find('.jblock-portlet');
      if ($blockPortlet.length > 0) {
        new EditionOverlay($blockPortlet).init();
      }

      _addBlockOnPortletBlock($targetBlock, $currentBlock, 'bottom', portletId);
      refreshSimpleEditionUI();

      // Animate block goal
      setTimeout(() => {
        $currentBlock.css('scale', '1');
        $currentBlock.on('bsTransitionEnd', function(e) {
          $currentBlock.css('scale', '');
        })
      }, 1);
    });
  };

  const _addPortletOnEmptyBlock = ($targetInnerBlock, portletId) => {
    let $currentBlock = $(
      Templates.NEW_BLOCK_PORTLET({
        'block-id': JPortalUtils.generateRandomID(),
        size: GRID_SIZE,
        'portlet-id': portletId,
      })
    );

    // Animate block start
    $currentBlock.css('scale', '0');

    // Create a new row
    let $newRow = JPortalUtils.createNewRow();
    // Add the block
    $newRow.append($currentBlock);
    // Append to the block
    $targetInnerBlock.append($newRow);

    // Display loading info in the block and remove add button
    $targetInnerBlock.find('.btn-add-portlet').remove();
    //Load portlet in this block
    JPortalUtils.addGlobalOverlay();
    $.ajax({
      url: 'types/JPortal/displayJPortlet.jsp',
      method: 'post',
      data: {
        jPortal: JPortalUtils.getJPortal(),
        portletId: portletId,
      },
    }).done(function (data) {
      JPortalUtils.removeGlobalOverlay();
      $currentBlock.find('.jblock-portlet').html(data);

      // Add overlay
      const $blockPortlet = $currentBlock.find('.jblock-portlet');
      if ($blockPortlet.length > 0) {
        new EditionOverlay($blockPortlet).init();
      }

      addBlockOnEmptyBlock($targetInnerBlock, $currentBlock, portletId);
      refreshSimpleEditionUI();

      // Animate block goal
      setTimeout(() => {
        $currentBlock.css('scale', '1');
      }, 1);

      // Animate block end
      setTimeout(() => {
        $currentBlock.css('scale', '');
      }, 350);
    });
  };

  const disableSimpleEdition = () => {
    $('.jblock-portlet').each((_index, element) => {
      let $overlay = $(element).data(EDITION_OVERLAY_DATA);
      $overlay && $overlay.destroy();
    });

    simpleEdition.stopEdition();
    simpleEdition = null;

    $('.jblock-portlet .menu__grab').draggable('destroy');
    $('.jportal-block .empty-block').droppable('destroy');
    $('.portlet-overlay_split').droppable('destroy');

    //CSP
    $('.ui-item-edit-collaborative-space-portal-simple').css('display', 'list-item');

    //JPORTAL
    $('.jportal-simple-edit-menu-start').removeClass('hide');
    $('.jportal-simple-edit-menu-stop').addClass('hide');

    $('#jportal-simple-edition').attr('title', I18N.glp('jportal-simple-edition.start-edition.label'));
    removeJPortalEvents();
  };

  const createPortletsEditionOverlay = () => {
    $('.jblock-portlet').each((_index, element) => {
      if ($(element).find('> .portlet-edition-overlay').length === 0) {
        new EditionOverlay($(element)).init();
      }
    });
  };

  const registerDraggable = () => {
    // Draggable
    $('.jblock-portlet .menu__grab').draggable({
      appendTo: '.jportal-wrapper',
      helper: function () {
        return "<div class='jportlet-drag-helper'></div>";
      },
      scrollSensitivity: 100,
      scrollSpeed: 30,
      cursor: 'grabbing',
      cursorAt: {
        left: -5,
        top: -5,
      },
      start: function (event, ui) {
        simpleEdition.isDragging = true;
        $(ui.helper).addClass('dragging');
        $(event.target).addClass('portlet-dragging');
        // Animate the helper width/height when creating it
        let $block = $(event.currentTarget).closest('.jportal-block');
        $block.find('.jblock-portlet').addClass('portlet-dragging');
        let width = $block.width();
        let height = $block.height();
        $('.jportlet-drag-helper').css('width', width);
        $('.jportlet-drag-helper').css('height', height);
        setTimeout(() => {
          $('.jportlet-drag-helper').addClass('animate-helper');
        }, 1);
        setTimeout(() => {
          let ratio = height / 25;
          let newWidth = width / ratio;
          newWidth = newWidth <= 25 ? 25 : newWidth;
          $('.jportlet-drag-helper').css('width', newWidth);
          $('.jportlet-drag-helper').css('height', '25');
        }, 2);

        // Desactivate droppable on the portlet itself
        $block.find('.portlet-overlay__drop-arrow').droppable('option', 'disabled', true);
        $block.find('.portlet-overlay__drop-arrow').css('display', 'none');
      },
      stop: function (event, ui) {
        simpleEdition.isDragging = false;
        $('.portlet-edition-overlay').removeClass('activate');
        $('.portlet-overlay_split').removeClass('activate');
        $('.jportal-block .empty-bblock').removeClass('activate');
        $('.jblock-portlet').removeClass('portlet-dragging');

        // Reactivate droppable
        // Desactivate droppable on the portlet itself
        $('.portlet-overlay__drop-arrow').droppable('option', 'disabled', false);
        let $block = $(event.currentTarget).closest('.jportal-block');
        $('.portlet-overlay__drop-arrow').css('display', 'flex');
      },
    });
  };
  const registerDroppable = () => {
    registerDroppableEmptyBlocks();
    registerDroppablePortlets();
  };

  const registerDroppableEmptyBlocks = () => {
    $('.jportal-block .empty-block').droppable({
      over: (event, _ui) => {
        $(event.target).addClass('activate');
      },
      out: (event, _ui) => {
        $(event.target).removeClass('activate');
      },
      drop: (event, ui) => {
        let $targetInnerBlock = $(event.target);
        let $currentBlock = $(ui.draggable).closest('.jportal-block');
        addBlockOnEmptyBlock($targetInnerBlock, $currentBlock);
        refreshSimpleEditionUI();
      },
      tolerance: 'pointer',
    });
  };

  const addBlockOnEmptyBlock = ($targetInnerBlock, $currentBlock, portletId = undefined) => {
    // Remove empty block on the target drop
    $targetInnerBlock.removeClass('empty-block');

    // Create a new row
    let $newRow = JPortalUtils.createNewRow();
    // Append to the block
    $targetInnerBlock.append($newRow);
    // Get current block & parent then detach it

    let $parentInnerBlock = $currentBlock.closest('.jportal-block-inner');
    let $detachedBlock = $currentBlock.detach();
    // animation
    $detachedBlock.css('scale', '0');
    // Set default size
    JPortalUtils.updateBlockSize($detachedBlock, GRID_SIZE);
    // Add detached block ont he newRow
    $newRow.append($detachedBlock);
    // Recalculate size
    JPortalUtils.calculateAndUpdateBlockSizesOfAllLines();
    // Remove dropable on this block
    $targetInnerBlock.droppable('destroy');
    $targetInnerBlock.removeClass('activate');

    // Add empty css class on parent inner block if the block is now empty
    if (
      $parentInnerBlock &&
      $parentInnerBlock.text() != undefined &&
      $parentInnerBlock.text().trim() === '' &&
      $parentInnerBlock.find('>.jportal-row').length === 0
    ) {
      $parentInnerBlock.addClass('empty-block');
    }

    // start animation
    setTimeout(() => {
      $detachedBlock.css('scale', '1');
    }, 1);

    // Save modifications
    let $targetBlock = $targetInnerBlock.closest('.jportal-block');
    JPortalUtils.saveBlockPositions(
      $detachedBlock.data('block-id'),
      $targetBlock.data('block-id'),
      'center',
      null,
      portletId
    );
  };

  const registerDroppablePortlets = () => {
    // Droppable portlet top & bottom
    $('.portlet-overlay__drop-arrow').droppable({
      over: (event, _ui) => {
        $(event.target).addClass('activate');
      },
      out: (event, _ui) => {
        $(event.target).removeClass('activate');
      },
      drop: (event, ui) => {
        let $targetBlock = $(event.target).closest('.jportal-block');
        let $currentBlock = $(ui.draggable).closest('.jportal-block');
        let dropPosition = $(event.target).data('drop-position');

        // The arrow still has the class activate after the drop, remove it
        $('.portlet-overlay__drop-arrow ').removeClass('activate');

        _addBlockOnPortletBlock($targetBlock, $currentBlock, dropPosition);
      },
      tolerance: 'pointer',
    });
  };

  const _addBlockOnPortletBlock = ($targetBlock, $currentBlock, dropPosition, portletId = null) => {
    if (!$targetBlock || !$currentBlock) {
      $.console.log('Error when retrieving $targetBlock and/or $currentBlock');
      return;
    }

    // Get the parent inner-block (if exist)
    let $parentInnerBlock = $currentBlock.closest('.jportal-block-inner');

    let $detachedBlock;
    if (!portletId) {
      // Detach the block to remove
      $detachedBlock = $currentBlock.detach();
      JPortalUtils.updateBlockSize($detachedBlock, GRID_SIZE);
      // Recalculate size
      JPortalUtils.calculateAndUpdateBlockSizesOfAllLines();
    } else {
      $detachedBlock = $currentBlock;
    }
    // animation
    //$detachedBlock.css('scale', '0');

    // Get target block size
    let targetBlockSize = JPortalUtils.getBlockSize($targetBlock);

    // If the size of the target block == GRID_SIZE add the block before or after
    if (targetBlockSize == GRID_SIZE) {
      let $newRow = JPortalUtils.createNewRow();
      $newRow.append($detachedBlock);

      // add after the target block line
      if (dropPosition == 'bottom') {
        $targetBlock.closest('.jportal-row').after($newRow);
      } else if (dropPosition == 'top') {
        $targetBlock.closest('.jportal-row').before($newRow);
      }
      // Recalculate size
      JPortalUtils.calculateAndUpdateBlockSizesOfAllLines();

      // start animation
      /*setTimeout(() => {
        $detachedBlock.css('scale', '1');
      }, 1);*/
      // Save modifications
      JPortalUtils.saveBlockPositions(
        $currentBlock.data('block-id'),
        $targetBlock.data('block-id'),
        dropPosition,
        null,
        portletId
      );
    } else {
      // Create a new block
      let newBlockId = JPortalUtils.generateRandomID();
      let block = $(
        Templates.NEW_BLOCK({
          'block-id': newBlockId,
          size: JPortalUtils.getBlockSize($targetBlock),
        })
      );
      // Add it after the target block
      $targetBlock.after(block);
      //Detach the target block
      let $detachedTargetBlock = $targetBlock.detach();

      // Set the target block to a size of GRID_SIZE because he will be contained in a block of his size
      JPortalUtils.updateBlockSize($detachedTargetBlock, GRID_SIZE);
      // Move the target block in this block
      let $newRow = $('<div>', { class: 'row jportal-row' });
      $newRow.append($detachedTargetBlock);
      $(block).find('.jportal-block-inner').append($newRow);

      // add after the target block line
      let $detachedBlockRow = $('<div>', { class: 'row jportal-row' });
      $detachedBlockRow.append($detachedBlock);

      if (dropPosition == 'bottom') {
        $(block).find('.jportal-block-inner').append($detachedBlockRow);
      } else if (dropPosition == 'top') {
        $(block).find('.jportal-block-inner').prepend($detachedBlockRow);
      }

      // Recalculate size
      JPortalUtils.calculateAndUpdateBlockSizesOfAllLines();

      // start animation
      /*setTimeout(() => {
        $detachedBlock.css('scale', '1');
      }, 1);*/
      // Save modifications
      JPortalUtils.saveBlockPositions(
        $currentBlock.data('block-id'),
        $targetBlock.data('block-id'),
        dropPosition,
        newBlockId,
        portletId
      );
    }
    // Add empty css class on parent inner block (if any) if the block is now empty
    if (
      $parentInnerBlock &&
      $parentInnerBlock.text() != undefined &&
      $parentInnerBlock.text().trim() === '' &&
      $parentInnerBlock.find('>.jportal-row').length === 0
    ) {
      $parentInnerBlock.addClass('empty-block');
      registerDroppableEmptyBlocks();
    }
    JPortalUtils.refreshCreationLink();
  };

  // =======================================================================
  // ********************** UTILITYS ***************************************
  // =======================================================================
  const addConstantPropertyOnObject = function (obj, constant_name, constant_value) {
    Object.defineProperty(obj, constant_name, {
      value: constant_value,
      writable: false,
      enumerable: true,
      configurable: true,
    });
  };

  // =======================================================================
  // ********************** TEMPLATE ********************************
  // =======================================================================
  let Templates = {};
  addConstantPropertyOnObject(Templates, 'EDITION_OVERLAY', Handlebars.compile($('#portlet-edition-overlay').html()));
  addConstantPropertyOnObject(Templates, 'NEW_BLOCK', Handlebars.compile($('#new-block-template').html()));
  addConstantPropertyOnObject(
    Templates,
    'NEW_BLOCK_PORTLET',
    Handlebars.compile($('#new-block-portlet-template').html())
  );
  addConstantPropertyOnObject(
    Templates,
    'ADD_PORTLET_BUTTON',
    Handlebars.compile($('#add-portlet-button-template').html())
  );

  /**
   * DRAGGABLE STATUS
   * Keep track of dragging status
   */
  class SimpleEdition {
    constructor() {
      this._isDragging = false;
      $('.jportal-wrapper').addClass('simple-editing');
    }

    get isDragging() {
      return this._isDragging;
    }
    set isDragging(value) {
      if (value) {
        $('.jportal-wrapper').addClass('is-dragging');
      } else {
        $('.jportal-wrapper').removeClass('is-dragging');
      }
      this._isDragging = value;
    }

    stopEdition() {
      this._isDragging = false;
      $('.jportal-wrapper').removeClass('is-dragging');
      $('.jportal-wrapper').removeClass('simple-editing');

      // Remove add portlet btn
      $('.btn-add-portlet').remove();
    }
  }

  /**
   * Edition overlay class when member mouse over a portlet
   */
  class EditionOverlay {
    constructor($portlet) {
      this.$portlet = $portlet;
      this.portletId = $portlet.closest('.jportal-block').data('portlet-id');
      this.$portlet.data(EDITION_OVERLAY_DATA, this);
    }

    init() {
      this.$html = $(
        Templates.EDITION_OVERLAY({
          'portlet-id': this.portletId,
        })
      );
      this.$portlet.prepend(this.$html);
      this.createListeners();
    }

    destroy() {
      this.$html.remove();
      this.$portlet.removeData(EDITION_OVERLAY_DATA);
      this.$portlet.find('.edition_menu').off('click', '[data-action]', this.actionsClickHandler);
    }

    createListeners() {
      this.$portlet.find('.edition_menu').on('click', '[data-action]', { that: this }, this.actionsClickHandler);
    }

    get blockId() {
      return this.$portlet.closest('.jportal-block').data('block-id');
    }

    actionsClickHandler(event) {
      let action = $(event.currentTarget).data('action');
      let that = event.data.that;
      switch (action) {
        case 'delete':
          $.jalios.ui.Modal.confirm('Voulez vous vraiment retirer la portlet ?', () => {
            // Get the line of the portlet
            let $line = that.$portlet.closest('.jportal-row');
            // Get block & row
            let $block = that.$portlet.closest('.jportal-block');
            let $row = $block.closest('.jportal-row');

            // Remove the block
            let blockId = $block.data('block-id');
            $block.css('scale', '0');
            $block.css('height', $block.css('height'));
            $block.css('overflow', 'hidden');
            setTimeout(() => {
              $block.css('height', '100px'); // Same height as empty block
            }, 1);
            setTimeout(() => {
              $block.remove();

              // Check if the row is now empty and is the only row in the inner block
              if ($row.children().length === 0) {
                let $rowParentInnerBlock = $row.closest('.jportal-block-inner');
                if ($rowParentInnerBlock.find('> .jportal-row').length === 1) {
                  $rowParentInnerBlock.addClass('empty-block');
                }
                $row.remove();
              }

              // Calculate new size and/or remove the line
              JPortalUtils.calculateAndUpdateBlockSizes($line);
              JPortalUtils.saveRemovedBlockAndUpdateSizes(blockId);
              refreshSimpleEditionUI();
              $block.css('overflow', '');
            }, 350); // Same as transition css speed
          });
          break;
      }
    }
  }

  // =======================================================================
  // ********************** CONSTANTS **************************
  // =======================================================================
  const GRID_SIZE = 12,
    GRID_COL_MD_PREFIX = 'col-md-',
    GRID_COL_DEFAULT_PREFIX = GRID_COL_MD_PREFIX;
  // =======================================================================
  // ********************** JPORTALUTILS **********************************
  // =======================================================================
  const JPortalUtils = {
    generateRandomID: function () {
      return '_' + Math.random().toString(36).substr(2, 9);
    },
    getJPortal: () => {
      return $('[data-jportal-id]').first().data('jportal-id');
    },
    calculateAndUpdateBlockSizesOfAllLines: () => {
      $('.jportal-row').each((_index, element) => {
        JPortalUtils.calculateAndUpdateBlockSizes($(element));
      });
    },
    createNewRow: () => {
      return $('<div>', { class: 'row jportal-row' });
    },
    saveBlockPositions: (blockToMoveId, targetBlockId, movePosition, newBlockId = null, portletId = null) => {
      // Post Map blockId / size
      let jPortal = JPortalUtils.getJPortal();

      $.ajax({
        url: 'jcore/jportal/action/saveJPortalStructure.jsp',
        method: 'post',
        data: {
          jPortal,
          blocksAndSize: JSON.stringify(JPortalUtils.getBlocksAndSize()),
          opMoveBlockAndUpdateSizes: true,
          blockToMoveId,
          targetBlockId,
          movePosition,
          newBlockId,
          portletId,
        },
      }).done(function (data) {
        // If result is ok remove it from DOM otherwhise display toastr error
        toastr.options = {
          positionClass: 'toast-top-center',
        };
        if (data.actionStatus === 'OK') {
          //toastr.info(data.message);
        } else {
          toastr.error(data.message);
        }
      });
    },

    calculateAndUpdateBlockSizes: ($line) => {
      let lineBlocks = $line.find('> .jportal-block');
      if (lineBlocks.length == 0) {
        $line.remove();
      } else {
        // Check if we need to update blocks size of this line
        let totalSize = 0;
        for (var i = 0; i < lineBlocks.length; i++) {
          let $block = $(lineBlocks[i]);
          totalSize += JPortalUtils.getBlockSize($block);
        }
        if (totalSize === GRID_SIZE) {
          return;
        }

        let blockNum = lineBlocks.length;
        if (blockNum != 0) {
          let blockSize = Math.floor(GRID_SIZE / blockNum);
          let lastBlockSize = blockSize;
          // If space remaining, add rest
          if (GRID_SIZE % blockNum !== 0) {
            lastBlockSize = blockSize + (GRID_SIZE % blockNum);
          }

          for (var i = 0; i < lineBlocks.length; i++) {
            let $block = $(lineBlocks[i]);
            if (i == lineBlocks.length - 1) {
              JPortalUtils.updateBlockSize($block, lastBlockSize);
            } else {
              JPortalUtils.updateBlockSize($block, blockSize);
            }
          }
        }
      }
    },

    getBlocksAndSize: () => {
      let blocksAndSize = {};

      $('.jportal-wrapper [data-block-id]').each((index, element) => {
        let size = JPortalUtils.getBlockSize($(element));
        let blockId = $(element).data('block-id');
        blocksAndSize[blockId] = size;
      });
      return blocksAndSize;
    },

    saveRemovedBlockAndUpdateSizes: (blockId) => {
      let blocksAndSize = JPortalUtils.getBlocksAndSize();

      // Post Map blockId / size
      let jPortal = JPortalUtils.getJPortal();
      $.ajax({
        url: 'jcore/jportal/action/saveJPortalStructure.jsp',
        method: 'post',
        data: {
          jPortal,
          blocksAndSize: JSON.stringify(blocksAndSize),
          blockId,
          opRemoveBlockAndUpdateSizes: true,
        },
      }).done(function (data) {
        // If result is ok remove it from DOM otherwhise display toastr error
        toastr.options = {
          positionClass: 'toast-top-center',
        };
        if (data.actionStatus === 'OK') {
          //toastr.info(data.message);
        } else {
          toastr.error(data.message);
        }
      });
    },

    refreshCreationLink: () => {
      // On empty blocks & portlets
      $('.jportal-wrapper').find('.btn-add-portlet').remove();
      $('.jportal-wrapper')
        .find('.empty-block, .portlet-edition-overlay')
        .each((_index, element) => {
          let blockId = $(element).closest('.jportal-block').data('block-id');
          let $button = $(
            Templates.ADD_PORTLET_BUTTON({
              'block-id': blockId,
              'jportal-id': JPortalUtils.getJPortal(),
            })
          );
          $(element).append($button);
        });
    },

    refreshSlick: () => {
      $('.slick-carousel').slick && $('.slick-carousel').slick('refresh');
    },

    updateBlockSize: ($element, size) => {
      $element.removeClass(function (index, className) {
        const elementClass = className.split(' ');
        for (let i = 0; i < elementClass.length; i++) {
          if (elementClass[i].startsWith(GRID_COL_DEFAULT_PREFIX)) {
            return elementClass[i];
          }
        }
      });
      $element.addClass(GRID_COL_DEFAULT_PREFIX + size);
    },

    getBlockSize: ($element) => {
      let classNames = $element.attr('class');
      const elementClass = classNames.split(' ');
      for (let i = 0; i < elementClass.length; i++) {
        if (elementClass[i].startsWith(GRID_COL_DEFAULT_PREFIX)) {
          let size = elementClass[i].replace(GRID_COL_DEFAULT_PREFIX, '');
          try {
            return parseInt(size, 10);
          } catch (err) {
            $.console.log(err);
            return 0;
          }
        }
      }
    },

    addGlobalOverlay: () => {
      if ($('.jportal-global-overlay').length === 0) {
        let $globalOverlay = $('<div>', { class: 'jportal-global-overlay' });
        $('body').prepend($globalOverlay);
        $('.jportal-global-overlay').displayLoadingWaves();
      }
    },
    removeGlobalOverlay: () => {
      $('.jportal-global-overlay').remove();
    },
  };

  $(document).ready(function () {
    $(document).on('click', "[data-jalios-jportal-action='activate-jportal-simple-edit']", toggleSimpleEdition);
  });
})(window.jQuery);
