/*!
 * Cropper v2.3.4
 * https://github.com/fengyuanchen/cropper
 *
 * Copyright (c) 2014-2016 Fengyuan Chen and contributors
 * Released under the MIT license
 *
 * Date: 2016-09-03T05:50:45.412Z
 */
(function(a){if(typeof define==="function"&&define.amd){define(["jquery"],a)}else{if(typeof exports==="object"){a(require("jquery"))}else{a(jQuery)}}})(function(al){var K=al(window);var x=al(document);var ar=window.location;var aD=window.navigator;var an=window.ArrayBuffer;var E=window.Uint8Array;var l=window.DataView;var I=window.btoa;var f="cropper";var v="cropper-modal";var ai="cropper-hide";var V="cropper-hidden";var ab="cropper-invisible";var aj="cropper-move";var T="cropper-crop";var O="cropper-disabled";var C="cropper-bg";var y="mousedown touchstart pointerdown MSPointerDown";var ag="mousemove touchmove pointermove MSPointerMove";var Z="mouseup touchend touchcancel pointerup pointercancel MSPointerUp MSPointerCancel";var b="wheel mousewheel DOMMouseScroll";var q="dblclick";var ao="load."+f;var X="error."+f;var Q="resize."+f;var d="build."+f;var a="built."+f;var j="cropstart."+f;var az="cropmove."+f;var ak="cropend."+f;var n="crop."+f;var aw="zoom."+f;var ax=/^(e|w|s|n|se|sw|ne|nw|all|crop|move|zoom)$/;var h=/^data:/;var N=/^data:([^;]+);base64,/;var S=/^data:image\/jpeg.*;base64,/;var aB="preview";var g="action";var W="e";var aq="w";var e="s";var i="n";var A="se";var ac="sw";var w="ne";var Y="nw";var o="all";var aa="crop";var av="move";var H="zoom";var t="none";var p=al.isFunction(al("<canvas>")[0].getContext);var ae=aD&&/(Macintosh|iPhone|iPod|iPad).*AppleWebKit/i.test(aD.userAgent);var aA=Number;var au=Math.min;var k=Math.max;var L=Math.abs;var ah=Math.sin;var r=Math.cos;var B=Math.sqrt;var D=Math.round;var R=Math.floor;var c=String.fromCharCode;function J(aE){return typeof aE==="number"&&!isNaN(aE)}function M(aE){return typeof aE==="undefined"}function G(aF,aG){var aE=[];if(J(aG)){aE.push(aG)}return aE.slice.apply(aF,aE)}function s(aG,aF){var aE=G(arguments,2);return function(){return aG.apply(aF,aE.concat(G(arguments)))}}function U(aE){var aF=aE.match(/^(https?:)\/\/([^\:\/\?#]+):?(\d*)/i);return aF&&(aF[1]!==ar.protocol||aF[2]!==ar.hostname||aF[3]!==ar.port)}function z(aE){var aF="timestamp="+(new Date()).getTime();return(aE+(aE.indexOf("?")===-1?"?":"&")+aF)}function aC(aE){return aE?' crossOrigin="'+aE+'"':""}function m(aE,aG){var aF;if(aE.naturalWidth&&!ae){return aG(aE.naturalWidth,aE.naturalHeight)}aF=document.createElement("img");aF.onload=function(){aG(this.width,this.height)};aF.src=aE.src}function ad(aH){var aI=[];var aG=aH.rotate;var aF=aH.scaleX;var aE=aH.scaleY;if(J(aG)&&aG!==0){aI.push("rotate("+aG+"deg)")}if(J(aF)&&aF!==1){aI.push("scaleX("+aF+")")}if(J(aE)&&aE!==1){aI.push("scaleY("+aE+")")}return aI.length?aI.join(" "):"none"}function ay(aK,aI){var aF=L(aK.degree)%180;var aH=(aF>90?(180-aF):aF)*Math.PI/180;var aL=ah(aH);var aN=r(aH);var aG=aK.width;var aO=aK.height;var aM=aK.aspectRatio;var aJ;var aE;if(!aI){aJ=aG*aN+aO*aL;aE=aG*aL+aO*aN}else{aJ=aG/(aN+aL/aM);aE=aJ/aM}return{width:aJ,height:aE}}function am(aO,aV){var aJ=al("<canvas>")[0];var aH=aJ.getContext("2d");var aG=0;var aF=0;var aI=aV.naturalWidth;var aN=aV.naturalHeight;var aP=aV.rotate;var aS=aV.scaleX;var aR=aV.scaleY;var aM=J(aS)&&J(aR)&&(aS!==1||aR!==1);var aT=J(aP)&&aP!==0;var aL=aT||aM;var aQ=aI*L(aS||1);var aE=aN*L(aR||1);var aW;var aU;var aK;if(aM){aW=aQ/2;aU=aE/2}if(aT){aK=ay({width:aQ,height:aE,degree:aP});aQ=aK.width;aE=aK.height;aW=aQ/2;aU=aE/2}aJ.width=aQ;aJ.height=aE;if(aL){aG=-aI/2;aF=-aN/2;aH.save();aH.translate(aW,aU)}if(aT){aH.rotate(aP*Math.PI/180)}if(aM){aH.scale(aS,aR)}aH.drawImage(aO,R(aG),R(aF),R(aI),R(aN));if(aL){aH.restore()}return aJ}function af(aH){var aG=aH.length;var aF=0;var aE=0;if(aG){al.each(aH,function(aI,aJ){aF+=aJ.pageX;aE+=aJ.pageY});aF/=aG;aE/=aG}return{pageX:aF,pageY:aE}}function P(aH,aI,aF){var aG="";var aE;for(aE=aI,aF+=aI;aE<aF;aE++){aG+=c(aH.getUint8(aE))}return aG}function F(aL){var aO=new l(aL);var aH=aO.byteLength;var aG;var aP;var aN;var aE;var aF;var aM;var aK;var aQ;var aI;var aJ;if(aO.getUint8(0)===255&&aO.getUint8(1)===216){aI=2;while(aI<aH){if(aO.getUint8(aI)===255&&aO.getUint8(aI+1)===225){aK=aI;break}aI++}}if(aK){aP=aK+4;aN=aK+10;if(P(aO,aP,4)==="Exif"){aM=aO.getUint16(aN);aF=aM===18761;if(aF||aM===19789){if(aO.getUint16(aN+2,aF)===42){aE=aO.getUint32(aN+4,aF);if(aE>=8){aQ=aN+aE}}}}}if(aQ){aH=aO.getUint16(aQ,aF);for(aJ=0;aJ<aH;aJ++){aI=aQ+aJ*12+2;if(aO.getUint16(aI,aF)===274){aI+=8;aG=aO.getUint16(aI,aF);if(ae){aO.setUint16(aI,1,aF)}break}}}return aG}function at(aJ){var aE=aJ.replace(N,"");var aK=atob(aE);var aH=aK.length;var aG=new an(aH);var aI=new E(aG);var aF;for(aF=0;aF<aH;aF++){aI[aF]=aK.charCodeAt(aF)}return aG}function ap(aG){var aI=new E(aG);var aH=aI.length;var aE="";var aF;for(aF=0;aF<aH;aF++){aE+=c(aI[aF])}return"data:image/jpeg;base64,"+I(aE)}function u(aF,aE){this.$element=al(aF);this.options=al.extend({},u.DEFAULTS,al.isPlainObject(aE)&&aE);this.isLoaded=false;this.isBuilt=false;this.isCompleted=false;this.isRotated=false;this.isCropped=false;this.isDisabled=false;this.isReplaced=false;this.isLimited=false;this.wheeling=false;this.isImg=false;this.originalUrl="";this.canvas=null;this.cropBox=null;this.init()}u.prototype={constructor:u,init:function(){var aF=this.$element;var aE;if(aF.is("img")){this.isImg=true;this.originalUrl=aE=aF.attr("src");if(!aE){return}aE=aF.prop("src")}else{if(aF.is("canvas")&&p){aE=aF[0].toDataURL()}}this.load(aE)},trigger:function(aE,aF){var aG=al.Event(aE,aF);this.$element.trigger(aG);return aG},load:function(aF){var aE=this.options;var aH=this.$element;var aG;var aI;if(!aF){return}aH.one(d,aE.build);if(this.trigger(d).isDefaultPrevented()){return}this.url=aF;this.image={};if(!aE.checkOrientation||!an){return this.clone()}aG=al.proxy(this.read,this);if(h.test(aF)){return S.test(aF)?aG(at(aF)):this.clone()}aI=new XMLHttpRequest();aI.onerror=aI.onabort=al.proxy(function(){this.clone()},this);aI.onload=function(){aG(this.response)};if(aE.checkCrossOrigin&&U(aF)&&aH.prop("crossOrigin")){aF=z(aF)}aI.open("get",aF);aI.responseType="arraybuffer";aI.send()},read:function(aJ){var aI=this.options;var aF=F(aJ);var aK=this.image;var aH=0;var aG=1;var aE=1;if(aF>1){this.url=ap(aJ);switch(aF){case 2:aG=-1;break;case 3:aH=-180;break;case 4:aE=-1;break;case 5:aH=90;aE=-1;break;case 6:aH=90;break;case 7:aH=90;aG=-1;break;case 8:aH=-90;break}}if(aI.rotatable){aK.rotate=aH}if(aI.scalable){aK.scaleX=aG;aK.scaleY=aE}this.clone()},clone:function(){var aG=this.options;var aJ=this.$element;var aF=this.url;var aE="";var aH;var aI;if(aG.checkCrossOrigin&&U(aF)){aE=aJ.prop("crossOrigin");if(aE){aH=aF}else{aE="anonymous";aH=z(aF)}}this.crossOrigin=aE;this.crossOriginUrl=aH;this.$clone=aI=al("<img"+aC(aE)+' src="'+(aH||aF)+'">');if(this.isImg){if(aJ[0].complete){this.start()}else{aJ.one(ao,al.proxy(this.start,this))}}else{aI.one(ao,al.proxy(this.start,this)).one(X,al.proxy(this.stop,this)).addClass(ai).insertAfter(aJ)}},start:function(){var aE=this.$element;var aF=this.$clone;if(!this.isImg){aF.off(X,this.stop);aE=aF}m(aE[0],al.proxy(function(aG,aH){al.extend(this.image,{naturalWidth:aG,naturalHeight:aH,aspectRatio:aG/aH});this.isLoaded=true;this.build()},this))},stop:function(){this.$clone.remove();this.$clone=null},build:function(){var aH=this.options;var aJ=this.$element;var aI=this.$clone;var aF;var aE;var aG;if(!this.isLoaded){return}if(this.isBuilt){this.unbuild()}this.$container=aJ.parent();this.$cropper=aF=al(u.TEMPLATE);this.$canvas=aF.find(".cropper-canvas").append(aI);this.$dragBox=aF.find(".cropper-drag-box");this.$cropBox=aE=aF.find(".cropper-crop-box");this.$viewBox=aF.find(".cropper-view-box");this.$face=aG=aE.find(".cropper-face");aJ.addClass(V).after(aF);if(!this.isImg){aI.removeClass(ai)}this.initPreview();this.bind();aH.aspectRatio=k(0,aH.aspectRatio)||NaN;aH.viewMode=k(0,au(3,D(aH.viewMode)))||0;if(aH.autoCrop){this.isCropped=true;if(aH.modal){this.$dragBox.addClass(v)}}else{aE.addClass(V)}if(!aH.guides){aE.find(".cropper-dashed").addClass(V)}if(!aH.center){aE.find(".cropper-center").addClass(V)}if(aH.cropBoxMovable){aG.addClass(aj).data(g,o)}if(!aH.highlight){aG.addClass(ab)}if(aH.background){aF.addClass(C)}if(!aH.cropBoxResizable){aE.find(".cropper-line, .cropper-point").addClass(V)}this.setDragMode(aH.dragMode);this.render();this.isBuilt=true;this.setData(aH.data);aJ.one(a,aH.built);this.completing=setTimeout(al.proxy(function(){this.trigger(a);this.trigger(n,this.getData());this.isCompleted=true},this),0)},unbuild:function(){if(!this.isBuilt){return}if(!this.isCompleted){clearTimeout(this.completing)}this.isBuilt=false;this.isCompleted=false;this.initialImage=null;this.initialCanvas=null;this.initialCropBox=null;this.container=null;this.canvas=null;this.cropBox=null;this.unbind();this.resetPreview();this.$preview=null;this.$viewBox=null;this.$cropBox=null;this.$dragBox=null;this.$canvas=null;this.$container=null;this.$cropper.remove();this.$cropper=null},render:function(){this.initContainer();this.initCanvas();this.initCropBox();this.renderCanvas();if(this.isCropped){this.renderCropBox()}},initContainer:function(){var aF=this.options;var aG=this.$element;var aH=this.$container;var aE=this.$cropper;aE.addClass(V);aG.removeClass(V);aE.css((this.container={width:k(aH.width(),aA(aF.minContainerWidth)||200),height:k(aH.height(),aA(aF.minContainerHeight)||100)}));aG.addClass(V);aE.removeClass(V)},initCanvas:function(){var aI=this.options.viewMode;var aF=this.container;var aN=aF.width;var aR=aF.height;var aJ=this.image;var aP=aJ.naturalWidth;var aM=aJ.naturalHeight;var aE=L(aJ.rotate)===90;var aL=aE?aM:aP;var aO=aE?aP:aM;var aQ=aL/aO;var aH=aN;var aK=aR;var aG;if(aR*aQ>aN){if(aI===3){aH=aR*aQ}else{aK=aN/aQ}}else{if(aI===3){aK=aN/aQ}else{aH=aR*aQ}}aG={naturalWidth:aL,naturalHeight:aO,aspectRatio:aQ,width:aH,height:aK};aG.oldLeft=aG.left=(aN-aH)/2;aG.oldTop=aG.top=(aR-aK)/2;this.canvas=aG;this.isLimited=(aI===1||aI===2);this.limitCanvas(true,true);this.initialImage=al.extend({},aJ);this.initialCanvas=al.extend({},aG)},limitCanvas:function(aN,aK){var aS=this.options;var aI=aS.viewMode;var aE=this.container;var aO=aE.width;var aR=aE.height;var aH=this.canvas;var aP=aH.aspectRatio;var aJ=this.cropBox;var aG=this.isCropped&&aJ;var aQ;var aL;var aF;var aM;if(aN){aQ=aA(aS.minCanvasWidth)||0;aL=aA(aS.minCanvasHeight)||0;if(aI){if(aI>1){aQ=k(aQ,aO);aL=k(aL,aR);if(aI===3){if(aL*aP>aQ){aQ=aL*aP}else{aL=aQ/aP}}}else{if(aQ){aQ=k(aQ,aG?aJ.width:0)}else{if(aL){aL=k(aL,aG?aJ.height:0)}else{if(aG){aQ=aJ.width;aL=aJ.height;if(aL*aP>aQ){aQ=aL*aP}else{aL=aQ/aP}}}}}}if(aQ&&aL){if(aL*aP>aQ){aL=aQ/aP}else{aQ=aL*aP}}else{if(aQ){aL=aQ/aP}else{if(aL){aQ=aL*aP}}}aH.minWidth=aQ;aH.minHeight=aL;aH.maxWidth=Infinity;aH.maxHeight=Infinity}if(aK){if(aI){aF=aO-aH.width;aM=aR-aH.height;aH.minLeft=au(0,aF);aH.minTop=au(0,aM);aH.maxLeft=k(0,aF);aH.maxTop=k(0,aM);if(aG&&this.isLimited){aH.minLeft=au(aJ.left,aJ.left+aJ.width-aH.width);aH.minTop=au(aJ.top,aJ.top+aJ.height-aH.height);aH.maxLeft=aJ.left;aH.maxTop=aJ.top;if(aI===2){if(aH.width>=aO){aH.minLeft=au(0,aF);aH.maxLeft=k(0,aF)}if(aH.height>=aR){aH.minTop=au(0,aM);aH.maxTop=k(0,aM)}}}}else{aH.minLeft=-aH.width;aH.minTop=-aH.height;aH.maxLeft=aO;aH.maxTop=aR}}},renderCanvas:function(aF){var aI=this.canvas;var aL=this.image;var aH=aL.rotate;var aG=aL.naturalWidth;var aK=aL.naturalHeight;var aJ;var aE;if(this.isRotated){this.isRotated=false;aE=ay({width:aL.width,height:aL.height,degree:aH});aJ=aE.width/aE.height;if(aJ!==aI.aspectRatio){aI.left-=(aE.width-aI.width)/2;aI.top-=(aE.height-aI.height)/2;aI.width=aE.width;aI.height=aE.height;aI.aspectRatio=aJ;aI.naturalWidth=aG;aI.naturalHeight=aK;if(aH%180){aE=ay({width:aG,height:aK,degree:aH});aI.naturalWidth=aE.width;aI.naturalHeight=aE.height}this.limitCanvas(true,false)}}if(aI.width>aI.maxWidth||aI.width<aI.minWidth){aI.left=aI.oldLeft}if(aI.height>aI.maxHeight||aI.height<aI.minHeight){aI.top=aI.oldTop}aI.width=au(k(aI.width,aI.minWidth),aI.maxWidth);aI.height=au(k(aI.height,aI.minHeight),aI.maxHeight);this.limitCanvas(false,true);aI.oldLeft=aI.left=au(k(aI.left,aI.minLeft),aI.maxLeft);aI.oldTop=aI.top=au(k(aI.top,aI.minTop),aI.maxTop);this.$canvas.css({width:aI.width,height:aI.height,left:aI.left,top:aI.top});this.renderImage();if(this.isCropped&&this.isLimited){this.limitCropBox(true,true)}if(aF){this.output()}},renderImage:function(aE){var aF=this.canvas;var aG=this.image;var aH;if(aG.rotate){aH=ay({width:aF.width,height:aF.height,degree:aG.rotate,aspectRatio:aG.aspectRatio},true)}al.extend(aG,aH?{width:aH.width,height:aH.height,left:(aF.width-aH.width)/2,top:(aF.height-aH.height)/2}:{width:aF.width,height:aF.height,left:0,top:0});this.$clone.css({width:aG.width,height:aG.height,marginLeft:aG.left,marginTop:aG.top,transform:ad(aG)});if(aE){this.output()}},initCropBox:function(){var aF=this.options;var aE=this.canvas;var aH=aF.aspectRatio;var aI=aA(aF.autoCropArea)||0.8;var aG={width:aE.width,height:aE.height};if(aH){if(aE.height*aH>aE.width){aG.height=aG.width/aH}else{aG.width=aG.height*aH}}this.cropBox=aG;this.limitCropBox(true,true);aG.width=au(k(aG.width,aG.minWidth),aG.maxWidth);aG.height=au(k(aG.height,aG.minHeight),aG.maxHeight);aG.width=k(aG.minWidth,aG.width*aI);aG.height=k(aG.minHeight,aG.height*aI);aG.oldLeft=aG.left=aE.left+(aE.width-aG.width)/2;aG.oldTop=aG.top=aE.top+(aE.height-aG.height)/2;this.initialCropBox=al.extend({},aG)},limitCropBox:function(aL,aI){var aR=this.options;var aO=aR.aspectRatio;var aF=this.container;var aM=aF.width;var aQ=aF.height;var aG=this.canvas;var aH=this.cropBox;var aP=this.isLimited;var aE;var aJ;var aK;var aN;if(aL){aE=aA(aR.minCropBoxWidth)||0;aJ=aA(aR.minCropBoxHeight)||0;aE=au(aE,aM);aJ=au(aJ,aQ);aK=au(aM,aP?aG.width:aM);aN=au(aQ,aP?aG.height:aQ);if(aO){if(aE&&aJ){if(aJ*aO>aE){aJ=aE/aO}else{aE=aJ*aO}}else{if(aE){aJ=aE/aO}else{if(aJ){aE=aJ*aO}}}if(aN*aO>aK){aN=aK/aO}else{aK=aN*aO}}aH.minWidth=au(aE,aK);aH.minHeight=au(aJ,aN);aH.maxWidth=aK;aH.maxHeight=aN}if(aI){if(aP){aH.minLeft=k(0,aG.left);aH.minTop=k(0,aG.top);aH.maxLeft=au(aM,aG.left+aG.width)-aH.width;aH.maxTop=au(aQ,aG.top+aG.height)-aH.height}else{aH.minLeft=0;aH.minTop=0;aH.maxLeft=aM-aH.width;aH.maxTop=aQ-aH.height}}},renderCropBox:function(){var aF=this.options;var aE=this.container;var aI=aE.width;var aH=aE.height;var aG=this.cropBox;if(aG.width>aG.maxWidth||aG.width<aG.minWidth){aG.left=aG.oldLeft}if(aG.height>aG.maxHeight||aG.height<aG.minHeight){aG.top=aG.oldTop}aG.width=au(k(aG.width,aG.minWidth),aG.maxWidth);aG.height=au(k(aG.height,aG.minHeight),aG.maxHeight);this.limitCropBox(false,true);aG.oldLeft=aG.left=au(k(aG.left,aG.minLeft),aG.maxLeft);aG.oldTop=aG.top=au(k(aG.top,aG.minTop),aG.maxTop);if(aF.movable&&aF.cropBoxMovable){this.$face.data(g,(aG.width===aI&&aG.height===aH)?av:o)}this.$cropBox.css({width:aG.width,height:aG.height,left:aG.left,top:aG.top});if(this.isCropped&&this.isLimited){this.limitCanvas(true,true)}if(!this.isDisabled){this.output()}},output:function(){this.preview();if(this.isCompleted){this.trigger(n,this.getData())}},initPreview:function(){var aE=aC(this.crossOrigin);var aF=aE?this.crossOriginUrl:this.url;var aG;this.$preview=al(this.options.preview);this.$clone2=aG=al("<img"+aE+' src="'+aF+'">');this.$viewBox.html(aG);this.$preview.each(function(){var aH=al(this);aH.data(aB,{width:aH.width(),height:aH.height(),html:aH.html()});aH.html("<img"+aE+' src="'+aF+'" style="display:block;width:100%;height:auto;min-width:0!important;min-height:0!important;max-width:none!important;max-height:none!important;image-orientation:0deg!important;">')})},resetPreview:function(){this.$preview.each(function(){var aF=al(this);var aE=aF.data(aB);aF.css({width:aE.width,height:aE.height}).html(aE.html).removeData(aB)})},preview:function(){var aI=this.image;var aG=this.canvas;var aJ=this.cropBox;var aE=aJ.width;var aK=aJ.height;var aF=aI.width;var aM=aI.height;var aH=aJ.left-aG.left-aI.left;var aL=aJ.top-aG.top-aI.top;if(!this.isCropped||this.isDisabled){return}this.$clone2.css({width:aF,height:aM,marginLeft:-aH,marginTop:-aL,transform:ad(aI)});this.$preview.each(function(){var aS=al(this);var aR=aS.data(aB);var aT=aR.width;var aQ=aR.height;var aP=aT;var aN=aQ;var aO=1;if(aE){aO=aT/aE;aN=aK*aO}if(aK&&aN>aQ){aO=aQ/aK;aP=aE*aO;aN=aQ}aS.css({width:aP,height:aN}).find("img").css({width:aF*aO,height:aM*aO,marginLeft:-aH*aO,marginTop:-aL*aO,transform:ad(aI)})})},bind:function(){var aF=this.options;var aG=this.$element;var aE=this.$cropper;if(al.isFunction(aF.cropstart)){aG.on(j,aF.cropstart)}if(al.isFunction(aF.cropmove)){aG.on(az,aF.cropmove)}if(al.isFunction(aF.cropend)){aG.on(ak,aF.cropend)}if(al.isFunction(aF.crop)){aG.on(n,aF.crop)}if(al.isFunction(aF.zoom)){aG.on(aw,aF.zoom)}aE.on(y,al.proxy(this.cropStart,this));if(aF.zoomable&&aF.zoomOnWheel){aE.on(b,al.proxy(this.wheel,this))}if(aF.toggleDragModeOnDblclick){aE.on(q,al.proxy(this.dblclick,this))}x.on(ag,(this._cropMove=s(this.cropMove,this))).on(Z,(this._cropEnd=s(this.cropEnd,this)));if(aF.responsive){K.on(Q,(this._resize=s(this.resize,this)))}},unbind:function(){var aF=this.options;var aG=this.$element;var aE=this.$cropper;if(al.isFunction(aF.cropstart)){aG.off(j,aF.cropstart)}if(al.isFunction(aF.cropmove)){aG.off(az,aF.cropmove)}if(al.isFunction(aF.cropend)){aG.off(ak,aF.cropend)}if(al.isFunction(aF.crop)){aG.off(n,aF.crop)}if(al.isFunction(aF.zoom)){aG.off(aw,aF.zoom)}aE.off(y,this.cropStart);if(aF.zoomable&&aF.zoomOnWheel){aE.off(b,this.wheel)}if(aF.toggleDragModeOnDblclick){aE.off(q,this.dblclick)}x.off(ag,this._cropMove).off(Z,this._cropEnd);if(aF.responsive){K.off(Q,this._resize)}},resize:function(){var aH=this.options.restore;var aJ=this.$container;var aE=this.container;var aF;var aI;var aG;if(this.isDisabled||!aE){return}aG=aJ.width()/aE.width;if(aG!==1||aJ.height()!==aE.height){if(aH){aF=this.getCanvasData();aI=this.getCropBoxData()}this.render();if(aH){this.setCanvasData(al.each(aF,function(aK,aL){aF[aK]=aL*aG}));this.setCropBoxData(al.each(aI,function(aK,aL){aI[aK]=aL*aG}))}}},dblclick:function(){if(this.isDisabled){return}if(this.$dragBox.hasClass(T)){this.setDragMode(av)}else{this.setDragMode(aa)}},wheel:function(aF){var aG=aF.originalEvent||aF;var aE=aA(this.options.wheelZoomRatio)||0.1;var aH=1;if(this.isDisabled){return}aF.preventDefault();if(this.wheeling){return}this.wheeling=true;setTimeout(al.proxy(function(){this.wheeling=false},this),50);if(aG.deltaY){aH=aG.deltaY>0?1:-1}else{if(aG.wheelDelta){aH=-aG.wheelDelta/120}else{if(aG.detail){aH=aG.detail>0?1:-1}}}this.zoom(-aH*aE,aF)},cropStart:function(aH){var aG=this.options;var aE=aH.originalEvent;var aK=aE&&aE.touches;var aJ=aH;var aF;var aI;if(this.isDisabled){return}if(aK){aF=aK.length;if(aF>1){if(aG.zoomable&&aG.zoomOnTouch&&aF===2){aJ=aK[1];this.startX2=aJ.pageX;this.startY2=aJ.pageY;aI=H}else{return}}aJ=aK[0]}aI=aI||al(aJ.target).data(g);if(ax.test(aI)){if(this.trigger(j,{originalEvent:aE,action:aI}).isDefaultPrevented()){return}aH.preventDefault();this.action=aI;this.cropping=false;this.startX=aJ.pageX||aE&&aE.pageX;this.startY=aJ.pageY||aE&&aE.pageY;if(aI===aa){this.cropping=true;this.$dragBox.addClass(v)}}},cropMove:function(aH){var aG=this.options;var aE=aH.originalEvent;var aK=aE&&aE.touches;var aJ=aH;var aI=this.action;var aF;if(this.isDisabled){return}if(aK){aF=aK.length;if(aF>1){if(aG.zoomable&&aG.zoomOnTouch&&aF===2){aJ=aK[1];this.endX2=aJ.pageX;this.endY2=aJ.pageY}else{return}}aJ=aK[0]}if(aI){if(this.trigger(az,{originalEvent:aE,action:aI}).isDefaultPrevented()){return}aH.preventDefault();this.endX=aJ.pageX||aE&&aE.pageX;this.endY=aJ.pageY||aE&&aE.pageY;this.change(aJ.shiftKey,aI===H?aH:null)}},cropEnd:function(aF){var aE=aF.originalEvent;var aG=this.action;if(this.isDisabled){return}if(aG){aF.preventDefault();if(this.cropping){this.cropping=false;this.$dragBox.toggleClass(v,this.isCropped&&this.options.modal)}this.action="";this.trigger(ak,{originalEvent:aE,action:aG})}},change:function(aQ,aW){var aH=this.options;var aF=aH.aspectRatio;var aV=this.action;var aM=this.container;var aG=this.canvas;var aE=this.cropBox;var aU=aE.width;var aP=aE.height;var aI=aE.left;var aO=aE.top;var aY=aI+aU;var aK=aO+aP;var aR=0;var aL=0;var aX=aM.width;var aT=aM.height;var aS=true;var aJ;var aN;if(!aF&&aQ){aF=aU&&aP?aU/aP:1}if(this.isLimited){aR=aE.minLeft;aL=aE.minTop;aX=aR+au(aM.width,aG.width,aG.left+aG.width);aT=aL+au(aM.height,aG.height,aG.top+aG.height)}aN={x:this.endX-this.startX,y:this.endY-this.startY};if(aF){aN.X=aN.y*aF;aN.Y=aN.x/aF}switch(aV){case o:aI+=aN.x;aO+=aN.y;break;case W:if(aN.x>=0&&(aY>=aX||aF&&(aO<=aL||aK>=aT))){aS=false;break}aU+=aN.x;if(aF){aP=aU/aF;aO-=aN.Y/2}if(aU<0){aV=aq;aU=0}break;case i:if(aN.y<=0&&(aO<=aL||aF&&(aI<=aR||aY>=aX))){aS=false;break}aP-=aN.y;aO+=aN.y;if(aF){aU=aP*aF;aI+=aN.X/2}if(aP<0){aV=e;aP=0}break;case aq:if(aN.x<=0&&(aI<=aR||aF&&(aO<=aL||aK>=aT))){aS=false;break}aU-=aN.x;aI+=aN.x;if(aF){aP=aU/aF;aO+=aN.Y/2}if(aU<0){aV=W;aU=0}break;case e:if(aN.y>=0&&(aK>=aT||aF&&(aI<=aR||aY>=aX))){aS=false;break}aP+=aN.y;if(aF){aU=aP*aF;aI-=aN.X/2}if(aP<0){aV=i;aP=0}break;case w:if(aF){if(aN.y<=0&&(aO<=aL||aY>=aX)){aS=false;break}aP-=aN.y;aO+=aN.y;aU=aP*aF}else{if(aN.x>=0){if(aY<aX){aU+=aN.x}else{if(aN.y<=0&&aO<=aL){aS=false}}}else{aU+=aN.x}if(aN.y<=0){if(aO>aL){aP-=aN.y;aO+=aN.y}}else{aP-=aN.y;aO+=aN.y}}if(aU<0&&aP<0){aV=ac;aP=0;aU=0}else{if(aU<0){aV=Y;aU=0}else{if(aP<0){aV=A;aP=0}}}break;case Y:if(aF){if(aN.y<=0&&(aO<=aL||aI<=aR)){aS=false;break}aP-=aN.y;aO+=aN.y;aU=aP*aF;aI+=aN.X}else{if(aN.x<=0){if(aI>aR){aU-=aN.x;aI+=aN.x}else{if(aN.y<=0&&aO<=aL){aS=false}}}else{aU-=aN.x;aI+=aN.x}if(aN.y<=0){if(aO>aL){aP-=aN.y;aO+=aN.y}}else{aP-=aN.y;aO+=aN.y}}if(aU<0&&aP<0){aV=A;aP=0;aU=0}else{if(aU<0){aV=w;aU=0}else{if(aP<0){aV=ac;aP=0}}}break;case ac:if(aF){if(aN.x<=0&&(aI<=aR||aK>=aT)){aS=false;break}aU-=aN.x;aI+=aN.x;aP=aU/aF}else{if(aN.x<=0){if(aI>aR){aU-=aN.x;aI+=aN.x}else{if(aN.y>=0&&aK>=aT){aS=false}}}else{aU-=aN.x;aI+=aN.x}if(aN.y>=0){if(aK<aT){aP+=aN.y}}else{aP+=aN.y}}if(aU<0&&aP<0){aV=w;aP=0;aU=0}else{if(aU<0){aV=A;aU=0}else{if(aP<0){aV=Y;aP=0}}}break;case A:if(aF){if(aN.x>=0&&(aY>=aX||aK>=aT)){aS=false;break}aU+=aN.x;aP=aU/aF}else{if(aN.x>=0){if(aY<aX){aU+=aN.x}else{if(aN.y>=0&&aK>=aT){aS=false}}}else{aU+=aN.x}if(aN.y>=0){if(aK<aT){aP+=aN.y}}else{aP+=aN.y}}if(aU<0&&aP<0){aV=Y;aP=0;aU=0}else{if(aU<0){aV=ac;aU=0}else{if(aP<0){aV=w;aP=0}}}break;case av:this.move(aN.x,aN.y);aS=false;break;case H:this.zoom((function(a0,a2,aZ,a1){var a4=B(a0*a0+a2*a2);var a3=B(aZ*aZ+a1*a1);return(a3-a4)/a4})(L(this.startX-this.startX2),L(this.startY-this.startY2),L(this.endX-this.endX2),L(this.endY-this.endY2)),aW);this.startX2=this.endX2;this.startY2=this.endY2;aS=false;break;case aa:if(!aN.x||!aN.y){aS=false;break}aJ=this.$cropper.offset();aI=this.startX-aJ.left;aO=this.startY-aJ.top;aU=aE.minWidth;aP=aE.minHeight;if(aN.x>0){aV=aN.y>0?A:w}else{if(aN.x<0){aI-=aU;aV=aN.y>0?ac:Y}}if(aN.y<0){aO-=aP}if(!this.isCropped){this.$cropBox.removeClass(V);this.isCropped=true;if(this.isLimited){this.limitCropBox(true,true)}}break}if(aS){aE.width=aU;aE.height=aP;aE.left=aI;aE.top=aO;this.action=aV;this.renderCropBox()}this.startX=this.endX;this.startY=this.endY},crop:function(){if(!this.isBuilt||this.isDisabled){return}if(!this.isCropped){this.isCropped=true;this.limitCropBox(true,true);if(this.options.modal){this.$dragBox.addClass(v)}this.$cropBox.removeClass(V)}this.setCropBoxData(this.initialCropBox)},reset:function(){if(!this.isBuilt||this.isDisabled){return}this.image=al.extend({},this.initialImage);this.canvas=al.extend({},this.initialCanvas);this.cropBox=al.extend({},this.initialCropBox);this.renderCanvas();if(this.isCropped){this.renderCropBox()}},clear:function(){if(!this.isCropped||this.isDisabled){return}al.extend(this.cropBox,{left:0,top:0,width:0,height:0});this.isCropped=false;this.renderCropBox();this.limitCanvas(true,true);this.renderCanvas();this.$dragBox.removeClass(v);this.$cropBox.addClass(V)},replace:function(aF,aE){if(!this.isDisabled&&aF){if(this.isImg){this.$element.attr("src",aF)}if(aE){this.url=aF;this.$clone.attr("src",aF);if(this.isBuilt){this.$preview.find("img").add(this.$clone2).attr("src",aF)}}else{if(this.isImg){this.isReplaced=true}this.options.data=null;this.load(aF)}}},enable:function(){if(this.isBuilt){this.isDisabled=false;this.$cropper.removeClass(O)}},disable:function(){if(this.isBuilt){this.isDisabled=true;this.$cropper.addClass(O)}},destroy:function(){var aE=this.$element;if(this.isLoaded){if(this.isImg&&this.isReplaced){aE.attr("src",this.originalUrl)}this.unbuild();aE.removeClass(V)}else{if(this.isImg){aE.off(ao,this.start)}else{if(this.$clone){this.$clone.remove()}}}aE.removeData(f)},move:function(aE,aG){var aF=this.canvas;this.moveTo(M(aE)?aE:aF.left+aA(aE),M(aG)?aG:aF.top+aA(aG))},moveTo:function(aE,aH){var aG=this.canvas;var aF=false;if(M(aH)){aH=aE}aE=aA(aE);aH=aA(aH);if(this.isBuilt&&!this.isDisabled&&this.options.movable){if(J(aE)){aG.left=aE;aF=true}if(J(aH)){aG.top=aH;aF=true}if(aF){this.renderCanvas(true)}}},zoom:function(aG,aE){var aF=this.canvas;aG=aA(aG);if(aG<0){aG=1/(1-aG)}else{aG=1+aG}this.zoomTo(aF.width*aG/aF.naturalWidth,aE)},zoomTo:function(aN,aJ){var aQ=this.options;var aI=this.canvas;var aH=aI.width;var aP=aI.height;var aM=aI.naturalWidth;var aO=aI.naturalHeight;var aG;var aL;var aF;var aK;var aE;aN=aA(aN);if(aN>=0&&this.isBuilt&&!this.isDisabled&&aQ.zoomable){aL=aM*aN;aF=aO*aN;if(aJ){aG=aJ.originalEvent}if(this.trigger(aw,{originalEvent:aG,oldRatio:aH/aM,ratio:aL/aM}).isDefaultPrevented()){return}if(aG){aK=this.$cropper.offset();aE=aG.touches?af(aG.touches):{pageX:aJ.pageX||aG.pageX||0,pageY:aJ.pageY||aG.pageY||0};aI.left-=(aL-aH)*(((aE.pageX-aK.left)-aI.left)/aH);aI.top-=(aF-aP)*(((aE.pageY-aK.top)-aI.top)/aP)}else{aI.left-=(aL-aH)/2;aI.top-=(aF-aP)/2}aI.width=aL;aI.height=aF;this.renderCanvas(true)}},rotate:function(aE){this.rotateTo((this.image.rotate||0)+aA(aE))},rotateTo:function(aE){aE=aA(aE);if(J(aE)&&this.isBuilt&&!this.isDisabled&&this.options.rotatable){this.image.rotate=aE%360;this.isRotated=true;this.renderCanvas(true)}},scale:function(aG,aF){var aH=this.image;var aE=false;if(M(aF)){aF=aG}aG=aA(aG);aF=aA(aF);if(this.isBuilt&&!this.isDisabled&&this.options.scalable){if(J(aG)){aH.scaleX=aG;aE=true}if(J(aF)){aH.scaleY=aF;aE=true}if(aE){this.renderImage(true)}}},scaleX:function(aF){var aE=this.image.scaleY;this.scale(aF,J(aE)?aE:1)},scaleY:function(aE){var aF=this.image.scaleX;this.scale(J(aF)?aF:1,aE)},getData:function(aG){var aF=this.options;var aK=this.image;var aE=this.canvas;var aI=this.cropBox;var aH;var aJ;if(this.isBuilt&&this.isCropped){aJ={x:aI.left-aE.left,y:aI.top-aE.top,width:aI.width,height:aI.height};aH=aK.width/aK.naturalWidth;al.each(aJ,function(aL,aM){aM=aM/aH;aJ[aL]=aG?D(aM):aM})}else{aJ={x:0,y:0,width:0,height:0}}if(aF.rotatable){aJ.rotate=aK.rotate||0}if(aF.scalable){aJ.scaleX=aK.scaleX||1;aJ.scaleY=aK.scaleY||1}return aJ},setData:function(aJ){var aF=this.options;var aK=this.image;var aE=this.canvas;var aI={};var aH;var aL;var aG;if(al.isFunction(aJ)){aJ=aJ.call(this.element)}if(this.isBuilt&&!this.isDisabled&&al.isPlainObject(aJ)){if(aF.rotatable){if(J(aJ.rotate)&&aJ.rotate!==aK.rotate){aK.rotate=aJ.rotate;this.isRotated=aH=true}}if(aF.scalable){if(J(aJ.scaleX)&&aJ.scaleX!==aK.scaleX){aK.scaleX=aJ.scaleX;aL=true}if(J(aJ.scaleY)&&aJ.scaleY!==aK.scaleY){aK.scaleY=aJ.scaleY;aL=true}}if(aH){this.renderCanvas()}else{if(aL){this.renderImage()}}aG=aK.width/aK.naturalWidth;if(J(aJ.x)){aI.left=aJ.x*aG+aE.left}if(J(aJ.y)){aI.top=aJ.y*aG+aE.top}if(J(aJ.width)){aI.width=aJ.width*aG}if(J(aJ.height)){aI.height=aJ.height*aG}this.setCropBoxData(aI)}},getContainerData:function(){return this.isBuilt?this.container:{}},getImageData:function(){return this.isLoaded?this.image:{}},getCanvasData:function(){var aE=this.canvas;var aF={};if(this.isBuilt){al.each(["left","top","width","height","naturalWidth","naturalHeight"],function(aG,aH){aF[aH]=aE[aH]})}return aF},setCanvasData:function(aG){var aE=this.canvas;var aF=aE.aspectRatio;if(al.isFunction(aG)){aG=aG.call(this.$element)}if(this.isBuilt&&!this.isDisabled&&al.isPlainObject(aG)){if(J(aG.left)){aE.left=aG.left}if(J(aG.top)){aE.top=aG.top}if(J(aG.width)){aE.width=aG.width;aE.height=aG.width/aF}else{if(J(aG.height)){aE.height=aG.height;aE.width=aG.height*aF}}this.renderCanvas(true)}},getCropBoxData:function(){var aE=this.cropBox;var aF;if(this.isBuilt&&this.isCropped){aF={left:aE.left,top:aE.top,width:aE.width,height:aE.height}}return aF||{}},setCropBoxData:function(aI){var aG=this.cropBox;var aH=this.options.aspectRatio;var aF;var aE;if(al.isFunction(aI)){aI=aI.call(this.$element)}if(this.isBuilt&&this.isCropped&&!this.isDisabled&&al.isPlainObject(aI)){if(J(aI.left)){aG.left=aI.left}if(J(aI.top)){aG.top=aI.top}if(J(aI.width)){aF=true;aG.width=aI.width}if(J(aI.height)){aE=true;aG.height=aI.height}if(aH){if(aF){aG.height=aG.width/aH}else{if(aE){aG.width=aG.height*aH}}}this.renderCropBox()}},getCroppedCanvas:function(aP){var aF;var aJ;var aH;var aL;var aK;var aM;var aO;var aN;var aG;var aE;var aI;if(!this.isBuilt||!p){return}if(!this.isCropped){return am(this.$clone[0],this.image)}if(!al.isPlainObject(aP)){aP={}}aI=this.getData();aF=aI.width;aJ=aI.height;aN=aF/aJ;if(al.isPlainObject(aP)){aK=aP.width;aM=aP.height;if(aK){aM=aK/aN;aO=aK/aF}else{if(aM){aK=aM*aN;aO=aM/aJ}}}aH=R(aK||aF);aL=R(aM||aJ);aG=al("<canvas>")[0];aG.width=aH;aG.height=aL;aE=aG.getContext("2d");if(aP.fillColor){aE.fillStyle=aP.fillColor;aE.fillRect(0,0,aH,aL)}aE.drawImage.apply(aE,(function(){var aQ=am(this.$clone[0],this.image);var aR=aQ.width;var aT=aQ.height;var aS=this.canvas;var aU=[aQ];var aX=aI.x+aS.naturalWidth*(L(aI.scaleX||1)-1)/2;var aW=aI.y+aS.naturalHeight*(L(aI.scaleY||1)-1)/2;var aV;var a2;var a0;var aZ;var a1;var aY;if(aX<=-aF||aX>aR){aX=aV=a0=a1=0}else{if(aX<=0){a0=-aX;aX=0;aV=a1=au(aR,aF+aX)}else{if(aX<=aR){a0=0;aV=a1=au(aF,aR-aX)}}}if(aV<=0||aW<=-aJ||aW>aT){aW=a2=aZ=aY=0}else{if(aW<=0){aZ=-aW;aW=0;a2=aY=au(aT,aJ+aW)}else{if(aW<=aT){aZ=0;a2=aY=au(aJ,aT-aW)}}}aU.push(R(aX),R(aW),R(aV),R(a2));if(aO){a0*=aO;aZ*=aO;a1*=aO;aY*=aO}if(a1>0&&aY>0){aU.push(R(a0),R(aZ),R(a1),R(aY))}return aU}).call(this));return aG},setAspectRatio:function(aF){var aE=this.options;if(!this.isDisabled&&!M(aF)){aE.aspectRatio=k(0,aF)||NaN;if(this.isBuilt){this.initCropBox();if(this.isCropped){this.renderCropBox()}}}},setDragMode:function(aH){var aE=this.options;var aG;var aF;if(this.isLoaded&&!this.isDisabled){aG=aH===aa;aF=aE.movable&&aH===av;aH=(aG||aF)?aH:t;this.$dragBox.data(g,aH).toggleClass(T,aG).toggleClass(aj,aF);if(!aE.cropBoxMovable){this.$face.data(g,aH).toggleClass(T,aG).toggleClass(aj,aF)}}}};u.DEFAULTS={viewMode:0,dragMode:"crop",aspectRatio:NaN,data:null,preview:"",responsive:true,restore:true,checkCrossOrigin:true,checkOrientation:true,modal:true,guides:true,center:true,highlight:true,background:true,autoCrop:true,autoCropArea:0.8,movable:true,rotatable:true,scalable:true,zoomable:true,zoomOnTouch:true,zoomOnWheel:true,wheelZoomRatio:0.1,cropBoxMovable:true,cropBoxResizable:true,toggleDragModeOnDblclick:true,minCanvasWidth:0,minCanvasHeight:0,minCropBoxWidth:0,minCropBoxHeight:0,minContainerWidth:200,minContainerHeight:100,build:null,built:null,cropstart:null,cropmove:null,cropend:null,crop:null,zoom:null};u.setDefaults=function(aE){al.extend(u.DEFAULTS,aE)};u.TEMPLATE=('<div class="cropper-container"><div class="cropper-wrap-box"><div class="cropper-canvas"></div></div><div class="cropper-drag-box"></div><div class="cropper-crop-box"><span class="cropper-view-box"></span><span class="cropper-dashed dashed-h"></span><span class="cropper-dashed dashed-v"></span><span class="cropper-center"></span><span class="cropper-face"></span><span class="cropper-line line-e" data-action="e"></span><span class="cropper-line line-n" data-action="n"></span><span class="cropper-line line-w" data-action="w"></span><span class="cropper-line line-s" data-action="s"></span><span class="cropper-point point-e" data-action="e"></span><span class="cropper-point point-n" data-action="n"></span><span class="cropper-point point-w" data-action="w"></span><span class="cropper-point point-s" data-action="s"></span><span class="cropper-point point-ne" data-action="ne"></span><span class="cropper-point point-nw" data-action="nw"></span><span class="cropper-point point-sw" data-action="sw"></span><span class="cropper-point point-se" data-action="se"></span></div></div>');u.other=al.fn.cropper;al.fn.cropper=function(aG){var aF=G(arguments,1);var aE;this.each(function(){var aK=al(this);var aJ=aK.data(f);var aH;var aI;if(!aJ){if(/destroy/.test(aG)){return}aH=al.extend({},aK.data(),al.isPlainObject(aG)&&aG);aK.data(f,(aJ=new u(this,aH)))}if(typeof aG==="string"&&al.isFunction(aI=aJ[aG])){aE=aI.apply(aJ,aF)}});return M(aE)?this:aE};al.fn.cropper.Constructor=u;al.fn.cropper.setDefaults=u.setDefaults;al.fn.cropper.noConflict=function(){al.fn.cropper=u.other;return this}});