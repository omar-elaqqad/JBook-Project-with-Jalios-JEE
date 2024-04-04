!function ($) {

  /* Do stuff on DOM Ready */
  const init = function(refresh) {  
	
    if(!refresh) {
      $('.faq-layout .entry-sortable').hover(
        function () {
          $(".faq-entry-layout").addClass("faq-entry-sortable");
          $(".faq-layout").sortable("enable");
        }, 
        function () {
          $(".faq-entry-layout").removeClass("faq-entry-sortable");
          $(".faq-layout").sortable("disable");
        }
      );
    }
	
    $(".faq-layout").sortable({
      containment: "parent",
      cursor: "move",
      delay: 150,
      helper: 'clone',
      tolerance: "pointer",
      placeholder: "question-field-placeholder",
      items: ".faq-entry-sortable",
      over: function (event, ui) {
        var cl = ui.item.attr('class');
        $('.question-field-placeholder').addClass(cl);
      },
      start: function(event, ui) { 
        $(this).attr('data-previndex', ui.item.index());
      },
      stop: function(event, ui) { 
        $(this).sortable("disable");
      },
      update: function (event, ui) {
        //gets the new and old index then removes the temporary attribute
        let newIndex = ui.item.index();
        let oldIndex = $(this).attr('data-previndex');
        saveUpdate(oldIndex, newIndex, $(ui.item).attr('data-faq-entry-id'));
        $(this).removeAttr('data-previndex');
      }
    });
    const saveUpdate = function (oldIndex, newIndex, id) {
      let opUp = "";
      let opDown = "";
      let deltaIndex = 0;
      if (oldIndex > newIndex) {
        opUp = true;
        deltaIndex = oldIndex - newIndex;
      } else {
        opDown = true;	 
        deltaIndex = newIndex - oldIndex;
      }
      if (deltaIndex !== 0) {
        sendRequest(id, opDown, opUp, deltaIndex);
      }
    }

    const sendRequest = function (id, opDown, opUp, deltaIndex) {
      $.ajax({
        url: 'types/FaqEntry/editFaqEntry.jsp',
        data: {
          id: id,
          opDown: opDown,
          opUp: opUp,
          deltaOrder: deltaIndex
        },
        type: 'POST'
      });
    }

  };
  
  // -------------------------------------
  // DOM READY
  // -------------------------------------

  $(document).ready(function() {
    init();
  });
  
  $(document).on('jalios:refresh', function(event) {
    if (event.refresh.type == "after") {
      init(true);
    }
  });
  
}(window.jQuery);