/**
 * Handles mentions in wiki area
 */
!(function($) {
  $(document).on("input propertychange", ".smartphone-wiki-area", function(e) {
    var elem = e.target;

    if (elem.classList.contains("mention-disabled")) {
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

    // Displays the mentions chooser if relevant

    if (
      word &&
      word.length > 1 &&
      word.indexOf(" ") < 0 &&
      word.indexOf("@") == 0 &&
      word.substring(1).indexOf("@") === -1
    ) {
      var hasDiscarded = false;
      var discardedMention = $(elem).data("discarded-mention");
      var backspaceTolerance = 1; // One char tolerance to allow backspace
      if (
        typeof discardedMention === "string" &&
        discardedMention.length > 1 &&
        word.length + backspaceTolerance >= discardedMention.length
      ) {
        var truncatedWord = word.substring(
          0,
          discardedMention.length - backspaceTolerance
        );
        var truncatedDiscardedMention = discardedMention.substring(
          0,
          discardedMention.length - backspaceTolerance
        );
        hasDiscarded = truncatedWord === truncatedDiscardedMention;
      }

      if (hasDiscarded) {
        // Update the discarded word
        $(elem).data("discarded-mention", word);
      } else {
        // Create the chooser itself
        $.jalios.smartPhone.DataChooser.createChooser(
          "mentions-chooser",
          word.substring(1)
        );

        // Add additional form params
        var chooserForm = $(".chooser-form");
        chooserForm.data("chooser-type", "member");
        chooserForm.data("selection-end", end);
        chooserForm.data("caller-input", $(e.target)); // The TEXTAREA that was used to instanciate this chooser (on which the user tapped)
        chooserForm.data("replaced-word", word);

        chooserForm.append('<input type="hidden" name="usage" value="0" />'); // Only members
        chooserForm.append(
          '<input type="hidden" name="isMention" value="true" />'
        );

        // Perform the search with the first input
        $(".chooser-input").trigger("input");
      }
    } else {
      // Reset the discarded-mention
      $(elem).removeData("discarded-mention");
    }
  });

  // Handle chooser desactivation on click on close button
  $(document).on("click", ".mentions-chooser .chooser-close", function() {
    var chooserForm = $(".chooser-form");
    var callerInput = chooserForm.data("caller-input");

    // When user desactivates the chooser, save the word as the last "discarded" word,
    // because we don't want to bother the user when he refuses
    callerInput.data("discarded-mention", chooserForm.data("replaced-word"));

    var selectionEnd = chooserForm.data("selection-end");
    if (callerInput.length >= 1) {
      // Restore focus + caret position
      callerInput.get(0).setSelectionRange(selectionEnd, selectionEnd);
      callerInput.focus();
    }
    $.jalios.smartPhone.DataChooser.desactivateChooser();
  });

  // Handle clicked element fetching + chooser desactivation, on click on a result
  $(document).on("click", ".mentions-chooser .chooser-result", function(e) {
    var chooserForm = $(".chooser-form");
    var callerInput = chooserForm.data("caller-input");

    var mentionValue = $(e.target)
      .closest(".chooser-result")
      .data("mention-email-prefix");
    var oldWord = chooserForm.data("replaced-word");
    var selectionEnd = chooserForm.data("selection-end");

    var oldSelectionStart = selectionEnd - oldWord.length + 1; // +1 to skip the @
    var callerInput = chooserForm.data("caller-input");

    // Save the word as the last "discarded" word,
    // because we don't want the chooser to pop again for this word
    callerInput.data("discarded-mention", "@" + mentionValue);

    // Once all data is read from the chooser form, remove it
    $.jalios.smartPhone.DataChooser.desactivateChooser();

    if (callerInput.length >= 1) {
      if (typeof mentionValue === "string" && mentionValue.length > 0) {
        // Replace text
        if (callerInput.get(0).setRangeText) {
          callerInput
            .get(0)
            .setRangeText(mentionValue, oldSelectionStart, selectionEnd);
        } else {
          // fallback: setRangeText is not supported in Mobile IE11
          var oldValue = callerInput.val();
          var newValue =
            oldValue.substring(0, oldSelectionStart) +
            mentionValue +
            oldValue.substring(selectionEnd);
          callerInput.val(newValue);
        }

        // Move carret at new position
        var newCarretPosition =
          selectionEnd + (mentionValue.length - oldWord.length + 1); // +1 to skip the @
        callerInput
          .get(0)
          .setSelectionRange(newCarretPosition, newCarretPosition);
        callerInput.focus();
      } else {
        alert(jaliosSettings["lbl-mention-noemail"]);
        // Restore focus + caret position
        setTimeout(function() {
          // delay for mobile IE 11
          callerInput.get(0).setSelectionRange(selectionEnd, selectionEnd);
          callerInput.focus();
        }, 300);
      }
    }
  });
})(window.jQuery);
