!(function(d){if(!d.jalios){d.jalios={}}if(!d.jalios.spectrum){d.jalios.spectrum={}}d.jalios.spectrum.init=function(){a();b()};const c=(function(){function f(g){let $element=d(g);let options=$element.data("jalios-spectrum-options");e(options,$element);$element.removeAttr("data-jalios-init-spectrum");$element.css("border-radius",0);$element.spectrum(options)}const e=function(h,g){h.change=function(i){g.trigger("input",{currentVal:i&&i.toHexString()});g.trigger("change",{currentVal:i&&i.toHexString()})};h.hide=function(i){g.trigger({type:"hide",color:i&&i.toHexString()})}};return f})();const a=function(){d(".spectrum").each(function(f,e){d(e).spectrum("destroy");d(e).attr("data-jalios-init-spectrum","true")});d(".sp-container").remove()};const b=function(e){d('[data-jalios-init-spectrum="true"]').each(function(g,f){new c(f)})}})(window.jQuery);