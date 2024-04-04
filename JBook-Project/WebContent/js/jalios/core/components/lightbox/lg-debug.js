/*!
 * lightgallery | 2.4.0 | January 29th 2022
 * http://www.lightgalleryjs.com/
 * Copyright (c) 2020 Sachin Neravath;
 * @license GPLv3
 */

(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
    typeof define === 'function' && define.amd ? define(factory) :
      (global = typeof globalThis !== 'undefined' ? globalThis : global || self, global.lgJPlatformDebug = factory());
}(this, (function () {
  'use strict';

  /*! *****************************************************************************
  Copyright (c) Microsoft Corporation.

  Permission to use, copy, modify, and/or distribute this software for any
  purpose with or without fee is hereby granted.

  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
  REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
  AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
  INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
  LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
  OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
  PERFORMANCE OF THIS SOFTWARE.
  ***************************************************************************** */

  /**
   * List of lightGallery events
   * All events should be documented here
   * Below interfaces are used to build the website documentations
   * */
  var lGEvents = {
    afterAppendSlide: 'lgAfterAppendSlide',
    init: 'lgInit',
    hasVideo: 'lgHasVideo',
    containerResize: 'lgContainerResize',
    updateSlides: 'lgUpdateSlides',
    afterAppendSubHtml: 'lgAfterAppendSubHtml',
    beforeOpen: 'lgBeforeOpen',
    afterOpen: 'lgAfterOpen',
    slideItemLoad: 'lgSlideItemLoad',
    beforeSlide: 'lgBeforeSlide',
    afterSlide: 'lgAfterSlide',
    posterClick: 'lgPosterClick',
    dragStart: 'lgDragStart',
    dragMove: 'lgDragMove',
    dragEnd: 'lgDragEnd',
    beforeNextSlide: 'lgBeforeNextSlide',
    beforePrevSlide: 'lgBeforePrevSlide',
    beforeClose: 'lgBeforeClose',
    afterClose: 'lgAfterClose',
    rotateLeft: 'lgRotateLeft',
    rotateRight: 'lgRotateRight',
    flipHorizontal: 'lgFlipHorizontal',
    flipVertical: 'lgFlipVertical',
    autoplay: 'lgAutoplay',
    autoplayStart: 'lgAutoplayStart',
    autoplayStop: 'lgAutoplayStop'
  };


  var __assign = function () {
    __assign = Object.assign || function __assign(t) {
      for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p)) t[p] = s[p];
      }
      return t;
    };
    return __assign.apply(this, arguments);
  };

  var imageEditorSettings = {
    fullScreen: true,
    fullscreenPluginStrings: {
      toggleFullscreen: 'Toggle Fullscreen'
    }
  };

  var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '`': '&#x60;',
    '=': '&#x3D;'
  };

  function escapeHtml(text) {
    return text.replace(/[&<>"'`=\/]/g, function (s) {
      return entityMap[s];
    });
  }

  var decodeHtml = function (text) {
    let newText = escapeHtml(text);
    return newText;
  };

  var JPlatformDebug = /** @class */ (function () {
    function JPlatformDebug(instance, $LG) {
      // get lightGallery core plugin instance
      this.core = instance;
      this.$LG = $LG;
      // extend module default settings with lightGallery core settings
      this.settings = __assign(__assign({}, imageEditorSettings), this.core.settings);
      return this;
    }
    JPlatformDebug.prototype.init = function () {
      var _this_ = this;

      _this_.core.LGel.on(lGEvents.beforeSlide, function (event) {
        jQuery(_this_.core.$toolbar.firstElement).find(".lg-image-editor").remove();
        var options = _this_.core.galleryItems[event.detail.index];
        if (options.lightboxOptions.imageEditorOption) {
          let lightboxOptions = options.lightboxOptions;
          let $imageEditor = jQuery("<button aria-label='" + decodeHtml(lightboxOptions.labels.editImage) + "' title='" + decodeHtml(lightboxOptions.labels.editImage) + "' class=\"lg-image-editor lg-jplatform-action lg-icon\"><span class='icomoon-image-compare'></span></button>");
          jQuery(_this_.core.$toolbar.firstElement).append($imageEditor);

          $imageEditor.on("click", function (event) {
            jQuery.jalios.ImageEditor.launchImageEditor(lightboxOptions.imageEditorOption);
          });
        }
      });
      jQuery(document).on("jalios:imageEditor", function (event) {
        if (event.imageEditor.type === jQuery.jalios.ImageEditor.EditorEventType.AFTER_IMAGE_REFRESHED) {
          // Update lightbox image
          if (jQuery("html").hasClass("lg-on")) { // Lightbox is opened
            jQuery(".lg-object.lg-image").attr("src", window.URL.createObjectURL(event.imageEditor.data.file));
          };
        }
      });
    };
    return JPlatformDebug;
  }());

  return JPlatformDebug;

})));