!function(h){var d={preloading:true,captionType:"data",captionSelector:"self",navText:['<span class="icomoon-arrow-left"></span>','<span class="icomoon-arrow-right"></span>'],closeText:'<span class="icomoon-cross"></span>',enableKeyboard:true,showCounter:true,nav:true};var c=8,f=9,m=32,n=13,i=false,j=/activity-show-comments/i;var l=function(t){var q=h.jalios.Event.match(t,"broker",j,true);if(!q){return}var u=q.source.currentTarget;q.options._broked=true;var p=h(u).closest(".activity");var r=h(".activity-comment-form-toggler",p);var s=h(".activity-comments",p);if(s.hasClass("hide")){r.toggleClass("hide");s.toggleClass("hide");h.jalios.ui.Widget.smartFocus(r)}else{r.toggleClass("hide");h.jalios.ui.Widget.smartFocus(r)}s.find(".js-wysiwyg").initWysiwyg()};var o=function(){h(".activity-container").each(function(){var p=h(this);var q=p.height();p.imagesLoaded(function(){p.css("max-height",q+250);p.css("overflow-y","auto")})})};var g=function(p){if(!h(p).find(".ajax-loading-component").length!=0){h(p).prepend("<div class='ajax-loading-component ajax-loading'></div>")}if(h(p).find(".ajax-loading .ajax-loading-display").length!=0){h(p).find(".ajax-loading .ajax-loading-display").remove()}h(p).find(".ajax-loading").append("<div class='ajax-loading-display'><div class='loader'></div></div>")};var a=function(s){var q=h(s.target).closest(".microblogging-form");if(q.exists()){var t=q.data("removedWebPage");if(t){var r=[q.find("INPUT[name=webpageUrl]").val()];var p=t.concat(r);q.data("removedWebPage",p)}else{var r=[q.find("INPUT[name=webpageUrl]").val()];q.data("removedWebPage",r)}q.find(".microblogging-webpage-wrapper").remove()}};let scrollToComments=function(p,q){let $target=h(p.target);let $activity=$target.closest(".activity");let $commentWrapper=$activity.length?h($activity[0]).find(".activity-comments-container .activity-comments"):q;if($commentWrapper&&$commentWrapper.length&&$commentWrapper.hasClass("hide")){$commentWrapper.removeClass("hide")}if($commentWrapper.length){let $topbar=h(".topbar");let topbarHeight=$topbar.height()||0;h("html,body").animate({scrollTop:h($commentWrapper.get(0)).offset().top-topbarHeight},200);let $focusableElt=$commentWrapper.find(":focusable").first();if($focusableElt.length){$focusableElt.focus()}$commentWrapper.addClass("highlighted");setTimeout(function(){$commentWrapper.removeClass("highlighted")},1000)}if(p&&p.keyCode){p.stopPropagation();p.preventDefault()}};const b=function(p){let refreshBefore=h.jalios.Event.match(p,"refresh","before");let refreshAfter=h.jalios.Event.match(p,"refresh","after");if(refreshAfter&&h(p.refresh.target).hasClass("activity-add-vote")){let $voterList=h(p.refresh.target).closest(".activity").find(".activity-voter-list .vote-tag");let pubId=h(p.refresh.target).closest(".activity").data("jalios-pub-id");if($voterList.exists()){$voterList.refresh({url:"front/vote/template/doVoteListDefaultTemplate.jsp",params:{pubId:pubId}})}}if(refreshBefore&&h(p.refresh.target.context).hasClass("microblogging-form-tab")){let $trigger=h(p.refresh.target.context);g($trigger.closest(".microblogging-form-wrapper").find(".microblogging-form"))}if(refreshBefore&&h(p.refresh.target).hasClass("activity-comments-container")){h(p.refresh.target).closest(".activity").attr("js-scroll-to-comments-flag","true")}if(refreshAfter&&h(p.refresh.target).hasClass("activity-comments-container")){let $activity=h(p.refresh.target).closest('[js-scroll-to-comments-flag="true"]');if($activity.length){$activity.removeAttr("js-scroll-to-comments-flag");let $commentsSection=$activity.find(".activity-comments");if($commentsSection.length){scrollToComments(p,$commentsSection)}}}if(refreshAfter&&p.refresh.options&&p.refresh.options.params&&p.refresh.options.params.activityNextpageButton==="true"){let $allListItems=h(p.refresh.target).find(".activity");let updateParentList=function(){let $this=h(this);let day=$this.closest("[data-jalios-activity-day]").attr("data-jalios-activity-day");let $container=$this.closest(".activity-container");let $existingParentLists=$container.find('.activity-day-list[data-jalios-activity-day="'+day+'"]');if($existingParentLists.length>1){let $existingList=h($existingParentLists.get(0));let $duplicateList=h($existingParentLists.get(1));$duplicateList.find(".activity").each(function(){let $toMove=h(this);h.console.debug("[updateParentList]","move activity: ",$toMove,"at: ",day,"to existing day list: ",$existingList);$existingList.append($toMove)});$duplicateList.remove()}};$allListItems.each(updateParentList)}};var e=function(){var p=h(".webpage-resolver ").is(":focus");if(p){return true}return false};let isFocusedClick=function(p){if(!p){return false}else{if(p.type==="click"){return true}else{if(p.type==="keydown"){let code=p.charCode||p.keyCode;if(code===32||code===13){return true}}}}return false};var k=function(){h(document).on("jalios:broker",l);h(document).on("click",".remove-link",a);h(document).on("click",".js-access-comment",scrollToComments);h(document).on("keydown",".js-access-comment",function(p){if(isFocusedClick(p)){scrollToComments(p)}});h(document).on("jalios:refresh",b)};h(document).ready(function(p){k()})}(window.jQuery);