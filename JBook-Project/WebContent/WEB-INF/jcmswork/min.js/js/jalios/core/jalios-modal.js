!(function(a){const h=32;const k=13;var f=/modal/i;var i=function(m){if(m&&m.skip=="modal"){return}var l=a.jalios.Event.match(m,"broker",f,true,true);if(!l){return}var n=l.source.currentTarget;a.jalios.ui.Modal.open(n,l.options)};var c=function(l){if(l.skip=="modal"){return}l.preventDefault();l.stopPropagation();l.stopImmediatePropagation();a.jalios.ui.Modal.open(l.currentTarget);a.jalios.ui.CtxMenu.hide()};var e=0;var j=function(m){var l=a("#jalios-previous-modal-"+e);if(l.exists()){l.prop("id","jalios-modal");l.modal("show");e--}};var b=function(l){var m=l?l.closest("DIV.modal"):a("#jalios-modal");if(m.exists()&&m.is(":visible")){e++;a.jalios.ui.Modal.close(false);a("#jalios-modal").prop("id","jalios-previous-modal-"+e)}};const d=function(){if(typeof(elementQuery)==="undefined"){return}a(document).on("shown.bs.modal",function(l){setTimeout(function(){elementQuery()},200)});a(document).on("jalios:refresh",function(l){let refresh=a.jalios.Event.match(l,"refresh","after");if(!refresh||!refresh.target){return}if(a(refresh.target).closest(".modal").exists()){setTimeout(function(){elementQuery()},200)}})};var g=function(){a(document).on("jalios:broker",i);a(document).on("click","A.modal",c);a(document).on("click",":button.modal",c);a(document).on("click",":submit.modal",c);a(document).on("click","area.modal",c);a(document).on("keydown","A.modal",function(l){if(!a(document.activeElement).is(".modal")){return}if(l.keyCode===h||l.keycode===k){a(document.activeElement).trigger("click");l.preventDefault()}});a(document).on("hide.bs.modal",j);d();a(document).on("keydown",function(o){if(o.which!=13){return}var p=a(document.body);if(!p.hasClass("modal-open")){return}var l=a(o.target);if(l.prop("tagName")=="TEXTAREA"){return}if(l.is("[class^=mce-]")){return}if(l.parent().is(".modal-footer")){return}if(l.is("a")){return}if(l.is(":input")){var n=p.find(".modal-content .modal-footer .btn-primary[type=submit]").last();if(!n.exists()){return}var m=a.Event("click");m.which=1;n.trigger(m);o.preventDefault()}})};if(!a.jalios){a.jalios={}}if(!a.jalios.ui){a.jalios.ui={}}a.jalios.ui.Modal={latest:{},openFromUrl:function(n,m){b();var l=a.jalios.ui.Modal.getModal();if(!l||!l.exists()){return}a.jalios.ui.Modal.latest=m||{};l.modal("show");var o=a.extend(true,{},{url:n,noscroll:true,nohistory:true},m);o.callback=false;l.refresh(o);a.jalios.ui.CtxMenu.hide()},open:function(r,u){let that=this;if(!r){return false}var s=a(r);if(s.is(".disabled")||s.closest("LI").is(".disabled")){return false}b(s);a.jalios.ui.Modal.latest=u||{};a.jalios.ui.Modal.latest.trigger=s;let $modal;if(s.hasClass("confirm-danger")){if(a("#jalios-modal").length>0){a("#jalios-modal").remove()}$modal=that.getDangerModal(s,function(v){that.closeAndFollow(true)})}else{$modal=that.getModal()}if(!$modal||!$modal.exists()){return}var n=false;var q=false;if(s.hasClass("alert")){n="jcore/modal/alert.jsp";q=true}else{if(s.hasClass("confirm")){n="jcore/modal/confirm.jsp";q=true}else{if(s.hasClass("prompt")){n="jcore/modal/prompt.jsp";q=true}else{if(s.hasClass("warning")){n="jcore/modal/warning.jsp";q=true}else{if(s.hasClass("permalink")){n="jcore/modal/permalink.jsp";q=true}}}}}if(q){if(s.attr("data-jalios-confirm-url")){n=s.attr("data-jalios-confirm-url")}if(n.indexOf("?")!==-1){n+="&"}else{n+="?"}var p=s.attr("data-jalios-text")||s.attr("title");n+=p?"msg="+a.jalios.Http.encode(p)+"&":"";$modal.addClass("modal-msg");const t=s.data("jalios-modal-title");t&&(n+="title="+a.jalios.Http.encode(t)+"&");var o=s.attr("data-jalios-modal-default");if(!o&&s.hasClass("permalink")){o=s[0].href}n+=o?"&defValue="+a.jalios.Http.encode(o)+"&":""}var m=s.get(0).href;if(m&&m.match(new RegExp("(jpg|jpeg|gif|png|bmp)([?][^?]+)*$","img"))){n="jcore/modal/image.jsp?url="+a.jalios.Http.encode(m)}var m=s.attr("data-jalios-modal-url");if(m){n=m}if(u&&u.url){n=u.url}$modal.modal("show");var l=a.extend(true,{},{target:"#jalios-modal",url:n,noscroll:true,nohistory:true,waiting:s.hasClass("modal-waiting")},u);l.callback=false;s.refresh(l);a.jalios.ui.CtxMenu.hide()},prompt:function(o,p,l,n){var m="jcore/modal/prompt.jsp?msg="+a.jalios.Http.encode(o);if(l){m+="&defValue="+l}n&&(m+="&title="+a.jalios.Http.encode(n));a.jalios.ui.Modal.openFromUrl(m,{callback:p,value:l});return false},confirm:function(n,o,m){var l="jcore/modal/confirm.jsp";let message;if(typeof n==="string"){message=n}else{if(a(n).exists()){let $trigger=a(n);message=$trigger.attr("data-jalios-text")||$trigger.attr("title");l=$trigger.attr("data-jalios-confirm-url")||l}}if(l.indexOf("?")!==-1){l+="&"}else{l+="?"}l+=message?"msg="+a.jalios.Http.encode(message):"";a.jalios.ui.Modal.openFromUrl(l,{params:{modalConfirm:true},callback:function(p){if(p&&!m){o(p)}if(!p&&m){o(p)}}});return false},alert:function(n,o){var l="jcore/modal/alert.jsp?msg="+a.jalios.Http.encode(n);var m={};if(o){m.callback=function(p){o(p)}}a.jalios.ui.Modal.openFromUrl(l,m);return false},confirmDanger:function(l,m){let $confirmDangerModal=this.getDangerModal(a(l),m);$confirmDangerModal.modal({keyboard:true,backdrop:"static"})},confirmInModal:function(m,s){var p=a(m);var r=p.closest("DIV.modal .modal-content .modal-footer");var l=p.closest("DIV.modal .modal-dialog");var t=p.attr("data-jalios-text")||p.attr("title")||I18N.glp("msg.js.confirm");var q=p.attr("data-jalios-text-confirm")||I18N.glp("com.lbl.ok");var o='<div class="modal-footer modal-confirm fade"><div class="row"><div class="confirm-message col-sm-7">'+t+'</div><div class="confirm-buttons col-sm-5"><a href="#" class="btn btn-default btn-cancel" data-dismiss="modal">'+I18N.glp("com.lbl.cancel")+'</a><a href="#" class="btn btn-danger btn-confirm">'+q+"</a></div></div></div>";var n=a(o);n.appendTo(r).delay(300).queue(function(u){a(this).addClass("in");l.addClass("modal-confirm-danger");u()});r.find(".modal-confirm .btn-cancel, .modal-confirm .btn-danger").on("click",function(x){x.preventDefault();var u=a(x.target);var z=u.closest(".modal-confirm");var v=a(this);if(u.hasClass("btn-confirm")){a(".modal-footer").hide();var y=document.getElementById("jalios-loading-wave").innerHTML;var w=Handlebars.compile(y);a(".modal-body").addClass("text-center").html(w())}if(u.hasClass("btn-cancel")&&l.hasClass("trash-modal")){x.preventDefault();x.stopPropagation();l.removeClass("modal-confirm-danger")}else{if(u.hasClass("btn-cancel")){return}}z.removeClass("in").delay(500).queue(function(A){s(v.hasClass("btn-danger"));z.remove();A()})})},close:function(l){a.jalios.ui.Modal.latest.value=l;a("#jalios-modal").modal("hide");return false},closeAndReload:function(l){a.jalios.ui.Modal.close();if(l){a.jalios.Browser.redirect(l)}else{a.jalios.Browser.reload()}return false},closeAndRefresh:function(){a.jalios.ui.Modal.close();a.jalios.AjaxRefresh.refreshTarget(a.jalios.ui.Modal.latest.trigger);return false},closeAndFollow:function(l){a.jalios.ui.Modal.close(l);if(a.jalios.ui.Modal.latest.callback){return false}a.jalios.DOM.follow(a.jalios.ui.Modal.latest.trigger,"modal","value",l);return false},getModal:function(){var l=a("#jalios-modal");if(l.exists()){if(l.data("bs.modal").isShown){a.console.warn("[Modal]","Cannot open a Modal when a modal is already opened");return}l.children().hide().remove("A.ajax-refresh-url");l.prop("class","modal fade ajax-refresh-div").css("width","").css("marginLeft","").removeAttr("data-jalios-ajax-refresh-url");return l}l=a('<div id="jalios-modal" class="modal fade ajax-refresh-div" aria-modal="true" role="dialog"></div>').appendTo("BODY");l.modal({keyboard:true,backdrop:"static"});l.on("hidden.bs.modal",function(m){if(a.jalios.ui.Modal.latest.callback){a.jalios.ui.Modal.latest.callback(a.jalios.ui.Modal.latest.value)}});l.on("click",".modal-steps .clickable-step",function(m){a.jalios.ui.Modal.goToStep(m,a(this))});return l},getDangerModal:function(l,n){try{let that=this;let options={title:I18N.glp("confirm-danger.lbl.confirm-delete"),message:I18N.glp("confirm-danger.lbl.confirm-delete.message"),btnCancel:I18N.glp("confirm-danger.lbl.cancel"),btnDelete:I18N.glp("confirm-danger.lbl.delete")};let newTitle=l.data("jalios-confirm-title");if(newTitle){options.title=newTitle}let newMessage=l.data("jalios-confirm-message");if(newMessage){options.message=newMessage}let btnCancelLabel=l.data("jalios-cancel-button-label");if(btnCancelLabel){options.btnCancel=btnCancelLabel}let btnDeleteLabel=l.data("jalios-delete-button-label");if(btnDeleteLabel){options.btnDelete=btnDeleteLabel}let $confirmDangerModal=a("#confirm-danger-modal");let confirmModalHtml=a(Handlebars.compile(a('<script id="jalios-confirm-danger-modal" type="text/x-handlebars-template"><div class="modal fade modal-confirm" id="confirm-danger-modal"><div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header"><h4 class="modal-title">{{title}}</h4></div><div class="modal-body"><p>{{{message}}}</p></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{btnCancel}}</button><a class="btn btn-danger btn-confirm" data-jalios-confirm="true" href="#">{{btnDelete}}</a></div></div></div></div<\/script>').html())(options));if($confirmDangerModal.length===0){a("body").append(confirmModalHtml);$confirmDangerModal=a("#confirm-danger-modal");$confirmDangerModal.on("hidden.bs.modal",function(o){$confirmDangerModal.remove()});$confirmDangerModal.find(".btn-danger").on("click",function(o){that.confirmInModal(o.target,function(p){if(p){n(true);$confirmDangerModal.modal("hide")}})})}return $confirmDangerModal}catch(m){a.console.error(m);return undefined}},fixWidth:function(o){var l=a(o||".modal");var s=l.children("div, form").first();var p=s.width()||l.width();var r=s.find("IFRAME");if(r.exists()){try{p=r[0].contentWindow.document.body.offsetWidth}catch(n){r=false;a.console.warn("[modal] Can't read iFrame properties",n)}}var q=p/2;var m=a(window).width();if(m/2<q){q=0}var l=s.closest(".modal").css("marginLeft",-q+"px");if(r&&r.exists()){l.css("width",p+18+"px")}},goToStep:function(p,s){p.stopImmediatePropagation();var q=parseInt(s.data("step"));var o=a(s.closest("form"));var l=a(o.find("input[name=formStep]"));var n=parseInt(l.val());var r;var m;if(q>n){r=q-1;m=a(o.find("button[name=opNext]"))}else{r=q+1;m=a(o.find("button[name=opPrevious]"))}l.val(r);m.trigger("click")}};a(document).ready(function(l){g()})})(window.jQuery);var deprecatedModal=function(a){jQuery.console.warn("[Deprecated] "+a+": JCMS requires the new Modal framework");jQuery.console.stacktrace()};JCMS=window.JCMS||{};JCMS.window=JCMS.window||{};JCMS.window.Modal=JCMS.window.Modal||{};JCMS.window.Modal.close=jQuery.jalios.ui.Modal.close;JCMS.window.Modal.relocate=function(){deprecatedModal("Modal.relocate")};JCMS.window.Modal.showJSP=function(a,c,b){deprecatedModal("Modal.showJSP");if(typeof b=="object"){a+="?"+jQuery.param(b,true)}jQuery.jalios.ui.Modal.openFromUrl(a,{callback:c})};JCMS.window.Modal.confirm=function(c,a,b){deprecatedModal("Modal.confirm");jQuery.jalios.ui.Modal.confirm(c,a)};function promptJSAction(c,b,a){deprecatedModal("promptJSAction");jQuery.jalios.ui.Modal.prompt(c,b,a)}function promptAction(d,b,c,a){deprecatedModal("promptAction");jQuery.jalios.ui.Modal.prompt(d,function(e){if(e===false){return}jQuery.jalios.Browser.redirect(jQuery.jalios.Http.getUrlWithUpdatedParam(b,c,e))},a)}function confirmJSAction(b,a){deprecatedModal("confirmJSAction");jQuery.jalios.ui.Modal.confirm(b,a)}function confirmAction(b,a){deprecatedModal("confirmAction");jQuery.jalios.ui.Modal.confirm(b,function(){jQuery.jalios.Browser.redirect(a)});return false}function confirmNoAction(b,a){deprecatedModal("confirmNoAction");jQuery.jalios.ui.Modal.confirm(b,function(){jQuery.jalios.Browser.redirect(a)},true)};