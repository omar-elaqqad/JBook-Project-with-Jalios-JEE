(function(d,c,a,e){var f=false;const b=function(){d(a).on("shown.bs.dropdown",function(h){var g=d(h.target);if(!g.hasClass("topbar-application-launcher")){return}if(!f){d.jalios.launcher.init(".topbar-application-launcher .application-launcher");f=true}})};d(a).ready(function(){b()})})(jQuery,window,document);