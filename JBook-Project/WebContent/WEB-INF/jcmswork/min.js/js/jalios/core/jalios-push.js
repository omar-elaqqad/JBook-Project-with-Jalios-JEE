!function(e){var c=function(){JcmsLogger.info("Jalios Push","Init EventSource Push JS ");f()};var f=function(){var i=a();var k=b();var j=d();var l=new EventSource("push/provider?device="+i+"&"+(k?k:"")+(j?j:""));e.jcms.push.evtSource=l;var h=function(n){var m=jQuery.Event("jalios.push");m.eventSourceType=n.type;m.serverEvent=n;e(document).trigger(m)};l.addEventListener("open",h);l.addEventListener("message",h);l.addEventListener("error",h);var g=jQuery.Event("push.notification:ready");e(document).trigger(g)};var a=function(){var g=e("[data-jalios-push-device-id]");return encodeURIComponent(g.data("jalios-push-device-id"))};var d=function(){var h=e("[data-jalios-push-type-filter]");var g="";h.each(function(i,j){g+="typeFilter="+encodeURIComponent(e(j).data("jalios-push-type-filter"))+"&"});return g};var b=function(){var h=e("[data-jalios-push-eventname-filter]");var g="";h.each(function(i,j){g+="eventFilter="+encodeURIComponent(e(j).data("jalios-push-eventname-filter"))+"&"});return g};if(!e.jcms){e.jcms={}}if(!e.jcms.push){e.jcms.push={}}e.jcms.push.evtSource;e(document).ready(function(g){c()})}(window.jQuery);jQuery.jalios.DOM.loadJavaScript("js/lib/eventsource.js","empty version");