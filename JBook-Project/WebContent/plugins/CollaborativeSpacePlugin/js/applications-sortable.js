!(function ($) {
  /* Do stuff on DOM Ready */
  const register = function () {
    $('#cs-header-tabs ul.nav-tabs').sortable({
      tolerance: 'pointer',
      forceHelperSize: true,
      helper: 'clone',
      delay: 150,
      containment: '#cs-header-tabs',
      items: '> li:not(.dropdown):not(#TabHeader_home):not(.add-application-tab)',
      stop: function (event, _ui) {
        let apps = $(event.target).find('> li[data-app-index]');
        let dropdownApps = $(event.target).find('li.dropdown li[data-app-index]');
        apps = [...apps, ...dropdownApps];
        let appIds = [];
        apps.each(function (element, index) {
          let id = $(element).data('portlet-id');
          if (id) {
            appIds.push(id);
            $(element).data('app-index', index);
          }
        });
        $.ajax({
          url: 'plugins/CollaborativeSpacePlugin/jsp/portal/collaborativeSpaceActions.jsp',
          traditional: true,
          method: 'post',
          data: {
            csId: $.plugin.CollaborativeSpace.getCSId(),
            appIds: appIds,
            opAppTabSwitch: true
          }
        });
      }
    });
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    register();
  });
})(window.jQuery);
