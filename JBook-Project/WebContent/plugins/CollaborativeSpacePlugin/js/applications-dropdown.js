!(function ($) {
  /* Do stuff on DOM Ready */
  const register = function () {
    new EditTabMenu($('#cs-header-tabs'));
  };

  const EditTabMenu = function ($tabs) {
    this.$element = $tabs;
    this.$backdrop = $('.application-edition-backdrop');
    this.$backdrop.prependTo(document.body);
    this.$menu = $tabs.find('.dropdown-menu.applications-menu');
    this.$menu.prependTo(document.body);
    this.initListeners();
    let $tabsUL = $tabs.find('>ul');
    this.cspId = $tabsUL.data('csp-id');
    this.confirmMessage = $tabsUL.data('remove-app-confirm-message');
    this.redirectHomeUrl = $tabsUL.data('home-url');
    this.isOpen = false;
  };

  EditTabMenu.prototype.initListeners = function () {
    let that = this;

    this.$element.find('.application-menu-btn').click(function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();

      let $target = $(event.target);
      let displayX = $target.offset().left;
      let displayY = $target.offset().top;
      that.isEditable = $(event.target).closest('li').data('is-editable');
      that.displayMenu(displayX, displayY);
      that.$currentTab = $(event.target).closest('li');
      that.currentAppId = $(event.target).closest('li').data('portlet-id');
    });

    $(document).on('click', function (event) {
      if (that.isOpen) {
        event.preventDefault();
        event.stopImmediatePropagation();
        that.removeMenu();
        that.removeBackDrop();
      }
    });

    this.$backdrop.click(function (event) {
      that.removeMenu();
    });

    this.$menu.find('.js-tab-menu-rename').click(function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      that.removeMenu();
      $.jalios.ui.Modal.openFromUrl(
        'plugins/CollaborativeSpacePlugin/jsp/portal/doServiceRenameModal.jsp?id=' +
          that.currentAppId
      );
    });

    this.$menu.find('.js-tab-menu-delete').click(function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      that.removeMenu();

      $.jalios.ui.Modal.confirm(that.confirmMessage, function () {
        $.ajax({
          url: 'plugins/CollaborativeSpacePlugin/jsp/portal/collaborativeSpaceActions.jsp',
          traditional: true,
          method: 'post',
          data: {
            appId: that.currentAppId,
            opRemoveApp: true,
            csId: that.cspId,
          },
          success: function (event) {
            let activeTab = that.$element.find('li.active').first();
            if (!activeTab) {
              return;
            }
            $.jalios.Browser.redirect(that.redirectHomeUrl);
          },
        });
      });
    });
  };

  EditTabMenu.prototype.displayMenu = function (pageX, pageY) {
    this.isOpen = true;
    if (!this.isEditable) {
      this.$menu.find('.js-tab-menu-rename').hide();
    } else {
      this.$menu.find('.js-tab-menu-rename').show();
    }
    this.$menu.css({
      display: 'block',
      left: pageX,
      top: pageY,
    });

    this.displayBackDrop();
  };

  EditTabMenu.prototype.displayBackDrop = function () {
    //this.$backdrop.removeClass('hide');
  };

  EditTabMenu.prototype.removeBackDrop = function () {
    //this.$backdrop.addClass('hide');
  };

  EditTabMenu.prototype.removeMenu = function () {
    this.$menu.css('display', 'none');
    this.isOpen = false;
    this.removeBackDrop();
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function () {
    register();
  });
})(window.jQuery);
