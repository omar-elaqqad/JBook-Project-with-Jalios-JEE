!(function(a){a(document).on("mobileinit",function(){a.mobile.dynamicBaseEnabled=false;a.mobile.popup.prototype.options.overlayTheme="b";a.mobile.loader.prototype.options.theme="g";a.mobile.pageLoadErrorMessageTheme="h";a.mobile.ignoreContentEnabled=true;a.mobile.page.prototype.options.keepNative=".itemlist-item";if(!a["jalios-settings"]){a["jalios-settings"]={}}a["jalios-settings"]["imageuploader-default-max-width"]=1600;a["jalios-settings"]["imageuploader-default-max-height"]=1600;a["jalios-settings"]["imageuploader-default-jpeg-quality"]=0.9;a.mobile.filterable.prototype.options.filterCallback=function(b,d){var c=a.jalios.smartPhone.Util.makePattern(d);return !c.test((""+(a.mobile.getAttribute(this,"filtertext")||a(this).text())).toLowerCase())}})})(window.jQuery);