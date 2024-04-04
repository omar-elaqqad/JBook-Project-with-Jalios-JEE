!function ($) {

  // ------------------------------------------
  //  PRIVATE CODE
  // ------------------------------------------
  
  var _keyupTimeout = 200;
  var _inputTimeoutID;
  
  /**
   * Do stuff on DOM Ready
   */
  var register = function(){
    $.console.log("register");  
    $(".items-text-filter INPUT").on('input change propertychange', filterItems);
  };
  
  /**
   * Handle Ajax-Refresh Event
   */
  var ajaxCallback = function(event){
    // Handle an Ajax-Refresh After
    var refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){ return; }
    
    // Work on refreshed content
    register();
  };
  
  /**
   * Filter items by searching
   */
  var filterItems = function(event){
    var text = event.target.value;
    var pat = new RegExp(text, 'i');
    
    // Use timeout to avoid search being performed for every typed character
    if (_inputTimeoutID) {
      clearTimeout(_inputTimeoutID);
    }

    var items = $(".type-label");
    
    if (event.target.value === null) {
      $(".type-label-wrapper").removeClass("hide");
    }
    
    _inputTimeoutID = setTimeout(function () {
      
      items.each(function() {
        var itemText = $( this ).text();
        if (pat.test(itemText)) {
          $( this ).closest(".type-label-wrapper").removeClass("hide");
          anyMatch = true;
        } else {
          $( this ).closest(".type-label-wrapper").addClass("hide");
        }
      });
      _inputTimeoutID = false;
    }, _keyupTimeout);
  }

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function() {
    register();
    // Register Ajax-Refresh callback
    $(document).on('jalios:refresh', ajaxCallback);
  });

}(window.jQuery);


