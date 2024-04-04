!function($) {
  /* Do stuff on DOM Ready */
  var register = function() {

    JcmsLogger.info('Jalios Push', 'Init EventSource Push JS ');
    init();
  }
  
  var init = function(){
	var deviceId =  getDeviceId();
	var eventFilterParam = getEventFilterParam();
	var typeFilterParam = getTypeFilterParam();
    var evtSource = new EventSource("push/provider?device="+deviceId+"&"+(eventFilterParam?eventFilterParam:"")+(typeFilterParam?typeFilterParam:""));
    $.jcms.push.evtSource = evtSource;
    var listener = function (e) {
      var event = jQuery.Event("jalios.push");
      event.eventSourceType = e.type;
      event.serverEvent = e;
      $(document).trigger(event);
    };
    evtSource.addEventListener("open", listener);
    evtSource.addEventListener("message", listener);
    evtSource.addEventListener("error", listener);
    // Fire an event
    var event = jQuery.Event("push.notification:ready");
    $(document).trigger(event);
  };
  
  var getDeviceId = function(){
	  var $deviceIdElts = $("[data-jalios-push-device-id]");
	  return encodeURIComponent($deviceIdElts.data("jalios-push-device-id"));
  };
  
  var getTypeFilterParam = function(){
	  var $filterElts = $("[data-jalios-push-type-filter]");
	  var filterParam = "";
	  $filterElts.each(function(index, currentValue) {		  
		  filterParam += "typeFilter="+encodeURIComponent($(currentValue).data("jalios-push-type-filter"))+"&";
	  });
	  return filterParam;
  };
  
  var getEventFilterParam = function(){
	  var $filterElts = $("[data-jalios-push-eventname-filter]");
	  var filterParam = "";
	  $filterElts.each(function(index, currentValue) {
		  filterParam += "eventFilter="+encodeURIComponent($(currentValue).data("jalios-push-eventname-filter"))+"&";
	  });
	  return filterParam;
  };
  
  // ------------------------------------------
  // PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jcms) {
    $.jcms = {};
  }
  
  if (!$.jcms.push) {
    $.jcms.push = {};
  }
  $.jcms.push.evtSource;
  // ------------------------------------------
  // DOM READY CODE
  // ------------------------------------------
  
  $(document).ready(function($) { 
    register();
  });

}(window.jQuery);

jQuery.jalios.DOM.loadJavaScript('js/lib/eventsource.js', 'empty version');
