/*!
 * modernizr v3.11.8
 * Build https://modernizr.com/download?-cssanimations-input-inputtypes-placeholder-mq-setclasses-teststyles-dontmin
 *
 * Copyright (c)
 *  Faruk Ates
 *  Paul Irish
 *  Alex Sexton
 *  Ryan Seddon
 *  Patrick Kettner
 *  Stu Cox
 *  Richard Herrera
 *  Veeck

 * MIT License
 */
;(function(s,A,c,h){var l=[];var E={_version:"3.11.8",_config:{classPrefix:"",enableClasses:true,enableJSClass:true,usePrefixes:true},_q:[],on:function(N,i){var M=this;setTimeout(function(){i(M[N])},0)},addTest:function(M,N,i){l.push({name:M,fn:N,options:i})},addAsyncTest:function(i){l.push({name:null,fn:i})}};var y=function(){};y.prototype=E;y=new y();var d=[];function u(M,i){return typeof M===i}function J(){var P;var Q;var N;var i;var M;var O;var S;for(var R in l){if(l.hasOwnProperty(R)){P=[];Q=l[R];if(Q.name){P.push(Q.name.toLowerCase());if(Q.options&&Q.options.aliases&&Q.options.aliases.length){for(N=0;N<Q.options.aliases.length;N++){P.push(Q.options.aliases[N].toLowerCase())}}}i=u(Q.fn,"function")?Q.fn():Q.fn;for(M=0;M<P.length;M++){O=P[M];S=O.split(".");if(S.length===1){y[S[0]]=i}else{if(!y[S[0]]||y[S[0]]&&!(y[S[0]] instanceof Boolean)){y[S[0]]=new Boolean(y[S[0]])}y[S[0]][S[1]]=i}d.push((i?"":"no-")+S.join("-"))}}}}var L=c.documentElement;var a=L.nodeName.toLowerCase()==="svg";function b(N){var O=L.className;var M=y._config.classPrefix||"";if(a){O=O.baseVal}if(y._config.enableJSClass){var i=new RegExp("(^|\\s)"+M+"no-js(\\s|$)");O=O.replace(i,"$1"+M+"js$2")}if(y._config.enableClasses){if(N.length>0){O+=" "+M+N.join(" "+M)}if(a){L.className.baseVal=O}else{L.className=O}}}function w(){if(typeof c.createElement!=="function"){return c.createElement(arguments[0])}else{if(a){return c.createElementNS.call(c,"http://www.w3.org/2000/svg",arguments[0])}else{return c.createElement.apply(c,arguments)}}}function I(){var i=c.body;if(!i){i=w(a?"svg":"body");i.fake=true}return i}function m(S,V,N,U){var T="modernizr";var M;var R;var O;var P;var i=w("div");var Q=I();if(parseInt(N,10)){while(N--){O=w("div");O.id=U?U[N]:T+(N+1);i.appendChild(O)}}M=w("style");M.type="text/css";M.id="s"+T;(!Q.fake?i:Q).appendChild(M);Q.appendChild(i);if(M.styleSheet){M.styleSheet.cssText=S}else{M.appendChild(c.createTextNode(S))}i.id=T;if(Q.fake){Q.style.background="";Q.style.overflow="hidden";P=L.style.overflow;L.style.overflow="hidden";L.appendChild(Q)}R=V(i,S);if(Q.fake&&Q.parentNode){Q.parentNode.removeChild(Q);L.style.overflow=P;L.offsetHeight}else{i.parentNode.removeChild(i)}return !!R}function o(N,O,Q){var i;if("getComputedStyle" in A){i=getComputedStyle.call(A,N,O);var M=A.console;if(i!==null){if(Q){i=i.getPropertyValue(Q)}}else{if(M){var P=M.error?"error":"log";M[P].call(M,"getComputedStyle returning null, its possible modernizr test results are inaccurate")}}}else{i=!O&&N.currentStyle&&N.currentStyle[Q]}return i}var g=(function(){var i=A.matchMedia||A.msMatchMedia;if(i){return function(N){var M=i(N);return M&&M.matches||false}}return function(N){var M=false;m("@media "+N+" { #modernizr { position: absolute; } }",function(O){M=o(O,null,"position")==="absolute"});return M}})();E.mq=g;var q=E.testStyles=m;var K=w("input");
/*!
{
  "name": "Input attributes",
  "property": "input",
  "tags": ["forms"],
  "authors": ["Mike Taylor"],
  "notes": [{
    "name": "WHATWG Spec",
    "href": "https://html.spec.whatwg.org/multipage/input.html#input-type-attr-summary"
  }],
  "knownBugs": ["Some blackberry devices report false positive for input.multiple"]
}
!*/
;var B="autocomplete autofocus list placeholder max min multiple pattern required step".split(" ");var f={};y.input=(function(O){for(var N=0,M=O.length;N<M;N++){f[O[N]]=!!(O[N] in K)}if(f.list){f.list=!!(w("datalist")&&A.HTMLDataListElement)}return f})(B);
/*!
{
  "name": "Form input types",
  "property": "inputtypes",
  "caniuse": "forms",
  "tags": ["forms"],
  "authors": ["Mike Taylor"],
  "polyfills": [
    "jquerytools",
    "webshims",
    "h5f",
    "webforms2",
    "nwxforms",
    "fdslider",
    "html5slider",
    "galleryhtml5forms",
    "jscolor",
    "html5formshim",
    "selectedoptionsjs",
    "formvalidationjs"
  ]
}
!*/
(function(){var P=["search","tel","url","email","datetime","date","month","week","time","datetime-local","number","range","color"];var N="1)";var R;var Q;var M;for(var O=0;O<P.length;O++){K.setAttribute("type",R=P[O]);M=K.type!=="text"&&"style" in K;if(M){K.value=N;K.style.cssText="position:absolute;visibility:hidden;";if(/^range$/.test(R)&&K.style.WebkitAppearance!==h){L.appendChild(K);Q=c.defaultView;M=Q.getComputedStyle&&Q.getComputedStyle(K,null).WebkitAppearance!=="textfield"&&(K.offsetHeight!==0);L.removeChild(K)}else{if(/^(search|tel)$/.test(R)){}else{if(/^(url|email)$/.test(R)){M=K.checkValidity&&K.checkValidity()===false}else{M=K.value!==N}}}}y.addTest("inputtypes."+R,!!M)}})();var j="Moz O ms Webkit";var D=(E._config.usePrefixes?j.split(" "):[]);E._cssomPrefixes=D;function x(M,i){return !!~(""+M).indexOf(i)}var G={elem:w("modernizr")};y._q.push(function(){delete G.elem});var C={style:G.elem.style};y._q.unshift(function(){delete C.style});function e(i){return i.replace(/([A-Z])/g,function(N,M){return"-"+M.toLowerCase()}).replace(/^ms-/,"-ms-")}function v(N,O){var M=N.length;if("CSS" in A&&"supports" in A.CSS){while(M--){if(A.CSS.supports(e(N[M]),O)){return true}}return false}else{if("CSSSupportsRule" in A){var P=[];while(M--){P.push("("+e(N[M])+":"+O+")")}P=P.join(" or ");return m("@supports ("+P+") { #modernizr { position: absolute; } }",function(i){return o(i,null,"position")==="absolute"})}}return h}function r(i){return i.replace(/([a-z])-([a-z])/g,function(O,N,M){return N+M.toUpperCase()}).replace(/^-/,"")}function z(T,P,W,U){U=u(U,"undefined")?false:U;if(!u(W,"undefined")){var Y=v(T,W);if(!u(Y,"undefined")){return Y}}var X,Q,M,O,V;var N=["modernizr","tspan","samp"];while(!C.style&&N.length){X=true;C.modElem=w(N.shift());C.style=C.modElem.style}function R(){if(X){delete C.style;delete C.modElem}}M=T.length;for(Q=0;Q<M;Q++){O=T[Q];V=C.style[O];if(x(O,"-")){O=r(O)}if(C.style[O]!==h){if(!U&&!u(W,"undefined")){try{C.style[O]=W}catch(S){}if(C.style[O]!==V){R();return P==="pfx"?O:true}}else{R();return P==="pfx"?O:true}}}R();return false}var H=(E._config.usePrefixes?j.toLowerCase().split(" "):[]);E._domPrefixes=H;function t(i,M){return function(){return i.apply(M,arguments)}}function p(N,Q,P){var O;for(var M in N){if(N[M] in Q){if(P===false){return N[M]}O=Q[N[M]];if(u(O,"function")){return t(O,P||Q)}return O}}return false}function n(R,i,O,P,Q){var M=R.charAt(0).toUpperCase()+R.slice(1),N=(R+" "+D.join(M+" ")+M).split(" ");if(u(i,"string")||u(i,"undefined")){return z(N,i,P,Q)}else{N=(R+" "+(H).join(M+" ")+M).split(" ");return p(N,i,O)}}E.testAllProps=n;function k(N,i,M){return n(N,h,h,i,M)}E.testAllProps=k;
/*!
{
  "name": "CSS Animations",
  "property": "cssanimations",
  "caniuse": "css-animation",
  "polyfills": ["transformie", "csssandpaper"],
  "tags": ["css"],
  "warnings": ["Android < 4 will pass this test, but can only animate a single property at a time"],
  "notes": [{
    "name": "Article: 'Dispelling the Android CSS animation myths'",
    "href": "https://web.archive.org/web/20180602074607/https://daneden.me/2011/12/14/putting-up-with-androids-bullshit/"
  }]
}
!*/
;y.addTest("cssanimations",k("animationName","a",true));
/*!
{
  "name": "placeholder attribute",
  "property": "placeholder",
  "tags": ["forms", "attribute"],
  "builderAliases": ["forms_placeholder"]
}
!*/
;y.addTest("placeholder",("placeholder" in w("input")&&"placeholder" in w("textarea")));J();b(d);delete E.addTest;delete E.addAsyncTest;for(var F=0;F<y._q.length;F++){y._q[F]()}s.Modernizr=y})(window,window,document);