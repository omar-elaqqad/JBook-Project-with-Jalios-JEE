!(function ($) {
  const ACTION_URL = "plugins/BlogPlugin/jsp/handleBlogAction.jsp";

  const toggleButton = function() {
    $(".app-sidebar-section-subscription .btn-default").toggleClass("hide");
  }

  const handleBlogSubscription = function(data) {
    $.ajax({
      url: ACTION_URL,
      method: "post",
      data: data
    }).done(function(data) {
      toggleButton();
      toastr.options = {
        "positionClass": "toast-top-center"
      };
      toastr.info(data.message);
    });
  }

  const initTooltips = function() {
    let $tooltips = $('.app-blog, .blog-fulldisplay');
    $tooltips = $tooltips.find('[data-toggle="tooltip"]');
    $tooltips.tooltip();
  }; // initTooltips

  const register = function () {
    $(document).on("click", "[data-jalios-blog-action]", function (event) {
      let action = $(event.currentTarget).data("jalios-blog-action");
      switch (action) {
        case 'followBlog':
          handleBlogSubscription({
            opFollow: true,
            blog: $(event.currentTarget).data("jalios-data-id")
          });
          break;
        case 'unfollowBlog':
          handleBlogSubscription({
            opUnfollow: true,
            blog: $(event.currentTarget).data("jalios-data-id")
          });
          break;
      }
    });
    $(document).on('jalios:refresh', function (event) {
      if (event.refresh.type == 'after') {
        initTooltips();
      }
    });
  }

  // ------------------------------------------
  // READY
  // ------------------------------------------

  // Plugin initialization on DOM ready
  $(document).ready(function () {
    register();
    initTooltips();
  });
})(window.jQuery);
