+function(h){var e=".dropdown-backdrop";var b='[data-toggle="dropdown"]';var a=function(i){h(i).on("click.bs.dropdown",this.toggle)};a.VERSION="3.3.7";function f(m,j){var k=h.fn.dropdown.getParent(m,j);if(k&&k.exists()){return k}var i=m.attr("data-target");if(!i){i=m.attr("href");i=i&&/#[A-Za-z]/.test(i)&&i.replace(/.*(?=#[^\s]*$)/,"")}var l=i&&h(i);return l&&l.length?l:m.parent()}function d(i){if(!h.fn.dropdown.clearMenus(i)){return}if(i&&i.which===3){return}h(e).remove();h(b).each(function(){var l=h(this);var k=f(l);var j={relatedTarget:this};if(!k.hasClass("open")){return}if(i&&i.type=="click"&&/input|textarea/i.test(i.target.tagName)&&h.contains(k[0],i.target)){return}k.trigger(i=h.Event("hide.bs.dropdown",j));if(i.isDefaultPrevented()){return}l.attr("aria-expanded","false");k.removeClass("open").trigger(h.Event("hidden.bs.dropdown",j))})}a.prototype.toggle=function(m){var l=h(this);if(l.is(".disabled, :disabled")){return}var k=f(l);var j=k.hasClass("open");d(m);if(!j){if("ontouchstart" in document.documentElement&&!k.closest(".navbar-nav").length){h(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(h(this)).on("click",d)}var i={relatedTarget:this};k.trigger(m=h.Event("show.bs.dropdown",i));if(m.isDefaultPrevented()){return}l.trigger("focus").attr("aria-expanded","true");k.toggleClass("open").trigger(h.Event("shown.bs.dropdown",i))}return false};a.prototype.keydown=function(m){if(!/(38|40|27|32)/.test(m.which)||/input|textarea/i.test(m.target.tagName)){return}var l=h(this);m.preventDefault();m.stopPropagation();if(l.is(".disabled, :disabled")){return}var k=f(l);var j=k.hasClass("open");if(!j&&m.which!=27||j&&m.which==27){if(m.which==27){k.find(b).trigger("focus")}return l.trigger("click")}var n=" li:not(.disabled):visible a";var o=k.find(".dropdown-menu"+n);if(!o.length){return}var i=o.index(m.target);if(m.which==38&&i>0){i--}if(m.which==40&&i<o.length-1){i++}if(!~i){i=0}o.eq(i).trigger("focus")};function g(i){return this.each(function(){var k=h(this);var j=k.data("bs.dropdown");if(!j){k.data("bs.dropdown",(j=new a(this)))}if(typeof i=="string"){j[i].call(k)}})}var c=h.fn.dropdown;h.fn.dropdown=g;h.fn.dropdown.Constructor=a;h.fn.dropdown.getParent=function(j,i){return false};h.fn.dropdown.clearMenus=function(i){};h.fn.dropdown.noConflict=function(){h.fn.dropdown=c;return this};h(document).on("click.bs.dropdown.data-api",d).on("click.bs.dropdown.data-api",".dropdown form",function(i){i.stopPropagation()}).on("click.bs.dropdown.data-api",b,a.prototype.toggle).on("keydown.bs.dropdown.data-api",b,a.prototype.keydown).on("keydown.bs.dropdown.data-api",".dropdown-menu",a.prototype.keydown)}(jQuery);