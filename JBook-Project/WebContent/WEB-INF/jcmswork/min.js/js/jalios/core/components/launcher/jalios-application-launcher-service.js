!(function(a){if(!a.jalios){a.jalios={}}if(!a.jalios.launcher){a.jalios.launcher={}}if(!a.jalios.launcher.service){a.jalios.launcher.service={}}a.jalios.launcher.service=(function(){var b;const d="jcore/launcher/applicationLauncherActions.jsp";function e(){return{getApplicationLauncher:function(g,f){let data={};data.opLoad=true;c(data,g,f,"getApplicationLauncher")},addApplication:function(g,h,f){if(!g){return}g.opAddApplication=true;c(g,h,f,"addApplication")},searchApplication:function(g,h,f){if(!g){g={text:""}}g.opSearchApplication=true;c(g,h,f,"searchApplication")},removeApplication:function(g,h,f){if(!g){return}g.opRemoveApplication=true;c(g,h,f,"removeApplication")},removeApplicationOnAllTabs:function(g,h,f){if(!g){return}g.opRemoveApplicationOnAllTabs=true;c(g,h,f,"removeApplicationOnAllTabs")},saveApplicationLauncher:function(g,h,f){if(!g){return}let doubleCallback=function(){h();a.jalios.launcher.service.getInstance().triggerEvent("saveApplicationLauncher",g)};a.ajax({url:"front/memberpreference/savePreference.jsp",method:"post",data:{key:"core.application.launcher",value:JSON.stringify(g)},success:doubleCallback,error:f})},triggerEvent:function(f,h){var g=jQuery.Event("jalios.application-launcher");g.applicationLauncher={};if(h){var i=typeof h==="object"?h:JSON.parse(h);g.applicationLauncher.data=i}g.applicationLauncher.name=f;a(document).trigger(g)}}}const c=function(h,i,g,f){let doubleCallback=function(j){if(j){i(j)}else{i()}a.jalios.launcher.service.getInstance().triggerEvent(f,h)};a.ajax({type:"POST",dataType:"json",url:d,data:h,success:doubleCallback,error:g})};return{getInstance:function(){if(!b){b=e()}return b}}})()})(window.jQuery);