!function(f){var b=false;var e=17;var d=1;var h=2;var g=function(i){let isMiddleClick=i.which===h;if(i.type==="mouseup"&&!isMiddleClick){return}var n=f(i.currentTarget);var k=f(i.target);if(k.data("jalios-action")&&k.data("jalios-action")!="clickable"){return}if(k.is("A")||k.is(":input")){return true}i.stopPropagation();i.stopImmediatePropagation();i.preventDefault();var j=null;var q=f("A",n);var p=n.data("jalios-url");if(p){j=p}else{if(q.exists()){j=q.first().prop("href")}}if(j){var s=n.data("jalios-options");var r=i.which===undefined?1:i.which;var l=r===d;if(!s||!s.mode||s.mode==="normal"){var m=f("BODY").hasClass("browser-Chrome");m|=f("BODY").hasClass("browser-Firefox");if(l){if(m&&(s&&s.target==="_blank"||b)){var o=window.open(j,"_blank")}else{document.location.href=j.startsWith("http")?j:document.getElementsByTagName("base")[0].href+j}}else{if(m&&r===h){i.preventDefault();var o=parent.window.open(j,"_blank")}}}else{if(s.mode==="modal"){if(l){f.jalios.ui.Modal.openFromUrl(j,s)}}else{if(s.mode==="ajax"){if(l){if(f.jalios.Common.size(s)===1){s.url=j}n.refresh(s)}}}}}};var a=function(i){if(i.which===e){b=true}};var c=function(){f(document).on("mouseup click",".clickable[data-jalios-url], [data-jalios-action='clickable']",g);f(document).keydown(a);f(document).keyup(function(){b=false})};f(document).ready(function(i){c()})}(window.jQuery);