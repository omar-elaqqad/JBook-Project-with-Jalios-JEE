!function ($) {
  var computeTimeout = false;
  
  const register = function(){
    $(".avoidance-links :input").on('input change propertychange', function(event) {
      // Use a timeout to avoid compute each time  a character is typed
      if (computeTimeout) {
        clearTimeout(computeTimeout);
      }
      computeTimeout = setTimeout(function() {
        computeTimeout = false;
        
        let avoidanceLinks = [];
        
        $(".widget-name-targets input[name=targets]").each(function(inputIndex, element) {
          console.debug("Starting target : " + inputIndex);
          console.group();
          let langValues = []; 
          $(".widget-name-labels .wdglang").each(function(idx, element) {
            if ($(element).find(".input-group-list input").get(inputIndex)) {
              let inputValue = $(element).find(".input-group-list input").get(inputIndex).value;
              let lang = $($(element).find(".input-group-list input").get(inputIndex)).attr("lang");
              
              if (inputValue || lang) {
                langValues.push({
                  lang: lang,
                  label: inputValue
                });
                console.debug("Pushing lang obj", {
                  lang: lang,
                  label: inputValue
                });
              }
            }
          });
          
          if ($(element).val() || langValues.length) {
            console.debug("Pushing target item : " + $(element).val());
            avoidanceLinks.push({
              target: $(element).val(),
              labelML: langValues
            });
          }


          
          console.groupEnd();
        });
        let jsonObject = {
          "targets": avoidanceLinks
        };
        
        $(".js_avoidance_links_value").val(JSON.stringify(jsonObject));
        console.debug("Final item", jsonObject);
        
      }, 500);
    });
  };

  
  $(document).ready(function() {
    register();
  });

}(window.jQuery);
