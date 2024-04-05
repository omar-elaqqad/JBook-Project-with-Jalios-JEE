!(function($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }
  if (!$.jalios.smartPhone) {
    $.jalios.smartPhone = {};
  }

  $.jalios.smartPhone.Badge = {
    levels: {
      INFO: "badge-info",
      WARN: "badge-warning",
      DANGER: "badge-danger"
    },

    /*
      Set a badge on a given $element

      config:{
        $element: the element where you want the badge to appear,
        level: $.jalios.smartPhone.Badge.levels (INFO,WARN,DANGER),
        value: the badge number (must be an integer)
        customCss: add custom css classes,
        animate: if true, the badge will animate
      }
    */
    setBadge: function(config) {
      if (!config.$element || config.$element.length == 0) return;

      let defaultConfig = {};
      defaultConfig.level = $.jalios.smartPhone.Badge.levels.INFO;
      defaultConfig.animate = false;
      defaultConfig.value = 0;

      config = $.extend({}, defaultConfig, config);

      let badge = config.$element.data("smartphone-badge");
      if (badge) {
        badge.update(config.level, config.value);
      } else if (config.value > 0) {
        badge = new Badge(
          config.$element,
          config.level,
          config.value,
          config.customCss
        );
        badge.render();
      }
      if (config.animate && badge) badge.animate();
    }
  };

  // =======================================================================
  // ********************** BADGE******* ***********************************
  // =======================================================================
  var Badge = function($parent, level, value, customCss) {
    this.$parent = $parent;
    this.level = level;
    this.value = value;
    this.customCSS = customCss;
  };

  Badge.prototype.render = function() {
    let customCssClass = this.level + " smartphone-badge";
    if (this.customCSS !== undefined) {
      customCssClass += " " + this.customCSS;
    }
    this.$element = $("<SPAN>", {
      class: customCssClass,
      text: this.value
    });
    this.$parent.addClass("smartphone-badge-parent");
    this.$parent.append(this.$element);
    this.$parent.data("smartphone-badge", this);
  };

  Badge.prototype.update = function(level, newValue, animate) {
    if (newValue === 0) {
      this.remove();
      return;
    }

    this.$element.removeClassStartingWith("badge-");
    this.$element.removeClass("one-digit");
    this.$element.removeClass("two-digit");
    this.$element.removeClass("three-digit");

    if (newValue < 10) {
      this.$element.addClass("one-digit");
    } else if (newValue >= 10 && newValue < 100) {
      this.$element.addClass("two-digit");
    } else if (newValue >= 100) {
      this.$element.addClass("three-digit");
      text = "99+";
    }

    this.$element.text(newValue);
    this.$element.addClass(level);

    this.level = level;
    this.value = newValue;
  };

  Badge.prototype.animate = function() {
    let that = this;
    this.$element.removeClass("badge-animate");
    setTimeout(function() {
      that.$element.addClass("badge-animate");
    }, 10);
  };

  Badge.prototype.remove = function() {
    this.$element.remove();
    this.$parent.removeData("smartphone-badge");
    this.$parent.removeClass("smartphone-badge-parent");
  };
})(window.jQuery);
