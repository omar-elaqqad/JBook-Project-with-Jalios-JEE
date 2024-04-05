String.prototype._namespace=function(a){Object.extend(this.split(".").inject(window,function(b,c){return(b[c]=b[c]||{})}),a||{})};String.prototype.fastStrip=function(){var c=this.replace(/^\s\s*/,""),a=/\s/,b=c.length;while(a.test(c.charAt(--b))){}return c.slice(0,b+1)};if(typeof String.prototype.trim!=="function"){String.prototype.trim=function(){return this.replace(/^\s\s*/,"").replace(/\s\s*$/,"")}}Array.prototype.addAll=function(){for(var c=0;c<arguments.length;c++){var b=arguments[c];for(var d=0;d<b.length;d++){this.push(b[d])}}};Object.extend(Element,(function(){function a(d,b,c){if(b&&b.indexOf(d.tagName)==-1){return false}if(c&&(!d.className||d.className.indexOf(c)<0)){return false}if(c&&!$(d).hasClassName(c)){return false}return d}return{_fastMatch:a}})());Element.addMethods({getJcmsId:function(c,d){var d=d?d:"ID_";var a=d.length;var b=$w(c.className).find(function(e){return e.startsWith(d)});return b&&b.substring(a)},getJcmsIds:function(b,d){var d=d?d:"ID_";var a=d.length;var c=$w(b.className).findAll(function(e){return e.startsWith(d)}).collect(function(e){return e.substring(a)});return c},findJcmsId:function(c){var b=c.getJcmsId();if(b){return b}var a=c.parentNode;return a&&$(a).findJcmsId()},fastUp:function(d,c,e,f,a){var b=(!c||Object.isArray(c))?c:[c];a=a||100;for(var g=f?d:d.parentNode;g;g=g.parentNode){if(a<=0){return}a--;if(Element._fastMatch(g,b,e)){return $(g)}}},fastNext:function(d,c,e,f,a){var b=(!c||Object.isArray(c))?c:[c];a=a||100;for(var g=f?d:d.nextSibling;g;g=g.nextSibling){if(g.nodeType!=1){continue}if(a<=0){return}a--;if(Element._fastMatch(g,b,e)){return $(g)}}},fastPrevious:function(d,c,e,f,a){var b=(!c||Object.isArray(c))?c:[c];a=a||100;for(var g=f?d:d.previousSibling;g;g=g.previousSibling){if(g.nodeType!=1){continue}if(a<=0){return}a--;if(Element._fastMatch(g,b,e)){return $(g)}}},fastLastChild:function(b,a,c){return Element.fastChild(b,a,c,100000)},fastChild:function(d,c,e,g){var b=(!c||Object.isArray(c))?c:[c];var f=false;var a=g==100000;var g=g||0;for(var h=d.firstChild;h;h=h.nextSibling){if(h.nodeType!=1){continue}if(Element._fastMatch(h,b,e)){g--;f=h}if(g<0){return $(h)}}if(f&&a){return $(f)}},fastSiblings:function(b,a,c,d){return Element.fastEach(b.parentNode,a,c,d,b)},fastEach:function(d,b,f,c,e){var h=(!b||Object.isArray(b))?b:[b];var g=0;var i=$A([]);for(var a=d.firstChild;a;a=a.nextSibling){if(a.nodeType!=1){continue}if(e&&a==e){continue}if(Element._fastMatch(a,h,f)){i.push(c($(a),++g))}}return i},fastVisible:function(a){return a.offsetWidth>0||a.offsetHeight>0},fastClassMatch:function(b,c,d){var d=d||1;if(!b.className){return false}var a=b.className.match(c);if(!a){return false}if(a.length<=d){return false}return a[d]}});JcmsAjaxRequest=Class.create();JcmsAjaxRequest.prototype={initialize:function(a){this.elm=a;this.effect=null;this.exception=null;this.callback=null;this.rpc=null;this._periodexec=null;this.waitState=true;this.timeout=20000;this.quiet=false;this.isOk=false;this.isDone=false;this.isUpdate=false;this.isEffect=false;this.isTimeout=false},asyncJsonCall:function(){this.isOk=false;this.isDone=false;this.isUpdate=false;this.isEffect=false;this.isTimeout=false;if(this.waitState){Ajax.setWaitState(true,this.elm)}try{if(this.effect){this.effect()}else{this.isEffect=true}if(this._timeoutFunc){clearTimeout(this._timeoutFunc)}this._timeoutFunc=setTimeout(function(){this.isTimeout=true;this._asyncResponseCallBack()}.bind(this),this.timeout);if(this.rpc){this.rpc()}}catch(a){this._handleException(a)}},asyncJsonCallPeriodical:function(b){var a=function(){if(this.isDone){return}if(JcmsJsContext&&!JcmsJsContext.hasFocus){return}this.asyncJsonCall.bind(this).defer()};this._periodexec=new PeriodicalExecuter(a.bind(this),b)},stopPeriodical:function(){if(this._periodexec){this._periodexec.stop()}this.dispose()},asyncJsonCallBack:function(b,a){if(b){this.returnValue=b}else{this.isOk=true}if(a){this.returnException=a}this.isDone=true;this._asyncResponseCallBack();if(this._periodexec){this.isDone=false}},asyncEffectCallBack:function(a){this.isEffect=true;this.workingEffect=a;this._asyncResponseCallBack()},_asyncResponseCallBack:function(){if(this.isTimeout){if(!this._timeoutFunc){return}this._handleException();return}if(!this.isDone){return}if(this.isUpdate){return}if(!this.isEffect){return}if(this.returnException){JcmsLogger.error("JcmsAjaxRequest",this.returnException.message," Error: ["+this.returnException.code+"]",this.returnException.name,"\n"+this.returnException.javaStack);this._handleException();return}if(this._timeoutFunc){clearTimeout(this._timeoutFunc)}this.isUpdate=true;try{if(this.callback){this.callback(this.returnValue,this.workingEffect)}}catch(a){JcmsLogger.error("JcmsAjaxRequest",a)}this._disposeResponse()},_disposeResponse:function(){if(this.waitState){Ajax.setWaitState(false,this.elm)}if(!this._periodexec){this.dispose()}},_handleException:function(a){if(!this.quiet){alert(I18N.glp("warn.json.sessiontimeout"));var b="";Object.keys(a).each(function(c){b+=c+": "+a[c]+"; "});JcmsLogger.warn("JcmsAjaxRequest",b)}if(this.exception){this.exception(this.returnException)}this._disposeResponse()},dispose:function(){this.elm=null;this.effect=null;this.exception=null;this.callback=null;this.rpc=null;this._timeoutFunc=null;this._periodexec=null;this.timeout=20000;this.quiet=false}};JcmsJsonRequest=Class.create();Object.extend(JcmsJsonRequest.prototype,JcmsAjaxRequest.prototype);if(!window.Ajax){var Ajax=new Object()}Object.extend(Ajax,{setWaitState:function(a,b){jQuery.jalios.Ajax.wait(a,b)},performAjaxRequest:function(e,f,h){var c=e;var g=c.indexOf("?");if(g>=0){e=c.substr(0,g);f=c.substr(g+1)}var a=new JcmsAjaxRequest();var b=function(){new Ajax.Request(e,{parameters:f,onComplete:a.asyncJsonCallBack.bind(a),onException:a._handleException.bind(a),onFailure:a._handleException.bind(a)})};var d=h||function(j,i){};a.rpc=b;a.callback=d;a.asyncJsonCall()},_styleSheetsAdded:$H(),_javaScriptsAdded:$H(),loadStyleSheet:function(f,e,c){var e=e?e:"all";if(Ajax._styleSheetsAdded.get(f)===true){JcmsLogger.debug("Ajax","StyleSheet already imported: ",f);return}JcmsLogger.info("Ajax","Import StyleSheet",f,c);Ajax.markStyleSheetLoaded(f);var b=document.getElementsByTagName("head")[0];var d=document.createElement("link");d.type="text/css";d.rel="stylesheet";d.media=e;d.href=f+(c?("?v="+c):"");b.appendChild(d);if(Prototype.Browser.IE){var a=function(){$(document.body).toggleClassName("fixIERenderingBugOnDynamicCssLoad")};a.defer()}},markStyleSheetLoaded:function(a){JcmsLogger.debug("Ajax","Mark StyleSheet loaded: ",a);Ajax._styleSheetsAdded.set(a,true)},markStyleSheetsLoaded:function(){$A(arguments).each(function(a){Ajax.markStyleSheetLoaded(a)})},loadJavaScript:function(d,b){if(Ajax._javaScriptsAdded.get(d)===true){JcmsLogger.debug("Ajax","JavaScript already imported: ",d);return}JcmsLogger.info("Ajax","Import JavaScript",d,b);Ajax.markJavaScriptLoaded(d);var a=document.getElementsByTagName("head")[0];var c=document.createElement("script");c.type="text/javascript";c.src=d+(b?("?v="+b):"");a.appendChild(c)},markJavaScriptLoaded:function(a){JcmsLogger.debug("Ajax","Mark JavaScript loaded: ",a);Ajax._javaScriptsAdded.set(a,true)},markJavaScriptsLoaded:function(){$A(arguments).each(function(a){Ajax.markJavaScriptLoaded(a)})}});Ajax.Responders.register({onException:function(b,a){alert(I18N.glp("warn.json.sessiontimeout"))}});if(!window.InputUtil){var InputUtil=new Object()}Object.extend(InputUtil,{focus:function(a){if(a.type&&a.type.toLowerCase()=="file"){return}if(a.focus){try{a.focus()}catch(b){}}if(a.value){a.value=a.value}},blur:function(a){if(a.type&&a.type.toLowerCase()=="file"){return}if(a.blur){try{a.blur()}catch(b){}}},getMeasurer:function(a){var c=$("tx-measurer");if(!c){c=new Element("div",{id:"tx-measurer"});InputUtil._measurer=c}a.parentNode.appendChild(c);c.style.width=a.getWidth()+"px";c.style.height=a.getHeight()+"px";c.style.overflow="auto";c.style.whiteSpace="normal";c.style.position="absolute";var b=Util.getCSS(a,["font-family","font-size","margin","padding"]);c.setStyle({visibility:"hidden",fontFamily:b.fontFamily,fontSize:b.fontSize,margin:b.margin,padding:b.padding});c.style.marginTop="-"+(a.getHeight()+24)+"px";c.style.marginBottom="24px";return $(InputUtil._measurer)},htmlEncode:function(a){return document.createElement("a").appendChild(document.createTextNode(a)).parentNode.innerHTML},getCharacterCoords:function(c,g){var f=InputUtil.getMeasurer(c);var e=InputUtil.htmlEncode(c.value);var d=e.substring(0,g)+"<i>|</i>";d=(d||"").replace(/\r\n/g,"\n").replace(/\n\r/g,"\n").split("\n").join("<br />");f.innerHTML=d;var b=f.down("I");var a=b.positionedOffset();return{left:a.left-(c.scrollLeft||0),top:a.top-(c.scrollTop||0)}},getSelection:function(l,c){var g=new Object();g.input=l;if(l.setSelectionRange){g.start=l.selectionStart;g.end=l.selectionEnd;g.value=l.value.substring(l.selectionStart,l.selectionEnd);g.gecko=true;g.scrolltop=l.scrollTop;g.scrollleft=l.scrollLeft}else{if(l.createTextRange){if(!l.ownerDocument){l.ownerDocument=document}var n=l.ownerDocument.selection.createRange();if(n.parentElement().tagName!="TEXTAREA"){g.start=0;g.end=0}else{if(n.text.length==0){var h=l.value;var j="~JCMSwiki~";n.text=j;var m=l.value;var i=m.indexOf(j);l.value=h;var q=m.substr(0,i).replace(/\r\n/g,"\n").replace(/\n\r/g,"\n").split("\n").length-1;g.value="";InputUtil._setSelection(g,i,i);g.start=i;g.end=i}else{var j=n.getBookmark();var f=l.createTextRange();var b=l.createTextRange();var k=f.text;b.moveToBookmark(j);var p=b.text;f.setEndPoint("EndToStart",b);var a=f.text.length;var i=k.indexOf(p,a);var e=i+p.length;var d=k.substring(0,i).replace(/\r\n/g,"\n").replace(/\n\r/g,"\n").split("\n").length-1;var o=d+p.replace(/\r\n/g,"\n").replace(/\n\r/g,"\n").split("\n").length-1;a=i;e=e;g.start=a;g.end=e;g.value=b.text;InputUtil._setSelection(g,a,e)}}}}if(JcmsLogger.isDebug&&JcmsLogger.InputUtil){JcmsLogger.debug("InputUtil","getSelection: "+g.start+","+g.end+": "+g.value+"("+g.scrolltop+","+g.scrollleft+")")}return c?InputUtil._trimSelection(g):g},replaceSelection:function(g,a,b,h,i){g.focus();i=(i==undefined)?0:i;var h=h||InputUtil.getSelection(g,b);var c=g.value;if(h.gecko){g.value=c.substring(0,h.start+i)+a+c.substring(h.end);var f=h.value?h.value.length:0;InputUtil._setSelection(h,h.start+i,h.end+(a.length+i-f))}else{var e=g.ownerDocument.selection.createRange();var d=(e.text.length==0);e.moveStart("character",i);e.text=a;e.moveStart("character",-a.length+i);e.moveEnd("character",i);e.select()}},replaceRegexp:function(f,d,a,i,c,e,g){var g=g||InputUtil.getSelection(f,c);var h=g.value;if(!h&&!e){return}var b=h;if(!h){b=i.replace(/\$1/g,"")}else{if(h.match(d)){b=h.replace(d,a)}else{b=h.replace(/\s*([\S ]+)(\s*)/g,i+"$2")}}if(b==h){return}InputUtil.replaceSelection(f,b,c,g)},_setSelection:function(e,g,a){e.input.focus();if(e.gecko){if(e.scrollleft){e.input.scrollLeft=e.scrollleft}if(e.scrolltop){e.input.scrollTop=e.scrolltop}else{Element.fire(e.input,"keypress")}e.input.setSelectionRange(a,a)}else{if(e.input.createTextRange){var c=e.input.createTextRange();var f=e.input.value;var d=f.substring(0,g).replace(/\r\n/g,"\n").replace(/\n\r/g,"\n").split("\n").length-1;var b=f.substring(g,a).replace(/\r\n/g,"\n").replace(/\n\r/g,"\n").split("\n").length-1;c.move("character",g-d);c.moveEnd("character",a-g);c.select()}}e.value=e.input.value.substring(g,a);e.start=g;e.end=a},_trimSelection:function(b){if(b.start>=b.end||!b.value){return b}var c=0;var a=0;while(b.value.charAt(c)==" "){c++}while(b.value.charAt(b.value.length-a-1)==" "){a++}if((c==0)&&(a==0)){return b}InputUtil._setSelection(b,b.start+c,b.end-a);return b}});"JCMS.util.StyleSheet"._namespace({_ss:false,_getStyleSheet:function(){var b=JCMS.util.StyleSheet._ss;if(b){return b}if(document.createStyleSheet){JCMS.util.StyleSheet._ss=document.createStyleSheet()}else{var a=document.getElementsByTagName("head")[0];var c=document.createElement("style");c.type="text/css";a.appendChild(c);JCMS.util.StyleSheet._ss=c.sheet}return JCMS.util.StyleSheet._ss},_addRule:function(c,b){var a=JCMS.util.StyleSheet._getStyleSheet();if(a.addRule){a.addRule(c,b)}else{a.insertRule(c+"{"+b+"}",a.cssRules.length)}},putRule:function(d,c){var b=JCMS.util.StyleSheet._getStyleSheet();var e=$A(b.rules||b.cssRules);var a=e.find(function(g,f){if(g.selectorText!=d){return false}if(!c){if(b.deleteRule){b.deleteRule(f)}else{b.removeRule(f)}return true}if(g.style.cssText){g.style.cssText=c}else{g.cssText=c}return true});if(!a&&c){JCMS.util.StyleSheet._addRule(d,c)}},removeRule:function(a){JCMS.util.StyleSheet.putRule(a,false)}});if(!window.FormUtil){var FormUtil=new Object()}Object.extend(FormUtil,{toggleInputs:function(c,a,b){$A(a).each(function(e,d){Form.getInputs(c,false,e).each(function(f){f.disabled=!b})})},setInputValues:function(a,b){Form.getInputs(a,"text",false).each(function(c){var d=b[c.name];if(d!=undefined){c.value=d}})},imposeMaxLength:function(b,a){if(b.value.length<a){return true}else{if(b.value.length>a){b.value="";return false}else{b.value=b.value.substr(0,a-1);return false}}},submit:function(d){var d=$(d);var a=false;var c=false;if(d.hasClassName("ajax-refresh")){JCMS.ajax.Refresh.refreshFromElement(d);return false}if(d.tagName=="FORM"){a=d}else{if(d.form){a=$(d.form);if(d.type=="submit"){c=""+d.value}}else{a=d.fastUp("FORM");if(!a){return false}}}if(!c.blank()){var b=a.elements.action;if(b){$(b).name=c}else{var b=$(document.createElement("INPUT"));b.name=c;b.value="true";b.type="hidden";a.appendChild(b)}}if(a.onsubmit){a.onsubmit()}a.submit();return true},clearFields:function(a){var b=Event.element(a);if(!b){return}b.previousSiblings().findAll(function(c){return c.clear}).invoke("clear")},getCheckedValues:function(b,d){var c=$(document.forms[b]);if(!c){return null}var a=c.getInputs("checkbox",d).concat(c.getInputs("radio",d));a=a.findAll(function(e){return e.checked});return a.pluck("value").compact()},getRadioValue:function(b,a){if($(b).type&&$(b).type.toLowerCase()=="radio"){var a=$(b).name;var b=$(b).form}else{if($(b).tagName.toLowerCase()!="form"){return false}}var c=$(b).getInputs("radio",a).find(function(d){return d.checked});return(c)?$F(c):null},activatePlaceholders:function(){var b=navigator.userAgent.toLowerCase();if(b.indexOf("safari")>0){return false}var a=document.getElementsByTagName("input");for(var c=0;c<a.length;c++){FormUtil.activatePlaceholderWithoutBrowserCheck(a[c])}},activatePlaceholder:function(b){var a=navigator.userAgent.toLowerCase();if(a.indexOf("safari")>0){return false}FormUtil.activatePlaceholderWithoutBrowserCheck(b)},activatePlaceholderWithoutBrowserCheck:function(a){a=$(a);if(a.readAttribute("type")=="text"){if(a.readAttribute("placeholder")&&a.readAttribute("placeholder").length>0){if(a.value==""){a.value=a.readAttribute("placeholder")}a.onclick=function(){if(this.value==this.readAttribute("placeholder")){this.value="";this.removeClassName("inactivePlaceHolder")}return false};a.onblur=function(){if(this.value.length<1){this.value=this.readAttribute("placeholder");this.addClassName("inactivePlaceHolder")}}}}},retrieveBooleanValue:function(f,e){var b=$(f).getInputs(null,e);var c=$A(b);for(var a=0;a<c.length;++a){var d=c[a];if(d.checked==true){return d.value}}return false}});if(!window.Util){var Util=new Object()}Object.extend(Util,{isInIFrame:function(){jQuery.jalios.DOM.isInIFrame()},shakeIE:function(){if(Prototype.Browser.IE){$(document.body).toggleClassName("fixIERenderingBug");JcmsLogger.debug("ShakeIE","Warning slow IE6 ! Use instead CSS (position: relative; zoom:1)")}},isIE78:function(){var a=$(document.body);if(!a){return false}if(a.hasClassName("browser-IE7")){return true}if(a.hasClassName("browser-IE8")){return true}return false},cleanDOMElements:function(g,b,d,c){var e=$A([]);for(var f=g.firstChild;f;f=f.nextSibling){if(f.nodeType!=1){continue}var a=c||!d||f.className.indexOf(d)>=0;if(b){Util.cleanDOMElements(f,b,d,a)}var f=$(f);f.removeAttribute("id");f.stopObserving();if(a){f.removeAttribute("onclick");e.push(f)}}e.each(function(i,h){g.removeChild(i)})},isLeftClick:function(a){return JcmsJsContext.isIE||Event.isLeftClick(a)},replaceHtml:function(c,b){var a=(typeof c==="string"?document.getElementById(c):c);var d=document.createElement(a.nodeName);d.id=a.id;d.className=a.className;d.innerHTML=b;a.parentNode.replaceChild(d,a);return d},getViewportBounds:function(f){var b=0;var d=0;var a=0;var c=0;if(!f){f=self}var e=f.document;if(f.screenTop){a=f.screenLeft;c=f.screenTop}else{if(f.screenX){a=f.screenX;c=f.screenY}}if(f.innerHeight){b=f.innerWidth;d=f.innerHeight}else{if(e.documentElement&&f.document.documentElement.clientHeight){b=e.documentElement.clientWidth;d=e.documentElement.clientHeight}else{if(document.body){b=e.body.clientWidth;d=e.body.clientHeight}}}return{x:a,y:c,width:b,height:d}},observeDocument:function(a,b){if(Prototype.Browser.IE||Prototype.Browser.Chrome){Event.observe(document,a,b)}else{Event.observe(window,a,b)}},observeFocus:function(a,b){if(document.addEventListener){document.addEventListener("focus",a,true);document.addEventListener("blur",b,true)}else{document.observe("focusin",a);document.observe("focusout",b)}},_classToCallBack:$H(),_tagToCallBack:$H(),_focusToCallBack:$H(),_onLoadCB:function(){var c=Util._onClickCB.bindAsEventListener(this);Util.observeDocument("click",c);Util.observeDocument("jcms:click",c);var b=Util._onFocusCB.bindAsEventListener(this,"focus:in");var a=Util._onFocusCB.bindAsEventListener(this,"focus:out");Util.observeFocus(b,a)},_onFocusCB:function(b,a){var d=Event.element(b);if(!d||!d.fastUp){return}var d=d.fastUp(["INPUT","TEXTAREA","SELECT"],null,true,2);if(!d){return}if(d.type&&d.type=="hidden"){return}if(!d._init){d._init=true;document.fire("jcms:init-focus",{elmId:d.identify()})}var c=$w(d.className);c.each(function(g,f){var e=Util._focusToCallBack.get(g);if(Object.isFunction(e)){e(b,d,g,a)}}.bind(this))},_onClickCB:function(a){if(!(a.eventName==="jcms:click"||Util.isLeftClick(a))){return}var b=Event.element(a);if(!b||!b.fastUp){return}if(b.tagName=="IMG"){if(Util._onClickDispatch(b,a)){return}}b=b.fastUp(["A","LABEL","BUTTON","INPUT","TEXTAREA","SELECT"],null,true,2);if(!b){return}Util._onClickDispatch(b,a)},_onClickDispatch:function(d,b){if(!d._init){d._init=true;document.fire("jcms:init",{elmId:d.identify()})}var a=false;var c=$w(d.className);c.each(function(g,f){var e=Util._classToCallBack.get(g);if(Object.isFunction(e)){e(b,d,g);a=true}}.bind(this));return a},observeClass:function(a,b){Util._classToCallBack.set(a,b)},observeFocusClass:function(a,b){Util._focusToCallBack.set(a,b)},getCSS:function(u,y,c){var h,o={},q,a,w=y instanceof Array;var d=document.defaultView&&document.defaultView.getComputedStyle;var f=/^-?\d+(?:px)?$/i,k=/^-?\d(?:\.\d+)?/,j=/\d$/,x,b;var p=w?y:[y];for(var r=0,m=p.length;r<m;r++){q=p[r];a=q.camelize();if(!c&&u.style[a]){o[q]=o[a]=u.style[a]}else{if(d){if(!h){h=window.getComputedStyle(u,"")}o[q]=o[a]=h&&h.getPropertyValue(q)}else{if(u.currentStyle){x=u.currentStyle[q]||u.currentStyle[a];var s=u.style||u;if(!f.test(x)&&k.test(x)){var g=s.left,l=u.runtimeStyle.left;u.runtimeStyle.left=u.currentStyle.left;b=j.test(x)?"em":"";var v=(a==="fontSize")?"1em":(x+b||0);try{s.left=v}catch(t){}x=s.pixelLeft+"px";s.left=g;u.runtimeStyle.left=l}o[q]=o[a]=x}}}}return w?o:o[y.camelize()]}});Event.observe(window,"load",Util._onLoadCB);var Notifier=Class.create({_events:[[document,"mousemove"],[document,"keydown"]],_timer:null,_idleTime:null,active:false,initialize:function(d,a,c,b){this.time=d;this.eventName=a||"state";this.active=c||false;this.className=$A(b);this.initObservers();this.setTimer();this._lastIdle=false},initObservers:function(){this._events.each(function(a){Event.observe(a[0],a[1],this.onInterrupt.bindAsEventListener(this))}.bind(this))},onInterrupt:function(c){var e=Event.element(c);var b=Event.pointerX(c);var a=Event.pointerY(c);clearTimeout(this._timer);if(this._lastIdle!=e){this._lastIdle=false}if(!this._matchClassName(e)&&(e.parentNode&&!this._matchClassName(e.parentNode))){return}if(this.active){var d=new Date()-this._idleTime;if(d>200){document.fire(this.eventName+":active",{idleTime:d,target:e,eX:b,eY:a})}}this.setTimer(e,b,a)},setTimer:function(c,b,a){this._idleTime=new Date();this._timer=setTimeout(function(){if(this._lastIdle==c){return}document.fire(this.eventName+":idle",{target:c,eX:b,eY:a});this._lastIdle=c}.bind(this),this.time)},_matchClassName:function(a){if(!this.className||!a||!this.className.any){return true}if(!a.className||!a.className.indexOf){return false}return this.className.any(function(b){return a.className.indexOf(b)>=0})}});var JcmsLogger={LEVEL_INFO:"info",LEVEL_DEBUG:"debug",LEVEL_WARN:"warn",LEVEL_ERROR:"error",isDebug:true&&window.console&&window.console.debug,Ajax:false,CtxMenuManager:false,CtxMenu:false,CtxMenuTrace:false,WikiToolbar:false,InputUtil:false,Autochooser:false,JcmsJsContext:false,Table:false,DocChooser:false,TreeCat:false,Modal:false,JcmsAjaxRequest:false,AjaxRefresh:false,ShakeIE:true,Widget:false,Plupload:true,EditFriendlyURL:false,_log:function(d,a){var b=a[0];var c=a[1];if(!window.console&&document.URL.indexOf("debug=true")>0&&d==JcmsLogger.LEVEL_INFO){alert($A(a).inspect())}if(!JcmsLogger._checkScope(d,b,c)){return}d=(typeof(d)=="undefined")?JcmsLogger.LEVEL_DEBUG:d;a[1]="["+d+"]["+b+"] "+c;a=$A(a).slice(1,a.length);if(window.console&&d&&window.console[d]&&typeof(window.console[d].apply)!="unknown"){window.console[d].apply(window.console,a)}},_checkScope:function(c,a,b){if((!b)||!JcmsLogger.isDebug){return false}c=(typeof(c)=="undefined")?JcmsLogger.LEVEL_DEBUG:c;if((!a)||(!JcmsLogger[a]&&c==JcmsLogger.LEVEL_DEBUG)){return false}return true},info:function(a,b){JcmsLogger._log(JcmsLogger.LEVEL_INFO,arguments)},debug:function(a,b){JcmsLogger._log(JcmsLogger.LEVEL_DEBUG,arguments)},warn:function(a,b){JcmsLogger._log(JcmsLogger.LEVEL_WARN,arguments)},error:function(a,b){JcmsLogger._log(JcmsLogger.LEVEL_ERROR,arguments)}};document.getElementsBySelector=function(a){return $$(a)};var cbSplit;if(!cbSplit){cbSplit=function(i,f,e){if(Object.prototype.toString.call(f)!=="[object RegExp]"){return cbSplit._nativeSplit.call(i,f,e)}var c=[],a=0,d=(f.ignoreCase?"i":"")+(f.multiline?"m":"")+(f.sticky?"y":""),f=RegExp(f.source,d+"g"),b,g,h,j;i=i+"";if(!cbSplit._compliantExecNpcg){b=RegExp("^"+f.source+"$(?!\\s)",d)}if(e===undefined||+e<0){e=Infinity}else{e=Math.floor(+e);if(!e){return[]}}while(g=f.exec(i)){h=g.index+g[0].length;if(h>a){c.push(i.slice(a,g.index));if(!cbSplit._compliantExecNpcg&&g.length>1){g[0].replace(b,function(){for(var k=1;k<arguments.length-2;k++){if(arguments[k]===undefined){g[k]=undefined}}})}if(g.length>1&&g.index<i.length){Array.prototype.push.apply(c,g.slice(1))}j=g[0].length;a=h;if(c.length>=e){break}}if(f.lastIndex===g.index){f.lastIndex++}}if(a===i.length){if(j||!f.test("")){c.push("")}}else{c.push(i.slice(a))}return c.length>e?c.slice(0,e):c};cbSplit._compliantExecNpcg=/()??/.exec("")[1]===undefined;cbSplit._nativeSplit=String.prototype.split}String.prototype.split=function(b,a){return cbSplit(this,b,a)};