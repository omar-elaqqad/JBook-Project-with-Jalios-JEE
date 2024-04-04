(function ($, window, document, undefined) {
  // ------------------------------------------
  //  PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.launcher) {
    $.jalios.launcher = {};
  }

  $.jalios.launcher.init = function (element) {
    return new Launcher(element);
  };

  $.jalios.launcher.getLauncher = function (element) {
    //TODO
  };

  // =======================================================================
  // ********************** UTILITYS ***************************************
  // =======================================================================
  var Utils = {
    log: function (message) {
      $.console.log(message);
    },
    checkInView: function ($container, containerWidth, $elem, partial) {
      let startX = -parseInt($container.css('left'), 10);
      let endX = startX + containerWidth + 1;

      let elemStartX = parseInt($elem.position().left, 0);
      let elemEndX = elemStartX + $elem.width();

      if (elemStartX >= startX && elemEndX <= endX) {
        return true;
      }

      return false;
    },
    BadgeLevel: {
      info: 1,
      warning: 2,
      danger: 3
    }
  };

  var LauncherTemplates = {};
  var addConstantPropertyOnObject = function (obj, constant_name, constant_value) {
    Object.defineProperty(LauncherTemplates, constant_name, {
      value: constant_value,
      writable: false,
      enumerable: true,
      configurable: true
    });
  };

  const ApplicationStore = function (launcher) {
    this.isIE11 = !!window.MSInputMethodContext && !!document.documentMode;
    this.isSafari =
      navigator.vendor &&
      navigator.vendor.indexOf('Apple') > -1 &&
      navigator.userAgent &&
      navigator.userAgent.indexOf('CriOS') == -1 &&
      navigator.userAgent.indexOf('FxiOS') == -1;
    var that = this;
    this.launcher = launcher;
    this.$element = this.launcher.$element.parent();

    $(document).on('click', function (event) {
      let $target = $(event.target);
      let $closest = $target.closest('.js-app-install');
      if ($target.hasClass('js-app-install') || $closest.length > 0) {
        return true;
      }
      that.removeStoreDropdown();
    });

    this.init();
  };

  ApplicationStore.prototype.init = function () {
    var that = this;
    this.$element.find('.app-search-store').click(function (event) {
      that.display();
    });
    this.$element.find('.app-search-store').keydown(function (event) {
      if(event.keyCode === 32) {
        that.display();
        event.preventDefault();
      }      
    });
  };

  ApplicationStore.prototype.display = function () {
    var that = this;
    this.$element.find('.topbar-ctxmenu-header').hide();
    this.$element.find('.topbar-ctxmenu-body').hide();

    let html = LauncherTemplates.APPLICATION_STORE_MENU();
    this.$element.append(html);

    this.$element.find('.app-search-input').focus();

    this.search('');

    this.$element.find('.js-close-app-store').click(function (event) {
      event.preventDefault();
      event.stopPropagation();
      event.stopImmediatePropagation();
      that.remove();
      $(".app-search-store").focus();
    });
    this.$element.find('.js-close-app-store').keydown(function (event) {
      if(event.keyCode === 32) {
        that.display();
        event.preventDefault();
        that.remove();
        $(".app-search-store").focus();
      }      
    });    

    this.$element.find('.app-search-input').on('input', function (event) {
      that.triggerNewSearch($(event.currentTarget).val());
    });
  };

  ApplicationStore.prototype.removeTimeout = function () {
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
  };

  ApplicationStore.prototype.triggerNewSearch = function (text) {
    var that = this;
    this.removeTimeout();
    this.timeout = setTimeout(function () {
      that.search(text);
    }, 300);
  };

  ApplicationStore.prototype.updatePs = function () {
    if (this.isIE11 || this.isSafari) {
      return;
    }

    var that = this;
    if (this.ps == null) {
      let $applicationStore = this.$element.find('.application-store');
      this.ps = new PerfectScrollbar($applicationStore[0]);
      $applicationStore.on('ps-scroll-y', function (event) {
        that.removeStoreDropdown();
      });
    } else {
      this.ps.update();
    }
  };

  ApplicationStore.prototype.remove = function () {
    this.$element.find('.topbar-ctxmenu-header').show();
    this.$element.find('.topbar-ctxmenu-body').show();
    this.$element.find('.topbar-ctxmenu-header.applications-store-search-header').remove();
    this.$element.find('.topbar-ctxmenu-body.application-store').remove();
    this.$element.find('.application-store-redirect').remove();
    this.launcher.$element.find('.js-store-dropdown-install').remove();
    this.removeStoreDropdown();
    this.ps = null;
    this.launcher.navTabs.checkDisplayArrows();
  };

  ApplicationStore.prototype.removeStoreDropdown = function () {
    if (this.$dropdownMenu) {
      this.$dropdownMenu.remove();
    }
    if (this.$currentApplicationWrapper) {
      this.$currentApplicationWrapper.removeClass('store-dropdown-open');
    }
  };

  ApplicationStore.prototype.search = function (text) {
    var that = this;
    this.launcher.service.searchApplication(
      {
        text: text
      },
      function (result) {
        that.displayApplications(result);
      },
      function (result) {
        Utils.log('Error : ' + result);
      }
    );
  };

  ApplicationStore.prototype.updateInstalledApplicationsCssClass = function () {
    var that = this;
    let tabs = that.launcher.applicationLauncherJson.tabs;
    let isInstalled = false;
    this.$element.find('.application-wrapper').each(function (index, element) {
      let shortcutId = $(element).find('.js-app-install').data('jalios-dataid');
      isInstalled = false;
      $.each(tabs, function (index, item) {
        $.each(item.applications, function (appIndex, app) {
          if (app.shortcutId == shortcutId) {
            isInstalled = true;
            return false;
          }
        });
      });

      if (isInstalled) {
        $(element).addClass('is-installed');
      } else {
        $(element).removeClass('is-installed');
      }
    });
  };

  ApplicationStore.prototype.displayAndPositionDropdownMenu = function ($target) {
    let $applicationwrapper = $target.closest('.application-wrapper');
    this.$currentApplicationWrapper = $applicationwrapper;
    this.$currentApplicationWrapper.addClass('store-dropdown-open');

    this.$dropdownMenu = this.launcher.$element.parent().find('.js-store-dropdown-install');
    let $storeHeader = this.$element.find('.applications-store-search-header');

    this.$dropdownMenu.css('display', 'block');
    this.$dropdownMenu.css(
      'top',
      $applicationwrapper.position().top + $storeHeader.height() + $applicationwrapper.height() / 2
    );

    let positionLeft = $applicationwrapper.width() - this.$dropdownMenu.width();
    this.$dropdownMenu.css('left', positionLeft + 'px');
  };

  ApplicationStore.prototype.displayApplications = function (json) {
    var that = this;

    var html = LauncherTemplates.APPLICATIONS_STORE(json);
    this.$element.find('.application-store').html(html);
    this.updatePs();

    this.updateInstalledApplicationsCssClass();

    let appCount = $(".topbar-application-launcher .topbar-ctxmenu-body  .application-wrapper").length;
    $(".js-application-launcher-search-live").html($.jalios.I18N.glp("appstore.lbl.search.aria-polite", appCount));

    this.$element.find('.js-app-install').click(function (event) {
      // Remove any previous dropdown
      that.launcher.$element.parent().find('.js-store-dropdown-install').remove();
      // Display new custom Dropdown install outside of menu
      let tabs = that.launcher.applicationLauncherJson.tabs;
      html = LauncherTemplates.APPLICATIONS_STORE_INSTALL_MENU(tabs);
      that.launcher.$element.parent().prepend(html);

      // Position dropdown menu
      that.displayAndPositionDropdownMenu($(event.currentTarget));

      let shorcutId = $(event.currentTarget).data('jalios-dataid');

      $.each(tabs, function (index, item) {
        $.each(item.applications, function (appIndex, app) {
          if (app.shortcutId == shorcutId) {
            let $li = that.$dropdownMenu.find('li:eq(' + index + ')');
            $li.addClass('js-app-installed');
            $li.find('.app-list-check').removeClass('hide');
            return false;
          }
        });
      });

      that.$dropdownMenu.find('li').click(function (event) {
        event.preventDefault();
        event.stopPropagation();
        let index = $(event.currentTarget).data('jalios-index');
        if ($(event.currentTarget).hasClass('js-app-installed')) {
          that.launcher.removeApp(shorcutId, index);
        } else {
          that.launcher.installApp(shorcutId, index);
        }
        that.removeStoreDropdown();
      });
      
    });
  };

  const NavTabs = function (launcher) {
    this.launcher = launcher;
    this.navMenuWidth = 320;
    this.$element = launcher.$element.find('.nav-tabs-wrapper');
    this.$scrollers = launcher.$element.find('.scroller');
    this.$scrollerLeft = launcher.$element.find('.scroller.scroller-left');
    this.$scrollerRight = launcher.$element.find('.scroller.scroller-right');
    this.$navTabs = this.$element.find('.nav-tabs');
    this.init();
  };

  NavTabs.prototype.init = function () {
    this.initListeners();
    this.updateAddTabIconTopBar();
  };

  NavTabs.prototype.updateAddTabIconTopBar = function () {
    if (this.$navTabs.find('.application-nav-tab').length > 1) {
      this.launcher.$element.closest('.topbar-application-launcher').find('.add-new-tab-topbar').addClass('hide');
    } else {
      this.launcher.$element.closest('.topbar-application-launcher').find('.add-new-tab-topbar').removeClass('hide');
    }
  };

  NavTabs.prototype.initListeners = function () {
    var that = this;
    this.$scrollers.click(function (event) {
      if ($(event.currentTarget).hasClass('scroller-left')) {
        that.scrollNav('left');
      } else {
        that.scrollNav('right');
      }
    });
  };

  NavTabs.prototype.updateTabsBadge = function () {
    var that = this;
    this.$element.find('.application-nav-tab-link').each(function (index, tab) {
      let $tab = $(tab);
      let $tabBadge = $tab.find('.topbar-item-badge');
      let tabId = $tab.data('target');
      tabId = tabId.substring(1, tabId.length);
      let $tabContent = that.launcher.$element.find('#' + tabId);

      let $badges = $tabContent.find('.tab-applications-items .topbar-item-badge');
      if ($badges.length > 0) {
        $tabBadge.removeClass('hide');
        $tabBadge.removeClass('app-badge-level-info');
        $tabBadge.removeClass('app-badge-level-warning');
        $tabBadge.removeClass('app-badge-level-danger');

        //let totalCount = 0;
        let level = 'info';
        let levelIndex = 0;
        $badges.each(function (index, badge) {
          //let badgeCount = parseInt($(badge).text(), 10);
          let badgeLevel = $(badge).data('level');
          let badgeLevelIndex = Utils.BadgeLevel[badgeLevel];
          if (badgeLevelIndex > levelIndex) {
            level = badgeLevel;
            levelIndex = badgeLevelIndex;
          }
          //totalCount += badgeCount;
        });

        //$tabBadge.text(totalCount);
        $tabBadge.addClass('app-badge-level-' + level);
      } else {
        $tabBadge.addClass('hide');
      }
    });
  };

  NavTabs.prototype.getTotalWidth = function () {
    let totalWidth = 1;
    this.$navTabs.find('li').each(function (index, element) {
      totalWidth += $(element).width();
    });
    return totalWidth;
  };

  NavTabs.prototype.getCurrentScrollLeft = function () {
    return parseInt(this.$navTabs.css('left'), 10);
  };

  NavTabs.prototype.scrollNav = function (direction) {
    var that = this;

    let $aimTab = null;
    let firstVisibleElementFound = false;
    this.$navTabs.find('.application-nav-tab, .application-nav-tab-add').each(function (index, element) {
      if (Utils.checkInView(that.$navTabs, that.navMenuWidth, $(element), true)) {
        firstVisibleElementFound = true;
        if (direction == 'left') {
          return false;
        }
      } else {
        if (direction == 'right' && firstVisibleElementFound) {
          $aimTab = $(element);
          return false;
        }
      }
      $aimTab = $(element);
    });

    let targetPosX;
    if (direction == 'left') {
      targetPosX = -$aimTab.position().left;
    } else {
      targetPosX = this.navMenuWidth - ($aimTab.width() + $aimTab.position().left);
    }

    this.$navTabs.one($.support.transition.end, function (e) {
      that.checkDisplayArrows();
    });
    this.$navTabs.css('left', targetPosX + 'px');
  };

  NavTabs.prototype.getTabMenuWidth = function () {
    let tabMenuWidth = this.$navTabs.closest('.nav-tabs-wrapper').outerWidth(true);
    return tabMenuWidth;
  };
  NavTabs.prototype.checkDisplayArrows = function () {
    let totalWidth = this.getTotalWidth();
    let tabMenuWidth = this.getTabMenuWidth();
    if (totalWidth > tabMenuWidth) {
      this.$navTabs.css('min-width', totalWidth + 'px');
      this.displayArrows();
    } else {
      this.removeArrows();
    }
  };

  NavTabs.prototype.checkDisplayLeftArrow = function () {
    if (parseInt(this.$navTabs.css('left'), 10) == 0) {
      this.$scrollerLeft.css('visibility', 'hidden');
    } else {
      this.$scrollerLeft.css('visibility', 'visible');
    }
  };

  NavTabs.prototype.checkDisplayRightArrow = function () {
    let isLastItemInView = Utils.checkInView(
      this.$navTabs,
      this.navMenuWidth,
      this.$navTabs.find('.application-nav-tab-add'),
      false
    );
    if (isLastItemInView) {
      this.$scrollerRight.css('visibility', 'hidden');
    } else {
      this.$scrollerRight.css('visibility', 'visible');
    }
  };

  NavTabs.prototype.displayArrows = function () {
    this.launcher.$element.addClass('display-arrows');
    this.checkDisplayLeftArrow();
    this.checkDisplayRightArrow();
  };

  NavTabs.prototype.removeArrows = function () {
    this.launcher.$element.removeClass('display-arrows');
  };

  NavTabs.prototype.focusLastTab = function () {
    let $lastTab = this.$navTabs.find('.application-nav-tab').last();
    $lastTab.find('a').click();

    let totalWidth = this.getTotalWidth();
    let tabMenuWidth = this.getTabMenuWidth();
    if (totalWidth > tabMenuWidth) {
      this.$navTabs.css('left', tabMenuWidth - totalWidth - $lastTab.width() + 'px');
    }
  };

  const EditTabMenu = function (launcher) {
    this.launcher = launcher;
    this.$element = this.launcher.$element.find('.launcher-navtab-menu');
    this.$validateDelete = this.launcher.$element.find('.tab-delete-confirm');
    this.initListeners();
  };

  EditTabMenu.prototype.initListeners = function () {
    var that = this;
    this.$element.find('.js-tab-menu-cancel').on("click keydown", function (event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      event.preventDefault();
      event.stopImmediatePropagation();
      that.removeMenu();
      that.launcher.removeBackdrop();
    });

    this.$element.find('.js-tab-menu-rename').on("click keydown", function (event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      event.preventDefault();
      event.stopImmediatePropagation();
      that.removeMenu();
      that.launcher.newAppTab.displayRename();
    });

    this.$element.find('.js-tab-menu-delete').on("click keydown", function (event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
      event.preventDefault();
      event.stopImmediatePropagation();
      that.removeMenu();
      //that.navTabs.updateAddTabIconTopBar();
      that.$validateDelete.removeClass('hide');
    });

    this.launcher.$backdrop.click(function (event) {
      that.removeMenu();
    });

    this.launcher.$element.find('.js-delete-tab-validate').click(function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      that.launcher.deleteActiveTab();
      that.removeMenu();
    });

    this.launcher.$element.find('.js-delete-tab-cancel').click(function (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      that.removeMenu();
    });
  };

  EditTabMenu.prototype.displayMenu = function (pageX, pageY) {
    this.launcher.displayBackdrop();
    if (this.launcher.navTabs.$navTabs.find('.application-nav-tab').length == 1) {
      this.$element.find('.js-tab-menu-delete').hide();
    }
    this.$element.css({
      display: 'block',
      left: pageX,
      top: pageY
    });
  };

  EditTabMenu.prototype.removeMenu = function () {
    this.$element.css('display', 'none');
    this.launcher.removeBackdrop();
    this.$validateDelete.addClass('hide');
  };

  const NewApplicationTab = function (launcher) {
    this.launcher = launcher;
    this.initListener();
  };

  NewApplicationTab.prototype.initListener = function () {
    var that = this;

    let $addNewTab = this.launcher.$element.parent().find('.add-new-tab');
    $addNewTab.click(function (event) {
      event.stopPropagation();
      event.stopImmediatePropagation();
      event.preventDefault();
      that.showAddTabInput();
    });
    $addNewTab.keydown(function (event) {
      if(event.keyCode === 32) {
        that.showAddTabInput();
        event.preventDefault();
      }      
    });
  };

  NewApplicationTab.prototype.displayRename = function () {
    this.launcher.navTabs.$navTabs.hide();
    this.launcher.navTabs.removeArrows();
    var html = LauncherTemplates.NEW_APPLICATION_INPUT();
    this.launcher.$element.find('.nav-tabs-wrapper').prepend(html);

    let currentName = this.launcher.navTabs.$navTabs.find('.application-nav-tab.active a').text();
    currentName = currentName.trim();

    this.$element = this.launcher.$element.find('.new-tab-display');

    this.$element.find('.tab-title').val(currentName);
    this.$element.find('.tab-title').focus();

    var that = this;
    this.$element.find('.js-cancel-new-tab').click(function (event) {
      event.preventDefault();
      event.stopPropagation();
      that.removeAddTabInput();
    });
    
    this.$element.find('.js-cancel-new-tab').keydown(function (event) {
      if(event.keyCode === 32) {
        that.removeAddTabInput();
        event.preventDefault();
      }      
    });

    this.$element.find('.js-create-new-tab').click(function (event) {
      event.preventDefault();
      event.stopPropagation();
      let tabTitle = that.$element.find('.tab-title').val();
      that.launcher.renameActiveTab(tabTitle);

      that.removeAddTabInput();
    });
    this.$element.find('.js-create-new-tab').keydown(function (event) {
      if(event.keyCode === 32) {
        let tabTitle = that.$element.find('.tab-title').val();
        that.launcher.renameActiveTab(tabTitle);
        event.preventDefault();
      }      
    });

    this.$element.find('.tab-title').keyup(function (event) {
      if (event.keyCode == 13) {
        that.removeAddTabInput();
        that.launcher.renameActiveTab($(event.target).val());
      }
    });
  };

  NewApplicationTab.prototype.showAddTabInput = function () {
    this.launcher.navTabs.$navTabs.hide();
    this.launcher.navTabs.removeArrows();

    var html = LauncherTemplates.NEW_APPLICATION_INPUT();
    this.launcher.$element.find('.nav-tabs-wrapper').prepend(html);
    this.$element = this.launcher.$element.find('.new-tab-display');
    this.$element.find('.tab-title').focus();

    var that = this;
    this.$element.find('.js-cancel-new-tab').click(function (event) {
      event.preventDefault();
      event.stopPropagation();
      that.removeAddTabInput();
    });

    this.$element.find('.js-create-new-tab').click(function (event) {
      event.preventDefault();
      event.stopPropagation();
      that.checkAndCreateNewTab();
    });

    this.$element.find('.tab-title').keyup(function (event) {
      if (event.keyCode == 13) {
        that.checkAndCreateNewTab();
      }
    });
  };

  NewApplicationTab.prototype.checkAndCreateNewTab = function () {
    let that = this;
    let tabTitle = that.$element.find('.tab-title').val();
    // Do nothing if tab title is empty
    if (tabTitle.trim() == '') return;

    that.removeAddTabInput();
    that.launcher.addTab(tabTitle);
  };

  NewApplicationTab.prototype.removeAddTabInput = function () {
    this.$element.remove();
    this.launcher.navTabs.$navTabs.show();
    this.launcher.navTabs.checkDisplayArrows();
  };

  var ApplicationClones = function (launcher) {
    this.launcher = launcher;
    this.isHelperActive = false;
  };

  /**
    Calcul width & height of all clones div (each tabs)
  **/
  ApplicationClones.prototype.recalculateActiveTabCloneDivDimension = function () {
    this.launcher.$tabActive
      .find('.tab-applications-items-clone')
      .width(this.launcher.$tabActive.find('tab-applications-items').width())
      .height(this.launcher.$tabActive.find('tab-applications-items').height());
  };

  ApplicationClones.prototype.resetActiveTabClones = function () {
    // Get current active tab clones
    var $tabClones = this.launcher.$tabActive.find('.tab-applications-items-clone');

    // Remove current clones
    $tabClones.empty();

    this.recalculateActiveTabCloneDivDimension();

    // loop through the original items...
    this.launcher.$tabActive
      .find('.tab-applications-items .launcher-application-item')
      .not('.exclude-me')
      .each(function () {
        // clone the original items to make their
        // absolute-positioned counterparts...
        var item = $(this);
        var item_clone = item.clone();
        // 'store' the clone for later use...
        item.data('clone', item_clone);

        // set the initial position of the clone
        var position = item.position();
        item_clone.css('left', position.left);
        item_clone.css('top', position.top);
        item_clone.addClass('is-clone');
        item_clone.find('.topbar-item-badge').remove();
        // append the clone...
        $tabClones.append(item_clone);
      });
  };

  ApplicationClones.prototype.helperOverTabHandler = function () {
    this.helperOver();
  };

  ApplicationClones.prototype.helperOutTabHandler = function () {
    if (!this.launcher.isOneTabDropActivated()) {
      this.helperOut();
    }
  };

  ApplicationClones.prototype.helperOut = function () {
    this.$appHelper.removeClass('helper-over-tab');
    this.launcher.$tabActive.find('.ui-sortable-placeholder').css('display', 'block');
    this.updatePositions();
  };

  ApplicationClones.prototype.helperOver = function () {
    this.$appHelper.addClass('helper-over-tab');
    this.launcher.$tabActive.find('.ui-sortable-placeholder').css('display', 'none');
    this.updatePositions();
  };

  ApplicationClones.prototype.updatePositions = function () {
    this.launcher.$tabActive
      .find(
        '.tab-applications-items .launcher-application-item:not(.exclude-me, .ui-sortable-placeholder, .app-draggable-clone)'
      )
      .each(function () {
        var item = $(this);
        var clone = item.data('clone');
        // stop current clone animations...
        clone.stop(true, false);
        // get the invisible item, which has snapped to a new
        // location, get its position, and animate the visible
        // clone to it...
        var position = item.position();

        clone.animate(
          {
            left: position.left,
            top: position.top
          },
          200
        );
      });
  };

  ApplicationClones.prototype.initHelper = function (ui) {
    var that = this;
    this.isHelperActive = true;
    this.$appHelper = ui.helper;
    this.$appHelper.addClass('exclude-me');
    this.$appHelper.addClass('application-sortable-helper');
    this.$appHelper.find('.topbar-item-badge').remove();
  };

  ApplicationClones.prototype.removeHelper = function () {
    this.isHelperActive = false;
  };

  ApplicationClones.prototype.startDrag = function () {
    // Show clones, hide legit
    this.launcher.$tabActive.find('.tab-applications-items-clone').removeClass('hide');
    this.launcher.$tabActive
      .find(".tab-applications-items .launcher-application-item:not('.app-draggable-clone, .exclude-me')")
      .css('visibility', 'hidden');
  };

  var Launcher = function (element) {
    this.$element = $(element);
    this.$element.data('jalios-launcher', this);
    this.applicationClones = new ApplicationClones(this);
    this.isIE11 = !!window.MSInputMethodContext && !!document.documentMode;
    this.isSafari =
      navigator.vendor &&
      navigator.vendor.indexOf('Apple') > -1 &&
      navigator.userAgent &&
      navigator.userAgent.indexOf('CriOS') == -1 &&
      navigator.userAgent.indexOf('FxiOS') == -1;
    this.initGlobalEvents();
    this.init();
  };

  Launcher.prototype.initGlobalEvents = function () {
    var that = this;
    $(document).on('jalios.application-launcher', function (event) {
      let eventName = event.applicationLauncher.name;
      if (eventName == 'addApplication' || eventName == 'removeApplication') {
        that.update();
      }
    });
  };

  Launcher.prototype.init = function () {
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATION_LAUNCHER',
      Handlebars.compile(this.$element.find('.application-launcher-template').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATION',
      Handlebars.compile(this.$element.find('.application-template').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'NEW_APPLICATION_INPUT',
      Handlebars.compile(this.$element.find('.new-tab-application-template').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATION_TAB',
      Handlebars.compile(this.$element.find('.application-tab-template').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATION_TAB_CONTENT',
      Handlebars.compile(this.$element.find('.application-tab-content-template').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATION_STORE_MENU',
      Handlebars.compile(this.$element.find('.application-store-menu').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATIONS_STORE',
      Handlebars.compile(this.$element.find('.applications-store').html())
    );
    addConstantPropertyOnObject(
      LauncherTemplates,
      'APPLICATIONS_STORE_INSTALL_MENU',
      Handlebars.compile(this.$element.find('.application-store-install-menu').html())
    );

    this.service = $.jalios.launcher.service.getInstance();
    this.ApplicationStore = new ApplicationStore(this);
    this.loadApplicationLauncher(this.initApplicationLauncher);
  };

  Launcher.prototype.displayBackdrop = function () {
    this.$backdrop.removeClass('hide');
  };

  Launcher.prototype.deleteActiveTab = function () {
    this.navTabs.$navTabs.find('.application-nav-tab.active').remove();
    this.saveApplicationLauncher();
    // Re-init
    this.initApplicationLauncher();
  };

  Launcher.prototype.removeBackdrop = function () {
    this.$backdrop.addClass('hide');
  };

  Launcher.prototype.renameActiveTab = function (tabName) {
    if (tabName.trim() == '') {
      return;
    }
    this.navTabs.$navTabs.find('.application-nav-tab.active .tab-name').text(tabName);
    this.saveApplicationLauncher();
  };

  Launcher.prototype.installApp = function (shorcutId, tabIndex) {
    if (this.applicationLauncherJson.tabs[tabIndex].applications == null) {
      this.applicationLauncherJson.tabs[tabIndex].applications = [];
    }
    this.applicationLauncherJson.tabs[tabIndex].applications.push({
      shortcutId: shorcutId
    });

    this.ApplicationStore.updateInstalledApplicationsCssClass();
    this.saveApplicationLauncherJsonAndUpdateMenu();
  };

  Launcher.prototype.removeApp = function (shorcutId, tabIndex) {
    var that = this;
    this.applicationLauncherJson.tabs[tabIndex].applications.each(function (item, index) {
      if (item.shortcutId == shorcutId) {
        that.applicationLauncherJson.tabs[tabIndex].applications.splice(index, 1);
      }
    });
    this.ApplicationStore.updateInstalledApplicationsCssClass();
    this.saveApplicationLauncherJsonAndUpdateMenu();
  };

  Launcher.prototype.addTab = function (tabName) {
    let that = this;
    this.tabIndex++;

    // Insert nav-tab
    let html = LauncherTemplates.APPLICATION_TAB({
      name: tabName,
      index: this.tabIndex
    });
    $(html).insertAfter(this.navTabs.$navTabs.find('.application-nav-tab').last());

    // Insert nav-tab-content
    html = LauncherTemplates.APPLICATION_TAB_CONTENT({
      index: this.tabIndex
    });

    this.$element.find('.tab-content').append(html);

    //Save json
    this.saveApplicationLauncher(function () {
      // Focus last tab
      that.navTabs.focusLastTab();
    });

    // Re-init
    this.initApplicationLauncher();
  };

  Launcher.prototype.update = function () {
    this.loadApplicationLauncher(this.initApplicationLauncher);
  };

  Launcher.prototype.initApplicationLauncher = function () {
    var that = this;
    this.destroyPs();
    this.displayApplicationLauncher(function () {
      that.navTabs = new NavTabs(that);
      that.initElementsVariables();
      that.initTabEditionMenu();
      that.initActiveTabListener();
      that.initListeners();
      that.initApplicationsSortable();
      that.initTabsSortable();
      that.initTabsDroppable();
      that.initBinDroppable();
      that.refreshShortcutBadges();

      that.navTabs.checkDisplayArrows();
      that.newAppTab = new NewApplicationTab(that);

      that.$element.closest('.topbar-application-launcher').find(' > .dropdown-menu').removeClass('is-loading');
      that.$element
        .closest('.topbar-application-launcher')
        .find('.js-topbar-add-menu')
        .on('click', function (event) {
          if ($(event.target).hasClass('js-topbar-add-menu')) {
            $(event.target).addClass('open');
            event.stopPropagation();
            event.stopImmediatePropagation();
          }
        });
      $.jalios.launcher.service.getInstance().triggerEvent("renderComplete");
    });
  };

  Launcher.prototype.refreshShortcutBadges = function () {
    var that = this;
    this.$element.find('[data-jalios-application-async-url]').each(function (index, element) {
      var $item = $(element);
      var shortcutId = $item.data('jalios-dataid');
      $.getJSON(
        $item.data('jalios-application-async-url'),
        {
          shortcutId: shortcutId
        },
        function (data) {
          if (data) {
            if ($item.find('.topbar-item-badge').exists()) {
              $item.find('.topbar-item-badge').remove();
            }

            if (data.title) {
              $item.find('.label-wrapper').html(data.title);
            }
            if (data.url) {
              $item.attr('href', data.url);
            }

            var hasBadge = data.badgeLevel && data.badgeText;
            if (hasBadge) {
              var newBadge = $('<span>', {
                "class": 'topbar-item-badge fade'
              });
              newBadge.html(data.badgeText);
              newBadge.data('level', data.badgeLevel.toLowerCase());
              newBadge.addClass('app-badge-level-' + data.badgeLevel.toLowerCase());
              if (data.badgeTitle) {
                newBadge.attr('title', data.badgeTitle);
              }
              $item.prepend(newBadge);
              newBadge.addClass('in');
            }
            that.navTabs.updateTabsBadge();
          }
        }
      );
    });
  };

  Launcher.prototype.initElementsVariables = function () {
    this.$navtabMenu = this.$element.find('.launcher-navtab-menu');
    this.$backdrop = this.$element.find('.application-launcher-backdrop');
    this.$bin = this.$element.find('.application-trash');
  };

  Launcher.prototype.initTabEditionMenu = function () {
    this.editTabMenu = new EditTabMenu(this);
  };

  Launcher.prototype.initListeners = function () {
    var that = this;
    this.navTabs.$navTabs.find('.launcher-navtab-menu-btn').on("click keydown", function (event) {
      if (!$.jalios.a11y.isFocusedClick(event)) {
        return;
      }
     
      that.editTabMenu.displayMenu(
        $(event.currentTarget).offset().left - that.navTabs.$navTabs.offset().left + parseInt(that.navTabs.$navTabs.css('left'), 10),
        $(event.currentTarget).offset().top - that.navTabs.$navTabs.offset().top
      );
    });
  };

  Launcher.prototype.displayBin = function () {
    var that = this;
    this.$bin.addClass('active');
  };

  Launcher.prototype.removeBin = function () {
    this.$bin.removeClass('active');
  };

  Launcher.prototype.initBinDroppable = function () {
    var that = this;
    this.$bin.find('.trash-overlay').droppable({
      accept: '.launcher-application-item',
      over: function (event, ui) {
        $(event.target).parent().addClass('application-over-bin');
        that.applicationClones.$appHelper.addClass('helper-over-tab');
      },
      out: function (event, ui) {
        $(event.target).parent().removeClass('application-over-bin');
        that.applicationClones.$appHelper.removeClass('helper-over-tab');
      },
      drop: function (event, ui) {
        $(ui.draggable).remove();
        $(event.target).parent().removeClass('application-over-bin');
        that.updatePs();
      }
    });

    this.$bin.removeClass('not-initialized');
  };

  Launcher.prototype.initTabsDroppable = function () {
    var that = this;
    let $tabs = this.navTabs.$navTabs.find('li:not(.add-new-tab)');
    $tabs.droppable({
      accept: '.launcher-application-item',
      over: function (event, ui) {
        $(event.target).addClass('tab-drop-over');
        that.applicationClones.helperOverTabHandler();
      },
      out: function (event, ui) {
        $(event.target).removeClass('tab-drop-over');
        that.applicationClones.helperOutTabHandler();
      },
      drop: function (event, ui) {
        /*let $uiHelperClone = $(ui.helper.clone());
        $uiHelperClone.removeAttr("data-jalios-dataid");
        $uiHelperClone.removeClass("exclude-me");
        that.$tabActive.find(".tab-applications-items").append($uiHelperClone);
        $uiHelperClone.addClass("launcher-slit-out-vertical");
        $uiHelperClone.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
          function(e) {
            $uiHelperClone.remove();
          });*/
      }
    });

    this.navTabs.$navTabs.find('li.active').droppable('destroy');
  };

  Launcher.prototype.initActiveTabListener = function () {
    var that = this;
    //Set initial active tab
    this.$tabActive = that.$element.find('.tab-applications.active');
    this.updatePs();

    // Listen to tab change
    this.$element.find('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      that.initTabsDroppable();
      var target = $(e.target).data('target');
      that.$tabActive = $(target);
      that.initApplicationsSortable();
      that.updatePs();
    });
    that.$tabActive = that.$element.find('.tab-applications.active');
  };

  Launcher.prototype.loadApplicationLauncher = function (callback) {
    var that = this;
    this.service.getApplicationLauncher(
      function (result) {
        try {
          that.applicationLauncherJson = result;
          that.tabIndex = that.applicationLauncherJson.tabs.length;
          if (callback) {
            callback.apply(that);
          }
        } catch (err) {
          //that.displayLoadingError();
          location.reload();
        }
      },
      function (error) {
        Utils.log(error);
        //that.displayLoadingError();
        location.reload();
      }
    );
  };

  Launcher.prototype.displayLoadingError = function () {
    this.$element.find('.ajax-loading-component').remove();
    this.$element.closest('.topbar-application-launcher').find(' > .dropdown-menu').removeClass('is-loading');
    this.$element.find('.application-launcher-error').removeClass('hide');
  };

  Launcher.prototype.removeLoadingError = function () {
    this.$element.find('.application-launcher-error').addClass('hide');
  };

  Launcher.prototype.displayApplicationLauncher = function (callback) {
    var that = this;
    var html = LauncherTemplates.APPLICATION_LAUNCHER(this.applicationLauncherJson);
    let $buffer = this.$element.find('.application-launcher-buffer');
    $buffer.html(html);
    $buffer.imagesLoaded(
      {
        // options...
      },
      function () {
        that.$element.html(html);
        callback();
      }
    );
  };

  Launcher.prototype.getApplicationLauncherAsJson = function () {
    let tabs = [];
    var that = this;
    this.$element.find('.nav-tabs .application-nav-tab a').each(function (index, element) {
      let tab = {};
      let applications = [];

      tab.name = $(element).find('.tab-name').text().trim();
      let tabId = $(element).data('target');

      that.$element
        .find(tabId)
        .find('.tab-applications-items .launcher-application-item')
        .each(function (index, element) {
          let application = {};
          let $element = $(element);
          let shortcutId = $element.data('jalios-dataid');
          let img = $element.find('img').attr('src');
          let name = $element.find('.label-wrapper').text().trim();
          let url = $element.attr('href');
          application.shortcutId = shortcutId;
          application.image = img;
          application.name = name;
          application.url = url;
          if ($element.data('jalios-application-async-url')) {
            application.asyncUrl = $element.data('jalios-application-async-url');
          }
          applications[index] = application;
        });

      tab.applications = applications;
      tabs[index] = tab;
    });

    var jsonData = JSON.stringify({
      tabs: tabs
    });

    return jsonData;
  };

  Launcher.prototype.saveApplicationLauncher = function (callback) {
    let json = this.getApplicationLauncherAsJson();
    this.applicationLauncherJson = JSON.parse(json);

    // Clean data
    let cleanedJSON = this.getCleanedApplicationLauncherJSON();

    this.service.saveApplicationLauncher(
      cleanedJSON,
      function (result) {
        Utils.log('Saved application launcher in member prefs');
        callback && callback();
      },
      function (error) {
        Utils.log('An error as occured during member prefs update');
      }
    );
  };

  Launcher.prototype.saveApplicationLauncherJsonAndUpdateMenu = function () {
    var that = this;

    // Clean data
    let cleanedJSON = this.getCleanedApplicationLauncherJSON();

    this.service.saveApplicationLauncher(
      cleanedJSON,
      function (result) {
        that.update();
      },
      function (error) {
        Utils.log('An error as occured during member prefs update');
      }
    );
  };

  Launcher.prototype.getCleanedApplicationLauncherJSON = function () {
    let cleanedJSON = $.extend(true, {}, this.applicationLauncherJson);

    $.each(cleanedJSON.tabs, function (key, value) {
      if (value.shortcutIds) {
        delete value.shortcutIds;
      }
      $.each(value.applications, function (appProp, appValue) {
        delete appValue.image;
        delete appValue.name;
        delete appValue.asyncUrl;
        delete appValue.url;
      });
    });

    return cleanedJSON;
  };

  Launcher.prototype.handleAppSortableEvent = function (event, ui) {
    this.applicationClones.removeHelper();
    // get the item we were just dragging, and
    // its clone, and adjust accordingly...
    this.$tabActive.find('a.exclude-me').each(function () {
      var item = $(this);
      var clone = item.data('clone');
      if (clone) {
        var position = item.position();

        // move the clone under the item we've just dropped...
        clone.css('left', position.left);
        clone.css('top', position.top);
        clone.show();
      }

      // remove unnecessary class...
      item.removeClass('exclude-me');
    });

    // make sure all our original items are visible again...
    this.$tabActive.find('.tab-applications-items .launcher-application-item').css('visibility', 'visible');
    this.$tabActive.find('.tab-applications-items-clone').addClass('hide');

    this.saveApplicationLauncher();
  };

  /**
   * Add app in new tab (check for duplicate)
   */
  Launcher.prototype.handleAppDroppableEvent = function (event, ui) {
    var data = {};
    var $helper = this.applicationClones.$appHelper;
    data.shortcutId = $helper.data('jalios-dataid');
    data.image = $helper.find('img').attr('src');
    data.name = $helper.find('.label-wrapper').text();
    data.url = $helper.attr('href');
    data.htmlAttributes = $helper.data('jalios-html-attributes');

    if ($helper.data('jalios-application-async-url')) {
      data.asyncUrl = $helper.data('jalios-application-async-url');
    }

    this.$tabActive.find("[data-jalios-dataid='" + data.shortcutId + "']").remove();

    // Add app in target tab if no duplicate
    const targetTabId = this.$element.find('.tab-drop-over a').data("target");
    const $targetTab = $(targetTabId);
    let alreadyExistApp = $targetTab.find(".tab-applications-items a[data-jalios-dataid='" + data.shortcutId + "']");
    if (!alreadyExistApp.length) {
      var html = LauncherTemplates.APPLICATION(data);
      $targetTab.find('.tab-applications-items').append(html);
    }

    // Refresh app badge if needed
    if ($(html).data('jalios-application-async-url')) {
      this.refreshShortcutBadges();
    }

    this.navTabs.$navTabs.find('li').removeClass('tab-drop-over');
    this.applicationClones.removeHelper();

    // Remove item dragged and his clone
    this.$tabActive.find('a.exclude-me').each(function () {
      var item = $(this);
      var clone = item.data('clone');
      clone.remove();
      clone.addClass('scale-out-bottom');
      item.remove();
    });

    // make sure all our original items are visible again...
    this.$tabActive.find('.tab-applications-items .launcher-application-item').css('visibility', 'visible');
    this.$tabActive.find('.tab-applications-items-clone').addClass('hide');

    this.saveApplicationLauncher();
    this.updatePs();
  };

  Launcher.prototype.destroyPs = function () {
    if (this.ps != null) {
      this.ps.destroy();
      this.ps = null;
    }
  };

  Launcher.prototype.updatePs = function () {
    if (this.isIE11 || this.isSafari) {
      return;
    }

    var that = this;
    if (this.ps == null) {
      let $tabContent = this.$element.find('.tab-content');
      this.ps = new PerfectScrollbar($tabContent[0]);
    } else {
      this.ps.update();
    }
  };

  Launcher.prototype.isOneTabDropActivated = function () {
    return this.navTabs.$navTabs.find('.tab-drop-over').length > 0;
  };

  Launcher.prototype.initTabsSortable = function () {
    var that = this;
    var $containement = that.$element.find('.nav-tabs');
    this.navTabs.$navTabs.sortable({
      delay: $.support.touch ? 150 : 0,
      items: '.application-nav-tab',
      tolerance: 'pointer',
      forceHelperSize: true,
      helper: 'clone',
      containment: $containement,
      cursorAt: {
        left: 30,
        top: 24
      },
      stop: function (event, ui) {
        that.saveApplicationLauncher();
      }
    });
  };

  Launcher.prototype.initApplicationsSortable = function () {
    var that = this;
    that.$tabActive.find('.tab-applications-items').sortable({
      helper: 'clone',
      start: function (e, ui) {
        that.destroyPs();
        that.applicationClones.initHelper(ui);
        that.applicationClones.resetActiveTabClones();
        that.applicationClones.startDrag();
        that.displayBin();
      },
      appendTo: that.$element,
      cursorAt: {
        left: 50,
        top: 41
      },
      change: function (e, ui) {
        that.applicationClones.updatePositions();
      },
      delay: 150,
      tolerance: 'pointer',
      stop: function (event, ui) {
        that.updatePs();
        that.removeBin();
        if (that.isOneTabDropActivated()) {
          that.handleAppDroppableEvent(event, ui);
        } else {
          that.handleAppSortableEvent(event, ui);
        }
      }
    });
  };

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
})(jQuery, window, document);
