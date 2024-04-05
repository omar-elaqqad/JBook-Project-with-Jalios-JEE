!function ($) {
  var displayAllComment = false;
  var voted = false;
  
  var callback = function(event) {
    $(".js-dbcomment-toggler-target").toggleClass("hide");
    $(".comment-form INPUT[name=displayAllComments]").val("true");
    displayAllComment = true;
  }
  
  var register = function() {
    $(document).on("click",".js-dbcomment-toggler", callback);
    $(document).on("jalios:refresh", function(event) {
      let $targetFromRefresh = event.refresh.target;
      let dataId = $targetFromRefresh.closest(".target").data("jalios-dataid");
      var contentVoteListBefore = null;
      
      if (event.refresh.options && event.refresh.options.params && !event.refresh.options.params.hasOwnProperty("voteDisplayAll")) {
        if (event.refresh.type === "before") 
        {
          voted = $("LIKE-" + dataId).hasClass(".has-voted");
          contentVoteListBefore = $targetFromRefresh.closest(".target").find(".vote-list").html();
        }      
        
        let $valueDisplay = $(".comment-form INPUT[name=displayAllComments]").val();
        if (event.refresh.type === "after" && $targetFromRefresh.hasClass("vote-tag")) {         
          
          $targetFromRefresh.closest(".target").find(".vote-list").attr("data-jalios-ajax-refresh-url", DBCOMMENT_VOTE_LIST_URL);
          
          if (voted === false && $("LIKE-" + dataId).hasClass(".has-voted") === voted) {
            $targetFromRefresh.closest(".target").find(".vote-list").html(contentVoteListBefore);
          }
          
          if ($("LIKE-" + dataId).hasClass(".has-voted") === voted) {
            $targetFromRefresh.closest(".target").find(".vote-list").refresh({
              nohistory: true,
              params: {
                pubId: dataId
              }
            });
            voted = !voted;
          }
        }
      } else {
        if (!voted) {
          $targetFromRefresh.closest(".target").find(".vote-list").refresh({
            nohistory: true,
            params: {
              pubId: dataId,
              voteDisplayAll: "true"
            }
          });
           voted = !voted;
        }
      }
    });
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
  
}(window.jQuery);