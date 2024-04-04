!function ($) {
  const ACTION_URL = "admin/action/handleBackofficeAction.jsp";
  
  const register = function(){
    $(document).on('show.jalios.sidebar start-hide.jalios.sidebar', function(event) {
      $.ajax({
        url: ACTION_URL,
        traditional: true,
        data: {
          sidebarOpened: event.type === "show",
          opSaveSidebarPreference: true
        },
        type: "post"
      })
    });
  };

  
  $(document).ready(function() {
    register();
  });

}(window.jQuery);
