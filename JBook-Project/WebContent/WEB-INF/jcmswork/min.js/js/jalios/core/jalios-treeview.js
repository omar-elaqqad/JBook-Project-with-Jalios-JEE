!function(c){var h=function(){c.jalios.ui.TreeView.upgrade();a(c(document));c(document).on("jalios:refresh",function(l){var k=c.jalios.Event.match(l,"refresh","after");if(!k){return}if(!k.target){return}k.target.each(function(){c.jalios.ui.TreeView.upgrade(this)});a(k.target)});c(document).on("jalios:autocomplete",f);c(document).on("click","UL.treeview .icon-treeview",e);c(document).on("click",".js-unselect-radio",function(k){let $radioInput=c(k.currentTarget);if($radioInput.attr("previousValue")=="true"){$radioInput.prop("checked",false)}else{$radioInput.attr("previousValue",false)}$radioInput.closest(".treeview").find(".js-unselect-radio").each(function(l,m){c(m).attr("previousValue",false)});$radioInput.attr("previousValue",$radioInput.is(":checked"))});c(document).on("change",".js-unselect-radio",function(k){let $radioInput=c(k.currentTarget);$radioInput.attr("previousValue",$radioInput.is(":checked"))});c(document).on("mouseover","UL.treeview.dragdrop .treeview-item-icon",d)};var a=function(k){k.find("UL.treeview.autocomplete").each(function(){var o=c(this);if(o.children("LI").exists()){var n="jcore/autocomplete/accategory.jsp?acadd=false";n+=o.hasClass("filter-manage")?"&filter=MANAGE":o.hasClass("filter-use")?"&filter=USE":o.hasClass("filter-read")?"&filter=READ":"";n+=o.hasClass("selectable")?"&selectable=true":"";n+="&rootCids="+o.matchClass(/ID_(\w+)/g).join("&rootCids=");n+="&rm="+o.matchClass(/RM_(\w+)/g).join("&rm=");var m="form-control typeahead treecatcomplete hidden-print"+(o.hasClass("hide")?" hide":"");var p=o.data("jalios-categorytree-search-input-context")&&o.data("jalios-categorytree-search-input-context").placeholder?o.data("jalios-categorytree-search-input-context").placeholder:I18N.glp("info.msg.autocomplete");var l=o.data("jalios-categorytree-search-input-context")&&o.data("jalios-categorytree-search-input-context").ariaLabel?o.data("jalios-categorytree-search-input-context").ariaLabel:I18N.glp("info.msg.autocomplete.search-category");var q=o.attr("id");o.before('<input type="text" class="'+m+'" data-jalios-treecat="'+q+'" aria-label="'+l+'" data-jalios-ajax-refresh-url="'+n+'" placeholder="'+p+'"/>')}else{var m="alert alert-info"+(o.hasClass("hide")?" hide":"");o.before('<div class="'+m+'"><p>'+I18N.glp("treecat.no-item")+"</p></div>")}});c(document).on("keydown",".treecatcomplete",function(l){if(l.which==13&&c(this).val().trim()===""){l.preventDefault();return false}})};var f=function(o){var q=jQuery.jalios.Event.match(o,"autocomplete");var k=q.$element.attr("data-jalios-treecat");if(!k){return}q.$element.val("");var p=q.$menu.find(".active").attr("data-value");var m=q.$element.next("UL.treeview");var n=[];if(m.hasClass("treeview-checkbox")){m.find("INPUT[type=checkbox]:checked").each(function(){n.push(c(this).val())})}if(m.hasClass("treeinput")){n.push(p)}var l={params:{}};l.url=m.attr("data-jalios-ajax-refresh-url");l.params.treeHint=m.attr("data-jalios-treeview-hint");l.target=m;l.scroll=false;var r=m.find("A[data-jalios-id="+p+"].treeview-name");if(r.exists()){if(!r.hasClass("treeview-hl")){l.callback=function(){if(m.hasClass("treeinput")){return}c.jalios.DOM.follow(r)}}}else{l.callback=function(){if(m.hasClass("treeinput")){return}var s=m.find("A[data-jalios-id="+p+"].treeview-name");c.jalios.DOM.follow(s)}}l.params.treeOpened=n.length>0?n:p;l.params.treeChecked=n;l.params.treeHighlighted=n;l.nohistory=true;m.refresh(l)};var d=function(l){var k=c(l.currentTarget);k.closest("UL[data-jalios-ajax-refresh-url].treeview-root.dragdrop").find("LI").each(function(){c(this).droppable({tolerance:"pointer",greedy:true,drop:b,accept:"LI",hoverClass:"sortable-active"})});k.closest("LI").draggable({axis:"y",cursor:"move",revert:"invalid",handle:".treeview-item-icon"})};var b=function(o,p){var k=c(p.helper);var q=c(this);var m={params:{drag:k.getJcmsId(),drop:q.getJcmsId()}};var l=q.closest("UL[data-jalios-ajax-refresh-url].treeview");if(!l.exists()){return}var n=[];l.find("INPUT[type=checkbox]:checked").each(function(){n.push(c(this).val())});m.url=l.attr("data-jalios-ajax-refresh-url");m.params.treeOpened=q.getJcmsId();m.params.treeHighlighted=q.getJcmsId();m.params.treeHint=l.attr("data-jalios-treeview-hint");m.target=l;m.scroll=false;m.params.treeChecked=n;l.refresh(m)};var i=function(m){var k=c(".treeview",m||document);if(m&&c(m).is(".treeview")){k=k.add(m)}var l=new Date().getTime();k.each(function(){c(this).children("LI").each(function(){var o=c(this);if(!o.hasClass("treeview-open")&&!o.hasClass("treeview-close")){var n=o.children("UL.treeview");if(n.exists()){if(n.children("LI").html()){o.addClass("treeview-open")}else{o.addClass("treeview-close")}}}if(!o.hasClass("treecat-msg")&&!o.children(":first-child").is(".icon-treeview")){o.prepend('<span class="icon-treeview"></span> ')}o.children("INPUT").attr("id",function(q,p){if(p){return p}p="treev_"+(l++);c(this).siblings("LABEL").attr("for",p);return p})})})};var e=function(k){var l=c(this).parent();if(l.hasClass("treeview-open")){l.removeClass("treeview-open").addClass("treeview-close")}else{if(l.hasClass("treeview-close")){l.removeClass("treeview-close").addClass("treeview-open");g(l)}}};var g=function(o,n){var k=o.is("UL")?o:o.find("> UL");var l={url:"jcore/treeview/treeview.jsp",target:k,params:{treeId:o.getJcmsId(true),treeChecked:[],treeHighlighted:[],treeOpened:[],treeCollection:[]},nohistory:true};o.find("INPUT[type=checkbox]:checked").each(function(){l.params.treeChecked.push(c(this).val());l.params.treeHighlighted.push(c(this).val())});var m=l.target.closest("UL[data-jalios-ajax-refresh-url].treeview");if(m.exists()){l.url=m.attr("data-jalios-ajax-refresh-url");l.params.treeHint=m.attr("data-jalios-treeview-hint")}if(m.length){let $treeRoot=m.closest("UL.treeview-root");if($treeRoot.length){let originalQueryStringJSON=$treeRoot.attr("data-jalios-treeview-original-qs");if(originalQueryStringJSON){let originalParams=JSON.parse(originalQueryStringJSON);if(originalParams){for(let key in originalParams){if(Object.prototype.hasOwnProperty.call(originalParams,key)){l.params[key]=originalParams[key]}}}}}}if(n){if(c.isArray(n)){c.merge(l.params.treeOpened,n);c.merge(l.params.treeCollection,n)}else{l.params.treeOpened.push(n);l.params.treeCollection.push(n)}}if(l.params.treeId){o.refresh(l)}else{if(l.url){o.refresh(l)}else{c.jalios.Browser.reload()}}};var j=function(k){let $refreshingElement=c('LI[data-jalios-id="'+k.nodeId+'"]');let $treeview;if(k.refreshRoot==="true"){$treeview=$refreshingElement.closest("UL[data-jalios-ajax-refresh-url].treeview-root")}else{$treeview=$refreshingElement.closest("UL[data-jalios-ajax-refresh-url].treeview")}jQuery.jalios.ui.TreeView.refresh($treeview,false);jQuery.jalios.ui.CtxMenu.hide()};if(!c.jalios){c.jalios={}}if(!c.jalios.ui){c.jalios.ui={}}c.jalios.ui.TreeView={upgrade:i,refresh:g,refreshNode:j};c(document).ready(function(k){h()})}(window.jQuery);