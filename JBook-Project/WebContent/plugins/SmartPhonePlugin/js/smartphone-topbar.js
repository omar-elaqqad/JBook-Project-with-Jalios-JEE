!(function($) {
  const closeMemberMenu = function() {
    let $memberMenuWrapper = $(".member-menu-wrapper");
    let $memberMenuWrapperTop = $(".member-menu-wrapper-top");
    let $topbar = $("#mobile-content-wrapper .topbar");

    // If member menu is closing, do nothing
    if ($memberMenuWrapper.hasClass("is-closing")) {
      return true;
    }

    setTimeout(function() {
      // Member menu is closed
      $memberMenuWrapper.removeClass("is-closing");
      // Member menu is no more displayed
      $memberMenuWrapper.removeClass("is-displayed");
    }, 350);
    // Hamburger not active
    $memberMenuWrapperTop.removeClass("is-active");

    // Start to close member menu
    $memberMenuWrapper.addClass("is-closing");

    // Remove topbar color
    $topbar.removeClass("member-menu-is-active");
  };

  var registerDomReady = function() {
    $(document).on("tap", ".js-toggle-member-menu", function(e) {
      e.preventDefault();
      e.stopPropagation();

      let $memberMenuWrapper = $(".member-menu-wrapper");
      let $memberMenuWrapperTop = $(".member-menu-wrapper-top");
      let $topbar = $("#mobile-content-wrapper .topbar");

      // If member menu is closing, do nothing
      if ($memberMenuWrapper.hasClass("is-closing")) {
        return true;
      }

      if ($memberMenuWrapper.hasClass("is-displayed")) {
        closeMemberMenu();
      } else {
        // Refresh member menu
        let $memberMenuWrappertabs = $(
          ".member-menu-wrapper .member-menu-tabs-content"
        );
        $.jalios.smartPhone.Ajax.refresh($memberMenuWrappertabs);

        // Show & slide member menu
        $memberMenuWrapper.addClass("is-displayed");

        // Change topbar color
        $topbar.addClass("member-menu-is-active");

        //Hambuger active show arrow
        $memberMenuWrapperTop.addClass("is-active");
      }
    });

    $(document).on(
      "click",
      ".topbar-my-day-overlay, .topbar-my-day-overlay-first",
      function(event) {
        $(".js-toggle-member-menu").trigger("click");
      }
    );

    $(document).on("click", ".js-close-mbr-menu", function(event) {
      $(".member-menu-wrapper").toggleClass("is-displayed");
    });

    $(document).on("click", ".tab-content A", function(event) {
      if ($(".member-menu-wrapper.is-displayed").length) {
        if (!$(event.currentTarget).hasClass("prevent-member-menu-toggle")) {
          closeMemberMenu();
        }
      }
    });

    $(document).on("pagecontainerbeforeshow", function(e) {
      //$.jalios.smartPhone.Util.enhanceComponent(".member-menu-wrapper");
    });
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
