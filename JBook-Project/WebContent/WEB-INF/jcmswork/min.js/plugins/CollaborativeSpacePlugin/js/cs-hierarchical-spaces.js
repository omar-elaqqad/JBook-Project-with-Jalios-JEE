(function(f,c,a,h){const e=function(i){let $toggleSubspaces=f(".cs-node-toggle-childs");if(!$toggleSubspaces.exists()||$toggleSubspaces.attr("data-toggle-subspaces-initialized")){return}f.console.debug("cs-hierarchical-spaces.js","initShowSubspaces",$toggleSubspaces);$toggleSubspaces.on("click keydown",function(j){if(!g(j)){return}let $elt=f(j.target);if(!$elt.exists()){return}let paramName=$elt.data("jalios-cs-tree-param-name");let paramValue=$elt.data("jalios-cs-tree-param-value");j.preventDefault();j.stopPropagation();let jsonParams={};if(paramName&&paramValue){jsonParams[paramName]=paramValue}$elt.closest(".ajax-refresh-div").refresh({nohistory:true,noscroll:true,params:jsonParams})});$toggleSubspaces.attr("data-toggle-subspaces-initialized",true)};const g=function(i){if(!i){return false}if(i.type==="click"){return true}else{if(i.type==="keydown"){let code=i.charCode||i.keyCode;if(code===32||code===13){return true}}}return false};const d=function(i){if(!i||!i.refresh||i.refresh.type!=="after"){return}e()};const b=function(){f(a).on("jalios:refresh",d)};f(a).ready(function(i){e();b()})}(jQuery,window,document));