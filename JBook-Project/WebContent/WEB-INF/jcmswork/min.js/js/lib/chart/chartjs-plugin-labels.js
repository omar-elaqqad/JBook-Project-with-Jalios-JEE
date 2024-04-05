(function(){if(typeof Chart==="undefined"){console.error("Can not find Chart object.");return}if(typeof Object.assign!="function"){Object.assign=function(f,h){if(f==null){throw new TypeError("Cannot convert undefined or null to object")}var g=Object(f);for(var e=1;e<arguments.length;e++){var d=arguments[e];if(d!=null){for(var c in d){if(Object.prototype.hasOwnProperty.call(d,c)){g[c]=d[c]}}}}return g}}var b={};["pie","doughnut","polarArea","bar"].forEach(function(c){b[c]=true});function a(){this.renderToDataset=this.renderToDataset.bind(this)}a.prototype.setup=function(d,c){this.chart=d;this.ctx=d.ctx;this.args={};this.barTotal={};var e=d.config.options;this.options=Object.assign({position:"default",precision:0,fontSize:e.defaultFontSize,fontColor:e.defaultFontColor,fontStyle:e.defaultFontStyle,fontFamily:e.defaultFontFamily,shadowOffsetX:3,shadowOffsetY:3,shadowColor:"rgba(0,0,0,0.3)",shadowBlur:6,images:[],outsidePadding:2,textMargin:2,overlap:true},c);if(d.config.type==="bar"){this.options.position="default";this.options.arc=false;this.options.overlap=true}};a.prototype.render=function(){this.labelBounds=[];this.chart.data.datasets.forEach(this.renderToDataset)};a.prototype.renderToDataset=function(e,d){this.totalPercentage=0;this.total=null;var c=this.args[d];c.meta.data.forEach(function(g,f){this.renderToElement(e,c,g,f)}.bind(this))};a.prototype.renderToElement=function(i,c,g,f){if(!this.shouldRenderToElement(c.meta,g)){return}this.percentage=null;var e=this.getLabel(i,g,f);if(!e){return}var d=this.ctx;d.save();d.font=Chart.helpers.fontString(this.options.fontSize,this.options.fontStyle,this.options.fontFamily);var h=this.getRenderInfo(g,e);if(!this.drawable(g,e,h)){d.restore();return}d.beginPath();d.fillStyle=this.getFontColor(i,g,f);this.renderLabel(e,h);d.restore()};a.prototype.renderLabel=function(c,d){return this.options.arc?this.renderArcLabel(c,d):this.renderBaseLabel(c,d)};a.prototype.renderBaseLabel=function(f,c){var e=this.ctx;if(typeof f==="object"){e.drawImage(f,c.x-f.width/2,c.y-f.height/2,f.width,f.height)}else{e.save();e.textBaseline="top";e.textAlign="center";if(this.options.textShadow){e.shadowOffsetX=this.options.shadowOffsetX;e.shadowOffsetY=this.options.shadowOffsetY;e.shadowColor=this.options.shadowColor;e.shadowBlur=this.options.shadowBlur}var d=f.split("\n");for(var g=0;g<d.length;g++){var h=c.y-this.options.fontSize/2*d.length+this.options.fontSize*g;e.fillText(d[g],c.x,h)}e.restore()}};a.prototype.renderArcLabel=function(p,h){var q=this.ctx,g=h.radius,m=h.view;q.save();q.translate(m.x,m.y);if(typeof p==="string"){q.rotate(h.startAngle);q.textBaseline="middle";q.textAlign="left";var s=p.split("\n"),n=0,c=[],e=0;if(this.options.position==="border"){e=(s.length-1)*this.options.fontSize/2}for(var d=0;d<s.length;++d){var k=q.measureText(s[d]);if(k.width>n){n=k.width}c.push(k.width)}for(var d=0;d<s.length;++d){var r=s[d];var l=(s.length-1-d)*-this.options.fontSize+e;q.save();var o=(n-c[d])/2;q.rotate(o/g);for(var f=0;f<r.length;f++){let txt=r.charAt(f);k=q.measureText(txt);q.save();q.translate(0,-1*g);q.fillText(txt,0,l);q.restore();q.rotate(k.width/g)}q.restore()}}else{q.rotate((m.startAngle+Math.PI/2+h.endAngle)/2);q.translate(0,-1*g);this.renderLabel(p,{x:0,y:0})}q.restore()};a.prototype.shouldRenderToElement=function(d,c){return !d.hidden&&!c.hidden&&(this.options.showZero||this.chart.config.type==="polarArea"?c._view.outerRadius!==0:c._view.circumference!==0)};a.prototype.getLabel=function(f,e,d){var c;if(typeof this.options.render==="function"){c=this.options.render({label:this.chart.config.data.labels[d],value:f.data[d],percentage:this.getPercentage(f,e,d),dataset:f,index:d})}else{switch(this.options.render){case"none":c="";break;case"value":c=f.data[d];break;case"label":c=this.chart.config.data.labels[d];break;case"image":c=this.options.images[d]?this.loadImage(this.options.images[d]):"";break;case"percentage":default:c=this.getPercentage(f,e,d)+"%";break}}if(typeof c==="object"){c=this.loadImage(c)}else{if(c!==null&&c!==undefined){c=c.toString()}}return c};a.prototype.getFontColor=function(f,d,c){var e=this.options.fontColor;if(typeof e==="function"){e=e({label:this.chart.config.data.labels[c],value:f.data[c],percentage:this.getPercentage(f,d,c),backgroundColor:f.backgroundColor[c],dataset:f,index:c})}else{if(typeof e!=="string"){e=e[c]||this.chart.config.options.defaultFontColor}}return e};a.prototype.getPercentage=function(g,f,d){if(this.percentage!==null){return this.percentage}var c;if(this.chart.config.type==="polarArea"){if(this.total===null){this.total=0;for(var e=0;e<g.data.length;++e){this.total+=g.data[e]}}c=g.data[d]/this.total*100}else{if(this.chart.config.type==="bar"){if(this.barTotal[d]===undefined){this.barTotal[d]=0;for(var e=0;e<this.chart.data.datasets.length;++e){this.barTotal[d]+=this.chart.data.datasets[e].data[d]}}c=g.data[d]/this.barTotal[d]*100}else{c=f._view.circumference/this.chart.config.options.circumference*100}}c=parseFloat(c.toFixed(this.options.precision));if(!this.options.showActualPercentages){if(this.chart.config.type==="bar"){this.totalPercentage=this.barTotalPercentage[d]||0}this.totalPercentage+=c;if(this.totalPercentage>100){c-=this.totalPercentage-100;c=parseFloat(c.toFixed(this.options.precision))}if(this.chart.config.type==="bar"){this.barTotalPercentage[d]=this.totalPercentage}}this.percentage=c;return c};a.prototype.getRenderInfo=function(d,c){if(this.chart.config.type==="bar"){return this.getBarRenderInfo(d,c)}else{return this.options.arc?this.getArcRenderInfo(d,c):this.getBaseRenderInfo(d,c)}};a.prototype.getBaseRenderInfo=function(f,e){if(this.options.position==="outside"||this.options.position==="border"){var i,g,c=f._view,d=c.startAngle+(c.endAngle-c.startAngle)/2,h=c.outerRadius/2;if(this.options.position==="border"){g=(c.outerRadius-h)/2+h}else{if(this.options.position==="outside"){g=(c.outerRadius-h)+h+this.options.textMargin}}i={x:c.x+(Math.cos(d)*g),y:c.y+(Math.sin(d)*g)};if(this.options.position==="outside"){var j=this.options.textMargin+this.measureLabel(e).width/2;i.x+=i.x<c.x?-j:j}return i}else{return f.tooltipPosition()}};a.prototype.getArcRenderInfo=function(i,f){var c,d=i._view;if(this.options.position==="outside"){c=d.outerRadius+this.options.fontSize+this.options.textMargin}else{if(this.options.position==="border"){c=(d.outerRadius/2+d.outerRadius)/2}else{c=(d.innerRadius+d.outerRadius)/2}}var h=d.startAngle,e=d.endAngle;var g=e-h;h+=Math.PI/2;e+=Math.PI/2;var j=this.measureLabel(f);h+=(e-(j.width/c+h))/2;return{radius:c,startAngle:h,endAngle:e,totalAngle:g,view:d}};a.prototype.getBarRenderInfo=function(d,c){var e=d.tooltipPosition();e.y-=this.measureLabel(c).height/2+this.options.textMargin;return e};a.prototype.drawable=function(f,d,j){if(this.options.overlap){return true}else{if(this.options.arc){return j.endAngle-j.startAngle<=j.totalAngle}else{var g=this.measureLabel(d),i=j.x-g.width/2,e=j.x+g.width/2,h=j.y-g.height/2,c=j.y+g.height/2;if(this.options.renderInfo==="outside"){return this.outsideInRange(i,e,h,c)}else{return f.inRange(i,h)&&f.inRange(i,c)&&f.inRange(e,h)&&f.inRange(e,c)}}}};a.prototype.outsideInRange=function(d,n,l,c){var h=this.labelBounds;for(var g=0;g<h.length;++g){var e=h[g];var o=[[d,l],[d,c],[n,l],[n,c]];for(var f=0;f<o.length;++f){var m=o[f][0];var k=o[f][1];if(m>=e.left&&m<=e.right&&k>=e.top&&k<=e.bottom){return false}}o=[[e.left,e.top],[e.left,e.bottom],[e.right,e.top],[e.right,e.bottom]];for(var f=0;f<o.length;++f){var m=o[f][0];var k=o[f][1];if(m>=d&&m<=n&&k>=l&&k<=c){return false}}}h.push({left:d,right:n,top:l,bottom:c});return true};a.prototype.measureLabel=function(e){if(typeof e==="object"){return{width:e.width,height:e.height}}else{var g=0;var d=e.split("\n");for(var f=0;f<d.length;++f){var c=this.ctx.measureText(d[f]);if(c.width>g){g=c.width}}return{width:g,height:this.options.fontSize*d.length}}};a.prototype.loadImage=function(d){var c=new Image();c.src=d.src;c.width=d.width;c.height=d.height;return c};Chart.plugins.register({id:"labels",beforeDatasetsUpdate:function(g,d){if(!b[g.config.type]){return}if(!Array.isArray(d)){d=[d]}var j=d.length;if(!g._labels||j!==g._labels.length){g._labels=d.map(function(){return new a()})}var f=false,h=0;for(var e=0;e<j;++e){var c=g._labels[e];c.setup(g,d[e]);if(c.options.position==="outside"){f=true;var k=c.options.fontSize*1.5+c.options.outsidePadding;if(k>h){h=k}}}if(f){g.chartArea.top+=h;g.chartArea.bottom-=h}},afterDatasetUpdate:function(e,d,c){if(!b[e.config.type]){return}e._labels.forEach(function(f){f.args[d.index]=d})},beforeDraw:function(c){if(!b[c.config.type]){return}c._labels.forEach(function(d){d.barTotalPercentage={}})},afterDatasetsDraw:function(c){if(!b[c.config.type]){return}c._labels.forEach(function(d){d.render()})}})})();