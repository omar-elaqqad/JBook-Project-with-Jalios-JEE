!(function ($) {
  tinymce.PluginManager.add('jsmartinsert', function (editor, url) {
    editor.addShortcut('ctrl+' + tinymce.util.VK.SPACEBAR, 'jsmartinsert.description', doInsert);

    bindEvents(editor);

    function doInsert() {
      cleanUp();

      var selection = editor.selection,
        dom = editor.dom;

      // Check if there is a text selected or not
      if (selection.isCollapsed()) {
        // Zero Width No-Break Space (zwnbsp)
        var chr = '&#xFEFF;';
        var markerId = 'marker';

        try {
          // Marker to add at the current cursor position
          var markerElement = '<span id="' + markerId + '">' + chr + '</span>';
          // Add new marker at the current position
          selection.setContent(markerElement);
          // Find the marker previously added
          var $marker = $(editor.getBody()).find('#marker');
          var markerNode = $marker.get(0);

          // Put the cursor in front of the marker element
          selection.select(markerNode);
          selection.collapse();

          // Retrieve the marker node's parent
          var parentNode = selection.getNode();

          // Retrieve the word just before the marker
          var parentContent = parentNode.innerHTML;
          // To support selection of words containing unicode letters (i.e. outside the
          // ascii range), build a regexp using unicode ranges from the following ranges :
          //  - numbers : 0030 - 0039
          //  - basic latin letters : 0041 - 007A
          //  - Latin 1 supplement  (letters only) : 00C0 - 00FF
          //  - Latin 1 extended A: 0100 - 017F
          //  - Latin 1 extended B: 0180 - 024F
          //  - Greek and coptic : 0370 - 03FF
          //  - cyrillic : 0400 - 04FF
          var lettersRanges =
            '\\u0030-\\u0039\\u0041-\\u007A\\u00C0-\\u00FF\\u0100-\\u017F\\u0180-\\u024F\\u0370-\\u03FF\\u0400-\\u04FF';
          var s =
            '([' +
            lettersRanges +
            ']+)(&nbsp;|\\s)*' +
            $.jalios.Common.escapeRegExp(markerElement).replace(chr, '[^<]*');
          var regex = new RegExp(s, 'i');
          parentNode.innerHTML = parentContent.replace(regex, function ($0, $1, $2) {
            // Wrap the word with a SPAN as selected marker
            return '<span class="mce-match-marker-selected">' + $1 + '</span>' + ($2 ? $2 : '');
          });

          // Find the SPAN wrapper node
          var $selectionElement = $(editor.getBody()).find('SPAN.mce-match-marker-selected');
          if ($selectionElement.length) {
            var selectionNode = $selectionElement.get(0);

            var startContainer = selectionNode.firstChild;
            var endContainer = selectionNode.firstChild;
            // Unwrap the word by removing the SPAN wrapper
            _unwrap(selectionNode);

            // Select the word
            var rng = dom.createRng();
            rng.setStart(startContainer, 0);
            rng.setEnd(endContainer, endContainer.data.length);
            selection.setRng(rng);
          }
        } catch (e) {
          $.console.log('Could not select the word: ' + e.stack ? e.stack : e);
        } finally {
          // Remove the marker element
          dom.remove('marker');
        }
      }

      // Get the selected text
      var selectedText = selection.getContent({
        format: 'text'
      });

      // Search if the selected text is not empty and not multiline
      if (!!$.trim(selectedText) && !selectedText.match(/[\r\n]+/gi)) {
        // Create new wrapper element for the dropdown - add typeahead-menu to use the CSS from jalios-autocomplete.less
        var $smartInsert = $(
          '<div class="jalios-smartinsert ajax-refresh-div typeahead-menu"><ul class="dropdown-menu"><li class="loading"></li></ul></div>'
        );

        // Position the element under the selected text
        var offset = editor.inline ? _offsetInline() : _offset();
        $smartInsert.css({
          'top': offset.top + 5,
          'left': offset.left
        });

        // Add the element to the body
        $('body').append($smartInsert);

        // Bind 'click' event to handle the item selection
        $smartInsert.on('click', itemClick);

        // Store the selected text as data attribute in the smartinsert to get it after
        $smartInsert.data('selectedText', selectedText);

        // Retrieve the main dropdown menu in ajax and add it to the wrapper element
        _loadMainDopdown($smartInsert);
      }
    }

    /**
     * Unwrap the word by removing the SPAN wrapper.
     */
    function _unwrap(node) {
      var parentNode = node.parentNode;

      if (node.firstChild) {
        parentNode.insertBefore(node.firstChild, node);
      }

      node.parentNode.removeChild(node);
    }

    /**
     * Returns the position of the selected text.
     */
    function _offset() {
      var rtePosition = $(editor.getContainer()).offset();
      var contentAreaPosition = $(editor.getContentAreaContainer()).position();

      var nodePosition = _getSelectedNodePosition(editor.selection);

      return {
        top: rtePosition.top + contentAreaPosition.top + nodePosition.top + nodePosition.height,
        left: rtePosition.left + contentAreaPosition.left + nodePosition.left
      };
    }

    /**
     * Returns the position of the selected text when the wysiwyg editor is in Inline Mode.
     */
    function _offsetInline() {
      const nodePosition = _getSelectedNodePosition(editor.selection);

      return {
        top: nodePosition.top + $(document).scrollTop(),
        left: nodePosition.left
      };
    }

    /**
     * Returns the position of the given selection.
     */
    function _getSelectedNodePosition(selection) {
      var position;

      var rng = selection.getRng(true);
      if (rng.getClientRects) {
        var rects = rng.getClientRects();
        if (rects.length > 0) {
          position = rects[0];
        }
      }

      // If getClientRects() method is not supported, fallback with position of the selection node
      if (!position) {
        var $node = $(selection.getNode());
        var nodePosition = $node.position();
        position = {
          top: nodePosition.top,
          left: nodePosition.left,
          height: $node.innerHeight,
          width: $node.innerWidth
        };
      }

      return position;
    }

    /**
     * Load the main dropdown menu in ajax and add it to the smartinsert wrapper element.
     */
    function _loadMainDopdown($smartInsert) {
      $.ajax({
        url: 'js/jalios/core/wysiwyg/plugins/jsmartinsert/jsp/smartinsert.jsp',
        data: {
          autocomplete: $smartInsert.data('selectedText')
        },
        dataType: 'html',
        cache: true,
        success: function (html) {
          $smartInsert.html(html);
        }
      });
    }

    /**
     * Remove the smartinsert contextual menu if exists.
     */
    function removeSmartInsert(e) {
      var $smartInsert = $(e.target).closest('.jalios-smartinsert');
      if (!$smartInsert.exists()) {
        cleanUp();
      }
    }

    /**
     * Remove the smartinsert contextual menu.
     */
    function cleanUp() {
      var $smartInsert = $('.jalios-smartinsert');
      $smartInsert.remove();
    }

    /**
     * Click on the current selected item.
     */
    function itemClick(e) {
      var $li = $(e.target).closest('LI');
      return selectItem($li, e);
    }

    /**
     * Append the selected data into the editor content.
     * If it's a menu (Publications, Members ...) which is selected, refresh the smartinsert to display the result of the menu.
     */
    function selectItem($li, e) {
      if ($li.length) {
        var item = $li.data();
        if (!$.isEmptyObject(item)) {
          select(item);
          cleanUp();
        } else if ($li.hasClass('ajax-refresh')) {
          $li.find('A').refresh({
            'noscroll': true,
            'nohistory': true,
            'callback': function () {
              // $smartInsert.find('LI').first().addClass('active');
            }
          });
        } else if ($li.hasClass('nomatch')) {
          cleanUp();
        }
      }

      if (e) {
        e.stopPropagation();
        e.preventDefault();
      }
    }

    /**
     * Append the selected data into the editor content.
     */
    function select(item) {
      var content = '<jalios:link data-jalios-id="' + item.value + '" />&nbsp;';
      editor.selection.setContent(content);
      editor.focus();
    }

    /**
     * Bind events for the smartinsert.
     */
    function bindEvents() {
      editor.on('keyup', keyUp);
      editor.on('keydown', keyDown);
      editor.on('click', removeSmartInsert);

      editor.on('init', function () {
        $(editor.getWin()).on('scroll', cleanUp);
      });

      // Global event must be cleaned when editor is removed
      let editorIdSelector = '#' + editor.id;
      $(document).on('click', editorIdSelector, removeSmartInsert);
      editor.on('remove', function () {
        $(document).off('click', editorIdSelector, removeSmartInsert);
      });
    }

    /**
     * Handle keyup event.
     */
    function keyUp(e) {
      var $smartInsert = $('.jalios-smartinsert');
      if ($smartInsert.length) {
        switch (e.which || e.keyCode) {
          // DOWN ARROW
          case 40:
          // UP ARROW
          case 38:
          // SHIFT
          case 16:
          // CTRL
          case 17:
          // ALT
          case 18:
          // SPACEBAR
          case 32:
            break;

          // TAB
          case 9:
          // ENTER
          case 13:
            var $li = $smartInsert.find('LI.active');
            selectItem($li);
            break;

          // LEFT ARROW
          case 37:
            previousPage($smartInsert);
            break;

          // BACKSPACE
          case 8:
            var $mainDropdown = $smartInsert.find('.dropdown-menu-main');
            if ($mainDropdown.length) {
              cleanUp();
            } else if (!previousPage($smartInsert)) {
              // Reload the main dropdown menu in ajax
              _loadMainDopdown($smartInsert);
            }
            break;

          // RIGHT ARROW
          case 39:
            nextPage($smartInsert);
            break;

          // ESC
          case 27:
          // DELETE
          case 46:
            cleanUp();
            break;

          default:
          // Do nothing
        }
      }
    }

    /**
     * Handle keydown event.
     */
    function keyDown(e) {
      var $smartInsert = $('.jalios-smartinsert');
      if ($smartInsert.length) {
        switch (e.which || e.keyCode) {
          // BACKSPACE
          case 8:
          // TAB
          case 9:
          // ENTER
          case 13:
          // ESC
          case 27:
          // SPACEBAR
          case 32:
          // LEFT ARROW
          case 37:
          // RIGHT ARROW
          case 39:
          // DELETE
          case 46:
            e.preventDefault();
            break;

          // UP ARROW
          case 38:
            e.preventDefault();
            highlightPreviousResult();
            break;
          // DOWN ARROW
          case 40:
            e.preventDefault();
            highlightNextResult();
            break;
        }

        e.stopPropagation();
      }
    }

    /**
     * Refresh the smartinsert with the previous page if there is one.
     */
    function previousPage($smartInsert) {
      var success = false;

      var $li = $smartInsert.find('LI.previous');
      if ($li.length) {
        selectItem($li);
        success = true;
      }

      return success;
    }

    /**
     * Refresh the smartinsert with the next page if there is one.
     */
    function nextPage($smartInsert) {
      var success = false;

      var $li = $smartInsert.find('LI.next');
      if ($li.length) {
        selectItem($li);
        success = true;
      }

      return success;
    }

    /**
     * Highlight the previous item in the dropdown. If there is no previous element, select the last item to loop.
     */
    function highlightPreviousResult() {
      var $smartInsert = $('.jalios-smartinsert');
      var currentIndex = $smartInsert.find('li.active').index(),
        index = currentIndex === 0 ? $smartInsert.find('li').length - 1 : --currentIndex;

      $smartInsert.find('li').removeClass('active').eq(index).addClass('active');

      // Check if the header of smartinsert is selected -> select the previous element
      if ($smartInsert.find('li.active').hasClass('results')) {
        highlightPreviousResult();
      }
    }

    /**
     * Highlight the next item in the dropdown. If there is no next element, select the first item to loop.
     */
    function highlightNextResult() {
      var $smartInsert = $('.jalios-smartinsert');
      var currentIndex = $smartInsert.find('li.active').index(),
        index = currentIndex === $smartInsert.find('li').length - 1 ? 0 : ++currentIndex;

      $smartInsert.find('li').removeClass('active').eq(index).addClass('active');

      // Check if the header of smartinsert is selected -> select the next element
      if ($smartInsert.find('li.active').hasClass('results')) {
        highlightNextResult();
      }
    }
  });
})(window.jQuery);
