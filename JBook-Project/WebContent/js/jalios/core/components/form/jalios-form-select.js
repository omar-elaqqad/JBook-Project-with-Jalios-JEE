!function ($) {

  let handlebarTemplate;

  const formatSelect = function(state) {
    if (!state.id) {
      return state.text;
    }
    
    if ($(state.element).closest(".js-select2-no-image").exists()) {
      return state.text;
    }
        
    let templateOptions = $(state.element).data("jalios-template-params");
    
    if (!templateOptions) {
      return state.text;
    }
    
    if (templateOptions.noIcon) {
      return state.text;
    }
    
    templateOptions.state = state;
    state = getSelectHandlebarTemplateHtml(templateOptions);
    return $(state); // Return jquery object in order to avoid select2 html escape
  };

  const formatSelected = function (state) {
    if (!state.id) {
      return state.text;
    }
    if (!document.getElementById("hdb-form-selected")) {
      return state.text;
    }

    let templateParams = $(state.element).data("jaliosTemplateParams");
    if (!templateParams) {
      return state.text;
    }

    
    let template = getSelectedHandlebarTemplateHtml();
    
    if (templateParams && templateParams.displayIconHtml) {
      let imgHtml = templateParams.iconHtml;
    
      state = template({
        state: state,
        imgHtml: imgHtml,
        templateParams: templateParams
      });
    } else if (templateParams && templateParams.displayIcon) {
      let icon = templateParams.icon;
    
      state = template({
        displayIcon: true,
        state: state,
        icon: icon,
        templateParams: templateParams
      });
    } else {
      return state.text;
    }

    return $(state); // Return jquery object in order to avoid select2 html escape
  };


  const defaultOptions = {
    theme: "bootstrap",
    templateResult: formatSelect,
    templateSelection: formatSelected,
    minimumResultsForSearch: 4,
    language: document.documentElement.lang
  };

  const initSelect2Inputs = function() {
    $(".select2-enumerate:not(.select2-type)").each(function(idx, element) {
      let $element = $(element);
      
      if ($element.closest(".js-select2-disabled").exists()) {
        return;
      }
      
      let customOptions = $element.data("jalios-select-search-options");
      if (customOptions) {
        customOptions = $.extend({}, defaultOptions, customOptions);
      } else {
        customOptions = defaultOptions;
      }
      $element.select2(customOptions);
    });
  }
  
  const initHandlebarTemplate = function() {
    if (!handlebarTemplate) {
      let source   = document.getElementById("hdb-form-select").innerHTML;
      handlebarTemplate = Handlebars.compile(source);   
    }  
  }
  
  const getSelectedHandlebarTemplateHtml = function(templateParams) {
    let templateId = "hdb-form-selected";
    if (templateParams && templateParams.state) {
      templateId = $(templateParams.state.element).closest("select").data("jaliosHandlebarSelectedTemplateId")
    } 

    return Handlebars.compile(document.getElementById(templateId).innerHTML);
  }  
  
  const getSelectHandlebarTemplateHtml = function(templateOptions) {
    let customTemplateId = $(templateOptions.state.element).closest("select").data("jaliosHandlebarSelectTemplateId");
    if (customTemplateId) {
      let source = document.getElementById(customTemplateId).innerHTML;
      let customTemplate = Handlebars.compile(source);
      return customTemplate(templateOptions);
    } else {
      return handlebarTemplate(templateOptions);
    }
  }
  
  $(document).ready(function() {
    initHandlebarTemplate();
    initSelect2Inputs();
    $(document).on('jalios:refresh', function(event){
      let refresh = $.jalios.Event.match(event, 'refresh', 'after');
      if (!refresh || !refresh.target){ return; }
      initSelect2Inputs();
    });
    
    // Destroy select2 on refreshed targets @see JCMS-9106 
    $(document).on('jalios:refresh', function(event){
      let refresh = $.jalios.Event.match(event, 'refresh', 'before');
      if (!refresh || !refresh.target){ return; }
      $(refresh.target).find("select").each(function(_idx, element) {
        if ($(element).data("select2") && $(element).prop('multiple')) {
          $(element).select2('destroy');
        }
      })
    });    
    
   /*
     * Hacky fix for a bug in select2 with jQuery 3.6.0's new nested-focus "protection"
     * see: https://github.com/select2/select2/issues/5993
     * see: https://github.com/jquery/jquery/issues/4382
     *
     * TODO: Recheck with the select2 GH issue and remove once this is fixed on their side
     */
  
    $(document).on('select2:open', function(){
      document.querySelector('.select2-search__field').focus();
    });

    $(document).on("jalios:field", function(event) {
      if (event.field.type === "addedField") {
        if (event.field.clones) {
          event.field.clones.forEach(function(element) {
            $(element).find(".form-control").removeClass("select2-hidden-accessible");
            $(element).find(".select2-container").remove();
          })
          initSelect2Inputs();
        }
      }
    });

    $(document).on('jalios:refresh', handleRefresh);
  });
  
  const handleRefresh = function(event){
    // Handle an Ajax-Refresh After
    let refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){ return; }
    initHandlebarTemplate();
  }

}(window.jQuery);