(function(e,h,i,b){const g="jaliosDirtyFormControlPlugin",f="plugin_"+g,d={config:{}};function j(k){this.$element=e(k);this._defaults=d;this._name=g;this.init()}j.prototype={init:function(){this.registerFormChange()},registerFormChange:function(){let that=this;if(!this.$element.is("form")){e.console.log("Jalios dirty form control only works on FORM element")}this.$element.find(":input").on("jalios.date.change change input",function(){that.$element.data("is-form-dirty",true)})},isFormDirty:function(){let isDirty=this.$element.data("is-form-dirty");if(isDirty){return true}if(typeof tinyMCE!=="undefined"){var k=false;e.each(tinyMCE.editors,function(l,m){if(e(m.formElement).hasClass("jalios-dirty-form-control")){k|=m.isDirty()}});if(k){return true}}return false}};e.fn[g]=function(l){var k=arguments;if(l===b||typeof l==="object"){return this.each(function(){if(!e.data(this,f)){var n=e(this).data();e.data(this,f,new j(this,l,n))}})}else{if(typeof l==="string"&&l[0]!=="_"&&l!=="init"){var m;this.each(function(){var n=e.data(this,f);if(n instanceof j&&typeof n[l]==="function"){m=n[l].apply(n,Array.prototype.slice.call(k,1))}if(l==="destroy"){e.data(this,f,null)}});return m!==b?m:this}}};const c=function(){if(e(".jalios-dirty-form-control").length>0){h.onbeforeunload=a;e(".jalios-dirty-form-control").each(function(k,l){if(!e(l).data("jalios-dirty-form-control-initialized")){e(l).data("jalios-dirty-form-control-initialized",true);e(l).jaliosDirtyFormControlPlugin()}})}};const a=function(k){if(h.disableOnBeforeUnloadMessage){return}let isAnyFormDirtry=false;e(".jalios-dirty-form-control").each(function(l,m){if(e(m).data(f).isFormDirty()){isAnyFormDirtry=true}});if(isAnyFormDirtry){return I18N.glp("warn.edit.contentlost")}return};e(i).ready(function(){c();e(i).on("jalios:refresh",function(k){let refresh=e.jalios.Event.match(k,"refresh","after");if(refresh){c()}})})})(jQuery,window,document);