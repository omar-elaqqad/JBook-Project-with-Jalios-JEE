!function($) {
	
  disableJsonButton = function() {
    $(".alert-rule-show-json").addClass("disabled");
  }
  
  $(document).on('click', '.alert-rule-delete', function() {
    $(this).closest("TR").remove();
    disableJsonButton();
  });

  addAlertRule = function(rule) {
       
    // Clone TR 
    var $model = $("TABLE.alert-rule-list TR.alert-rule-model");
    var $newTR = $model.clone();

    // Prepare TR
    $newTR.removeClass("alert-rule-model");
    
    // Remove "disabled" for each INPUT
    $newTR.find("INPUT").each(function() {
      $(this).removeAttr("disabled");
    });
    
    // Set Level
    var level = rule.level;
    if (!level) {
      level = "any";      
    }
    $newTR.find(".alert-level-cell .alert-level-model.alert-level-" + level).removeClass("alert-level-model");
    $newTR.find(".alert-level-cell .alert-level-model").each(function() {
      $(this).remove();
    });
    $newTR.find(".alert-level-cell INPUT[name='alertLevels']").val(level);
    
    // Set Domain and Name
    $spanAlertDomainName = $newTR.find(".alert-domain-name .alert-type");
    $spanAlertDomainName.text(rule.domainNameLabel);
    if (!rule.domainName) {
      $spanAlertDomainName.addClass("any-alert-type");
    } else {
      $newTR.find(".alert-domain-name INPUT[name='alertDomainNames']").val(rule.domainName);
    }

    // Set icon
    if (rule.domainIcon) {
      $newTR.find(".alert-domain-name .jalios-icon").attr("src", rule.domainIcon);
    } else {
      $newTR.find(".alert-domain-name .jalios-icon").remove();
    }

    // Set AlertChannels
    if (rule.channels) {
      $(rule.channels).each(function(index, alertChannelName) {
        $newTR.find(".alert-channel-" + alertChannelName + " INPUT").prop("checked", true);
      });
    }

    // Remove same rule
    $("TABLE.alert-rule-list TR").each(function() {
      var $tr = $(this);
      if (!$tr.hasClass("alert-rule-model")) {
        if ($tr.find(".alert-level-" + level).length != 0) {
          if ($tr.find(".alert-domain-name INPUT[value='" + rule.domainName + "']").length != 0) {
            $tr.remove();    
          }
        }
      }
    });

    // Add new TR
    $model.before($newTR);
    
    // Show TABLE if hidden
    $("TABLE.alert-rule-list").removeClass("hide");
    
    disableJsonButton();

  };
  
  
}(window.jQuery);
