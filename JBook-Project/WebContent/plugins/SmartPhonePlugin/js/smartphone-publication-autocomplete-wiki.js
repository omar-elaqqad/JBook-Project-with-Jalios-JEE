/**
 * Handles link to publications in wiki area
 */
!(function($) {
  $(document).on("input propertychange", ".smartphone-wiki-area", function(e) {
    var elem = e.target;

    if (elem.classList.contains("publication-link-disabled")) {
      return;
    }

    // Get word under the cursor
    if (elem.selectionStart > elem.selectionEnd) {
      return;
    }

    var start = elem.selectionStart;
    var end = elem.selectionEnd;
    var value = elem.value;

    if (start == end) {
      start--;
    }

    var chr = value.charAt(start);
    while (start >= 0 && chr != " " && chr != "\n" && chr != "\r") {
      start--;
      chr = value.charAt(start);
    }
    var word = value.substring(start + 1, end);

    // Displays the publication chooser if relevant

    if (
      word &&
      word.length === 2 &&
      word.indexOf(" ") < 0 &&
      word.indexOf("[[") === 0
    ) {
      // Create the chooser itself
      $.jalios.smartPhone.DataChooser.createChooser(
        "publication-link-chooser",
        ""
      );

      // Add additional form params
      var chooserForm = $(".chooser-form");
      chooserForm.data("chooser-type", "publication");
      chooserForm.data("selection-end", end);
      chooserForm.data("caller-input", $(e.target)); // The TEXTAREA that was used to instanciate this chooser (on which the user tapped)
      chooserForm.data("replaced-word", word);

      // Perform the search with the first input
      $(".chooser-input").trigger("input");
    }
  });

  // Handle chooser desactivation on click on close button
  $(document).on(
    "click",
    ".publication-link-chooser .chooser-close",
    function() {
      var chooserForm = $(".chooser-form");
      var callerInput = chooserForm.data("caller-input");

      var selectionEnd = chooserForm.data("selection-end");
      if (callerInput.length >= 1) {
        // Restore focus + caret position
        callerInput.get(0).setSelectionRange(selectionEnd, selectionEnd);
        callerInput.focus();
      }
      $.jalios.smartPhone.DataChooser.desactivateChooser();
    }
  );

  // Handle clicked element fetching + chooser desactivation, on click on a result
  $(document).on("click", ".publication-link-chooser .chooser-result", function(
    e
  ) {
    var chooserForm = $(".chooser-form");
    var callerInput = chooserForm.data("caller-input");

    var publicationLink =
      $(e.target)
        .closest(".chooser-result")
        .data("jalios-chooser-dataid") +
      "][" +
      $(e.target)
        .closest(".chooser-result")
        .data("jalios-chooser-label") +
      "]]";
    var oldWord = chooserForm.data("replaced-word");
    var selectionEnd = chooserForm.data("selection-end");

    var oldSelectionStart = selectionEnd - oldWord.length + 2; // +2 to skip the [[
    var callerInput = chooserForm.data("caller-input");

    // Once all data is read from the chooser form, remove it
    $.jalios.smartPhone.DataChooser.desactivateChooser();

    if (callerInput.length >= 1) {
      // Replace text
      if (callerInput.get(0).setRangeText) {
        callerInput
          .get(0)
          .setRangeText(publicationLink, oldSelectionStart, selectionEnd);
      } else {
        // fallback: setRangeText is not supported in Mobile IE11
        var oldValue = callerInput.val();
        var newValue =
          oldValue.substring(0, oldSelectionStart) +
          publicationLink +
          oldValue.substring(selectionEnd);
        callerInput.val(newValue);
      }

      // Move carret at new position
      var newCarretPosition =
        selectionEnd + (publicationLink.length - oldWord.length + 2); // +2 to skip the [[
      callerInput
        .get(0)
        .setSelectionRange(newCarretPosition, newCarretPosition);
      callerInput.focus();
    }
  });
})(window.jQuery);
