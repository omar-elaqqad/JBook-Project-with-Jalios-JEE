!(function ($) {
  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.mediaelement) {
    $.jalios.mediaelement = {};
  }

  let players = [];

  /**
   * Init a media element player to save his progression
   * This method must be called after the "success" event of mediaelement
   * @param {*} player
   * @param {*} domNode
   * @returns
   */
  $.jalios.mediaelement.init = function (player, domNode) {
    // Prevent double init
    if ($(domNode).data('jalios-mediaelement-initialized')) {
      return;
    }
    $(domNode).data('jalios-mediaelement-initialized', true);

    // Store the player
    players.push({ player: player, domNode: domNode });

    // Save progression on pause
    player.addEventListener('pause', function () {
      saveMediaProgression(player, domNode);
    });

    // If a progression exist, set the current time
    let startTime = getInitialStartTime(domNode);
    if (startTime) {
      player.setCurrentTime(startTime);
    }
  };

  // On window.onbeforunload, save the progression
  let existingHandler = window.onbeforeunload;
  window.onbeforeunload = function (event) {
    if (existingHandler) existingHandler(event);

    players.forEach(function (mediaElement) {
      let player = mediaElement.player;
      let domNode = mediaElement.domNode;

      saveMediaProgression(player, domNode);
    });
  };

  /**
   * Save the player progression if it changed
   * @param {*} player
   * @param {*} domNode
   */
  const saveMediaProgression = function (player, domNode) {
    let startTime = getInitialStartTime(domNode);
    let currentTime = Math.floor(player.currentTime);

    if (startTime !== currentTime) {
      if (isMediaProgressionEndReached(player, domNode, currentTime)) {
        completeMediaProgression(domNode);
        //removeMediaProgression(domNode);
      } else {
        let fileDocId = $(domNode).data('jalios-filedocument-id');
        $.ajax({
          url: 'front/media/saveMediaProgression.jsp',
          method: 'post',
          data: {
            progression: currentTime,
            fileDocumentId: fileDocId
          }
        });
      }
    }
  };
  
  const completeMediaProgression = function (domNode) {
    let fileDocId = $(domNode).data('jalios-filedocument-id');
    $.ajax({
      url: 'front/media/completeMediaProgression.jsp',
      method: 'post',
      data: {
        fileDocumentId: fileDocId
      }
    });
  };

  const removeMediaProgression = function (domNode) {
    let fileDocId = $(domNode).data('jalios-filedocument-id');
    $.ajax({
      url: 'front/media/deleteMediaProgression.jsp',
      method: 'post',
      data: {
        fileDocumentId: fileDocId
      }
    });
  };

  /**
   * Check if the end of a video is almost reached
   * @param {*} player
   * @param {*} domNode
   * @param {*} currentTime
   * @returns True if the end of the video is almost reached
   */
  const isMediaProgressionEndReached = function (player, domNode, currentTime) {
    try {
      let duration = player.duration;
      let beforeEndPercentage = $(domNode).data('jalios-mediaprogression-remove-beforeend-percentage');
      let beforeEndMinimumSeconds = $(domNode).data('jalios-mediaprogression-remove-beforeend-minimum-seconds');
      // Check if the progression should be removed or saved
      // Prevent divided by 0
      if (beforeEndPercentage === 0) {
        beforeEndPercentage = 1;
      }
      let durationEnd = (duration * beforeEndPercentage) / 100;

      if (durationEnd < beforeEndMinimumSeconds) {
        durationEnd = beforeEndMinimumSeconds;
      }
      durationEnd = duration - durationEnd;
      return currentTime > durationEnd;
    } catch (err) {
      $.console.log(err);
      return false;
    }
  };

  /**
   * Retrieve the initial start time from the video in dom
   * @param {*} domNode
   * @returns
   */
  const getInitialStartTime = function (domNode) {
    let $element = $(domNode);
    let startTime = $element.data('jalios-mediaelement-start');
    return Math.floor(startTime);
  };

  // Fix JCMS-7643 - Invalid media player width (using full window) when media displayed in nav tab
  // --> Intercept tab change to "shake" all medialement players size
  $(document).on('jalios:tab', function (event) {
    if (typeof mejs === undefined) {
      return;
    }
    var $tabPane = $(event.tab.pane);
    $tabPane.find('.mejs__container').each(function () {
      var mejs_player = mejs.players[this.id];
      if (mejs_player && mejs_player.resetSize) {
        mejs_player.resetSize();
      }
    });
  });
})(window.jQuery);
