(function(a){var b=function(d,c){this.$element=a(d);this.$note=a('<div class="notif"></div>');this.options=a.extend(true,{},a.fn.notify.defaults,c);this._link=null;if(this.options.transition){if(this.options.transition==="fade"){this.$note.addClass("in").addClass(this.options.transition)}else{this.$note.addClass(this.options.transition)}}else{this.$note.addClass("fade").addClass("in")}if(this.options.type){this.$note.addClass("alert-"+this.options.type)}else{this.$note.addClass("alert-success")}if(this.options.message){if(typeof this.options.message==="string"){this.$note.html(this.options.message)}else{if(typeof this.options.message==="object"){if(this.options.message.html){this.$note.html(this.options.message.html)}else{if(this.options.message.text){this.$note.text(this.options.message.text)}}}}}if(this.options.closable){this._link=a('<a class="close pull-right">&times;</a>'),a(this._link).on("click",a.proxy(b.onClose,this)),this.$note.prepend(this._link)}if(this.options.icon){this.$note.prepend('<i class="icon-'+this.options.icon+'"></i> ')}return this};b.onClose=function(){this.options.onClose();a(this.$note).remove();this.options.onClosed()};b.prototype.show=function(){if(this.options.fadeOut.enabled){this.$note.delay(this.options.fadeOut.delay||3000).fadeOut("slow",a.proxy(b.onClose,this))}this.$element.append(this.$note);this.$note.alert()};b.prototype.hide=function(){if(this.options.fadeOut.enabled){this.$note.delay(this.options.fadeOut.delay||3000).fadeOut("slow",a.proxy(b.onClose,this))}else{b.onClose.call(this)}};a.fn.notify=function(c){return new b(this,c)};a.fn.notify.defaults={type:"success",closable:true,transition:"fade",icon:false,fadeOut:{enabled:true,delay:3000},message:null,onClose:function(){},onClosed:function(){}}})(window.jQuery);