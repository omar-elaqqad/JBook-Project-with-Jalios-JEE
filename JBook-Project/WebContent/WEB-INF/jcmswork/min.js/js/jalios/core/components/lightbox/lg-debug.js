/*!
 * lightgallery | 2.4.0 | January 29th 2022
 * http://www.lightgalleryjs.com/
 * Copyright (c) 2020 Sachin Neravath;
 * @license GPLv3
 */
(function(b,a){typeof exports==="object"&&typeof module!=="undefined"?module.exports=a():typeof define==="function"&&define.amd?define(a):(b=typeof globalThis!=="undefined"?globalThis:b||self,b.lgJPlatformDebug=a())}(this,(function(){
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
;var f={afterAppendSlide:"lgAfterAppendSlide",init:"lgInit",hasVideo:"lgHasVideo",containerResize:"lgContainerResize",updateSlides:"lgUpdateSlides",afterAppendSubHtml:"lgAfterAppendSubHtml",beforeOpen:"lgBeforeOpen",afterOpen:"lgAfterOpen",slideItemLoad:"lgSlideItemLoad",beforeSlide:"lgBeforeSlide",afterSlide:"lgAfterSlide",posterClick:"lgPosterClick",dragStart:"lgDragStart",dragMove:"lgDragMove",dragEnd:"lgDragEnd",beforeNextSlide:"lgBeforeNextSlide",beforePrevSlide:"lgBeforePrevSlide",beforeClose:"lgBeforeClose",afterClose:"lgAfterClose",rotateLeft:"lgRotateLeft",rotateRight:"lgRotateRight",flipHorizontal:"lgFlipHorizontal",flipVertical:"lgFlipVertical",autoplay:"lgAutoplay",autoplayStart:"lgAutoplayStart",autoplayStop:"lgAutoplayStop"};var c=function(){h=Object.assign||function h(k){for(var l,j=1,o=arguments.length;j<o;j++){l=arguments[j];for(var m in l){if(Object.prototype.hasOwnProperty.call(l,m)){k[m]=l[m]}}}return k};return h.apply(this,arguments)};var g={fullScreen:true,fullscreenPluginStrings:{toggleFullscreen:"Toggle Fullscreen"}};var b={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;","/":"&#x2F;","`":"&#x60;","=":"&#x3D;"};function a(h){return h.replace(/[&<>"'`=\/]/g,function(i){return b[i]})}var e=function(h){let newText=a(h);return newText};var d=(function(){function h(i,j){this.core=i;this.$LG=j;this.settings=c(c({},g),this.core.settings);return this}h.prototype.init=function(){var i=this;i.core.LGel.on(f.beforeSlide,function(k){jQuery(i.core.$toolbar.firstElement).find(".lg-image-editor").remove();var j=i.core.galleryItems[k.detail.index];if(j.lightboxOptions.imageEditorOption){let lightboxOptions=j.lightboxOptions;let $imageEditor=jQuery("<button aria-label='"+e(lightboxOptions.labels.editImage)+"' title='"+e(lightboxOptions.labels.editImage)+"' class=\"lg-image-editor lg-jplatform-action lg-icon\"><span class='icomoon-image-compare'></span></button>");jQuery(i.core.$toolbar.firstElement).append($imageEditor);$imageEditor.on("click",function(l){jQuery.jalios.ImageEditor.launchImageEditor(lightboxOptions.imageEditorOption)})}});jQuery(document).on("jalios:imageEditor",function(j){if(j.imageEditor.type===jQuery.jalios.ImageEditor.EditorEventType.AFTER_IMAGE_REFRESHED){if(jQuery("html").hasClass("lg-on")){jQuery(".lg-object.lg-image").attr("src",window.URL.createObjectURL(j.imageEditor.data.file))}}})};return h}());return d})));