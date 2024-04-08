!function(e){var c="jcore/alert/app/alerts/getAlertAppStatus.jsp";var j=function(q){e.console.debug("[alert-app]","changePagerReverse");var y=e.jalios.alert.app.getForm();if(!y||!y.exists()){throw ("[alert-app] changePagerReverse: FORM not found. Cannot continue");return}var t=e.jalios.alert.app.getFormData();if(!t){throw ("[alert-app] changePagerReverse: formData not found. Cannot continue");return}var s=e(q.currentTarget);var x=s.data("jalios-options");if(!x){throw ("[alert-app] invalid (or no) data-jalios-options found on reverse link. Cannot continue");return}var u=x.params;if(!u){throw ("[alert-app] params not found in data-jalios-options ("+JSON.stringify(x)+"). Cannot continue");return}var w=u[e.jalios.alert.app.PARAM_PAGER_REVERSE_NAME];if(w===undefined){throw ("[alert-app] reverse value not found in params ("+JSON.stringify(x)+") of data-jalios-options ("+JSON.stringify(x)+"). Cannot continue");return}var v=":input[name='"+e.jalios.alert.app.PARAM_PAGER_REVERSE_NAME+"']";var r=y.find(v);if(r.exists()){e.console.debug("[alert-app]","Update reverse to",w);r.val(w)}else{r=e("<INPUT/>").attr("type","hidden").attr("name",e.jalios.alert.app.PARAM_PAGER_REVERSE_NAME).val(w);y.append(r)}y.refresh({isform:true})};var f=function(r){e.console.debug("[alert-app]","changeTab");var s=e(r.currentTarget);var q=s&&s.exists()?s.closest("LI.js-alert-tab").find(":input[name='alertTab']"):null;if(q&&q.exists()){e(":input[name='alertTab']").each(function(u,t){e(t).attr("checked",false)});q.attr("checked",true)}s.refresh({isform:true})};var k=function(s){e.console.debug("[alert-app]","markAsRead");var q=e(s.currentTarget).closest(".alert-card");if(!q.exists()||q.data("jalios-reading-in-progress")){return}q.data("jalios-reading-in-progress",true);var r=i(q);var t=q.hasClass("alert-read")?false:true;if(t){e.jalios.alert.markAsRead(r)}else{e.jalios.alert.markAsUnread(r)}};var p=function(){e.console.debug("[alert-app]","buildConfirmMarkAllRead");var q=e.jalios.alert.app.getFormData();e.ajax({url:c,data:q,type:"POST"}).done(function(r){d(r,q)})};var d=function(q,s){if(!q){return}e.console.debug("[alert-app]","confirmMarkAllRead");if(q.count===0){var r=e.jalios.I18N.glp("alerts.no-unread-alerts");toastr.options.timeOut=2000;toastr.options.positionClass="toast-top-center";toastr.info(r)}else{if(q.count>0){var t=q.count==1?e.jalios.I18N.glp("alerts.mark-all-read.confirm",q.count):e.jalios.I18N.glp("alerts.mark-all-read.confirm-2",q.count);e.jalios.ui.Modal.confirm(t,function(u){e.jalios.alert.markAllAsRead(s)})}}};var a=function(q){if(q.alert){e.console.debug("[alert-app]","handleAlertEvent, event: "+JSON.stringify(q.alert));if(q.alert.type==="action"){if(q.alert.action==="read"||q.alert.action==="unread"){n(q)}if(q.alert.action==="all-read"){h(q)}}else{if(q.alert.type==="refresh"){m(q)}}}};var n=function(s){e.console.debug("[alert-app]","afterReadOrUnread");if(!s||!s.alert){return}var q=g(s.alert.alertId);if(!q){return}var r=e(".read-mode-filters INPUT[name=alertReadMode]:checked").val();if(r==="all"){q.find(".js-alert-mark-as-read").toggleClass("hide");q.toggleClass("alert-read")}else{q.hide("fast",function(){q.remove();var t=e(".app-alerts .alert-card").length<=1;if(t){b()}})}q.data("jalios-reading-in-progress",false)};var h=function(q){e.console.debug("[alert-app]","afterAllRead");if(!q||!q.alert){return}b()};var b=function(){e.console.debug("[alert-app]","refreshAppForm");var q=e.jalios.alert.app.getForm();if(q&&q.exists()){q.refresh({isform:true})}};var o=function(q){if(q.oldDate==null||q.oldDate==""){return}b()};var m=function(r){e.console.debug("[alert-app]","refreshSidebarCounter");var q=e(".app-alerts-sidebar-unread-count");if(!q.exists()){return}if(!r.alert||!r.alert.unreadInfo){return}var t=r.alert.unreadInfo;var s=e(".app-alerts-sidebar-read-mode-suffix");if(t.count>0){q.text(t.count);s.show()}else{s.hide();q.text(0)}};var g=function(r){var q=e(".app-alerts .alert-card[data-jalios-alert-id='"+r+"']");return q};var i=function(q){var r=q.data("jalios-alert-id");return r};if(!e.jalios){e.jalios={}}if(!e.jalios.alert){e.jalios.alert={}}if(!e.jalios.alert.app){e.jalios.alert.app={}}e.jalios.alert.app={_APP_FORM_URL:"jcore/alert/app/doAlertAppInner.jsp",PARAM_PAGER_REVERSE_NAME:"alertListReverse",getForm:function(){return e("FORM.app-alert-form")},getFormData:function(){var q=e.jalios.alert.app.getForm();return q&&q.exists()?q.serializeArray():null}};var l=function(){e(document).on("click",".app-alerts .js-alert-tab",f);e(document).on("click",".app-alerts .js-alert-mark-as-read",k);e(document).on("click",".app-alerts .js-alert-mark-all-as-read",p);e(document).on("click",".app-alerts .js-alert-app-pager-reverse",j);e(document).on("jalios.date.change",".app-alerts .datepicker-wrapper .form-control",o);e(document).on("jalios:alert",a)};e(document).ready(function(){l()})}(window.jQuery);