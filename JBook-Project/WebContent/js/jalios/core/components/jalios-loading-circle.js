!function ($) {
  $.fn.displayLoading = function(){
    var $this = $(this);
    if(!$this.find(".ajax-loading-component").length != 0){
      $this.prepend("<div class='ajax-loading-component ajax-loading'></div>");
    }
    // Remove current animation if one is currently running 
    if($this.find(".ajax-loading .ajax-loading-display").length != 0){
      $this.find(".ajax-loading .ajax-loading-display").remove();
    }
    // Add animation
    $this.find(".ajax-loading").append("<div class='ajax-loading-display'><div class='loader'></div></div>");
    return $this;
  }
}(window.jQuery);