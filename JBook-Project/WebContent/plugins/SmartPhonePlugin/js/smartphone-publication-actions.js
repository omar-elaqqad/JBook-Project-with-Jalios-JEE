!(function($) {
  // ------------------------------------------
  //  METHODS
  // ------------------------------------------

  const handleVote = function(event) {
    let $target = $(event.currentTarget);
    let isAlreadyVoted = $target.hasClass("is-active");
    let publicationId = $target.data("jalios-data-id");
    $.ajax({
      url: "plugins/SmartPhonePlugin/jsp/action/handleSmartPhoneAction.jsp",
      data: {
        opVote: !isAlreadyVoted,
        opRemoveVote: isAlreadyVoted,
        pub: publicationId
      }
    }).done(function(data) {
      if (data.actionStatus === "OK") {
        $target.toggleClass("is-active");
        if ($target.hasClass("is-active")) {
          $target.addClass("animated");
        }
        $.ajax({
          url: "plugins/SmartPhonePlugin/jsp/core/pub/doPubSocialFooter.jsp",
          data: {
            pubId: publicationId
          }
        }).done(function(html) {
          $(
            ".pub-social-footer[data-jalios-data-id=" + publicationId + "]"
          ).html($(html).html());
        });
      }
    });
  };

  // ------------------------------------------
  //  INIT
  // ------------------------------------------
  $(document).on("tap", ".action-item-vote", handleVote);
})(window.jQuery);
