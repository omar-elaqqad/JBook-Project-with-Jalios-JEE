(function(B,I,d,m){var n,T;var R="JPORTLET_UPDATE";var k="LAYOUT_JBLOCK",S="PORTLET",N="jalios-jportal-component-type",u="jalios-jportal-component-id";var t=12,P="col-md-",l=P,M=new RegExp("^"+P,"gi");var e=null;var J=function(){n=new D(B(".jportal-wrapper"));n.initJBlocks();n.updateUi();i.updateJPortalCustomCss()};const H=function(){c();p();Q()};var Q=function(){B(".ui-resizable-handle").remove();var Y=B(".jportal-block").not(":last-child"),W,X,V,U;Y.resizable({handles:"e",start:function(ac,ad){B(".jportal-block").addClass("no-jblock-transition");var ae=ad.element;var ab=ae.next();var Z=B(ae).data("jalios-jblock");var aa=B(ab).data("jalios-jblock");var ag=Z.getBlockSize(l),af=aa.getBlockSize(l);X=B(ad.element).closest(".jportal-block-line").width();W=X/t;V=ag+af;U=V-2;B(ae).resizable("option","grid",[W,0])},resize:function(ab,ad){var ae=ad.element,aa=ae.next(),Z=Math.ceil(ae.width()/W);Z=Z>=U?U:Z;Z=Z<2?2:Z;var ac=V-Z;B(ae).data("jalios-jblock").updateSize(Z);B(ae).css("width","");B(aa).data("jalios-jblock").updateSize(ac);elementQuery()},stop:function(Z,aa){n.registerNewAction();B(".jportal-block").removeClass("no-jblock-transition")}})};var x;var c=function(){B(".jportal-block:not(.jportal-block-main)").draggable({handle:".jportal-block-header",appendTo:"body",start:function(U,V){x=V.helper.clone();x.addClass("jblock-helper-clone");B("BODY").prepend(x)},drag:function(V,U){x.css("left",U.helper.offset().left);x.css("top",U.helper.offset().top)},stop:function(V,U){B(".jblock-helper-clone").remove()},containment:"body",scrollSensitivity:100,scrollSpeed:30,appendTo:".jportal-wrapper",helper:function(){return"<div class='jblock-helper'></div>"},cursorAt:{left:20,top:5},cursor:"move"});B(".is-draggable").draggable({cursorAt:{left:20,top:5},containment:"body",refreshPositions:true,appendTo:".jportal-wrapper",scrollSensitivity:100,scrollSpeed:30,helper:function(){return"<div class='jblock-helper'></div>"},cursor:"move",start:function(U,V){x=V.helper.clone();x.addClass("jblock-helper-clone");B("BODY").prepend(x)},drag:function(U,V){x.css("left",V.helper.offset().left);x.css("top",V.helper.offset().top)},stop:function(V,U){B(".jblock-helper-clone").remove()}})};var p=function(){B(".jportal-drop-block").droppable({accept:".jportal-component, .jportal-block",over:function(U,V){B(this).addClass("jblock-drag-over")},out:function(U,V){B(this).removeClass("jblock-drag-over")},drop:f,tolerance:"pointer"})};const E=function(U){n.displayOverlay();i.saveStructure(function(){B.ajax({url:"jcore/jportal/history/jportalHistory.jsp",method:"post",data:{jPortal:n.getId()}}).done(function(V){B("BODY").append(V);n.scrollTop();B("BODY").addClass("jportal-history-active");B(".jportal-history-item").first().addClass("history-selected");B("#jportalHistoryIframe").one("load",function(){n.hideOverlay()})})})};const A=function(U){B(U.currentTarget).tooltip("hide")};const F=function(U){U.stopPropagation();U.preventDefault();n.displayOverlay();i.saveStructure(function(){B.ajax({url:"jcore/jportal/preview/jportalPreview.jsp",method:"post",data:{jPortal:n.getId()}}).done(function(V){B("BODY").append(V);n.scrollTop();B("BODY").addClass("jportal-preview-active");B("#jportalPreviewIframe").one("load",function(){n.hideOverlay()})})})};const j=function(U){B(".jportal-history").remove();B("BODY").removeClass("jportal-history-active")};const O=function(U){if(B("BODY").hasClass("jportal-preview-active")){U.preventDefault();B(".jportal-preview").remove();B("BODY").removeClass("jportal-preview-active")}};const q=function(X){B(".jportal-history-revert").attr("disabled","disabled");B(".jportal-history-item").removeClass("history-selected");var U=B(X.target).closest(".jportal-history-item");var W=U.data("jalios-structure-id");var V=U.data("jalios-jportal-url");U.addClass("history-selected");B(".js-jportal-version-rename").attr("href","jcore/jportal/history/doJPortalHistoryVersionRenameModal.jsp?jportalStructureId="+W);B("#jportalHistoryIframe").off("load");B("#jportalHistoryIframe").on("load",function(){B(".jportal-history-revert").removeAttr("disabled")});B("#jportalHistoryIframe").attr("src",V+"?preview=true&structureId="+W);B(".jportal-revert-form INPUT[name='structureId']").val(W)};const h=function(U){n.resetSidebar();let currentEditedBlock=n.getCurrentEditedPortletBlock();if(!currentEditedBlock||currentEditedBlock.removed){return}let portletId=B(U.currentTarget).data(u);if(!portletId){return}let componentTitle=B(U.currentTarget).find(".jportal-component-label").text();currentEditedBlock.setJPortlet(portletId,componentTitle);if(n.isShowContentMode()){currentEditedBlock.loadPortlet()}n.setCurrentEditedBlockPicked();n.registerNewAction()};const r=function(U){i.saveStructure()};const z=function(U){U.preventDefault();U.stopPropagation();B.jalios.ui.Modal.confirm(B("#jportalHistoryIframe").data("jalios-confirm-text"),function(){B(".jportal-revert-form").submit()})};var s=function(U){n.toggleJPortletContent()};var K=function(W){var U=B(".jportlet-sidebar").data("block-id");var V;if(U){V=i.getJBlockFromId(U)}else{V=n.getMainJBlock()}i.updateJBlockParametersFromSidebar(V)};var b=function(U){if(B(U.currentTarget).closest("form").length){return}i.updateJPortalParametersFromSidebar()};var v=function(W){var U;if(W.refresh.type=="before"){}if(W.refresh.type=="after"){U=B(W.refresh.target);if(U.hasClass("jportal-editor-sidebar")&&n){if(W.refresh.options&&W.refresh.options.params&&!W.refresh.options.params.portletClassName){n.removeCurrentEditedPortletBlock()}}if(U.hasClass("portlet-list")||U.hasClass("jportal-editor-sidebar")||U.hasClass("jportal-sidebar")){c();if(W.refresh.options.params.blockId){i.updateComponentSidebarInputs(".jportal-editor-sidebar");i.displayOverlayAroundJBlock(W.refresh.options.params.blockId)}else{i.removeOverlayAroundJBlock();i.updateJPortalSidebarInputs();n.resetSidebarScrollbar()}n.isInitialized=true}var V=W.refresh.options;if(V&&V.params&&V.params.opUpdate=="true"&&V.params.jportalStructureId){B(".history-selected .jportal-history-item-title").text(V.params.customTitle);B.jalios.ui.Modal.close(true)}}};const C=function(W,U){let portletClassName=U.data("jaliosPortletClassname");n.displaySidebarLoading();B(".jportal-editor-sidebar").data("sidebar").open({url:"jcore/jportal/commonSidebar/doJPortalSidebar.jsp?portletClassName="+portletClassName+"&jPortal="+n.getId()+"&displayReturnCaret=true"});var V=B(W.target);var X=i.createBlock(12);let jblock;if(V.parent().hasClass("jportal-block-line")){jblock=i.addJBlockOnLineTargetDrop(V,X)}else{if(V.hasClass("drop-center")){jblock=i.addJBlockOnCenterTargetDrop(V,X)}else{jblock=i.addJBlockOnSideTargetDrop(V,X)}}jblock.updateAsPortletPlaceholder(U);n.setCurrentEditedPortletBlock(jblock)};var a=function(X,Y){var V=B(X.target);var aa=i.createBlock(12);var Z,ab,W,U;if(V.parent().hasClass("jportal-block-line")){i.addJBlockOnLineTargetDrop(V,aa)}else{if(V.hasClass("drop-center")){i.addJBlockOnCenterTargetDrop(V,aa)}else{i.addJBlockOnSideTargetDrop(V,aa)}}n.registerNewAction()};const L=function(V,W){var U=B(W.draggable);if(U.data(N)===S){C(V,U)}else{if(U.data(N)===k){a(V,W);n.registerNewAction()}}};const o=function(U,ab){var ad=ab.draggable.data("jalios-jblock");var ac=B(ab.draggable).closest(".jportal-block-line");var Z=B(U.target);var X=B(Z).closest(".jportal-block-line");var af=B(Z).closest(".jportal-block");var V=B(af).data("jalios-jblock");var aa=B(af).closest(".jportal-block-line").parent();var W=B(aa).data("jalios-jblock");var Y=ab.draggable.closest(".jportal-block-line").parent();var ae=B(Y).data("jalios-jblock");B(ab.draggable).removeAttr("style");if(Z.hasClass("drop-center")){B(Z).remove();B(af).append(ab.draggable);V.addVirtualLine();i.computeBlocksSize(af.find(".jportal-block-line:first"));i.computeBlocksSize(ac)}else{if(Z.parent().hasClass("jportal-block-line")){var ag=i.createLine();ag.append(ab.draggable);if(B(Z).hasClass("drop-top")){B(ag).insertBefore(X)}else{if(B(Z).hasClass("drop-bottom")){B(ag).insertAfter(X)}}i.computeBlocksSize(ac);i.computeBlocksSize(ag)}else{if(B(Z).hasClass("drop-right")){B(ab.draggable).insertAfter(af)}else{if(B(Z).hasClass("drop-left")){B(ab.draggable).insertBefore(af)}}if(!ac.is(X)){i.computeBlocksSize(ac);i.computeBlocksSize(X)}}}n.registerNewAction()};var f=function(U,V){B(".jportal-drop-block").removeClass("jblock-drag-over");if(V.draggable.hasClass("jportal-component")){L(U,V)}else{o(U,V)}H()};var w=function(W,U,V){Object.defineProperty(y,U,{value:V,writable:false,enumerable:true,configurable:true})};var y={};w(y,"JPORTAL_BLOCK",Handlebars.compile(B("#jportal-block").html()));w(y,"JPORTAL_BLOCK_LINE",Handlebars.compile(B("#jportal-block-line").html()));w(y,"JPORTLET",Handlebars.compile(B("#jportlet").html()));w(y,"JPORTAL_BLOCK_INNER_TEMPLATE",Handlebars.compile(B("#jportal-block-inner-template").html()));w(y,"BLOCK_PORTLET_DROPDOWN_EDIT_ITEM",Handlebars.compile(B("#block-portlet-dropdown-edit-item").html()));w(y,"JBLOCK_DROP_CENTER",Handlebars.compile(B("#jblock-drop-center").html()));w(y,"JPORTAL_STRUCTURE",Handlebars.compile(B("#jportal-structure").html()));var i={customCssTimer:null,handleJPortalCustomCssChange:function(){if(i.customCssTimer!=null){clearTimeout(i.customCssTimer)}i.customCssTimer=setTimeout(function(){i.updateJPortalCustomCss()},1000)},getAnimationTime:function(U){if(U=="slow"){return 800}else{if(U=="default"){return 400}else{if(U=="fast"){return 200}}}return 400},isEmpty:function(U){if(U==null||U==""||U==" "||U==m||U=="null"){return true}return false},updateTopbar:function(U){if(U){B(".topbar").removeClass("hide");B(".jportal-wrapper").addClass("is-topbar-displayed")}else{B(".topbar").addClass("hide");B(".jportal-wrapper").removeClass("is-topbar-displayed")}},updateJPortalCustomCss:function(){var U=B("style[data-id='"+n.getId()+"']");if(U.length){U.remove()}B("<style type='text/css' data-id='"+n.getId()+"'>"+n.getCustomCss()+"</style>").appendTo("head")},removeOtherSelectionIfBlockIsSelection:function(V){if(V.getOptions()){var U=V.getOptions();if(U.isPortletSelection==="true"){B(".jportal-block").each(function(W,X){if(B(X).data("id")!=V.getId()){B(X).data("jalios-jblock").setPortletSelection(false)}})}}},triggerJPortalUpdateInStorage:function(){var U={};U.data=new Date().getTime();U.jportal=n.getId();localStorage["jportal.sync.preview.structure"]=JSON.stringify(U)},updateJBlockParametersFromSidebar:function(U){i._updateJsonDataFromSidebar(".jblock-ui",U,"jalios-ui");i._updateJsonDataFromSidebar(".jblock-options",U,"jalios-options");i._updateJsonCssDataFromSidebar(".jportal-editor-sidebar",U);i._updateJsonPortletCssDataFromSidebar(".jportal-editor-sidebar",U);i.removeOtherSelectionIfBlockIsSelection(U);i.displayOrHidePortletSectionHeadersOption(U);U.updateUi();n.registerNewAction()},updateJPortalParametersFromSidebar:function(){i._updateJsonDataFromSidebar(".jportal-parameters",n,"jalios-ui");i._updateJsonCssDataFromSidebar(".jportal-parameters",n);i.handleJPortalCustomCssChange();n.updateUi();n.registerNewAction()},displayOrHidePortletSectionHeadersOption:function(U){let isSelection=U.getOptions()&&U.getOptions().isPortletSelection;if(isSelection===true||isSelection==="true"){B(".js-selection-headers-toggle").show()}else{B(".js-selection-headers-toggle").hide()}},_updateChainedInputs:function(){B(".input-group-chained").each(function(V,W){var U=-1;var X=true;B(W).find(".jblock-css").each(function(Z,aa){if(U==-1){U=B(aa).val()}var ab=B(aa).val();if(U!=ab){X=false}});var Y=B(W).find(".input-group-addon");if(X){Y.addClass("is-chained")}else{Y.removeClass("is-chained")}B(W).find(".input-chainer").prop("checked",X)})},_updateJsonCssDataFromSidebar:function(X,W){var V={};B(X+" .jblock-css").each(function(Y,aa){var Z=B(aa).attr("NAME");V[Z]=B(aa).val()});var U=W.$element.data("jalios-ui");U=U||{};U.css=V;W.$element.data("jalios-ui",U)},_updateJsonPortletCssDataFromSidebar:function(X,W){var V={};B(X+" .jportlet-css").each(function(Y,aa){var Z=B(aa).attr("NAME");V[Z]=B(aa).val()});var U=W.$element.data("jalios-jportlet");U=U||{};U.ui=U.ui||{};U.ui.css=V;W.$element.data("jalios-jportlet",U)},_updateJsonDataFromSidebar:function(V,W,U){var X;if(W.$element.data(U)){X=W.$element.data(U)}else{X={}}B(V).find("INPUT, SELECT, TEXTAREA").not(".jblock-css, .jportlet-css").each(function(Z,ac){var ab=B(ac).attr("NAME");var ae=B(ac).attr("TYPE");if(!i.isEmpty(ab)){if(ae=="radio"&&B(ac).prop("checked")){X[ab]=B(ac).val()}else{if(ae=="checkbox"){var ad=B("INPUT[type='checkbox'][name='"+ab+"']").length;if(ad>1){var aa=X[ab];if(i.isEmpty(aa)){aa=[]}var Y=B(ac);var af=aa.indexOf(Y.val());if(af==-1&&Y.is(":checked")){aa.push(B(ac).val());X[ab]=aa}else{if(af>-1&&!Y.is(":checked")){aa.splice(af,1)}}}else{X[ab]=B(ac).is(":checked")}}else{if(ae!="radio"){X[ab]=B(ac).val()}}}}});W.$element.data(U,X);return X},updateJPortalSidebarInputs:function(){var X=n.getMainJBlock();var Z=X.getUi();var V=X.getOptions();i._updateInputs(".jblock-parameters.jblock-ui",Z);if(Z!=null){i._updateInputs(".jblock-parameters",Z.css)}i._updateInputs(".jblock-parameters.jblock-options",V);var W=n.getUi();i._updateInputs(".jportal-parameters",W);if(W!=null){i._updateInputs(".jportal-parameters",W.css)}ace.require("ace/ext/language_tools");var Y=ace.edit(B(".jblock-custom-css").attr("id"));Y.getSession().setMode("ace/mode/css");Y.setAutoScrollEditorIntoView(true);Y.getSession().setTabSize(2);Y.getSession().setUseSoftTabs(true);Y.setOption("maxLines",30);Y.setOption("minLines",10);Y.setOption("enableBasicAutocompletion",true);Y.getSession().on("change",function(){var aa=Y.getSession().getValue();B(".ace-custom-css").val(aa)});var U=ace.edit(B(".jblock-custom-js").attr("id"));U.getSession().setMode("ace/mode/javascript");U.setAutoScrollEditorIntoView(true);U.getSession().setTabSize(2);U.getSession().setUseSoftTabs(true);U.setOption("maxLines",30);U.setOption("minLines",10);U.setOption("enableBasicAutocompletion",true);U.getSession().on("change",function(){var aa=U.getSession().getValue();B(".ace-custom-js").val(aa)})},updateComponentSidebarInputs:function(Z){var V=B(".jportlet-sidebar").data("block-id");var X=i.getJBlockFromId(V);var Y=X.getUi();var U=X.getJPortletUi();var W=X.getOptions();i._updateInputs(Z,Y);if(Y!=null){i._updateInputs(Z,Y.css)}if(U){i._updateInputs(Z,U.css)}i._updateInputs(Z,W);i._updateChainedInputs();i.displayOrHidePortletSectionHeadersOption(X)},_updateInputs:function(W,U){try{B.each(U,function(Y,Z){if(typeof Z==="boolean"||Z=="true"||Z=="false"){if(B(W+" INPUT[name='"+Y+"']").length>1){B(W+" INPUT[name='"+Y+"'][value='"+Z+"']").prop("checked",true)}else{B(W+" INPUT[name='"+Y+"']").prop("checked",Z)}}else{if(B(W+" INPUT[name='"+Y+"']").length){var X=B(W+" INPUT[name='"+Y+"']");if(X.length>1&&X[0].type=="checkbox"&&!i.isEmpty(Z)){B(X).each(function(aa,ab){if(Z.indexOf(ab.value)>-1){B(ab).prop("checked",true)}})}else{B(W+" INPUT[name='"+Y+"']").val(Z)}}else{if(B(W+" SELECT[name='"+Y+"']").length&&Z!=null){B(W+" SELECT[name='"+Y+"']").val(Z)}else{if(B(W+" TEXTAREA[name='"+Y+"']").length){B(W+" TEXTAREA[name='"+Y+"']").val(Z)}}}}})}catch(V){B.console.log(V)}},getJBlockFromPortletId:function(V){var U;B(".jportal-block").each(function(X,Y){U=B(Y).data("jalios-jblock");var W=U.getPortletId();if(V===W){return false}});return U},getJblockDefaultTitle:function(){return n.$element.find(".jportal-wrapper-inner").data("jalios-cell-title")},getJBlockFromId:function(U){var V=null;B(".jportal-block").each(function(W,X){if(B(X).data("id")==U){V=B(X).data("jalios-jblock");return}});return V},displayOverlayAroundJBlock:function(U){i.removeOverlayAroundJBlock();var V=i.getJBlockFromId(U);V.$element.addClass("jportal-block-overlay-edition")},removeOverlayAroundJBlock:function(){B(".jportal-block.jportal-block-overlay-edition").removeClass("jportal-block-overlay-edition")},computeBlocksSize:function(ab){if(!n.isInitialized){return}var U=B(ab).closest(".jportal-block");var V=B(U).data("jalios-jblock");var Z=B(ab).find("> .jportal-block");if(Z.length==0){B(ab).remove()}else{var aa=Z.length;if(aa!=0){var X=Math.floor(t/aa);var ac=X;if(t%aa!==0){ac=X+(t%aa)}for(var W=0;W<Z.length;W++){var Y=B(Z[W]).data("jalios-jblock");if(W==Z.length-1){Y.updateSize(ac)}else{Y.updateSize(X)}}}}if(B(U).find(".jportal-block-line").length==0){V.addDNDArea()}},createBlock:function(W,X){var U=X==null?i.generateRandomID():X;var V=y.JPORTAL_BLOCK({"grid-md-size":W,"block-id":U});return B(V)},createStructure:function(V){var U=y.JPORTAL_STRUCTURE({"structure-type":V});return B(U)},createDropCenter:function(){var U=y.JBLOCK_DROP_CENTER();return B(U)},createPortletMenu:function(W,U){var V=y.BLOCK_PORTLET_DROPDOWN_EDIT_ITEM({"portlet-id":W,"block-id":U});return B(V)},createBlockInnerTemplate:function(U){var V=y.JPORTAL_BLOCK_INNER_TEMPLATE({"block-id":U});return B(V)},createPortlet:function(V){var U=y.JPORTLET({title:V});return B(U)},createLine:function(){var U=y.JPORTAL_BLOCK_LINE();return B(U)},addJBlockOnCenterTargetDrop:function(U,X,V){var W=U.closest(".jportal-block");var Y=W.data("jalios-jblock");U.remove();W.append(X);jblock=new g(X);jblock.addDNDArea();Y.addVirtualLine();if(!V){i.computeBlocksSize(W.find(".jportal-block-line:first"))}return jblock},addJBlockOnLineTargetDrop:function(W,Y,X){var V=W.closest(".jportal-block-line");var U=i.createLine();U.append(B(Y));if(W.hasClass("drop-top")){B(U).insertBefore(V)}else{if(W.hasClass("drop-bottom")){B(U).insertAfter(V)}}jblock=new g(Y);jblock.addDNDArea();if(!X){i.computeBlocksSize(U)}return jblock},addJBlockOnSideTargetDrop:function(V,Y,W){var X=V.closest(".jportal-block");var U=V.closest(".jportal-block-line");if(V.hasClass("drop-right")){B(Y).insertAfter(X)}else{if(V.hasClass("drop-left")){B(Y).insertBefore(X)}}jblock=new g(Y);jblock.addDNDArea();if(!W){i.computeBlocksSize(U)}return jblock},saveStructure:function(V){if(!n.hasStructureChanged()){if(typeof V==="function"){V()}return}if(n.saveTimer){clearTimeout(n.saveTimer)}var U=n.convertDOMtoJSON();n.jsonStructure=JSON.stringify(U);B.ajax({url:"jcore/jportal/action/saveJPortalStructure.jsp",method:"post",data:{jPortal:n.id,jPortalStructure:n.jsonStructure,opSaveStructure:true}}).done(function(Y){if(Y.actionStatus==="OK"){B.console.log("Structure saved");toastr.success(Y.message);B(".jportal-history-link").removeClass("hide");i.triggerJPortalUpdateInStorage();var W=B.jalios.ui.Widget.Date.getDateFormat();var X=moment(new Date()).format(W);B(".jportal-last-save-date").text(X);if(!n.hasStructureChanged()){n.registerNewAction()}}else{if(Y.actionStatus==="ERROR"){toastr.options={positionClass:"toast-top-center"};toastr.error(Y.message);B.console.log("An error occured when saving JPortal Structure");B.console.log("actionStatus : "+Y.actionStatus+", message : "+Y.message)}}B.console.log(Y);if(typeof V==="function"){V()}})},generateRandomID:function(){return"_"+Math.random().toString(36).substr(2,9)}};var g=function(U){this.setDefaultTitle(i.getJblockDefaultTitle());this.$element=B(U);if(!this.$element.data("id")){this.$element.data("id",i.generateRandomID())}this.id=this.$element.data("id");this.init()};g.prototype.destroyAnimation=function(){this.$element.removeAttr("data-aos");this.$element.removeAttr("data-aos-duration");this.$element.removeClass("aos-animate")};g.prototype.init=function(){var W=this;this.$element.data("jalios-jblock",W);this.$element.prepend(i.createBlockInnerTemplate(W.id));this.$element.find(" > .jportal-block").each(function(X,Y){var Z=new g(Y)});this.addVirtualLine();if(this.$element.data("jalios-jportlet")){var U=this.$element.data("jalios-jportlet");if(U.id!=null){this.setJPortlet(U.id,U.title)}}var V=this.$element.find(".jblock-delete:first");B(V).on("click",function(X){if(W.$element.find(".jportal-block").exists()||W.$element.hasClass("has-jportlet")){B.jalios.ui.Modal.confirm(B(V).data("jalios-confirm-text"),function(){W.$element.one(B.support.transition.end,function(Y){W.remove();H();n.updateHeaderFooter();n.registerNewAction()});W.$element.find(".jportal-block-header").empty().css("height","40px");W.$element.css("width","0px")})}else{W.$element.one(B.support.transition.end,function(Y){W.remove();H();n.updateHeaderFooter();n.registerNewAction()});W.$element.find(".jportal-block-header").empty().css("height","40px");W.$element.css("width","0px")}});this.updateUi();n.$element.on(R,function(Z){if(W.$element.data("jalios-jportlet")){var X=W.$element.data("jalios-jportlet");var Y=X.id;if(Y==Z.id){X.title=Z.portletName;W.setDefaultTitle(i.getJblockDefaultTitle()+" - "+X.title);W.$element.data("jalios-jportlet",X);n.registerNewAction();i.triggerJPortalUpdateInStorage();W.$element.find(".jportal-block-inner:first").displayLoading();W.loadPortlet(function(){W.$element.find(".ajax-loading-component").remove()});W.updateUi()}}})};g.prototype.applyData=function(V){if(V){var U=this;this.setUi(V.ui);this.setOptions(V.options);this.setJPortletData(V.jportlet);if(n.isShowContentMode()){this.loadPortlet()}let lineSize=0;B.each(V.jblocks,function(X,Z){var aa=i.createBlock(Z.ui.gridSizeMd,Z.id);var W;var Y;if(lineSize===12){W=U.$element.find(">.jportal-block-inner >.jportal-block-line:last-child >.drop-bottom");Y=i.addJBlockOnLineTargetDrop(W,aa,true);lineSize=Y.getBlockSize(l)}else{if(U.$element.find(">.jportal-block-inner >.drop-center").length){W=U.$element.find(">.jportal-block-inner >.drop-center");Y=i.addJBlockOnCenterTargetDrop(W,aa,true);lineSize+=Y.getBlockSize(l)}else{W=U.$element.find(">.jportal-block-inner >.jportal-block-line >.jportal-block:last >.drop-right");Y=i.addJBlockOnSideTargetDrop(W,aa,true);lineSize+=Y.getBlockSize(l)}}Y.applyData(Z)});this.updateUi()}};g.prototype.setUi=function(U){this.$element.data("jalios-ui",U)};g.prototype.setOptions=function(U){this.$element.data("jalios-options",U)};g.prototype.setJPortletData=function(U){if(U!=null&&U.id!=null){this.setJPortlet(U.id,U.title)}};g.prototype.setCustomClass=function(U){if(U==null){U=""}U+=" jportal-block-inner";this.$element.find(".jportal-block-inner:first").attr("class",U)};g.prototype.updateUi=function(){var ae=this.getOptions();if(ae){this.setPortletSelection(ae.isPortletSelection)}else{this.updateTitle(this.defaultTitle)}var aa=this.getJPortletUi();if(aa&&aa.css){this._updateJPortletCss(aa.css)}var W=this.getUi();if(W){this.setCustomClass(W.customClass);var Y=W.css;var V;if(this.getPortletId()!=null){V=this.$element.find(".jportlet:first")}else{V=this.$element.find(".jportal-block-inner:first")}V.removeAttr("style");var ad=null;if(this.getPortletId()!=null){ad=V.find(".Portlet:first");ad.removeAttr("style");if(!i.isEmpty(W.verticalAlign)){V.css("display","flex");V.css("align-items",W.verticalAlign)}if(!i.isEmpty(W.horizontalAlign)){V.css("display","flex");V.css("justify-content",W.horizontalAlign)}}if(i.isEmpty(W.animation)){this.destroyAnimation()}else{var U=this.$element.attr("data-aos");var X=this.$element.attr("data-aos-duration");if(U!=W.animation||X!=i.getAnimationTime(W.animationDuration)){this.$element.attr("data-aos",W.animation);this.$element.attr("data-aos-duration",i.getAnimationTime(W.animationDuration));this.$element.removeClass("aos-animate");this.$element.addClass("hide");var Z=this;setTimeout(function(){Z.$element.removeClass("hide");Z.$element.addClass("aos-animate")},800)}}if(Y==null){return}for(var ac in Y){if(Y.hasOwnProperty(ac)){var ab=Y[ac];ac=ac.split(/(?=[A-Z])/).join("-").toLowerCase();if(ac=="width"&&!i.isEmpty(ab)){ad.css(ac,ab);V.css("display","flex");V.css("overflow","auto")}else{if(ac=="height"&&!i.isEmpty(ab)){var ad=V.find(".Portlet:first");ad.css(ac,ab);V.css("overflow","auto")}else{if(ac=="background-image"&&ab!=""){ab="url("+ab+")"}if(!isNaN(ab)){ab+="px"}if(ad!=null){ad.css(ac,ab)}else{V.css(ac,ab)}}}}}}};g.prototype._updateJPortletCss=function(U){if(U.jaliosSkinHeaderPrimary){var W=this.$element.find(".jportlet .portlet-header-primary");if(W.length){W.css("color",U.jaliosSkinHeaderPrimary)}}if(U.jaliosSkinHeaderSecondary){var V=this.$element.find(".jportlet .portlet-header-secondary");if(V.length){V.css("background-color",U.jaliosSkinHeaderSecondary)}}};g.prototype.setPortletSelection=function(U){var V=this.getOptions()||{};if(U==="true"||U===true){V.isPortletSelection=true}else{V.isPortletSelection=false}this.updateOptions(V);this.updatePortletSelectionClass()};g.prototype.updatePortletSelectionClass=function(){if(this.getOptions().isPortletSelection){this.$element.addClass("is-portlet-selection");if(this.getId()!=n.getMainJBlock().getId()){var U="Selection";if(!i.isEmpty(this.getJPortlet())&&!i.isEmpty(this.getJPortlet().title)){U+=" - "+this.getJPortlet().title}this.updateTitle(U)}}else{this.$element.removeClass("is-portlet-selection");this.updateTitle(this.defaultTitle)}};g.prototype.setDefaultTitle=function(U){this.defaultTitle=U};g.prototype.updateTitle=function(U){this.$element.find(".block-title:first").text(U);this.$element.find(".block-title:first").attr("title",U)};g.prototype.updateOptions=function(U){this.$element.data("jalios-options",U)};g.prototype.getBlockSize=function(V){var X=this.$element.attr("class").split(" ");for(var W=0;W<X.length;W++){if(X[W].startsWith(V)){var U=X[W].substring(V.length,X[W].length);return parseInt(U,10)}}return 0};g.prototype.loadPortlet=function(W){if(this.getPortletId()){var V=this;var U=this.getPortletId();this.$element.removeClass("has-jportlet");this.$element.find(".jportal-block-inner:first").displayLoading();B.jalios.AjaxRefresh.triggerRefreshEvent(B.jalios.AjaxRefresh.RefreshEventType.BEFORE,"types/JPortal/displayJPortlet.jsp",V.$element);B.ajax({url:"types/JPortal/displayJPortlet.jsp",method:"post",data:{jPortal:n.getId(),portletId:U}}).done(function(X){if(n.isShowContentMode()){V.$element.find(".jportlet:first").html(X);V.updateUi();V.$element.addClass("has-jportlet");V.$element.find(".ajax-loading-component").remove()}if(typeof W==="function"){W()}elementQuery();B.jalios.AjaxRefresh.triggerRefreshEvent(B.jalios.AjaxRefresh.RefreshEventType.AFTER,"types/JPortal/displayJPortlet.jsp",V.$element)})}};g.prototype.setJPortlet=function(W,U){var V=this.getJPortlet()||{};V.id=W;V.title=U;this.$element.data("jalios-jportlet",V);var Y=i.createPortlet(U);this.$element.find(".jportal-block-inner:first").append(Y);this.$element.find(".drop-center:first").remove();this.$element.addClass("has-jportlet");var X=B(this.$element).find(".jblock-edit:first");X.replaceWith(i.createPortletMenu(W,this.id));this.setDefaultTitle(i.getJblockDefaultTitle()+" - "+V.title);this.updateUi()};g.prototype.getJPortlet=function(){return this.$element.data("jalios-jportlet")};g.prototype.getPortletId=function(){var U=this.getJPortlet();if(U){return U.id}else{return null}};g.prototype.getId=function(){return this.id};g.prototype.getUi=function(){return this.$element.data("jalios-ui")};g.prototype.getOptions=function(){return this.$element.data("jalios-options")};g.prototype.getJPortlet=function(){return this.$element.data("jalios-jportlet")};g.prototype.getJPortletUi=function(){var U=this.getJPortlet();if(U){return U.ui}return null};g.prototype.removeContent=function(){this.$element.find(".jportlet:first").remove();var U=this.$element.data("jalios-jportlet");this.setJPortlet(U.id,U.title)};g.prototype.remove=function(){if(this.$element.find(".js-portlet-placeholder").length>0){let currentEditedPortletBlock=n.getCurrentEditedPortletBlock();currentEditedPortletBlock.remove()}var U=this.$element.closest(".jportal-block-line");this.$element.remove();i.computeBlocksSize(U);if(this.$element.hasClass("js-portlet-placeholder")){n.resetSidebar()}this.removed=true};g.prototype.addVirtualLine=function(){var U=this;if(this.$element.find(".jportal-block").length>0){line=i.createLine();this.$element.find("> .jportal-block-inner").append(line);var V=0;this.$element.find("> .jportal-block ").each(function(W,Z){if(V==12){V=0;line=i.createLine();U.$element.find("> .jportal-block-inner").append(line)}var Y=B(Z).data("jalios-jblock");var X=Y.getBlockSize(l);V+=X;B(line).append(Z)});p()}};g.prototype.addDNDArea=function(){this.$element.find(".jportal-block-inner:first").append(i.createDropCenter());p()};g.prototype.updateSize=function(U){this.$element.removeClass(function(V,X){var Y=X.split(" ");for(var W=0;W<Y.length;W++){if(Y[W].startsWith(l)){return Y[W]}}});this.$element.addClass(l+U)};g.prototype.updateAsPortletPlaceholder=function(U){this.updateTitle(U.data("jalios-jportal-portlet-name"));this.$element.find(".jportal-jblock-header").css("background-color","#e91e63");this.$element.find(".jportal-jblock-header").css("color","#fff");this.$element.find(".jportal-jblock-header .js-handle").hide();this.$element.find(".jportal-jblock-header .jblock-edit").hide();this.$element.addClass("js-portlet-placeholder")};g.prototype.removePortletPlaceholderSpecification=function(){this.$element.find(".jportal-jblock-header").css("background-color","");this.$element.find(".jportal-jblock-header").css("color","");this.$element.find(".jportal-jblock-header .js-handle").show();this.$element.find(".jportal-jblock-header .jblock-edit").show();this.$element.removeClass("js-portlet-placeholder")};var D=function(U){this.$element=B(U);this.init()};D.prototype.init=function(){this.displayOverlay();this.handlePendingOverlay(this,600);this.id=this.$element.data("jalios-jportal-id");this.$element.data("jportal",this)};D.prototype.displaySidebarLoading=function(){B(".jportal-sidebar .sidebar-tab-content").displayLoading()};D.prototype.scrollTop=function(){this.$element.scrollTop(0);I.scrollTo(0,0)};D.prototype.getSidebarScrollbar=function(){return this.ps};D.prototype.resetSidebarScrollbar=function(){B(".jportal-editor-sidebar .sidebar-body").scrollTop(0)};D.prototype.getCustomCss=function(){if(this.getUi()){return this.getUi().customCss}else{return""}};D.prototype.handlePendingOverlay=function(U,V){setTimeout(function(){if(U.isInitialized){var W=B("INPUT[name='displayTopbar']:checked").val()=="true";i.updateTopbar(W);B(".sidebar-overlay").removeClass("is-first-load");B(".jportal-edition").removeClass("hide");U.hideOverlay()}else{U.handlePendingOverlay(U,200)}},V)};D.prototype.displayOverlay=function(){B("BODY").addClass("jportal-overlay-active");var U=B(".jportal-overlay");U.removeClass("hide").addClass("is-active")};D.prototype.hideOverlay=function(){B("BODY").removeClass("jportal-overlay-active");var U=B(".jportal-overlay");U.one(B.support.transition.end,function(){U.addClass("hide")});U.removeClass("is-active")};D.prototype.updateUi=function(){var X=this;if(this.getUi()){var aa=this.getUi();var W=this.$element.find(".jportal-wrapper-inner");W.removeClass("container");W.removeClass("container-fluid");W.addClass(aa.container);this.updateHeaderFooter();var V=aa.css;if(V==null){return}var Z=B("BODY");Z.removeAttr("style");for(var U in V){if(V.hasOwnProperty(U)){var Y=V[U];U=U.split(/(?=[A-Z])/).join("-").toLowerCase();if(U=="background-image"&&Y!=""){Y="url("+Y+")"}if(!isNaN(Y)){Y+="px"}Z.css(U,Y)}}}};D.prototype.updateHeaderFooter=function(){var U=this.getUi();if((U.displayHeader=="false"||U.displayHeader===false)&&B(".jportal-header").length){B(".jportal-header").remove()}else{if((U.displayHeader=="true"||U.displayHeader===true)&&B(".jportal-header").length===0){this._addStructure("header","HEADER")}else{if((U.displayHeader=="true"||U.displayHeader===true)&&B(".jportal-header").length){if(B(".jportal-header").find(".jportal-block").length===0){U.displayHeader=false;U.jblockHeader=null;B(".jportal-header").remove()}}}}if((U.displayFooter=="false"||U.displayFooter===false)&&B(".jportal-footer").length){B(".jportal-footer").remove()}else{if((U.displayFooter=="true"||U.displayFooter===true)&&B(".jportal-footer").length===0){this._addStructure("footer","FOOTER")}else{if((U.displayFooter=="true"||U.displayFooter===true)&&B(".jportal-header").length){if(B(".jportal-footer").find(".jportal-block").length===0){U.displayFooter=false;U.jblockFooter=null;B(".jportal-footer").remove()}}}}H()};D.prototype._addStructure=function(Z,X){var W=this.getUi();var Y=null;if(Z==="footer"){i.createStructure(Z).insertAfter(this.$element.find(".jportal-wrapper-inner"));if(W.jblockFooter){Y=W.jblockFooter.id}}else{if(Z==="header"){i.createStructure(Z).insertBefore(this.$element.find(".jportal-wrapper-inner"));if(W.jblockHeader){Y=W.jblockHeader.id}}}var V=i.createBlock(12,Y);V.addClass("jblock-structured-"+Z);B(".jportal-"+Z).append(V);var U=new g(V);U.addDNDArea();if(Z==="footer"){U.applyData(W.jblockFooter)}else{if(Z==="header"){U.applyData(W.jblockHeader)}}U.updateUi();this._initStructuredJBlock(".jblock-structured-"+Z)};D.prototype.getMainJBlock=function(){return this.$element.find(".jportal-block-main").data("jalios-jblock")};D.prototype.initJBlocks=function(){this.$element.find(".jportal-block:first").addClass("jportal-block-main");var U=0;this.$element.find(".row > .jportal-block").each(function(V,W){new g(W)});this._initStructuredJBlock(".jportal-block-main");this.$element.find(".jportal-block > .jportal-block-inner").each(function(V,X){if(B(X).find(".jportal-block-line").length==0&&B(X).find(".jportlet").length==0){var W=B(X).parent().data("jalios-jblock");W.addDNDArea()}});this.jsonStructure=JSON.stringify(this.convertDOMtoJSON())};D.prototype._initStructuredJBlock=function(U){B(U).addClass("jblock-structured");this.$element.find(U).wrap("<div class='jportal-block-line'></div>");this.$element.find(U+" .drop-right:first").remove();this.$element.find(U+" .drop-left:first").remove();this.$element.find(U+" .jblock-delete:first").remove();this.$element.find(U+" .jportal-block-header:first >SPAN").remove();this.$element.find(U+" .jportal-block-header:first").css("cursor","inherit")};D.prototype.hasStructureChanged=function(){var U=this.convertDOMtoJSON();if(this.jsonStructure===JSON.stringify(U)){return false}return true};D.prototype.registerNewAction=function(){if(this.hasStructureChanged()){B("#saveJPortal").removeAttr("disabled");B(".btn-jportal-publish").attr("disabled","disabled");if(this.saveTimer){clearTimeout(this.saveTimer)}this.saveTimer=setTimeout(i.saveStructure,5000)}else{B("#saveJPortal").attr("disabled","disabled");B(".btn-jportal-publish").removeAttr("disabled");if(this.saveTimer){clearTimeout(this.saveTimer)}}};D.prototype.getId=function(){return this.id};D.prototype.isShowContentMode=function(){return B("BODY").hasClass("is-show-content-mode")};D.prototype.toggleJPortletContent=function(){B(".jportal-action-show-content  >SPAN").toggleClass("hide");if(this.isShowContentMode()){B("BODY").removeClass("is-show-content-mode");B(".jportal-block").each(function(V,W){if(B(W).data("jalios-jportlet")){var U=B(W).data("jalios-jportlet");if(U.id!=null){B(W).data("jalios-jblock").removeContent()}}})}else{B("BODY").addClass("is-show-content-mode");B(".jportal-block").each(function(U,V){if(B(V).data("jalios-jportlet")){B(V).data("jalios-jblock").loadPortlet()}})}};D.prototype.convertDOMtoJSON=function(){var V=this.$element.find(".jportal-block-main");var W=[this.createJSONBlock(V)];var U={jBlocks:W,ui:this.getUi()};return U};D.prototype.createJSONBlock=function(W){var U=B(W);var Z=[];var X=this;U.find(">.jportal-block-inner > .jportal-block-line > .jportal-block").each(function(ab,ac){var ad=X.createJSONBlock(ac);Z.push(ad)});var V=U.data("jalios-jblock");var Y=V.getUi()||{};Y.gridSizeMd=V.getBlockSize(l);var aa={id:V.getId(),ui:Y,options:V.getOptions(),jportlet:V.getJPortlet(),jblocks:Z};return aa};D.prototype.getUi=function(){var X=this.$element.data("jalios-ui");if(this.$element.find(".jportal-header .jportal-block:first").length){var W=this.$element.find(".jportal-header .jportal-block:first");var U=this.createJSONBlock(W);X.jblockHeader=U}if(this.$element.find(".jportal-footer .jportal-block:first").length){var V=this.$element.find(".jportal-footer .jportal-block:first");var Y=this.createJSONBlock(V);X.jblockFooter=Y}return X};D.prototype.getCurrentEditedPortletBlock=function(){return this.currentEditedBlock};D.prototype.setCurrentEditedPortletBlock=function(U){this.removeCurrentEditedPortletBlock();this.currentEditedBlock=U};D.prototype.removeCurrentEditedPortletBlock=function(){if(this.currentEditedBlock&&!this.currentEditedBlock.removed){this.currentEditedBlock.remove();H();this.updateHeaderFooter()}};D.prototype.resetSidebar=function(){this.displaySidebarLoading();B;B(".jportal-editor-sidebar").data("sidebar").open({url:"jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal="+n.getId()})};D.prototype.setCurrentEditedBlockPicked=function(){this.currentEditedBlock.removePortletPlaceholderSpecification();this.currentEditedBlock=m};var G=function(){B(d).on("click","#saveJPortal",r);B(d).on("click",".js-jportal-history-close",j);B(d).on("click",".js-jportal-preview-close",O);B(d).on("click",".jportal-history-revert",z);B(d).on("click",".js-jportal-show-content",s);B(d).on("click",".jportal-history-link",E);B(d).on("click","a.jportal-show-preview",F);B(d).on("click","a.jportal-show-preview-new-window",A);B(d).on("click",".jportal-history-item",q);B(d).on("click",".jportal-component-portlet",h);B(d).on("jalios:refresh",v);B(d).on("shown.bs.tab",function(U){n.resetSidebarScrollbar()});B(d).on("change","INPUT[name='displayTopbar']",function(V){var U=B("INPUT[name='displayTopbar']:checked").val()=="true";i.updateTopbar(U)});B(I).on("beforeunload",function(){i.saveStructure();B.ajax({url:"jcore/jportal/action/unlockJPortal.jsp",data:{jPortal:n.getId()}})});B(d).on("change paste keyup",".jportal-parameters :input",b);B(d).on("change paste keyup",".jblock-parameters :input",K)};B(d).ready(function(){G();J();H();B(d).on("show.jalios.sidebar",function(U){if(!B(U.target).hasClass("jportal-editor-sidebar")){return}B(U.target).addClass("is-open");elementQuery();B("BODY").addClass("is-jportal-sidebar-opened")});B(d).on("shown.jalios.sidebar",function(U){if(!B(U.target).hasClass("jportal-editor-sidebar")){return}B(U.target).addClass("is-open")});B(d).on("start-hide.jalios.sidebar",function(U){if(!B(U.target).hasClass("jportal-editor-sidebar")){return}B("BODY").removeClass("is-jportal-sidebar-opened");B(U.target).removeClass("is-open")});B(d).on("start-hide.jalios.sidebar",function(U){elementQuery()});B(".jportal-sidebar-opener").click();B('[data-toggle="tooltip"]').tooltip();n.toggleJPortletContent()})})(jQuery,window,document);