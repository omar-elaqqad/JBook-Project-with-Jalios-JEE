!(function($) {
  var toggleRssItemDescription = function(event) {
    var $rssItem = $(this).closest("DIV[data-jalios-rss-itemid]");

    if (!$rssItem) {
      return;
    }

    var descriptionId = $rssItem.data("jalios-rss-descriptionid");
    $("#" + descriptionId).toggleClass("hide");
    $rssItem.find(".rss-item-description-toggled").toggleClass("hide");

    return;
  };

  var markAsRead = function(event) {
    if (event.which !== 1 && event.which !== 2) {
      return;
    }

    var $rssItem = $(this).closest("DIV");

    if (!$rssItem) {
      return;
    }

    var channelSource = $rssItem.data("jalios-rss-sourceid");
    var itemId = $rssItem.data("jalios-rss-itemid");

    $rssItem.addClass("readArticleRssItem");
    track(channelSource, itemId);

    return;
  };

  var track = function(channelSource, itemId) {
    try {
      JcmsJsContext.getJsonRPC().JcmsJSONUtil.trackRss(
        callback,
        channelSource,
        itemId
      );
    } catch (ex) {
      alert(I18N.glp("warn.json.sessiontimeout"));
      return;
    }
  };

  var callback = function(value) {
    // do nothing
  };

  var register = function() {
    $(document).on(
      "click",
      ".portlet-rss .rss-toggle",
      toggleRssItemDescription
    );
    $(document).on("mousedown", ".portlet-rss .RssItemLink.track", markAsRead);
  };

  // Plugin initialization on DOM ready

  var registerDomReady = function() {
    register();
    $(document).on("pagecontainerbeforeshow", function() {
      register();
    });
  };

  $(document).ready(registerDomReady);
})(window.jQuery);
