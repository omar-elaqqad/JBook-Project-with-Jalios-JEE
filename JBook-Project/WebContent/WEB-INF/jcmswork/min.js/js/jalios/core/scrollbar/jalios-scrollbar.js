(function(e,c,a,h){var d="scrollbar",g="plugin_"+d,f={wheelSpeed:2,wheelPropagation:true,minScrollbarLength:20};function b(k,j,i){this.element=k;this.settings=e.extend({},f,j,i);this._defaults=f;this._name=d;this.init()}b.prototype={init:function(){this.scrollbar=new PerfectScrollbar(this.element,this.settings);var i=e(this.element);i.on("ps-scroll-y",function(k){var j=e.Event("scrolly.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-scroll-x",function(k){var j=e.Event("scrollx.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-scroll-up",function(k){var j=e.Event("scrollup.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-scroll-down",function(k){var j=e.Event("scrolldown.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-scroll-left",function(k){var j=e.Event("scrollleft.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-scroll-right",function(k){var j=e.Event("scrollright.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-y-reach-start",function(k){var j=e.Event("scrollstarty.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-y-reach-end",function(k){var j=e.Event("scrollendy.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-x-reach-start",function(k){var j=e.Event("scrollstartx.jalios.scrollbar",{originalEvent:k});i.trigger(j)});i.on("ps-x-reach-end",function(k){var j=e.Event("scrollendx.jalios.scrollbar",{originalEvent:k});i.trigger(j)})},destroy:function(){this.scrollbar.destroy();this.scrollbar=null;e.data(this.element,g,null)},refresh:function(){this.scrollbar.update()}};e.fn[d]=function(j){var i=arguments;if(j===h||typeof j==="object"){return this.each(function(){if(!e.data(this,g)){var l=e(this).data();e.data(this,g,new b(this,j,l))}})}else{if(typeof j==="string"&&j[0]!=="_"&&j!=="init"){var k;this.each(function(){var l=e.data(this,g);if(l instanceof b&&typeof l[j]==="function"){k=l[j].apply(l,Array.prototype.slice.call(i,1))}});return k!==h?k:this}}}}(jQuery,window,document));