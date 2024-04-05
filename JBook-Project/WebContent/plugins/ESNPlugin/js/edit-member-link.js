// the semi-colon before function invocation is a safety net against concatenated
// scripts and/or other plugins which may not be closed properly.
;(function($, window, document, undefined) {

  "use strict";

  // undefined is used here as the undefined global variable in ECMAScript 3 is
  // mutable (ie. it can be changed by someone else). undefined isn't really being
  // passed in so we can ensure the value of it is truly undefined. In ES5, undefined
  // can no longer be modified.

  // window is passed through as local variable rather than global
  // as this (slightly) quickens the resolution process and can be more efficiently
  // minified (especially when both are regularly referenced in your plugin).

  const getClipboardUrl = function() {
    let clipboardUrl;
    
    // Filtering URL from the content using regular expressions
    if (event.clipboardData && event.clipboardData.types.contains && event.clipboardData.types.contains('text/plain')){
      // Chrome && edge
      clipboardUrl = event.clipboardData.getData('text/plain');
    } else if (event.clipboardData && event.clipboardData.types.indexOf('text/plain') > -1){
      // Firefox
      clipboardUrl = event.clipboardData.getData('text/plain');
    } else if (window.clipboardData && window.clipboardData.getData('Text')){
      // IE < Edge
      clipboardUrl = window.clipboardData.getData('Text');
    } 
    return clipboardUrl;
  }; // clipboardUrl

  const getUrlHostname = function(url) {
    if (!url) {
      return null;
    }
    let loc = document.createElement('a');
        loc.href = url.toLowerCase();
    let hostname = loc.hostname;
    //$.console.debug("[esn-edit-member-link]", "[getUrlHostname]", "for: ", url, "hostname is: ", hostname);
    return hostname;
} // getUrlHostname
  
  const resolveUrlLabel = function(url) {
    
    let urlDomainLabelMap = $.plugin.esn.editMemberLink.urlDomainLabelMap;
    if (!urlDomainLabelMap) {
      // Reference map has not been found
      return;
    }
    
    let match = false;
    let urlHostname = getUrlHostname(url);
    if (!urlHostname) {
      return;
    }

    for (let i = 0; i < urlDomainLabelMap.length; i++) {
      let itMapping = urlDomainLabelMap[i];
      let itDomain = itMapping['domain'] ? itMapping['domain'] : null;
      let itLabel = itMapping['label'] ? itMapping['label'] : null;
      
      if (!itDomain || !itLabel) {
        // Incomplete mapping definition
        continue;
      }
      
      // Test user URL matched mapping definition
      //$.console.debug("[esn-edit-member-link]", "[resolveUrlLabel]", "match?", urlHostname, itDomain);
      match = urlHostname.match(itDomain);
      if (match) {
        return itLabel;
      }
    }
  }; // resolveUrlLabel
  
  const handlePasteUrl = function(event) {
    // Ensure Paste event occured in Edit MemberLink FORM
    let $editLinkForm = $(event.target).closest(".esn-edit-member-link");
    // Ensure Title input exists
    let $titleInput = $editLinkForm.find("INPUT[name='title']");
    if (!$titleInput || !$titleInput.exists()) {
      return;
    }
    // Do nothing when title is already not empty!
    let isTitleInputNotEmpty = $titleInput.val();
    if (isTitleInputNotEmpty) {
      return;
    }
    
    // Retrieve pasted text
    let clipboardUrl = getClipboardUrl();
    if (!clipboardUrl || !clipboardUrl.length) {
      return;
    }
    // Resolve domain -> label
    let label = resolveUrlLabel(clipboardUrl);
    if (label) {
      $titleInput.val(label);
    }
  }; // handlePasteUrl

  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.plugin) { $.plugin = {}; }
  if (!$.plugin.esn) { $.plugin.esn = {}; }
  if (!$.plugin.esn.editMemberLink) { $.plugin.esn.editMemberLink = {}; }

  // This reference map is filled by JSP, and comes from properties.
  //$.plugin.esn.editMemberLink.urlDomainLabelMap = [
  //  { 'domain' : 'twitter.com', 'label' : 'Twitter' },
  //  { 'domain' : 'linkedin.com', 'label' : 'LinkedIn' },
  //];

  var onJaliosAjaxRefreshAfter = function(refresh) {
    registerPasteUrl();
  };

  var onJaliosRefreshHandler = function(event) {
    var refreshAfter = $.jalios.Event.match(event, 'refresh', 'after');
    if (refreshAfter) {
      onJaliosAjaxRefreshAfter(event);
    }
  };

  const registerPasteUrl = function() {
    // Do not bind on document
    //$(document).on('paste', handlePasteUrl);
    // Bind on INPUT.url so that we know the paste event occurs on URL input
    $('.esn-edit-member-link INPUT[name="url"]').on('paste', handlePasteUrl);
  }; // registerPasteUrl

  const register = function() {
    registerPasteUrl();
  };

  $(document).on('jalios:ready', function() {
    register();
  });

}(jQuery, window, document));