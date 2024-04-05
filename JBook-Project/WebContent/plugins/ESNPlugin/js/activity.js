!function ($) {
  "use strict";

  var lightbox_default_options = {
      preloading: true,
      captionType: "data",
      captionSelector: "self",
      navText: ['<span class="icomoon-arrow-left"></span>','<span class="icomoon-arrow-right"></span>'],
      closeText: '<span class="icomoon-cross"></span>',
      enableKeyboard: true,
      showCounter: true,
      nav: true
    };
  
  var DELETE_KEY = 8,
    TAB_KEY = 9,
    SPACE_KEY = 32,
    ENTER_KEY = 13,
    isResolvingUrl = false,
    pattern = /activity-show-comments/i;
  
  /* Toggles the activity comment form */
  var handleCommentToggle = function (event) {
    var broker = $.jalios.Event.match(event, 'broker', pattern, true);
    if (!broker) { return; }
    
    // Element
    var elm = broker.source.currentTarget;
    broker.options._broked = true;
    
    var $activityContainer = $(elm).closest(".activity");
    var $commentFormContainer = $(".activity-comment-form-toggler",$activityContainer);
    var $commentContainer = $(".activity-comments",$activityContainer);
    
    if ($commentContainer.hasClass("hide")) { 
      $commentFormContainer.toggleClass("hide");
      $commentContainer.toggleClass("hide");
      $.jalios.ui.Widget.smartFocus($commentFormContainer);      
    } else {
      $commentFormContainer.toggleClass("hide");
      $.jalios.ui.Widget.smartFocus($commentFormContainer);   
    }
    
    $commentContainer.find(".js-wysiwyg").initWysiwyg();
  };
  
  /* Toggles the activity comment form */
  var fixMaxHeightPortlet = function() {
    $(".activity-container").each(function() {
      var $that = $(this);
      var maxHeight = $that.height();
      $that.imagesLoaded( function() {
        $that.css("max-height", maxHeight + 250);
        $that.css("overflow-y", "auto");
      });
    })
  };
  

  var displayLoading = function(element){
    if(!$(element).find(".ajax-loading-component").length != 0){
      $(element).prepend("<div class='ajax-loading-component ajax-loading'></div>");
    }
    // Remove current animation if one is currently running 
    if($(element).find(".ajax-loading .ajax-loading-display").length != 0){
      $(element).find(".ajax-loading .ajax-loading-display").remove();
    }
    // Add animation
    $(element).find(".ajax-loading").append("<div class='ajax-loading-display'><div class='loader'></div></div>");
  };
  
 
  var handleRemovePage = function(event) {
    var $form = $(event.target).closest(".microblogging-form");
    
    if ($form.exists()) {
      // Keep an array of already removed webpages
      var data = $form.data("removedWebPage");
      if (data) {
        var removedWebPageArray = [$form.find("INPUT[name=webpageUrl]").val()];
        var newArray = data.concat(removedWebPageArray);
        $form.data("removedWebPage", newArray);
      } else {
        var removedWebPageArray = [$form.find("INPUT[name=webpageUrl]").val()];
        $form.data("removedWebPage", removedWebPageArray);
      }
      $form.find(".microblogging-webpage-wrapper").remove();
    }
  };

  let scrollToComments = function(event, $comments) {
    let $target = $(event.target);
    let $activity = $target.closest(".activity");
    let $commentWrapper = $activity.length ? $($activity[0]).find(".activity-comments-container .activity-comments") : $comments;
    if ($commentWrapper && $commentWrapper.length && $commentWrapper.hasClass("hide")) {
      $commentWrapper.removeClass("hide");
    }
    // Scroll to comment block
    if ($commentWrapper.length) {
      let $topbar = $('.topbar');
      let topbarHeight = $topbar.height() || 0;
      $('html,body').animate({ scrollTop: $($commentWrapper.get(0)).offset().top - topbarHeight}, 200);
      // Focus first :focusable
      let $focusableElt = $commentWrapper.find(':focusable').first();
      if ($focusableElt.length) {
        $focusableElt.focus();
      }
      $commentWrapper.addClass("highlighted");
      setTimeout(function(){
        $commentWrapper.removeClass("highlighted");
      }, 1000);
    }
    // Prevent next focused item to be trigerred after Enter pressed
    if (event && event.keyCode) {
      event.stopPropagation();
      event.preventDefault();
    }
  };
  
  const handleAjaxRefresh = function(event) {
    let refreshBefore = $.jalios.Event.match(event,'refresh','before');
    let refreshAfter = $.jalios.Event.match(event,'refresh','after');
    if (refreshAfter && $(event.refresh.target).hasClass("activity-add-vote")){
      let $voterList = $(event.refresh.target).closest(".activity").find(".activity-voter-list .vote-tag");
      let pubId = $(event.refresh.target).closest(".activity").data("jalios-pub-id");
      if ($voterList.exists()) {
        $voterList.refresh({
          url: 'front/vote/template/doVoteListDefaultTemplate.jsp',
          params: { "pubId" : pubId}
        });
      }
    }

    if (refreshBefore && $(event.refresh.target.context).hasClass("microblogging-form-tab")) {
      let $trigger = $(event.refresh.target.context);
      displayLoading($trigger.closest(".microblogging-form-wrapper").find(".microblogging-form"));
    }

    if (refreshBefore && $(event.refresh.target).hasClass("activity-comments-container")){
      $(event.refresh.target).closest(".activity").attr("js-scroll-to-comments-flag", "true");
    }

    if (refreshAfter && $(event.refresh.target).hasClass("activity-comments-container")){
      let $activity = $(event.refresh.target).closest('[js-scroll-to-comments-flag="true"]');
      if ($activity.length) {
        $activity.removeAttr("js-scroll-to-comments-flag");
        let $commentsSection = $activity.find(".activity-comments");
        if ($commentsSection.length) {
          scrollToComments(event, $commentsSection);
        }
      }
    }

    if (refreshAfter
          && event.refresh.options
          && event.refresh.options.params
          && event.refresh.options.params.activityNextpageButton === "true") {
      // Find listItem to move in previous role=list for same day
      let $allListItems = $(event.refresh.target).find('.activity');
      let updateParentList = function(){
        let $this = $(this);
        let day = $this.closest('[data-jalios-activity-day]').attr('data-jalios-activity-day');
        // Find if day has existing previous list
        let $container = $this.closest('.activity-container');
        let $existingParentLists = $container.find('.activity-day-list[data-jalios-activity-day="'+day+'"]');
        if ($existingParentLists.length > 1) {
          // Found multiple list for this day
          let $existingList = $($existingParentLists.get(0));
          let $duplicateList = $($existingParentLists.get(1));
          $duplicateList.find('.activity').each(function(){
            let $toMove = $(this);
            $.console.debug('[updateParentList]', 'move activity: ', $toMove, 'at: ', day, 'to existing day list: ', $existingList);
            $existingList.append($toMove);
          });
          $duplicateList.remove();
        }
      };
      $allListItems.each(updateParentList);
    }
  };
  
//  let handleShowComments = function(event) {
//    let refresh = $.jalios.Event.match(event, "refresh", "after");
//    if (!refresh) {
//      return;
//    }
//    if ($(event.refresh.currentTarget).hasClass("btn-show-comments")){
//      scrollToComments(event);
//    }
//  };

  var preventKeyPressOnWebPageForm = function () {
    var hasFocus = $('.webpage-resolver ').is(':focus');
    if(hasFocus) {
      return true;
    }
    return false;
  };

  let isFocusedClick = function (event) {
    if (!event){
      return false;
    } else if (event.type === 'click'){
      return true;
    } else if (event.type === 'keydown'){
      let code = event.charCode || event.keyCode;
      if (code === 32 || code === 13){
        return true;
      }
    }
    return false;
  }; // isFocusedClick
  
  var register = function() {
    $(document).on("jalios:broker", handleCommentToggle);
    $(document).on("click", ".remove-link", handleRemovePage);
    $(document).on("click", ".js-access-comment", scrollToComments);
    $(document).on("keydown", ".js-access-comment", function (event) {
      if (isFocusedClick(event)) {
        scrollToComments(event);
      }
    });
//    $(document).on("refresh:after", ".btn-show-comments", handleShowComments);
//    $(document).on("jalios:broker", ".btn-show-comments", handleShowComments);
//    $(document).on("jalios:broker", ".btn-show-comments", handleShowComments);
//    $(document).on("jalios:broker", handleShowComments);
    $(document).on('jalios:refresh', handleAjaxRefresh);
  };
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);