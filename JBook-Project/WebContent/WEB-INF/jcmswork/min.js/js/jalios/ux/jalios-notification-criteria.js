!function(f){var a=200;var c;var e=function(){f.console.log("register");f(".items-text-filter INPUT").on("input change propertychange",d)};var b=function(h){var g=f.jalios.Event.match(h,"refresh","after");if(!g||!g.target){return}e()};var d=function(i){var j=i.target.value;var h=new RegExp(j,"i");if(c){clearTimeout(c)}var g=f(".type-label");if(i.target.value===null){f(".type-label-wrapper").removeClass("hide")}c=setTimeout(function(){g.each(function(){var k=f(this).text();if(h.test(k)){f(this).closest(".type-label-wrapper").removeClass("hide");anyMatch=true}else{f(this).closest(".type-label-wrapper").addClass("hide")}});c=false},a)};f(document).ready(function(){e();f(document).on("jalios:refresh",b)})}(window.jQuery);