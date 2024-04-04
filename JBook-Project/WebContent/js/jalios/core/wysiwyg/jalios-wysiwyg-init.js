!(function ($) {
  /**
   * Create a wysiwyg editor.
   */
  $.fn.initWysiwyg = function () {
    return this.each(function () {
      var $self = $(this);
      
      if ($self.hasClass('wysiwyg-editor-init-in-progress')) {
        $.console.error('Concurrent wysiwyg initialization attempt for element', $self[0]);
        return;
      }      
      $self.addClass('wysiwyg-editor-init-in-progress');

      try {
        // Ensure that there is no editor already initialized on the element
        $self.removeWysiwyg();

        // Track editor initialization to add dedicated class as pending progress flag on form
        // The data pending-wysiwyg-init value is increased by 1 everytime a wysiwyg is initialized in the form then decremented by 1
        // as soon as a wysiwyg is ready.
        // When a wysiwyg is ready, if the value is === 0
        // then it means all the wysiwygs of the form are initialized, 
        // thus we remove the class wysiwyg-init-in-progress
        var $form = $($self[0].form);
        $form.data('pending-wysiwyg-init', ($form.data('pending-wysiwyg-init') || 0) + 1);
        $form.addClass('wysiwyg-init-in-progress');

        // Initialize the wysiwyg editor on the element
        $self.wysiwyg({
          language_load: true,
          language: $.jalios.I18N.glp('lang.tinymce'),
          setup: setup
        });
      } catch (e) {
        $.console.error(
          'An error occurred while initializing the wysiwyg editor on element #' + $self.attr('id') + ': ' + e.stack
            ? e.stack
            : e
        );

        var $wysiwygEditor = $self.closest('.wysiwyg-editor');

        // Remove the wysiwyg editor
        $self.removeWysiwyg();

        // Remove the loading animation
        hideWysiwyg($wysiwygEditor);

        $wysiwygEditor.append(
          '<div class="wysiwyg-message wysiwyg-message-error"><p>' + I18N.glp('wysiwyg.error.msg') + '</p></div>'
        );
        
        // Clear loading progress flag
        var $form = $($self[0].form);
        $form.data('pending-wysiwyg-init', ($form.data('pending-wysiwyg-init') || 0) - 1);
        if ($form.data('pending-wysiwyg-init') <= 0) {
          $form.removeClass('wysiwyg-init-in-progress');
        }
        $self.removeClass('wysiwyg-editor-init-in-progress');
      }
    });

    function setup(editor) {
      // Initialize a 'plugins' object to add specific plugin properties/methods to be able use them in other plugins
      if (!editor.jalios) {
        editor.jalios = {};
      }
      if (!editor.jalios.plugins) {
        editor.jalios.plugins = {};
      }

      var $element = $(editor.getElement()); // textarea element

      var $wysiwygEditor = $element.closest('.wysiwyg-editor');

      // Initialize the loading animation
      showWysiwyg($wysiwygEditor);

      // Update the settings
      var $options = editor ? editor.settings : null;
      if ($options) {
        // Force statusbar to true when the resize option is enabled and statusbar is disabled to display the resize icon.
        // A CSS class hides the status bar (cf. wysiwyg.jsp)
        if ($options['resize'] && $options['statusbar'] === false) {
          $options['statusbar'] = true;
        }

        // Add 'contenteditable' attribute as valid attributes for custom jalios tags
        if ($options['extended_valid_elements']) {
          var elements = $options['extended_valid_elements'].split(',');
          var updated = '';
          for (var i = 0; i < elements.length; i++) {
            if (i > 0) {
              updated += ',';
            }
            var element = elements[i];
            if (element.indexOf('jalios') != -1) {
              if (element.indexOf('contenteditable') < 0) {
                if (element.indexOf('[') != -1) {
                  updated += element.replace(']', '|contenteditable]');
                } else {
                  updated += element + '[contenteditable]';
                }
              }
            }
          }
          $options['extended_valid_elements'] = updated;
        }
      }
      editor.settings = $options;

      editor.on('init', function (e) {
        /* Hack to Fix the width problem. An issue is open on github: https://github.com/tinymce/tinymce/issues/3798 */
        if (tinyMCE.majorVersion == 4) {
          $wysiwygEditor.find('IFRAME').css('width', 'calc(100% - 1px)');
        }

        // Hack to defined the editor height below the authorized minimum height (100px)
        if (
          tinyMCE.majorVersion == 4 &&
          editor.settings.height < 100 &&
          editor.settings.min_height <= editor.settings.height
        ) {
          $('#' + editor.id + '_ifr').css('height', editor.settings.height);
        }

        var $form = $($element[0].form);
        $form.data('pending-wysiwyg-init', ($form.data('pending-wysiwyg-init') || 0) - 1);
        if ($form.data('pending-wysiwyg-init') <= 0) {
          $form.removeClass('wysiwyg-init-in-progress');
        }

        // Disable the editor if the related textarea is disabled or readonly
        if ($element.prop('disabled') || $element.prop('readonly')) {
          editor.setMode('readonly');
        }

        // Remove class indicating wysiwyg initialization was in progress             
        $element.removeClass('wysiwyg-editor-init-in-progress');
        
        // Add a new class to indicate that the editor is initialized and avoid resetting it after an ajax request
        $element.addClass('wysiwyg-initialized');

        // Remove the loading animation after editor initialization
        hideWysiwyg($wysiwygEditor);

        // Focus the editor if 'focus' class is found
        var $container = $(editor.getContainer());
        var autoFocus = $container.closest('.focus').exists() && $container.is(':visible');
        if (autoFocus) {
          editor.focus();
        }

        // Workaround TinyMCE memory leak (editor instance added twice in tinymce.editors array)
        // --> any duplicate instance until only one is kept in array
        // https://github.com/tinymce/tinymce/issues/3710
        var editorDupeCount = 0;
        tinymce.editors.each(function (itEditor) {
          if (editor == itEditor) {
            editorDupeCount++;
          }
        });
        while (editorDupeCount > 1) {
          for (var i = 0; i < tinymce.editors.length; i++) {
            if (tinymce.editors[i] == editor) {
              tinymce.editors.splice(i, 1);
              break;
            }
          }
          editorDupeCount--;
        }

        var scrollTo = editor.settings.scrollto;
        if (scrollTo) {
          if (isNaN(scrollTo)) {
            // Is CSS Selector (Not a Number)
            var $scrollElt = $(editor.getBody()).find(scrollTo);
            if ($scrollElt.length) {
              let $children = $(editor.iframeElement).contents().children();
              if ($children.length > 0) {
                $children.animate(
                  {
                    scrollTop: $scrollElt.get(0).offsetTop
                  },
                  200
                );
              }

              let $wysiwygInlineButtons = $('.wysiwyg-inline-buttons');
              if ($wysiwygInlineButtons.exists()) {
                let docScrollTop = $('.wysiwyg-inline-buttons').offset().top - $('.topbar').height() - 20;
                $(window).scrollTop(docScrollTop);
              }
            }
          } else {
            // Is a Number
            var position = parseInt(scrollTo, 10);
            if (!isNaN(position)) {
              $(editor.getWin()).scrollTop(position);
            }
          }
        }

        // Inform any body interested that editor is ready
        var event = $.Event('wysiwyg:ready');
        event.editor = editor;
        $element.trigger(event);
      });
    }
  };

  /**
   * Remove an existing wysiwyg editor.
   */
  $.fn.removeWysiwyg = function () {
    return this.each(function () {
      var $self = $(this);
      try {
        $self.wysiwyg('destroy');
      } catch (e) {
        $.console.error(
          'An error occurred while removing the wysiwyg editor on element #' + $self.attr('id') + ': ' + e.stack
            ? e.stack
            : e
        );
      }
    });
  };

  const showWysiwyg = function ($element) {
    $element.displayLoading();
  };

  const hideWysiwyg = function ($element) {
    let $loading = $element.find('.ajax-loading-component');
    $loading.fadeOut(function () {
      $loading.remove();
    });
  };

  // Find all Editors whose elements is no longer part of the DOM and remove them.
  // This will prevents editor leaks after ajax refresh
  var destroyDetachedEditors = function () {
    if (typeof tinymce === undefined) {
      return;
    }
    var editorsToDestroy = [];
    tinymce.editors.each(function (editor) {
      if (!$(editor.getElement()).closest('html').exists()) {
        editorsToDestroy.push(editor);
      }
    });
    editorsToDestroy.each(function (editor) {
      editor.destroy();
    });
  };

  var register = function (event) {
    tinymce.baseURL = JcmsJsContext.getBaseUrl() + $.jalios.Properties.get('wysiwyg.path');

    // Initialize the WYSIWYG editors after the DOM is loaded (ajax or not).
    // Do not initialize the elements with the class 'js-wysiwyg-skip-init'
    $('.js-wysiwyg:not(.js-wysiwyg-skip-init):not(.wysiwyg-editor-init-in-progress):not(.wysiwyg-initialized)').initWysiwyg();

    // Bind the 'click' event on the elements with a WYSIWYG action, and trigger the WYSIWYG events according to the WYSIWYG action
    $(document).on('click', '[data-jalios-action^="wysiwyg:"]', function (e) {
      var $elt = $(this);
      var wysiwygAction = $elt.data('jalios-action');

      var event = $.Event(wysiwygAction);
      $elt.trigger(event);
    });

    // Listen the WYSIWYG 'init' action to initialize a WYSIWYG editor
    $(document).on('wysiwyg:init', function (e) {
      var $elt = $(e.target);
      var target = $elt.data('jalios-target');
      if (target) {
        $(target).initWysiwyg();
      }
    });

    // Listen the WYSIWYG 'remove' action to remove a WYSIWYG editor and destroy the wysiwyg plugin instance data attached to the element
    $(document).on('wysiwyg:remove', function (e) {
      var $elt = $(e.target);
      var target = $elt.data('jalios-target');
      if (target) {
        $(target).removeWysiwyg();
      }
    });

    // Remove all editors that are not bound to a DOM element
    destroyDetachedEditors();
  };

  $(document).on('jalios:ready', function (event) {
    register(event);
  });

  // empy any auxiliary menu opened who might be in the modal
  // We don't want to remove the div as it might be used by another wysiwyg in the page
  $(document).on('hide.bs.modal', function (event) {
    $('.tox.tox-tinymce-aux').empty();
  });

  // Remove all editors that are no longer bound to a DOM element
  $(document).on('jalios:refresh', function (event) {
    var refreshAfter = $.jalios.Event.match(event, 'refresh', 'after');
    if (refreshAfter) {
      destroyDetachedEditors();
    }
  });
})(window.jQuery);
