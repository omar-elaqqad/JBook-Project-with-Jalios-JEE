/*!
 * lightgallery | 2.4.0 | January 29th 2022
 * http://www.lightgalleryjs.com/
 * Copyright (c) 2020 Sachin Neravath;
 * @license GPLv3
 */
(function(b,a){typeof exports==="object"&&typeof module!=="undefined"?module.exports=a():typeof define==="function"&&define.amd?define(a):(b=typeof globalThis!=="undefined"?globalThis:b||self,b.lgJPlatformAccessPub=a())}(this,(function(){
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
;var d={afterAppendSlide:"lgAfterAppendSlide",init:"lgInit",hasVideo:"lgHasVideo",containerResize:"lgContainerResize",updateSlides:"lgUpdateSlides",afterAppendSubHtml:"lgAfterAppendSubHtml",beforeOpen:"lgBeforeOpen",afterOpen:"lgAfterOpen",slideItemLoad:"lgSlideItemLoad",beforeSlide:"lgBeforeSlide",afterSlide:"lgAfterSlide",posterClick:"lgPosterClick",dragStart:"lgDragStart",dragMove:"lgDragMove",dragEnd:"lgDragEnd",beforeNextSlide:"lgBeforeNextSlide",beforePrevSlide:"lgBeforePrevSlide",beforeClose:"lgBeforeClose",afterClose:"lgAfterClose",rotateLeft:"lgRotateLeft",rotateRight:"lgRotateRight",flipHorizontal:"lgFlipHorizontal",flipVertical:"lgFlipVertical",autoplay:"lgAutoplay",autoplayStart:"lgAutoplayStart",autoplayStop:"lgAutoplayStop"};var a=function(){e=Object.assign||function e(g){for(var h,f=1,k=arguments.length;f<k;f++){h=arguments[f];for(var j in h){if(Object.prototype.hasOwnProperty.call(h,j)){g[j]=h[j]}}}return g};return e.apply(this,arguments)};var c={fullScreen:true,fullscreenPluginStrings:{toggleFullscreen:"Toggle Fullscreen"}};var b=(function(){function e(f,g){this.core=f;this.$LG=g;this.settings=a(a({},c),this.core.settings);return this}e.prototype.init=function(){var f=this;this.core.LGel.on(d.beforeSlide,function(h){jQuery(f.core.$toolbar.firstElement).find(".lg-access-pub").remove();var g=f.core.galleryItems[h.detail.index];if(g.lightboxOptions.url){let $accessPubElement=jQuery("<a>",{title:jQuery.jalios.I18N.glp("lightbox.accessPub"),href:g.lightboxOptions.url,"aria-label":jQuery.jalios.I18N.glp("lightbox.accessPub"),role:"button","class":"lg-access-pub lg-icon lg-jplatform-action"});let $accessPubElementIcon=jQuery("<span>",{"class":"icomoon icomoon-image2"});$accessPubElement.append($accessPubElementIcon);f.core.$toolbar.append($accessPubElement[0])}})};return e}());return b})));