!function ($) {

  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------

  var commonClickHandle = function(event) {
    // Prevent submit
    event.preventDefault();
    
    // Prevent propagation
    event.stopPropagation();
  }
  
  var handleUnifiedInsertMediaClick = function(event) {
    commonClickHandle(event);
    var $elm = $(event.currentTarget);
    var mediaSource = $elm.data('jalios-source');
    $.jalios.UnifiedInsert.insertMedia(mediaSource);
  };
  
  var handleUnifiedInsertLinkClick = function(event) {
    commonClickHandle(event);
    var $elm = $(event.currentTarget);
    var dataId = $elm.data('jalios-id');
    $.jalios.UnifiedInsert.insertLink(dataId);
  };
  
  var handleUnifiedInsertCloseClick = function(event) {
    commonClickHandle(event);
    window.parent ? window.parent.close() : window.close();
  };
  
  /* Do stuff on DOM Ready */
  var register = function() {
    // used by topframe (unifiedinsert.jsp)
    if ($(".app-unifiedinsert").exists()) {
      window.skipJsRedirect = true; // inform Popup.redirect method in jalios-browser.js to skip this window when refreshing parent
      $(document).on('jalios:unifiedinsert', handleUnifiedInsertEvent);
      return;
    }
    // used by iframe (mediabrowser, pubchooser, querychooser, etc)
    $(document).on('click', ".unifiedinsert-media", handleUnifiedInsertMediaClick);
    $(document).on('click', ".unifiedinsert-link", handleUnifiedInsertLinkClick);
    $(document).on('click', ".unifiedinsert-close", handleUnifiedInsertCloseClick);
  }

  // ------------------------------------------
  //  Internal methods used to propagate insertion selection from iframe to topframe
  // ------------------------------------------

  /**
   * Receive and process insert event in the top frame(unifiedinsert.jsp).
   */
  var handleUnifiedInsertEvent = function(event) {
    $.console.log("jalios:unifiedinsert event catched :", event);

    Popup.callback(event.unifiedinsert);
    var closeAfter = (event.unifiedinsert.closeAfter == undefined) ? true : event.unifiedinsert.closeAfter;
    if (closeAfter) {
      window.close();
    }
  };
  
  /**
   * Internal method sending an event from the content iframe (mediabrowser, pubchooser, querychooser, etc)
   * to the top frame (unifiedinsert.jsp).
   */
  var sendInsertEvent = function(eventType, eventAttributes, closeAfter) {

    var winOpener = window.parent; // iframe
    if (!winOpener){ return false; }

    var event = $.Event('jalios:unifiedinsert');
    event.unifiedinsert    = {};
    event.unifiedinsert.type   = eventType;
    event.unifiedinsert.attributes = eventAttributes;
    event.unifiedinsert.closeAfter = closeAfter;
    var $parentDoc = winOpener.jQuery(winOpener.document);
    $parentDoc.trigger(event);
  }
  
  // ------------------------------------------
  //  PUBLIC
  // ------------------------------------------

  $.jalios.UnifiedInsert = {

    /**
     * Inform unified insert that the specified Data has been selected for insertion.
     * <p>
     * When UnifiedInsert has been opened by wysiwyg editor, it will normally insert
     * a JHTML tag <pre><jalios:link data-jalios-id='$dataId'></pre>
     * <p>
     * This method must be invoked FROM the content selection iframe.
     *  
     * @param {dataId} the id of the Data that was selected, required
     * @param {closeAfter} boolean to indicate wether current window should be closed after insert, optional (default behavior is to close)  
     */
    insertLink: function(dataId, closeAfter) {
      if (!dataId) {
        return;
      }
      $.jalios.UnifiedInsert.insert('link', {
          "data-jalios-id" : dataId
        }, closeAfter);
    },
    
    /**
     * Inform unified insert that the specified media has been selected for insertion.
     * <p>
     * When UnifiedInsert has been opened by wysiwyg editor, it will normally insert
     * a JHTML tag <pre><jalios:media data-jalios-source='$mediaSource'></pre>
     * <p>
     * This method must be invoked FROM the content selection iframe.
     *  
     * @param {mediaSource} the source of the media that was selected (url, id, ...), required
     * @param {closeAfter} boolean to indicate wether current window should be closed after insert, optional (default behavior is to close)  
     */
    insertMedia: function(mediaSource, closeAfter) {
      if (!mediaSource) {
        return;
      }
      $.jalios.UnifiedInsert.insert('media', {
          "data-jalios-source" : mediaSource
        }, closeAfter);
    },
    
    /**
     * Inform unified insert that the specified include has been request for insertion.
     * <p>
     * When UnifiedInsert has been opened by wysiwyg editor, it will normally insert
     * a JHTML tag <pre><jalios:include data-jalios-type='$includeType' data-jalios-params='$includeParams'></pre>
     * <p>
     * This method must be invoked FROM the content selection iframe.
     *  
     * @param {includeType} the type of include selected (eg 'query', 'gallery', ...), required
     * @param {includeParams} the params of this include selected (eg 'qs=foobar')
     * @param {closeAfter} boolean to indicate wether current window should be closed after insert, optional (default behavior is to close)  
     */
    insertInclude: function(includeType, includeParams, closeAfter) {
      if (!includeType) {
        return;
      }
      $.jalios.UnifiedInsert.insert('include', {
          "data-jalios-type" : includeType,
          "data-jalios-params" : includeParams
        }, closeAfter);
    }, 
    
    /**
     * Inform unified insert that the specified HTML was selected for insertion.
     * <p>
     * When UnifiedInsert has been opened by wysiwyg editor, it will normally insert
     * the specified HTML tag in the editor.
     * <p>
     * This method must be invoked FROM the content selection iframe.
     *  
     * @param {html} the HTML selected for insertion, required
     * @param {closeAfter} boolean to indicate wether current window should be closed after insert, optional (default behavior is to close)  
     */
    insertHTML: function(html, closeAfter) {
      if (!html) {
        return;
      }
      $.jalios.UnifiedInsert.insert('html', {
          "data-jalios-html" : html
        }, closeAfter);
    },
    
    /**
     * Inform unified insert that the specified insertion was requested.
     * <p>
     * This is the most generic method supporting every possible kind of insert
     * <p>
     * This method must be invoked FROM the content selection iframe.
     *  
     * @param {insertType} the type of insert being requeste (eg 'link', 'media', 'include', 'html' ...), required
     * @param {insertOptions} the attributes required for this insert, examples :  
     * for a link <pre>{ 'data-jalios-id': 'c_42' }</pre>   ) 
     * for a media <pre>{ 'data-jalios-source': 'myurl or id' }</pre>   )  
     * for an include <pre>{ 'data-jalios-type': 'gallery|media', 'data-jalios-params' : 'qs=foobar'}</pre>   )  
     * for some HTML <pre>{ 'data-jalios-html': 'Hello<strong>World!</strong>'}</pre>   )  
     * @param {closeAfter} boolean to indicate wether current window should be closed after insert, optional (default behavior is to close)  
     */
    insert: function(insertType, insertOptions, closeAfter) {
      if (!insertType) {
        return;
      }
      sendInsertEvent(insertType, insertOptions, closeAfter);
    }
  
  };
  
  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function() {
    register();
  });

}(window.jQuery);
