!function($) {

  /**
   * Returns true if click occured on a Profile edit display TAB link.
   */
  var validateDisplayLoading = function($trigger) {
    // is profile tab link
    var validateProfileTabLink = $trigger && $trigger.hasClass("js-tab-link");
    // is child of "esn profile full display"
    validateProfileTabLink = validateProfileTabLink && $trigger.parents(".edit-member-profile").length > 0;
    var validateDisplayLoading = validateProfileTabLink;
    return validateDisplayLoading;
  };

  /**
   * Displays a loading effect after a delay if relevant.
   */
  var onJaliosAjaxRefreshBefore = function(refresh) {
    var $profileInner = $('.member-profile-inner');
    var $trigger = $(refresh.options.trigger);
    if (validateDisplayLoading($trigger)) {
      $($profileInner).displayLoading();
    }
  };

  var setSelectedTab = function(event) {
    var refresh = $.jalios.Event.match(event, 'refresh', 'before');
    if (refresh) {
      // Do not repeat after page reloaded
      return;
    }
    $form = $('.edit-member-profile FORM[name="editForm"]');
    // Get active tab index
    var $activeTab = $form.find('.edit-profile-tabs > UL LI.active');
    // Do not count tabdrop if any as it will make index invalid
    var $activeTabIndex = $form.find('.edit-profile-tabs > UL LI:not(.tabdrop)').index($activeTab);
    // Set active tab index
    $tabInput = $form.find('[name="openTabStr"]');
    if ($tabInput.length) {
      $tabInput.val($activeTabIndex);
    }
  };
  var onJaliosRefreshHandler = function(event) {
    var refresh = $.jalios.Event.match(event, 'refresh', 'before');
    if (refresh) {
      onJaliosAjaxRefreshBefore(refresh);
    }
    setSelectedTab(event);
  };

  var register = function() {
    $(document).on('jalios:refresh', onJaliosRefreshHandler);
  };
  $(document).ready(function() {
    register();
  });

}(window.jQuery);
