!function(c){if(!c.jalios){c.jalios={}}if(!c.jalios.form){c.jalios.form={}}var h=function(j){c(".disabled, :disabled").each(function(k){var l=c(this);l.addClass("excludeSingleSubmit")})};var e=function(l){var k=l.refresh;if(!k){return}if(k.type=="before"){if(!k.options||!k.options.isform){return}var j=c(k.options.isform);if(!j.exists()){return}var m=j.hasClass("wysiwyg-init-in-progress");if(m){l.preventDefault();l.stopPropagation();l.stopImmediatePropagation();return}c.jalios.form.SingleSubmit.ajaxRefreshing=true;if(j.hasClass("noSingleSubmitButton")){return}if(c.jalios.form.SingleSubmit.processing){l.preventDefault();l.stopPropagation();l.stopImmediatePropagation();return}c.jalios.form.SingleSubmit.disable()}else{if(k.type=="success"||k.type=="fail"){c.jalios.form.SingleSubmit.enable();c.jalios.form.SingleSubmit.ajaxRefreshing=false}}};var d=function(k){var j=c(k.currentTarget);if(!j.exists()){return}if(c.jalios.form.SingleSubmit.ajaxRefreshing){k.preventDefault();k.stopPropagation();k.stopImmediatePropagation();return}var l=j.hasClass("wysiwyg-init-in-progress");if(l){k.preventDefault();k.stopPropagation();k.stopImmediatePropagation();return}if(j.hasClass("noSingleSubmitButton")){return}if(c.jalios.form.SingleSubmit.processing){k.preventDefault();k.stopPropagation();k.stopImmediatePropagation();return}c.jalios.form.SingleSubmit.disable();window.onbeforeunload=null};var f=function(){c(document).ready(h);c(document).on("jalios:refresh",e);c(document).on("submit","FORM",d)};var g=function(j){if(j.keyCode==116){return}c(j.target).attr("data-jalios-dirty-input","true")};var i=function(){var j=c(document).find('[data-jalios-dirty-input="true"]').length;if(j){return true}if(typeof(tinyMCE)!=="undefined"){var k=false;jQuery.each(tinyMCE.editors,function(l,m){k|=m.isDirty()});if(k){return true}}return false};var b=function(){window.onbeforeunload=a;c(document).on("keypress",":input",g)};var a=function(){if(window.disableOnBeforeUnloadMessage){return}if(!i()){return}return I18N.glp("warn.edit.contentlost")};c.jalios.form.SingleSubmit={processing:false,enable:function(){c.jalios.form.SingleSubmit.toggle(true)},disable:function(){c.jalios.form.SingleSubmit.toggle(false)},toggle:function(j){c.jalios.form.SingleSubmit.processing=!j;c("INPUT.formButton, BUTTON.formButton, A.formButton, INPUT.btn, BUTTON.btn, A.btn").each(function(l){var m=c(this);var k=c(m.prop("form")||m.closest("FORM"));if(k.hasClass("noSingleSubmitButton")){return}if(m.hasClass("excludeSingleSubmit")){return}m.toggleClass("disabled",!j)})},initUnload:b};c(document).ready(function(j){f()})}(window.jQuery);function initUnloadMessage(){jQuery.jalios.form.SingleSubmit.initUnload()};