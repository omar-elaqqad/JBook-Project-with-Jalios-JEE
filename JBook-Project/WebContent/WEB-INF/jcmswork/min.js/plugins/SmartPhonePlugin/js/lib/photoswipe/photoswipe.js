/*! PhotoSwipe - v4.1.3 - 2019-01-08
* http://photoswipe.com
* Copyright (c) 2019 Dmitry Semenov; */
(function(a,b){if(typeof define==="function"&&define.amd){define(b)}else{if(typeof exports==="object"){module.exports=b()}else{a.PhotoSwipe=b()}}})(this,function(){var a=function(a3,bv,cr,bw){var bA={features:null,bind:function(cC,cA,cB,cz){var p=(cz?"remove":"add")+"EventListener";cA=cA.split(" ");for(var cy=0;cy<cA.length;cy++){if(cA[cy]){cC[p](cA[cy],cB,false)}}},isArray:function(p){return(p instanceof Array)},createEl:function(cy,p){var cz=document.createElement(p||"div");if(cy){cz.className=cy}return cz},getScrollY:function(){var p=window.pageYOffset;return p!==undefined?p:document.documentElement.scrollTop},unbind:function(cz,p,cy){bA.bind(cz,p,cy,true)},removeClass:function(cz,cy){var p=new RegExp("(\\s|^)"+cy+"(\\s|$)");cz.className=cz.className.replace(p," ").replace(/^\s\s*/,"").replace(/\s\s*$/,"")},addClass:function(cy,p){if(!bA.hasClass(cy,p)){cy.className+=(cy.className?" ":"")+p}},hasClass:function(cy,p){return cy.className&&new RegExp("(^|\\s)"+p+"(\\s|$)").test(cy.className)},getChildByClass:function(cy,p){var cz=cy.firstChild;while(cz){if(bA.hasClass(cz,p)){return cz}cz=cz.nextSibling}},arraySearch:function(cA,cz,cy){var p=cA.length;while(p--){if(cA[p][cy]===cz){return p}}return -1},extend:function(cz,cy,p){for(var cA in cy){if(cy.hasOwnProperty(cA)){if(p&&cz.hasOwnProperty(cA)){continue}cz[cA]=cy[cA]}}},easing:{sine:{out:function(p){return Math.sin(p*(Math.PI/2))},inOut:function(p){return -(Math.cos(Math.PI*p)-1)/2}},cubic:{out:function(p){return --p*p*p+1}}},detectFeatures:function(){if(bA.features){return bA.features}var cA=bA.createEl(),cE=cA.style,cH="",cz={};cz.oldIE=document.all&&!document.addEventListener;cz.touch="ontouchstart" in window;if(window.requestAnimationFrame){cz.raf=window.requestAnimationFrame;cz.caf=window.cancelAnimationFrame}cz.pointerEvent=!!(window.PointerEvent)||navigator.msPointerEnabled;if(!cz.pointerEvent){var cy=navigator.userAgent;if(/iP(hone|od)/.test(navigator.platform)){var cI=(navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/);if(cI&&cI.length>0){cI=parseInt(cI[1],10);if(cI>=1&&cI<8){cz.isOldIOSPhone=true}}}var cD=cy.match(/Android\s([0-9\.]*)/);var cK=cD?cD[1]:0;cK=parseFloat(cK);if(cK>=1){if(cK<4.4){cz.isOldAndroid=true}cz.androidVersion=cK}cz.isMobileOpera=/opera mini|opera mobi/i.test(cy)}var cF=["transform","perspective","animationName"],cJ=["","webkit","Moz","ms","O"],cL,cB;for(var cC=0;cC<4;cC++){cH=cJ[cC];for(var cG=0;cG<3;cG++){cL=cF[cG];cB=cH+(cH?cL.charAt(0).toUpperCase()+cL.slice(1):cL);if(!cz[cL]&&cB in cE){cz[cL]=cB}}if(cH&&!cz.raf){cH=cH.toLowerCase();cz.raf=window[cH+"RequestAnimationFrame"];if(cz.raf){cz.caf=window[cH+"CancelAnimationFrame"]||window[cH+"CancelRequestAnimationFrame"]}}}if(!cz.raf){var p=0;cz.raf=function(cN){var cM=new Date().getTime();var cO=Math.max(0,16-(cM-p));var cP=window.setTimeout(function(){cN(cM+cO)},cO);p=cM+cO;return cP};cz.caf=function(cM){clearTimeout(cM)}}cz.svg=!!document.createElementNS&&!!document.createElementNS("http://www.w3.org/2000/svg","svg").createSVGRect;bA.features=cz;return cz}};bA.detectFeatures();if(bA.features.oldIE){bA.bind=function(cD,cB,cC,cA){cB=cB.split(" ");var p=(cA?"detach":"attach")+"Event",cz,cE=function(){cC.handleEvent.call(cC)};for(var cy=0;cy<cB.length;cy++){cz=cB[cy];if(cz){if(typeof cC==="object"&&cC.handleEvent){if(!cA){cC["oldIE"+cz]=cE}else{if(!cC["oldIE"+cz]){return false}}cD[p]("on"+cz,cC["oldIE"+cz])}else{cD[p]("on"+cz,cC)}}}}}var a4=this;var D=25,K=3;var ac={allowPanToNext:true,spacing:0.12,bgOpacity:1,mouseUsed:false,loop:true,pinchToClose:true,closeOnScroll:true,closeOnVerticalDrag:true,verticalDragRange:0.75,hideAnimationDuration:333,showAnimationDuration:333,showHideOpacity:false,focus:true,escKey:true,arrowKeys:true,mainScrollEndFriction:0.35,panEndFriction:0.35,isClickableElement:function(p){return p.tagName==="A"},getDoubleTapZoom:function(cy,p){if(cy){return 1}else{return p.initialZoomLevel<0.7?1:1.33}},maxSpreadZoom:1.33,modal:true,scaleMode:"fit"};bA.extend(ac,bw);var bN=function(){return{x:0,y:0}};var G,bU,bG,bI,l,Z,U=bN(),cv=bN(),al=bN(),bH,ba,aI,b4={},bJ,bO,ax,cg,F,a5,bq=0,bW={},bK=bN(),at,q,aW=0,B,bo,J,R,cb,ah,ae=true,cj,aR=[],a9,aZ,af,aC,bj,b5,bb,T={},h=false,be,aK=function(p,cy){bA.extend(a4,cy.publicMethods);aR.push(p)},bB=function(p){var cy=aS();if(p>cy-1){return p-cy}else{if(p<0){return cy+p}}return p},ci={},a8=function(p,cy){if(!ci[p]){ci[p]=[]}return ci[p].push(cy)},ao=function(cy){var cA=ci[cy];if(cA){var p=Array.prototype.slice.call(arguments);p.shift();for(var cz=0;cz<cA.length;cz++){cA[cz].apply(a4,p)}}},ap=function(){return new Date().getTime()},d=function(p){aE=p;a4.bg.style.opacity=p*ac.bgOpacity},r=function(cA,p,cB,cz,cy){if(!h||(cy&&cy!==a4.currItem)){cz=cz/(cy?cy.fitRatio:a4.currItem.fitRatio)}cA[cb]=ax+p+"px, "+cB+"px"+cg+" scale("+cz+")"},ak=function(p){if(bm){if(p){if(bJ>a4.currItem.fitRatio){if(!h){bz(a4.currItem,false,true);h=true}}else{if(h){bz(a4.currItem);h=false}}}r(bm,al.x,al.y,bJ)}},cu=function(p){if(p.container){r(p.container.style,p.initialPosition.x,p.initialPosition.y,p.initialZoomLevel,p)}},bT=function(p,cy){cy[cb]=ax+p+"px, 0px"+cg},ad=function(p,cz){if(!ac.loop&&cz){var cy=bI+(bK.x*bq-p)/bK.x,cA=Math.round(p-aH.x);if((cy<0&&cA>0)||(cy>=aS()-1&&cA<0)){p=aH.x+cA*ac.mainScrollEndFriction}}aH.x=p;bT(p,l)},aN=function(cy,cz){var p=ar[cy]-bW[cy];return cv[cy]+U[cy]+p-p*(cz/bO)},a7=function(cy,p){cy.x=p.x;cy.y=p.y;if(p.id){cy.id=p.id}},E=function(cy){cy.x=Math.round(cy.x);cy.y=Math.round(cy.y)},s=null,aD=function(){if(s){bA.unbind(document,"mousemove",aD);bA.addClass(a3,"pswp--has_mouse");ac.mouseUsed=true;ao("mouseUsed")}s=setTimeout(function(){s=null},100)},b2=function(){bA.bind(document,"keydown",a4);if(bb.transform){bA.bind(a4.scrollWrap,"click",a4)}if(!ac.mouseUsed){bA.bind(document,"mousemove",aD)}bA.bind(window,"resize scroll orientationchange",a4);ao("bindEvents")},aq=function(){bA.unbind(window,"resize scroll orientationchange",a4);bA.unbind(window,"scroll",aI.scroll);bA.unbind(document,"keydown",a4);bA.unbind(document,"mousemove",aD);if(bb.transform){bA.unbind(a4.scrollWrap,"click",a4)}if(bV){bA.unbind(window,bH,a4)}clearTimeout(be);ao("unbindEvents")},aJ=function(cy,cz){var p=P(a4.currItem,b4,cy);if(cz){cn=p}return p},b1=function(p){if(!p){p=a4.currItem}return p.initialZoomLevel},Q=function(p){if(!p){p=a4.currItem}return p.w>0?ac.maxSpreadZoom:1},ce=function(cz,cA,p,cy){if(cy===a4.currItem.initialZoomLevel){p[cz]=a4.currItem.initialPosition[cz];return true}else{p[cz]=aN(cz,cy);if(p[cz]>cA.min[cz]){p[cz]=cA.min[cz];return true}else{if(p[cz]<cA.max[cz]){p[cz]=cA.max[cz];return true}}}return false},C=function(){if(cb){var p=bb.perspective&&!cj;ax="translate"+(p?"3d(":"(");cg=bb.perspective?", 0px)":")";return}cb="left";bA.addClass(a3,"pswp--ie");bT=function(cy,cz){cz.left=cy+"px"};cu=function(cC){var cz=cC.fitRatio>1?1:cC.fitRatio,cB=cC.container.style,cy=cz*cC.w,cA=cz*cC.h;cB.width=cy+"px";cB.height=cA+"px";cB.left=cC.initialPosition.x+"px";cB.top=cC.initialPosition.y+"px"};ak=function(){if(bm){var cB=bm,cC=a4.currItem,cz=cC.fitRatio>1?1:cC.fitRatio,cy=cz*cC.w,cA=cz*cC.h;cB.width=cy+"px";cB.height=cA+"px";cB.left=al.x+"px";cB.top=al.y+"px"}}},S=function(cy){var p="";if(ac.escKey&&cy.keyCode===27){p="close"}else{if(ac.arrowKeys){if(cy.keyCode===37){p="prev"}else{if(cy.keyCode===39){p="next"}}}}if(p){if(!cy.ctrlKey&&!cy.altKey&&!cy.shiftKey&&!cy.metaKey){if(cy.preventDefault){cy.preventDefault()}else{cy.returnValue=false}a4[p]()}}},bh=function(p){if(!p){return}if(ai||cp||Y||br){p.preventDefault();p.stopPropagation()}},aX=function(){a4.setScrollOffset(0,bA.getScrollY())};var aj={},cl=0,bp=function(p){if(aj[p]){if(aj[p].raf){aZ(aj[p].raf)}cl--;delete aj[p]}},x=function(p){if(aj[p]){bp(p)}if(!aj[p]){cl++;aj[p]={}}},a1=function(){for(var p in aj){if(aj.hasOwnProperty(p)){bp(p)}}},az=function(p,cF,cB,cE,cy,cA,cz){var cD=ap(),cG;x(p);var cC=function(){if(aj[p]){cG=ap()-cD;if(cG>=cE){bp(p);cA(cB);if(cz){cz()}return}cA((cB-cF)*cy(cG/cE)+cF);aj[p].raf=a9(cC)}};cC()};var co={shout:ao,listen:a8,viewportSize:b4,options:ac,isMainScrollAnimating:function(){return Y},getZoomLevel:function(){return bJ},getCurrentIndex:function(){return bI},isDragging:function(){return bV},isZooming:function(){return bf},setScrollOffset:function(p,cy){bW.x=p;b5=bW.y=cy;ao("updateScrollOffset",bW)},applyZoomPan:function(cA,cz,p,cy){al.x=cz;al.y=p;bJ=cA;ak(cy)},init:function(){if(G||bU){return}var cy;a4.framework=bA;a4.template=a3;a4.bg=bA.getChildByClass(a3,"pswp__bg");af=a3.className;G=true;bb=bA.detectFeatures();a9=bb.raf;aZ=bb.caf;cb=bb.transform;bj=bb.oldIE;a4.scrollWrap=bA.getChildByClass(a3,"pswp__scroll-wrap");a4.container=bA.getChildByClass(a4.scrollWrap,"pswp__container");l=a4.container.style;a4.itemHolders=at=[{el:a4.container.children[0],wrap:0,index:-1},{el:a4.container.children[1],wrap:0,index:-1},{el:a4.container.children[2],wrap:0,index:-1}];at[0].el.style.display=at[2].el.style.display="none";C();aI={resize:a4.updateSize,orientationchange:function(){clearTimeout(be);be=setTimeout(function(){if(b4.x!==a4.scrollWrap.clientWidth){a4.updateSize()}},500)},scroll:aX,keydown:S,click:bh};var cA=bb.isOldIOSPhone||bb.isOldAndroid||bb.isMobileOpera;if(!bb.animationName||!bb.transform||cA){ac.showAnimationDuration=ac.hideAnimationDuration=0}for(cy=0;cy<aR.length;cy++){a4["init"+aR[cy]]()}if(bv){var cz=a4.ui=new bv(a4,bA);cz.init()}ao("firstUpdate");bI=bI||ac.index||0;if(isNaN(bI)||bI<0||bI>=aS()){bI=0}a4.currItem=bD(bI);if(bb.isOldIOSPhone||bb.isOldAndroid){ae=false}a3.setAttribute("aria-hidden","false");if(ac.modal){if(!ae){a3.style.position="absolute";a3.style.top=bA.getScrollY()+"px"}else{a3.style.position="fixed"}}if(b5===undefined){ao("initialLayout");b5=aC=bA.getScrollY()}var p="pswp--open ";if(ac.mainClass){p+=ac.mainClass+" "}if(ac.showHideOpacity){p+="pswp--animate_opacity "}p+=cj?"pswp--touch":"pswp--notouch";p+=bb.animationName?" pswp--css_animation":"";p+=bb.svg?" pswp--svg":"";bA.addClass(a3,p);a4.updateSize();Z=-1;aW=null;for(cy=0;cy<K;cy++){bT((cy+Z)*bK.x,at[cy].el.style)}if(!bj){bA.bind(a4.scrollWrap,ba,a4)}a8("initialZoomInEnd",function(){a4.setContent(at[0],bI-1);a4.setContent(at[2],bI+1);at[0].el.style.display=at[2].el.style.display="block";if(ac.focus){a3.focus()}b2()});a4.setContent(at[1],bI);a4.updateCurrItem();ao("afterInit");if(!ae){F=setInterval(function(){if(!cl&&!bV&&!bf&&(bJ===a4.currItem.initialZoomLevel)){a4.updateSize()}},1000)}bA.addClass(a3,"pswp--visible")},close:function(){if(!G){return}G=false;bU=true;ao("close");aq();aL(a4.currItem,null,true,a4.destroy)},destroy:function(){ao("destroy");if(ca){clearTimeout(ca)}a3.setAttribute("aria-hidden","true");a3.className=af;if(F){clearInterval(F)}bA.unbind(a4.scrollWrap,ba,a4);bA.unbind(window,"scroll",a4);ck();a1();ci=null},panTo:function(p,cz,cy){if(!cy){if(p>cn.min.x){p=cn.min.x}else{if(p<cn.max.x){p=cn.max.x}}if(cz>cn.min.y){cz=cn.min.y}else{if(cz<cn.max.y){cz=cn.max.y}}}al.x=p;al.y=cz;ak()},handleEvent:function(p){p=p||window.event;if(aI[p.type]){aI[p.type](p)}},goTo:function(p){p=bB(p);var cy=p-bI;aW=cy;bI=p;a4.currItem=bD(bI);bq-=cy;ad(bK.x*bq);a1();Y=false;a4.updateCurrItem()},next:function(){a4.goTo(bI+1)},prev:function(){a4.goTo(bI-1)},updateCurrZoomItem:function(p){if(p){ao("beforeChange",0)}if(at[1].el.children.length){var cy=at[1].el.children[0];if(bA.hasClass(cy,"pswp__zoom-wrap")){bm=cy.style}else{bm=null}}else{bm=null}cn=a4.currItem.bounds;bO=bJ=a4.currItem.initialZoomLevel;al.x=cn.center.x;al.y=cn.center.y;if(p){ao("afterChange")}},invalidateCurrItems:function(){a5=true;for(var p=0;p<K;p++){if(at[p].item){at[p].item.needsUpdate=true}}},updateCurrItem:function(cy){if(aW===0){return}var cB=Math.abs(aW),cA;if(cy&&cB<2){return}a4.currItem=bD(bI);h=false;ao("beforeChange",aW);if(cB>=K){Z+=aW+(aW>0?-K:K);cB=K}for(var cz=0;cz<cB;cz++){if(aW>0){cA=at.shift();at[K-1]=cA;Z++;bT((Z+2)*bK.x,cA.el.style);a4.setContent(cA,bI-cB+cz+1+1)}else{cA=at.pop();at.unshift(cA);Z--;bT(Z*bK.x,cA.el.style);a4.setContent(cA,bI+cB-cz-1-1)}}if(bm&&Math.abs(aW)===1){var p=bD(q);if(p.initialZoomLevel!==bJ){P(p,b4);bz(p);cu(p)}}aW=0;a4.updateCurrZoomItem();q=bI;ao("afterChange")},updateSize:function(cC){if(!ae&&ac.modal){var cz=bA.getScrollY();if(b5!==cz){a3.style.top=cz+"px";b5=cz}if(!cC&&T.x===window.innerWidth&&T.y===window.innerHeight){return}T.x=window.innerWidth;T.y=window.innerHeight;a3.style.height=T.y+"px"}b4.x=a4.scrollWrap.clientWidth;b4.y=a4.scrollWrap.clientHeight;aX();bK.x=b4.x+Math.round(b4.x*ac.spacing);bK.y=b4.y;ad(bK.x*bq);ao("beforeResize");if(Z!==undefined){var cy,cB,cA;for(var p=0;p<K;p++){cy=at[p];bT((p+Z)*bK.x,cy.el.style);cA=bI+p-1;if(ac.loop&&aS()>2){cA=bB(cA)}cB=bD(cA);if(cB&&(a5||cB.needsUpdate||!cB.bounds)){a4.cleanSlide(cB);a4.setContent(cy,cA);if(p===1){a4.currItem=cB;a4.updateCurrZoomItem(true)}cB.needsUpdate=false}else{if(cy.index===-1&&cA>=0){a4.setContent(cy,cA)}}if(cB&&cB.container){P(cB,b4);bz(cB);cu(cB)}}a5=false}bO=bJ=a4.currItem.initialZoomLevel;cn=a4.currItem.bounds;if(cn){al.x=cn.center.x;al.y=cn.center.y;ak(true)}ao("resize")},zoomTo:function(cF,cC,cz,p,cB){if(cC){bO=bJ;ar.x=Math.abs(cC.x)-al.x;ar.y=Math.abs(cC.y)-al.y;a7(cv,al)}var cA=aJ(cF,false),cD={};ce("x",cA,cD,cF);ce("y",cA,cD,cF);var cG=bJ;var cE={x:al.x,y:al.y};E(cD);var cy=function(cH){if(cH===1){bJ=cF;al.x=cD.x;al.y=cD.y}else{bJ=(cF-cG)*cH+cG;al.x=(cD.x-cE.x)*cH+cE.x;al.y=(cD.y-cE.y)*cH+cE.y}if(cB){cB(cH)}ak(cH===1)};if(cz){az("customZoomTo",0,1,cz,p||bA.easing.sine.inOut,cy)}else{cy(1)}}};var aF=30,W=10;var c,aB,bE={},bX={},m={},bd={},cf={},bc=[],cq={},aA,z=[],bY={},t,br,ag,ch=0,j=bN(),am=0,bV,bu,cp,ai,bP,L,av,bf,M,O,cn,aH=bN(),bm,Y,ar=bN(),i=bN(),bk,au,aQ,aE,b,V=function(cy,p){return cy.x===p.x&&cy.y===p.y},bQ=function(cy,p){return Math.abs(cy.x-p.x)<D&&Math.abs(cy.y-p.y)<D},aO=function(cy,p){bY.x=Math.abs(cy.x-p.x);bY.y=Math.abs(cy.y-p.y);return Math.sqrt(bY.x*bY.x+bY.y*bY.y)},ck=function(){if(bP){aZ(bP);bP=null}},cs=function(){if(bV){bP=a9(cs);b9()}},cx=function(){return !(ac.scaleMode==="fit"&&bJ===a4.currItem.initialZoomLevel)},a6=function(cy,p){if(!cy||cy===document){return false}if(cy.getAttribute("class")&&cy.getAttribute("class").indexOf("pswp__scroll-wrap")>-1){return false}if(p(cy)){return cy}return a6(cy.parentNode,p)},e={},bg=function(cy,p){e.prevent=!a6(cy.target,ac.isClickableElement);ao("preventDragEvent",cy,p,e);return e.prevent},bR=function(cz,cy){cy.x=cz.pageX;cy.y=cz.pageY;cy.id=cz.identifier;return cy},o=function(cz,cy,p){p.x=(cz.x+cy.x)*0.5;p.y=(cz.y+cy.y)*0.5},bC=function(cy,p,cA){if(cy-aB>50){var cz=z.length>2?z.shift():{};cz.x=p;cz.y=cA;z.push(cz);aB=cy}},n=function(){var p=al.y-a4.currItem.initialPosition.y;return 1-Math.abs(p/(b4.y/2))},cd={},cc={},bS=[],aw,aV=function(p){while(bS.length>0){bS.pop()}if(!ah){if(p.type.indexOf("touch")>-1){if(p.touches&&p.touches.length>0){bS[0]=bR(p.touches[0],cd);if(p.touches.length>1){bS[1]=bR(p.touches[1],cc)}}}else{cd.x=p.pageX;cd.y=p.pageY;cd.id="";bS[0]=cd}}else{aw=0;bc.forEach(function(cy){if(aw===0){bS[0]=cy}else{if(aw===1){bS[1]=cy}}aw++})}return bS},g=function(cy,cH){var cA,cE=0,cF=al[cy]+cH[cy],cC,cz=cH[cy]>0,cG=aH.x+cH.x,cB=aH.x-cq.x,p,cD;if(cF>cn.min[cy]||cF<cn.max[cy]){cA=ac.panEndFriction}else{cA=1}cF=al[cy]+cH[cy]*cA;if(ac.allowPanToNext||bJ===a4.currItem.initialZoomLevel){if(!bm){cD=cG}else{if(bk==="h"&&cy==="x"&&!cp){if(cz){if(cF>cn.min[cy]){cA=ac.panEndFriction;cE=cn.min[cy]-cF;cC=cn.min[cy]-cv[cy]}if((cC<=0||cB<0)&&aS()>1){cD=cG;if(cB<0&&cG>cq.x){cD=cq.x}}else{if(cn.min.x!==cn.max.x){p=cF}}}else{if(cF<cn.max[cy]){cA=ac.panEndFriction;cE=cF-cn.max[cy];cC=cv[cy]-cn.max[cy]}if((cC<=0||cB>0)&&aS()>1){cD=cG;if(cB>0&&cG<cq.x){cD=cq.x}}else{if(cn.min.x!==cn.max.x){p=cF}}}}}if(cy==="x"){if(cD!==undefined){ad(cD,true);if(cD===cq.x){L=false}else{L=true}}if(cn.min.x!==cn.max.x){if(p!==undefined){al.x=p}else{if(!L){al.x+=cH.x*cA}}}return cD!==undefined}}if(!Y){if(!L){if(bJ>a4.currItem.fitRatio){al[cy]+=cH[cy]*cA}}}},b0=function(cA){if(cA.type==="mousedown"&&cA.button>0){return}if(bx){cA.preventDefault();return}if(ag&&cA.type==="mousedown"){return}if(bg(cA,true)){cA.preventDefault()}ao("pointerDown");if(ah){var cy=bA.arraySearch(bc,cA.pointerId,"id");if(cy<0){cy=bc.length}bc[cy]={x:cA.pageX,y:cA.pageY,id:cA.pointerId}}var p=aV(cA),cz=p.length;av=null;a1();if(!bV||cz===1){bV=au=true;bA.bind(window,bH,a4);t=b=aQ=br=L=ai=bu=cp=false;bk=null;ao("firstTouchStart",p);a7(cv,al);U.x=U.y=0;a7(bd,p[0]);a7(cf,bd);cq.x=bK.x*bq;z=[{x:bd.x,y:bd.y}];aB=c=ap();aJ(bJ,true);ck();cs()}if(!bf&&cz>1&&!Y&&!L){bO=bJ;cp=false;bf=bu=true;U.y=U.x=0;a7(cv,al);a7(bE,p[0]);a7(bX,p[1]);o(bE,bX,i);ar.x=Math.abs(i.x)-al.x;ar.y=Math.abs(i.y)-al.y;M=O=aO(bE,bX)}},aM=function(cC){cC.preventDefault();if(ah){var cy=bA.arraySearch(bc,cC.pointerId,"id");if(cy>-1){var cB=bc[cy];cB.x=cC.pageX;cB.y=cC.pageY}}if(bV){var cz=aV(cC);if(!bk&&!ai&&!bf){if(aH.x!==bK.x*bq){bk="h"}else{var cA=Math.abs(cz[0].x-bd.x)-Math.abs(cz[0].y-bd.y);if(Math.abs(cA)>=W){bk=cA>0?"h":"v";av=cz}}}else{av=cz}}},b9=function(){if(!av){return}var cF=av.length;if(cF===0){return}a7(bE,av[0]);m.x=bE.x-bd.x;m.y=bE.y-bd.y;if(bf&&cF>1){bd.x=bE.x;bd.y=bE.y;if(!m.x&&!m.y&&V(av[1],bX)){return}a7(bX,av[1]);if(!cp){cp=true;ao("zoomGestureStarted")}var cA=aO(bE,bX);var cC=H(cA);if(cC>a4.currItem.initialZoomLevel+a4.currItem.initialZoomLevel/15){b=true}var cE=1,cG=b1(),cy=Q();if(cC<cG){if(ac.pinchToClose&&!b&&bO<=a4.currItem.initialZoomLevel){var p=cG-cC;var cD=1-p/(cG/1.2);d(cD);ao("onPinchClose",cD);aQ=true}else{cE=(cG-cC)/cG;if(cE>1){cE=1}cC=cG-cE*(cG/3)}}else{if(cC>cy){cE=(cC-cy)/(cG*6);if(cE>1){cE=1}cC=cy+cE*cG}}if(cE<0){cE=0}M=cA;o(bE,bX,j);U.x+=j.x-i.x;U.y+=j.y-i.y;a7(i,j);al.x=aN("x",cC);al.y=aN("y",cC);t=cC>bJ;bJ=cC;ak()}else{if(!bk){return}if(au){au=false;if(Math.abs(m.x)>=W){m.x-=av[0].x-cf.x}if(Math.abs(m.y)>=W){m.y-=av[0].y-cf.y}}bd.x=bE.x;bd.y=bE.y;if(m.x===0&&m.y===0){return}if(bk==="v"&&ac.closeOnVerticalDrag){if(!cx()){U.y+=m.y;al.y+=m.y;var cB=n();br=true;ao("onVerticalDrag",cB);d(cB);ak();return}}bC(ap(),bE.x,bE.y);ai=true;cn=a4.currItem.bounds;var cz=g("x",m);if(!cz){g("y",m);E(al);ak()}}},I=function(cF){if(bb.isOldAndroid){if(ag&&cF.type==="mouseup"){return}if(cF.type.indexOf("touch")>-1){clearTimeout(ag);ag=setTimeout(function(){ag=0},600)}}ao("pointerUp");if(bg(cF,false)){cF.preventDefault()}var cz;if(ah){var cA=bA.arraySearch(bc,cF.pointerId,"id");if(cA>-1){cz=bc.splice(cA,1)[0];if(navigator.msPointerEnabled){var cE={4:"mouse",2:"touch",3:"pen"};cz.type=cE[cF.pointerType];if(!cz.type){cz.type=cF.pointerType||"mouse"}}else{cz.type=cF.pointerType||"mouse"}}}var cy=aV(cF),p,cG=cy.length;if(cF.type==="mouseup"){cG=0}if(cG===2){av=null;return true}if(cG===1){a7(cf,cy[0])}if(cG===0&&!bk&&!Y){if(!cz){if(cF.type==="mouseup"){cz={x:cF.pageX,y:cF.pageY,type:"mouse"}}else{if(cF.changedTouches&&cF.changedTouches[0]){cz={x:cF.changedTouches[0].pageX,y:cF.changedTouches[0].pageY,type:"touch"}}}}ao("touchRelease",cF,cz)}var cI=-1;if(cG===0){bV=false;bA.unbind(window,bH,a4);ck();if(bf){cI=0}else{if(am!==-1){cI=ap()-am}}}am=cG===1?ap():-1;if(cI!==-1&&cI<150){p="zoom"}else{p="swipe"}if(bf&&cG<2){bf=false;if(cG===1){p="zoomPointerUp"}ao("zoomGestureEnded")}av=null;if(!ai&&!cp&&!Y&&!br){return}a1();if(!aA){aA=b8()}aA.calculateSwipeSpeed("x");if(br){var cB=n();if(cB<ac.verticalDragRange){a4.close()}else{var cC=al.y,cH=aE;az("verticalDrag",0,1,300,bA.easing.cubic.out,function(cJ){al.y=(a4.currItem.initialPosition.y-cC)*cJ+cC;d((1-cH)*cJ+cH);ak()});ao("onVerticalDrag",1)}return}if((L||Y)&&cG===0){var cD=ab(p,aA);if(cD){return}p="zoomPointerUp"}if(Y){return}if(p!=="swipe"){A();return}if(!L&&bJ>a4.currItem.fitRatio){aY(aA)}},b8=function(){var cz,cy;var p={lastFlickOffset:{},lastFlickDist:{},lastFlickSpeed:{},slowDownRatio:{},slowDownRatioReverse:{},speedDecelerationRatio:{},speedDecelerationRatioAbs:{},distanceOffset:{},backAnimDestination:{},backAnimStarted:{},calculateSwipeSpeed:function(cA){if(z.length>1){cz=ap()-aB+50;cy=z[z.length-2][cA]}else{cz=ap()-c;cy=cf[cA]}p.lastFlickOffset[cA]=bd[cA]-cy;p.lastFlickDist[cA]=Math.abs(p.lastFlickOffset[cA]);if(p.lastFlickDist[cA]>20){p.lastFlickSpeed[cA]=p.lastFlickOffset[cA]/cz}else{p.lastFlickSpeed[cA]=0}if(Math.abs(p.lastFlickSpeed[cA])<0.1){p.lastFlickSpeed[cA]=0}p.slowDownRatio[cA]=0.95;p.slowDownRatioReverse[cA]=1-p.slowDownRatio[cA];p.speedDecelerationRatio[cA]=1},calculateOverBoundsAnimOffset:function(cA,cB){if(!p.backAnimStarted[cA]){if(al[cA]>cn.min[cA]){p.backAnimDestination[cA]=cn.min[cA]}else{if(al[cA]<cn.max[cA]){p.backAnimDestination[cA]=cn.max[cA]}}if(p.backAnimDestination[cA]!==undefined){p.slowDownRatio[cA]=0.7;p.slowDownRatioReverse[cA]=1-p.slowDownRatio[cA];if(p.speedDecelerationRatioAbs[cA]<0.05){p.lastFlickSpeed[cA]=0;p.backAnimStarted[cA]=true;az("bounceZoomPan"+cA,al[cA],p.backAnimDestination[cA],cB||300,bA.easing.sine.out,function(cC){al[cA]=cC;ak()})}}}},calculateAnimOffset:function(cA){if(!p.backAnimStarted[cA]){p.speedDecelerationRatio[cA]=p.speedDecelerationRatio[cA]*(p.slowDownRatio[cA]+p.slowDownRatioReverse[cA]-p.slowDownRatioReverse[cA]*p.timeDiff/10);p.speedDecelerationRatioAbs[cA]=Math.abs(p.lastFlickSpeed[cA]*p.speedDecelerationRatio[cA]);p.distanceOffset[cA]=p.lastFlickSpeed[cA]*p.speedDecelerationRatio[cA]*p.timeDiff;al[cA]+=p.distanceOffset[cA]}},panAnimLoop:function(){if(aj.zoomPan){aj.zoomPan.raf=a9(p.panAnimLoop);p.now=ap();p.timeDiff=p.now-p.lastNow;p.lastNow=p.now;p.calculateAnimOffset("x");p.calculateAnimOffset("y");ak();p.calculateOverBoundsAnimOffset("x");p.calculateOverBoundsAnimOffset("y");if(p.speedDecelerationRatioAbs.x<0.05&&p.speedDecelerationRatioAbs.y<0.05){al.x=Math.round(al.x);al.y=Math.round(al.y);ak();bp("zoomPan");return}}}};return p},aY=function(p){p.calculateSwipeSpeed("y");cn=a4.currItem.bounds;p.backAnimDestination={};p.backAnimStarted={};if(Math.abs(p.lastFlickSpeed.x)<=0.05&&Math.abs(p.lastFlickSpeed.y)<=0.05){p.speedDecelerationRatioAbs.x=p.speedDecelerationRatioAbs.y=0;p.calculateOverBoundsAnimOffset("x");p.calculateOverBoundsAnimOffset("y");return true}x("zoomPan");p.lastNow=ap();p.panAnimLoop()},ab=function(p,cz){var cA;if(!Y){ch=bI}var cy;if(p==="swipe"){var cE=bd.x-cf.x,cD=cz.lastFlickDist.x<10;if(cE>aF&&(cD||cz.lastFlickOffset.x>20)){cy=-1}else{if(cE<-aF&&(cD||cz.lastFlickOffset.x<-20)){cy=1}}}var cC;if(cy){bI+=cy;if(bI<0){bI=ac.loop?aS()-1:0;cC=true}else{if(bI>=aS()){bI=ac.loop?0:aS()-1;cC=true}}if(!cC||ac.loop){aW+=cy;bq-=cy;cA=true}}var cF=bK.x*bq;var cB=Math.abs(cF-aH.x);var cG;if(!cA&&cF>aH.x!==cz.lastFlickSpeed.x>0){cG=333}else{cG=Math.abs(cz.lastFlickSpeed.x)>0?cB/Math.abs(cz.lastFlickSpeed.x):333;cG=Math.min(cG,400);cG=Math.max(cG,250)}if(ch===bI){cA=false}Y=true;ao("mainScrollAnimStart");az("mainScroll",aH.x,cF,cG,bA.easing.cubic.out,ad,function(){a1();Y=false;ch=-1;if(cA||ch!==bI){a4.updateCurrItem()}ao("mainScrollAnimComplete")});if(cA){a4.updateCurrItem(true)}return cA},H=function(p){return 1/O*p*bO},A=function(){var cz=bJ,cC=b1(),p=Q();if(bJ<cC){cz=cC}else{if(bJ>p){cz=p}}var cB=1,cy,cA=aE;if(aQ&&!t&&!b&&bJ<cC){a4.close();return true}if(aQ){cy=function(cD){d((cB-cA)*cD+cA)}}a4.zoomTo(cz,0,200,bA.easing.cubic.out,cy);return true};aK("Gestures",{publicMethods:{initGestures:function(){var p=function(cz,cC,cA,cy,cB){B=cz+cC;bo=cz+cA;J=cz+cy;if(cB){R=cz+cB}else{R=""}};ah=bb.pointerEvent;if(ah&&bb.touch){bb.touch=false}if(ah){if(navigator.msPointerEnabled){p("MSPointer","Down","Move","Up","Cancel")}else{p("pointer","down","move","up","cancel")}}else{if(bb.touch){p("touch","start","move","end","cancel");cj=true}else{p("mouse","down","move","up")}}bH=bo+" "+J+" "+R;ba=B;if(ah&&!cj){cj=(navigator.maxTouchPoints>1)||(navigator.msMaxTouchPoints>1)}a4.likelyTouchDevice=cj;aI[B]=b0;aI[bo]=aM;aI[J]=I;if(R){aI[R]=aI[J]}if(bb.touch){ba+=" mousedown";bH+=" mousemove mouseup";aI.mousedown=aI[B];aI.mousemove=aI[bo];aI.mouseup=aI[J]}if(!cj){ac.allowPanToNext=false}}}});var ca,aL=function(cC,cz,cB,cy){if(ca){clearTimeout(ca)}bx=true;bL=true;var cA;if(cC.initialLayout){cA=cC.initialLayout;cC.initialLayout=null}else{cA=ac.getThumbBoundsFn&&ac.getThumbBoundsFn(bI)}var cE=cB?ac.hideAnimationDuration:ac.showAnimationDuration;var cD=function(){bp("initialZoom");if(!cB){d(1);if(cz){cz.style.display="block"}bA.addClass(a3,"pswp--animated-in");ao("initialZoom"+(cB?"OutEnd":"InEnd"))}else{a4.template.removeAttribute("style");a4.bg.removeAttribute("style")}if(cy){cy()}bx=false};if(!cE||!cA||cA.x===undefined){ao("initialZoom"+(cB?"Out":"In"));bJ=cC.initialZoomLevel;a7(al,cC.initialPosition);ak();a3.style.opacity=cB?0:1;d(1);if(cE){setTimeout(function(){cD()},cE)}else{cD()}return}var p=function(){var cG=bG,cF=!a4.currItem.src||a4.currItem.loadError||ac.showHideOpacity;if(cC.miniImg){cC.miniImg.style.webkitBackfaceVisibility="hidden"}if(!cB){bJ=cA.w/cC.w;al.x=cA.x;al.y=cA.y-aC;a4[cF?"template":"bg"].style.opacity=0.001;ak()}x("initialZoom");if(cB&&!cG){bA.removeClass(a3,"pswp--animated-in")}if(cF){if(cB){bA[(cG?"remove":"add")+"Class"](a3,"pswp--animate_opacity")}else{setTimeout(function(){bA.addClass(a3,"pswp--animate_opacity")},30)}}ca=setTimeout(function(){ao("initialZoom"+(cB?"Out":"In"));if(!cB){bJ=cC.initialZoomLevel;a7(al,cC.initialPosition);ak();d(1);if(cF){a3.style.opacity=1}else{d(1)}ca=setTimeout(cD,cE+20)}else{var cI=cA.w/cC.w,cK={x:al.x,y:al.y},cL=bJ,cJ=aE,cH=function(cM){if(cM===1){bJ=cI;al.x=cA.x;al.y=cA.y-b5}else{bJ=(cI-cL)*cM+cL;al.x=(cA.x-cK.x)*cM+cK.x;al.y=(cA.y-b5-cK.y)*cM+cK.y}ak();if(cF){a3.style.opacity=1-cM}else{d(cJ-cM*cJ)}};if(cG){az("initialZoom",0,1,cE,bA.easing.cubic.out,cH,cD)}else{cH(1);ca=setTimeout(cD,cE+20)}}},cB?25:90)};p()};var aU,aT={},w=[],bL,bx,b7={index:0,errorMsg:'<div class="pswp__error-msg"><a href="%url%" target="_blank">The image</a> could not be loaded.</div>',forceProgressiveLoading:false,preload:[1,1],getNumItemsFn:function(){return aU.length}};var bD,aS,y,bl=function(){return{center:{x:0,y:0},max:{x:0,y:0},min:{x:0,y:0}}},a0=function(cA,p,cz){var cy=cA.bounds;cy.center.x=Math.round((aT.x-p)/2);cy.center.y=Math.round((aT.y-cz)/2)+cA.vGap.top;cy.max.x=(p>aT.x)?Math.round(aT.x-p):cy.center.x;cy.max.y=(cz>aT.y)?Math.round(aT.y-cz)+cA.vGap.top:cy.center.y;cy.min.x=(p>aT.x)?0:cy.center.x;cy.min.y=(cz>aT.y)?cA.vGap.top:cy.center.y},P=function(cA,p,cD){if(cA.src&&!cA.loadError){var cB=!cD;if(cB){if(!cA.vGap){cA.vGap={top:0,bottom:0}}ao("parseVerticalMargin",cA)}aT.x=p.x;aT.y=p.y-cA.vGap.top-cA.vGap.bottom;if(cB){var cC=aT.x/cA.w;var cz=aT.y/cA.h;cA.fitRatio=cC<cz?cC:cz;var cy=ac.scaleMode;if(cy==="orig"){cD=1}else{if(cy==="fit"){cD=cA.fitRatio}}if(cD>1){cD=1}cA.initialZoomLevel=cD;if(!cA.bounds){cA.bounds=bl()}}if(!cD){return}a0(cA,cA.w*cD,cA.h*cD);if(cB&&cD===cA.initialZoomLevel){cA.initialPosition=cA.bounds.center}return cA.bounds}else{cA.w=cA.h=0;cA.initialZoomLevel=cA.fitRatio=1;cA.bounds=bl();cA.initialPosition=cA.bounds.center;return cA.bounds}},bi=function(cz,cB,cy,p,cC,cA){if(cB.loadError){return}if(p){cB.imageAppended=true;bz(cB,p,(cB===a4.currItem&&h));cy.appendChild(p);if(cA){setTimeout(function(){if(cB&&cB.loaded&&cB.placeholder){cB.placeholder.style.display="none";cB.placeholder=null}},500)}}},aP=function(cy){cy.loading=true;cy.loaded=false;var p=cy.img=bA.createEl("pswp__img","img");var cz=function(){cy.loading=false;cy.loaded=true;if(cy.loadComplete){cy.loadComplete(cy)}else{cy.img=null}p.onload=p.onerror=null;p=null};p.onload=cz;p.onerror=function(){cy.loadError=true;cz()};p.src=cy.src;return p},bt=function(p,cy){if(p.src&&p.loadError&&p.container){if(cy){p.container.innerHTML=""}p.container.innerHTML=ac.errorMsg.replace("%url%",p.src);return true}},bz=function(cB,cy,cA){if(!cB.src){return}if(!cy){cy=cB.container.lastChild}var p=cA?cB.w:Math.round(cB.w*cB.fitRatio),cz=cA?cB.h:Math.round(cB.h*cB.fitRatio);if(cB.placeholder&&!cB.loaded){cB.placeholder.style.width=p+"px";cB.placeholder.style.height=cz+"px"}cy.style.width=p+"px";cy.style.height=cz+"px"},u=function(){if(w.length){var p;for(var cy=0;cy<w.length;cy++){p=w[cy];if(p.holder.index===p.index){bi(p.index,p.item,p.baseDiv,p.img,false,p.clearPlaceholder)}}w=[]}};aK("Controller",{publicMethods:{lazyLoadItem:function(p){p=bB(p);var cy=bD(p);if(!cy||((cy.loaded||cy.loading)&&!a5)){return}ao("gettingData",p,cy);if(!cy.src){return}aP(cy)},initController:function(){bA.extend(ac,b7,true);a4.items=aU=cr;bD=a4.getItemAt;aS=ac.getNumItemsFn;y=ac.loop;if(aS()<3){ac.loop=false}a8("beforeChange",function(cD){var cC=ac.preload,cz=cD===null?true:(cD>=0),cA=Math.min(cC[0],aS()),cB=Math.min(cC[1],aS()),cy;for(cy=1;cy<=(cz?cB:cA);cy++){a4.lazyLoadItem(bI+cy)}for(cy=1;cy<=(cz?cA:cB);cy++){a4.lazyLoadItem(bI-cy)}});a8("initialLayout",function(){a4.currItem.initialLayout=ac.getThumbBoundsFn&&ac.getThumbBoundsFn(bI)});a8("mainScrollAnimComplete",u);a8("initialZoomInEnd",u);a8("destroy",function(){var cy;for(var p=0;p<aU.length;p++){cy=aU[p];if(cy.container){cy.container=null}if(cy.placeholder){cy.placeholder=null}if(cy.img){cy.img=null}if(cy.preloader){cy.preloader=null}if(cy.loadError){cy.loaded=cy.loadError=false}}w=null})},getItemAt:function(p){if(p>=0){return aU[p]!==undefined?aU[p]:false}return false},allowProgressiveImg:function(){return ac.forceProgressiveLoading||!cj||ac.mouseUsed||screen.width>1200},setContent:function(cC,cB){if(ac.loop){cB=bB(cB)}var cy=a4.getItemAt(cC.index);if(cy){cy.container=null}var cD=a4.getItemAt(cB),cA;if(!cD){cC.el.innerHTML="";return}ao("gettingData",cB,cD);cC.index=cB;cC.item=cD;var cz=cD.container=bA.createEl("pswp__zoom-wrap");if(!cD.src&&cD.html){if(cD.html.tagName){cz.appendChild(cD.html)}else{cz.innerHTML=cD.html}}bt(cD);P(cD,b4);if(cD.src&&!cD.loadError&&!cD.loaded){cD.loadComplete=function(cF){if(!G){return}if(cC&&cC.index===cB){if(bt(cF,true)){cF.loadComplete=cF.img=null;P(cF,b4);cu(cF);if(cC.index===bI){a4.updateCurrZoomItem()}return}if(!cF.imageAppended){if(bb.transform&&(Y||bx)){w.push({item:cF,baseDiv:cz,img:cF.img,index:cB,holder:cC,clearPlaceholder:true})}else{bi(cB,cF,cz,cF.img,Y||bx,true)}}else{if(!bx&&cF.placeholder){cF.placeholder.style.display="none";cF.placeholder=null}}}cF.loadComplete=null;cF.img=null;ao("imageLoadComplete",cB,cF)};if(bA.features.transform){var p="pswp__img pswp__img--placeholder";p+=(cD.msrc?"":" pswp__img--placeholder--blank");var cE=bA.createEl(p,cD.msrc?"img":"");if(cD.msrc){cE.src=cD.msrc}bz(cD,cE);cz.appendChild(cE);cD.placeholder=cE}if(!cD.loading){aP(cD)}if(a4.allowProgressiveImg()){if(!bL&&bb.transform){w.push({item:cD,baseDiv:cz,img:cD.img,index:cB,holder:cC})}else{bi(cB,cD,cz,cD.img,true,true)}}}else{if(cD.src&&!cD.loadError){cA=bA.createEl("pswp__img","img");cA.style.opacity=1;cA.src=cD.src;bz(cD,cA);bi(cB,cD,cz,cA,true)}}if(!bL&&cB===bI){bm=cz.style;aL(cD,(cA||cD.img))}else{cu(cD)}cC.el.innerHTML="";cC.el.appendChild(cz)},cleanSlide:function(p){if(p.img){p.img.onload=p.img.onerror=null}p.loaded=p.loading=p.img=p.imageAppended=false}}});var by,X={},v=function(cy,cB,p){var cA=document.createEvent("CustomEvent"),cz={origEvent:cy,target:cy.target,releasePoint:cB,pointerType:p||"touch"};cA.initCustomEvent("pswpTap",true,true,cz);cy.target.dispatchEvent(cA)};aK("Tap",{publicMethods:{initTap:function(){a8("firstTouchStart",a4.onTapStart);a8("touchRelease",a4.onTapRelease);a8("destroy",function(){X={};by=null})},onTapStart:function(p){if(p.length>1){clearTimeout(by);by=null}},onTapRelease:function(cy,cz){if(!cz){return}if(!ai&&!bu&&!cl){var cA=cz;if(by){clearTimeout(by);by=null;if(bQ(cA,X)){ao("doubleTap",cA);return}}if(cz.type==="mouse"){v(cy,cz,"mouse");return}var p=cy.target.tagName.toUpperCase();if(p==="BUTTON"||bA.hasClass(cy.target,"pswp__single-tap")){v(cy,cz);return}a7(X,cA);by=setTimeout(function(){v(cy,cz);by=null},300)}}}});var f;aK("DesktopZoom",{publicMethods:{initDesktopZoom:function(){if(bj){return}if(cj){a8("mouseUsed",function(){a4.setupDesktopZoom()})}else{a4.setupDesktopZoom(true)}},setupDesktopZoom:function(cz){f={};var p="wheel mousewheel DOMMouseScroll";a8("bindEvents",function(){bA.bind(a3,p,a4.handleMouseWheel)});a8("unbindEvents",function(){if(f){bA.unbind(a3,p,a4.handleMouseWheel)}});a4.mouseZoomedIn=false;var cB,cA=function(){if(a4.mouseZoomedIn){bA.removeClass(a3,"pswp--zoomed-in");a4.mouseZoomedIn=false}if(bJ<1){bA.addClass(a3,"pswp--zoom-allowed")}else{bA.removeClass(a3,"pswp--zoom-allowed")}cy()},cy=function(){if(cB){bA.removeClass(a3,"pswp--dragging");cB=false}};a8("resize",cA);a8("afterChange",cA);a8("pointerDown",function(){if(a4.mouseZoomedIn){cB=true;bA.addClass(a3,"pswp--dragging")}});a8("pointerUp",cy);if(!cz){cA()}},handleMouseWheel:function(p){if(bJ<=a4.currItem.fitRatio){if(ac.modal){if(!ac.closeOnScroll||cl||bV){p.preventDefault()}else{if(cb&&Math.abs(p.deltaY)>2){bG=true;a4.close()}}}return true}p.stopPropagation();f.x=0;if("deltaX" in p){if(p.deltaMode===1){f.x=p.deltaX*18;f.y=p.deltaY*18}else{f.x=p.deltaX;f.y=p.deltaY}}else{if("wheelDelta" in p){if(p.wheelDeltaX){f.x=-0.16*p.wheelDeltaX}if(p.wheelDeltaY){f.y=-0.16*p.wheelDeltaY}else{f.y=-0.16*p.wheelDelta}}else{if("detail" in p){f.y=p.detail}else{return}}}aJ(bJ,true);var cz=al.x-f.x,cy=al.y-f.y;if(ac.modal||(cz<=cn.min.x&&cz>=cn.max.x&&cy<=cn.min.y&&cy>=cn.max.y)){p.preventDefault()}a4.panTo(cz,cy)},toggleDesktopZoom:function(cz){cz=cz||{x:b4.x/2+bW.x,y:b4.y/2+bW.y};var cy=ac.getDoubleTapZoom(true,a4.currItem);var p=bJ===cy;a4.mouseZoomedIn=!p;a4.zoomTo(p?a4.currItem.initialZoomLevel:cy,cz,333);bA[(!p?"add":"remove")+"Class"](a3,"pswp--zoomed-in")}}});var a2={history:true,galleryUID:1};var b3,bF,bZ,aa,cw,an,bs,bM,b6,ay,bn,k,N=function(){return bn.hash.substring(1)},ct=function(){if(b3){clearTimeout(b3)}if(bZ){clearTimeout(bZ)}},cm=function(){var cA=N(),cC={};if(cA.length<5){return cC}var cy,cz=cA.split("&");for(cy=0;cy<cz.length;cy++){if(!cz[cy]){continue}var cB=cz[cy].split("=");if(cB.length<2){continue}cC[cB[0]]=cB[1]}if(ac.galleryPIDs){var p=cC.pid;cC.pid=0;for(cy=0;cy<aU.length;cy++){if(aU[cy].pid===p){cC.pid=cy;break}}}else{cC.pid=parseInt(cC.pid,10)-1}if(cC.pid<0){cC.pid=0}return cC},aG=function(){if(bZ){clearTimeout(bZ)}if(cl||bV){bZ=setTimeout(aG,500);return}if(aa){clearTimeout(bF)}else{aa=true}var p=(bI+1);var cz=bD(bI);if(cz.hasOwnProperty("pid")){p=cz.pid}var cy=bs+"&gid="+ac.galleryUID+"&pid="+p;if(!bM){if(bn.hash.indexOf(cy)===-1){ay=true}}var cA=bn.href.split("#")[0]+"#"+cy;if(k){if("#"+cy!==window.location.hash){history[bM?"replaceState":"pushState"]("",document.title,cA)}}else{if(bM){bn.replace(cA)}else{bn.hash=cy}}bM=true;bF=setTimeout(function(){aa=false},60)};aK("History",{publicMethods:{initHistory:function(){bA.extend(ac,a2,true);if(!ac.history){return}bn=window.location;ay=false;b6=false;bM=false;bs=N();k=("pushState" in history);if(bs.indexOf("gid=")>-1){bs=bs.split("&gid=")[0];bs=bs.split("?gid=")[0]}a8("afterChange",a4.updateURL);a8("unbindEvents",function(){bA.unbind(window,"hashchange",a4.onHashChange)});var p=function(){an=true;if(!b6){if(ay){history.back()}else{if(bs){bn.hash=bs}else{if(k){history.pushState("",document.title,bn.pathname+bn.search)}else{bn.hash=""}}}}ct()};a8("unbindEvents",function(){if(bG){p()}});a8("destroy",function(){if(!an){p()}});a8("firstUpdate",function(){bI=cm().pid});var cy=bs.indexOf("pid=");if(cy>-1){bs=bs.substring(0,cy);if(bs.slice(-1)==="&"){bs=bs.slice(0,-1)}}setTimeout(function(){if(G){bA.bind(window,"hashchange",a4.onHashChange)}},40)},onHashChange:function(){if(N()===bs){b6=true;a4.close();return}if(!aa){cw=true;a4.goTo(cm().pid);cw=false}},updateURL:function(){ct();if(cw){return}if(!bM){aG()}else{b3=setTimeout(aG,800)}}}});bA.extend(a4,co)};return a});