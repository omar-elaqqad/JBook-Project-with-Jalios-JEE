var isIE=document.all?true:false;var isNN4=document.layers?true:false;var isNN7=(document.all&&document.getElementById)?true:false;var isOPERA=(navigator.userAgent.indexOf("Opera")!=-1&&document.getElementById)?true:false;var isSafari=(navigator.userAgent.indexOf("Safari")!=-1);var JcmsJsContext={_contextPath:null,_baseUrl:null,_jsonRPC:null,getContextPath:function(){if(!this._contextPath){this._init()}return this._contextPath},getBaseUrl:function(){if(!this._baseUrl){this._init()}return this._baseUrl},getSecuredBaseUrl:function(){if(!this._securedBaseUrl){this._init()}return this._securedBaseUrl},getJsonRPC:function(){this._jsonRPC=new JSONRpcClient(JcmsJsContext.getContextPath()+"/JSON-RPC");return this._jsonRPC},redirect:function(a){if(a){a=(a.indexOf("http")==0)?a:(JcmsJsContext.getBaseUrl()+a);document.location=JCMS.Security.getUrlWithCSRFToken(a);return true}return false},_init:function(){if(!this._baseUrl){JcmsJsContext._baseUrl=document.getElementsByTagName("base")[0].href}if(!this._securedBaseUrl){JcmsJsContext._securedBaseUrl=document.getElementsByTagName("base")[0].getAttribute("data-secured-href")||JcmsJsContext._baseUrl;JcmsLogger.debug("JcmsJsContext",JcmsJsContext._securedBaseUrl)}if(!this._contextPath){JcmsJsContext._contextPath=document._contextPath}},_handleAjaxCreate:function(b,e){b.options.requestHeaders=b.options.requestHeaders||{};var a=document.body.id;if(a){b.options.requestHeaders["X-Jcms-Ajax-Id"]=a}var d=$("AjaxCtxtDeflate");if(d&&!Prototype.Browser.MobileSafari){b.options.requestHeaders["X-Jcms-Ajax-Deflate"]=d.innerHTML}var c=$("CSRFTokenElm");if(c){b.options.requestHeaders[JCMS.Security.CSRF_TOKEN_HEADER_NAME]=c.innerHTML}},_205Sync:false,_handleAjax205:function(a,b){if(205!=a.transport.status||JcmsJsContext._205Sync){return}JcmsJsContext._205Sync=true;alert(I18N.glp("warn.json.sessiontimeout.205"));document.location=document.location},isIE:Prototype.Browser.IE,isNN4:document.layers?true:false,isNN7:(document.all&&document.getElementById)?true:false,isOPERA:Prototype.Browser.Opera,isWebKit:Prototype.Browser.WebKit,isIE8:document.body.className.indexOf("browser-IE8")>=0,isIE7:document.body.className.indexOf("browser-IE7")>=0,isIE6:document.body.className.indexOf("browser-IE6")>=0,isFirefox:document.body.className.indexOf("browser-Firefox")>=0,hasFocus:true,handleFocusInCB:function(a){JcmsJsContext.handleFocus(a,true)},handleFocusOutCB:function(a){JcmsJsContext.handleFocus(a,false)},handleFocus:function(b,a){JcmsJsContext.hasFocus=a;document.fire("page:focus",{focus:a})}};Ajax.Responders.register({onCreate:JcmsJsContext._handleAjaxCreate,onComplete:JcmsJsContext._handleAjax205});function getFormElementPos(c,a){elms=c.elements;for(var b=0;b<elms.length;b++){if(elms[b].name==a){return b}}return -1}function updateOptionMenu(a,b,c){for(m=b.length-1;m>0;m--){b[m]=null}for(i=0;i<c[a].length;i++){b[i]=new Option(c[a][i].text,c[a][i].value)}b[0].selected=true}function setField(b,a){if(b!=null){b.value=a}}function clearField(d,c,b,a){if(d!=null){d.value="";if(d.selectedIndex){d.selectedIndex=0}}if(c!=null){c.value="";if(c.selectedIndex){c.selectedIndex=0}}if(b!=null){b.value="";if(b.selectedIndex){b.selectedIndex=0}}if(a!=null){a.value="";if(a.selectedIndex){a.selectedIndex=0}}}function blankField(d,c,b,a){if(d!=null){d.value=" "}if(c!=null){c.value=" "}if(b!=null){b.value=" "}if(a!=null){a.value=" "}}function uncheckElement(d,c,b,a){if(c!=null&&c>=0){d.elements[c].checked=false}if(b!=null&&b>=0){d.elements[b].checked=false}if(a!=null&&a>=0){d.elements[a].checked=false}}function uncheckAll(b,a,d){if(a!=null){var c=b.elements[a];for(i=0;i<c.length;i++){if(c[i]!=d){c[i].checked=false}}}}function checkAll(b,a,c){checkAllwithId(b,a,c,null,null)}function checkAllwithId(b,a,c,d){_checkAllwithId(b.elements,a,c,d)}function checkAllwithParentId(e,a,c,d){var b=$$("#"+e+" INPUT[type=checkbox]");if(b){_checkAllwithId(b.toArray(),a,c,d)}}function _checkAllwithId(c,a,d,e){for(var b=0;b<c.length;b++){if(c[b].name!=a){continue}if(e!=null&&c[b].id.indexOf(e)<0){continue}checkIt=!c[b].checked;break}for(var b=0;b<c.length;b++){if(c[b].name!=a){continue}if(e!=null&&c[b].id.indexOf(e)<0){continue}c[b].checked=checkIt}d.checked=checkIt}function selectAll(b,a){selectAllwithId(b,a,null)}function selectAllwithId(c,a,d){elms=c.elements;for(var b=0;b<elms.length;b++){if(elms[b].name!=a){continue}if(d!=null&&elms[b].id.indexOf(d)<0){continue}selectIt=elms[b].selectedIndex;break}for(var b=0;b<elms.length;b++){if(elms[b].name!=a){continue}if(d!=null&&elms[b].id.indexOf(d)<0){continue}elms[b].selectedIndex=selectIt}}function checkAndSubmitForm(b,a,e,d,c){if(a&&a.value==""){alert(d);return}if(e&&e.value==""){alert(c);return}if(b.onsubmit){b.onsubmit()}b.submit()}function moveFormOption(b,e,d,c,a){array=b.elements;if(d=="up"){if(e>c){tmp=array[e].selectedIndex;array[e].selectedIndex=array[e-1].selectedIndex;array[e-1].selectedIndex=tmp}else{tmp=array[c].selectedIndex;for(i=c;i<a;i++){array[i].selectedIndex=array[i+1].selectedIndex}array[a].selectedIndex=tmp}}else{if(d=="down"){if(e<a){tmp=array[e].selectedIndex;array[e].selectedIndex=array[e+1].selectedIndex;array[e+1].selectedIndex=tmp}else{tmp=array[a].selectedIndex;for(i=a;i>=c;i--){array[i].selectedIndex=array[i-1].selectedIndex}array[c].selectedIndex=tmp}}else{if(d=="remove"){for(i=e;i<a;i++){array[i].selectedIndex=array[i+1].selectedIndex}array[a].selectedIndex=0}}}}function moveFormElement(b,e,d,c,a){array=b.elements;if(d=="up"){if(e>c){tmp=array[e].value;array[e].value=array[e-1].value;array[e-1].value=tmp}else{tmp=array[c].value;for(i=c;i<a;i++){array[i].value=array[i+1].value}array[a].value=tmp}}else{if(d=="down"){if(e<a){tmp=array[e].value;array[e].value=array[e+1].value;array[e+1].value=tmp}else{tmp=array[a].value;for(i=a;i>=c;i--){array[i].value=array[i-1].value}array[c].value=tmp}}else{if(d=="remove"){for(i=e;i<a;i++){array[i].value=array[i+1].value}array[a].value=""}}}}function move2FormElement(b,e,d,c,a){array=b.elements;if(d=="up"){if(e>(c+1)){tmp=array[e].value;array[e].value=array[e-2].value;array[e-2].value=tmp;tmp=array[e-1].value;array[e-1].value=array[e-3].value;array[e-3].value=tmp}else{tmp1=array[c].value;tmp2=array[c+1].value;for(i=c;i<a;i++){array[i].value=array[i+2].value}array[a-1].value=tmp1;array[a].value=tmp2}}else{if(d=="down"){if(e<a){tmp=array[e].value;array[e].value=array[e+2].value;array[e+2].value=tmp;tmp=array[e-1].value;array[e-1].value=array[e+1].value;array[e+1].value=tmp}else{tmp1=array[a].value;tmp2=array[a-1].value;for(i=a;i>=c;i--){array[i].value=array[i-2].value}array[c+1].value=tmp1;array[c].value=tmp2}}else{if(d=="remove"){for(i=e-1;i<a;i++){array[i].value=array[i+2].value}array[a-1].value="";array[a].value=""}}}}function getUrlWithUpdatedParam(b,d,c){var a=b.toString();re1=new RegExp("([^?]*\\?.*)("+d+"=[^&]*&?)(.*)","i");re2=new RegExp("([^?]*\\?)(.*)","i");re3=new RegExp("([^?]*)","i");if(a.search(re1)!=-1){if(c){a=a.replace(re1,"$1"+d+"="+c+"&$3")}else{a=a.replace(re1,"$1$3")}}else{if(a.search(re2)!=-1){if(c){a=a.replace(re2,"$1"+d+"="+c+"&$2")}else{a=a.replace(re2,"$1$2")}}else{if(c){a=a.replace(re3,"$1?"+d+"="+c)}else{a=a.replace(re3,"$1")}}}return a}function popupWindow(b,g,k,e,d,a,f,j,c){Popup.popupWindow(b,g,k,e,d,a,f,j,c)}function pause(b){var a=new Date();var c=a.getTime()+b;while(true){a=new Date();if(a.getTime()>c){return}}}"JCMS.Thumbnail"._namespace({load:function(a){try{JcmsJsContext.getJsonRPC().ThumbnailTag.createThumbnailFromSessionAttribute(function(c,e){if(e){return}if(c){var d=$(a);if(d){d.hide();d.src=c;d.show()}}},a)}catch(b){}}});"JCMS.Security"._namespace({CSRF_TOKEN_HEADER_NAME:"X-Jcms-CSRF-Token",CSRF_TOKEN_PARAMETER_NAME:"csrftoken",currentToken:null,init:function(){var a=$("CSRFTokenElm");if(!a){return}JcmsLogger.info("Channel","Init CSRF prevention token");this.currentToken=a.innerHTML;this._addCSRFTokenToAllForms();Event.observe(document,"refresh:after",function(){JCMS.Security._addCSRFTokenToAllForms.defer()})},_addCSRFTokenToAllForms:function(){var g=document.getElementsByTagName("form");for(var c=0;c<g.length;c++){var e=g[c];if(e.id==="rshStorageForm"){continue}var d=e.getAttribute("method");var f=d&&d.toUpperCase()==="POST";if(!f){continue}var a=e.getAttribute("action");var b=a&&a.match("^(https?:)?//.*$")&&!a.startsWith(JcmsJsContext.getBaseUrl())&&!a.startsWith(JcmsJsContext.getSecuredBaseUrl());if(b){continue}JCMS.Security._addCSRFToken(e)}},_addCSRFToken:function(b){if(!b){return}var a=$(b).getInputs("hidden",JCMS.Security.CSRF_TOKEN_PARAMETER_NAME);if(a.length>0){return}a=document.createElement("input");a.type="hidden";a.name=JCMS.Security.CSRF_TOKEN_PARAMETER_NAME;a.value=JCMS.Security.currentToken;b.appendChild(a)},getUrlWithCSRFToken:function(a){if(!JCMS.Security.currentToken){return a}var b=a+((a.indexOf("?")==-1)?"?":"&")+JCMS.Security.CSRF_TOKEN_PARAMETER_NAME+"="+encodeURIComponent(JCMS.Security.currentToken);return b}});function doOnLoad(){var a=$("popupEdition");if(a&&a.id=="popupEdition"){Popup.autoResize(a,jQuery("#edit-topbar").height()+18*4)}if(JcmsJsContext.isIE){document.onfocusin=JcmsJsContext.handleFocusInCB;document.onfocusout=JcmsJsContext.handleFocusOutCB}else{window.onfocus=JcmsJsContext.handleFocusInCB;window.onblur=JcmsJsContext.handleFocusOutCB}}if(document.loaded){JCMS.Security.init()}else{Event.observe(document,"dom:loaded",function(){JCMS.Security.init()})}Event.observe(window,"load",function(){if(window.setupAllTabs){setupAllTabs()}doOnLoad.defer()});