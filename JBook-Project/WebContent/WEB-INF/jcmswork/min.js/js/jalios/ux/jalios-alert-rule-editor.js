!function(a){disableJsonButton=function(){a(".alert-rule-show-json").addClass("disabled")};a(document).on("click",".alert-rule-delete",function(){a(this).closest("TR").remove();disableJsonButton()});addAlertRule=function(d){var b=a("TABLE.alert-rule-list TR.alert-rule-model");var c=b.clone();c.removeClass("alert-rule-model");c.find("INPUT").each(function(){a(this).removeAttr("disabled")});var e=d.level;if(!e){e="any"}c.find(".alert-level-cell .alert-level-model.alert-level-"+e).removeClass("alert-level-model");c.find(".alert-level-cell .alert-level-model").each(function(){a(this).remove()});c.find(".alert-level-cell INPUT[name='alertLevels']").val(e);$spanAlertDomainName=c.find(".alert-domain-name .alert-type");$spanAlertDomainName.text(d.domainNameLabel);if(!d.domainName){$spanAlertDomainName.addClass("any-alert-type")}else{c.find(".alert-domain-name INPUT[name='alertDomainNames']").val(d.domainName)}if(d.domainIcon){c.find(".alert-domain-name .jalios-icon").attr("src",d.domainIcon)}else{c.find(".alert-domain-name .jalios-icon").remove()}if(d.channels){a(d.channels).each(function(f,g){c.find(".alert-channel-"+g+" INPUT").prop("checked",true)})}a("TABLE.alert-rule-list TR").each(function(){var f=a(this);if(!f.hasClass("alert-rule-model")){if(f.find(".alert-level-"+e).length!=0){if(f.find(".alert-domain-name INPUT[value='"+d.domainName+"']").length!=0){f.remove()}}}});b.before(c);a("TABLE.alert-rule-list").removeClass("hide");disableJsonButton()}}(window.jQuery);