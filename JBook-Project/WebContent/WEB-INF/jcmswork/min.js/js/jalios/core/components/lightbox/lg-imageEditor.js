/*!
 * lightgallery | 2.4.0 | January 29th 2022
 * http://www.lightgalleryjs.com/
 * Copyright (c) 2020 Sachin Neravath;
 * @license GPLv3
 */
(function(b,a){typeof exports==="object"&&typeof module!=="undefined"?module.exports=a():typeof define==="function"&&define.amd?define(a):(b=typeof globalThis!=="undefined"?globalThis:b||self,b.lgJPlatformImageEditor=a())}(this,(function(){
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
;var b={afterAppendSlide:"lgAfterAppendSlide",init:"lgInit",hasVideo:"lgHasVideo",containerResize:"lgContainerResize",updateSlides:"lgUpdateSlides",afterAppendSubHtml:"lgAfterAppendSubHtml",beforeOpen:"lgBeforeOpen",afterOpen:"lgAfterOpen",slideItemLoad:"lgSlideItemLoad",beforeSlide:"lgBeforeSlide",afterSlide:"lgAfterSlide",posterClick:"lgPosterClick",dragStart:"lgDragStart",dragMove:"lgDragMove",dragEnd:"lgDragEnd",beforeNextSlide:"lgBeforeNextSlide",beforePrevSlide:"lgBeforePrevSlide",beforeClose:"lgBeforeClose",afterClose:"lgAfterClose",rotateLeft:"lgRotateLeft",rotateRight:"lgRotateRight",flipHorizontal:"lgFlipHorizontal",flipVertical:"lgFlipVertical",autoplay:"lgAutoplay",autoplayStart:"lgAutoplayStart",autoplayStop:"lgAutoplayStop"};var a=function(){e=Object.assign||function e(g){for(var h,f=1,k=arguments.length;f<k;f++){h=arguments[f];for(var j in h){if(Object.prototype.hasOwnProperty.call(h,j)){g[j]=h[j]}}}return g};return e.apply(this,arguments)};var c={fullScreen:true,fullscreenPluginStrings:{toggleFullscreen:"Toggle Fullscreen"}};var d=(function(){function e(f,g){this.core=f;this.$LG=g;this.settings=a(a({},c),this.core.settings);return this}e.prototype.init=function(){var f=this;f.core.LGel.on(b.beforeSlide,function(h){jQuery(f.core.$toolbar.firstElement).find(".lg-image-editor").remove();var g=f.core.galleryItems[h.detail.index];if(g.lightboxOptions.imageEditorOption){let lightboxOptions=g.lightboxOptions;let $editImageElement=jQuery("<button>",{title:jQuery.jalios.I18N.glp("lightbox.editImage"),href:g.lightboxOptions.url,"aria-label":jQuery.jalios.I18N.glp("lightbox.editImage"),role:"button","class":"lg-image-editor lg-jplatform-action lg-icon"});let $editImageElementIcon=jQuery("<span>",{"class":"icomoon icomoon-crop2"});$editImageElement.append($editImageElementIcon);jQuery(f.core.$toolbar.firstElement).append($editImageElement[0]);$editImageElement.on("click",function(i){jQuery.jalios.ImageEditor.launchImageEditor(lightboxOptions.imageEditorOption)})}});jQuery(document).on("jalios:imageEditor",function(g){if(g.imageEditor.type===jQuery.jalios.ImageEditor.EditorEventType.AFTER_IMAGE_REFRESHED){if(jQuery("html").hasClass("lg-on")){jQuery(".lg-object.lg-image").attr("src",window.URL.createObjectURL(g.imageEditor.data.file))}}})};return e}());return d})));