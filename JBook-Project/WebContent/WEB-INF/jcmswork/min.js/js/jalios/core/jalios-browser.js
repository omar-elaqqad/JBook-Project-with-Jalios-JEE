!function(d){var b=function(){d(document).on("jalios:broker",f);d(document).on("click",".popup-lg",e)};var c=/popup-lg/i;var f=function(h){var g=d.jalios.Event.match(h,"broker",c,true,true);if(!g){return}var i=g.source.currentTarget;a(i,g.options)};var e=function(g){g.preventDefault();g.stopPropagation();g.stopImmediatePropagation();a(g.currentTarget)};var a=function(k,i){var h=d(k);var g=h.attr("data-jalios-url")||h.prop("href");var j=h.attr("title")||"Popup";d.jalios.Browser.popupWindow(g,j,900,600,true,true,true,false)};if(!d.jalios){d.jalios={}}d.jalios.Browser={isIE:function(g){if(!g){return d.browser.msie}return d.browser.msie&&g<=parseInt(d.browser.version,10)},isMobileSafari:function(){return/Apple.*Mobile/.test(navigator.userAgent)},reload:function(g){return d.jalios.Browser.redirect(false,g)},redirect:function(g,m,i){try{var k=m?window.opener:window;try{if(k.parent&&!k.parent.skipJsRedirect){k.parent.document;k=k.parent}}catch(h){}var j=k.document;var l=j.location;if(!g||l.href==g){l.reload(true)}else{if(typeof i==="undefined"||i){g=JCMS.Security.getUrlWithCSRFToken(g)}l.href=g}}catch(h){d.console.warn("Popup.redirect",h,h.message)}},popup:function(h,g,i){if(g){g=g.replace(new RegExp("[^a-zA-Z0-9_]+","img"),"");g=g.substr(0,48)}window.open(h,g,i);return false},updateUrl:function(g,h){if(h){document.title=h+" - "+d("body").data("channel-name")}else{document.title=d("body").data("channel-name")}window.history.replaceState(history.state,null,g)},popupWindow:function(j,u,t,n,m,i,p,r,k,v){if(!m){m="no"}if(!t){t=320}if(!n){n=260}i="resizable="+(d.jalios.Common.toBoolean(i,true)?"yes":"no");p="scrollbars="+(d.jalios.Common.toBoolean(p,true)?"yes":"no");if(r==undefined){r=true}if(!navigator.jalios){navigator.jalios=new Object()}var g=navigator.jalios.popupWindow;if(!k){k=window}if(u){u=u.replace(new RegExp("[^a-zA-Z0-9_]+","img"),"");u=u.substr(0,48)}var x=function(w){if(w&&w.opener){try{w.opener.name}catch(h){return false}return true}return false};if(!u&&!x(k)){u="_blank"}else{if(!r){if(g||k.name.indexOf(u)===0){var s=k.name.lastIndexOf("_");navigator.jalios.popupCounter=s>0?parseInt(k.name.substring(s+1))+1:(navigator.jalios.popupCounter?navigator.jalios.popupCounter+1:1);u=u+"_"+navigator.jalios.popupCounter}else{if(x(k)){var o=k.opener;while(o){u=o.name+"_"+u;o=x(o)?o.opener:null}}}}}if(r&&g&&g.close){g.close()}try{var l="status="+m+",width="+t+",height="+n+",menubar=no,"+i+","+p;navigator.jalios.popupWindow=k.open(j,u,l);d.console.debug("Popup","popupWindow",j,l);g=navigator.jalios.popupWindow;if(!g){alert(I18N.glp("warn.popup.blocker"))}}catch(q){alert(I18N.glp("warn.popup.blocker"))}k.callback=v?function(h){v.apply(this,$A(h))}:false;k.callbackLinkId=this.tagName?d(this).identify():false;if(g&&g.focus){g.focus()}return false},callback:function(){var h=window.opener||window.parent;if(!h){return false}if(h.callback){h.callback(arguments);return true}if(!h.callbackLinkId){return false}var g=d.Event("jalios:popup");g.popup={};g.popup.type="callback";g.popup.args=arguments;d(h.document).trigger(g);return true},autoResize:function(j,i,o){if(!i){i=55}if(!o){o=50}var k=window.screenLeft?window.screenLeft:window.screenX;var m=window.screenTop?window.screenTop:window.screenY;var h=d(window);var l=h.height();var g=d(j).bounds();var n=g.height+i;n=Math.min(n,self.screen.availHeight);if(m&&(n+m>self.screen.availHeight)){n=self.screen.availHeight-m}window.resizeTo(h.width(),Math.max(o,n))},isInPopup:function(){return !(opener==undefined)}};d(document).ready(function(g){b()})}(window.jQuery);window.Popup={reload:jQuery.jalios.Browser.reload,redirect:jQuery.jalios.Browser.redirect,encode:jQuery.jalios.Http.encode,callback:jQuery.jalios.Browser.callback,popupWindow:jQuery.jalios.Browser.popupWindow,popupEvent:function(){jQuery.console.error("[Deprecated] popupEvent() Should use jQuery.jalios.Browser.popup")},autoResize:jQuery.jalios.Browser.autoResize,isInPopup:jQuery.jalios.Browser.isInPopup};