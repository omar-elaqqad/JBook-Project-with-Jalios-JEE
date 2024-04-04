!function($) {

  /* Do stuff on DOM Ready */	
  var init = function(){
    setTimeout(function(){
      showHiddenAbstract();
      $(".layout-jnews").css("visibility", "visible");
    }, 250);   
    setTimeout(function(){ 
      hideGradientAbstract();
    }, 500);  
  }	
  
  var hideGradientAbstract = function() {
    var abstractPub = $('.layout-jnews .card.pub-jnews .height-item-jnews .gradient-jnews.abstract-publication');
    var card = abstractPub.closest('.layout-jnews .card.pub-jnews .height-item-jnews');
    for (var i = 0; i < card.length; i++) {
      var abstractBox = card[i].querySelector('.gradient-jnews.abstract-publication');
      var title = card[i].querySelector('.nounderline-jnews .card-block');
      var footer = card[i].querySelector('.card-block-footer.footer-publication');
      if (abstractBox != null) {
        var heightAbstract = abstractBox.offsetHeight;  
        var heightTitle = title.offsetHeight;
        var heightFooter = footer.offsetHeight;
        var heightCard = card[i].offsetHeight;
        if (heightCard - heightTitle - heightAbstract - heightFooter > 20) {
          abstractBox.classList.remove("gradient-jnews");
        }
      }
    }
  }
  
  var showHiddenAbstract = function() {
    var abstractPub = $('.layout-jnews .card.pub-jnews .height-item-jnews .add-abstract.abstract-publication');  
    var card = abstractPub.closest('.layout-jnews .card.pub-jnews .height-item-jnews');
    var paddingBottomTitle = 16;
    for (var i = 0; i < card.length; i++) {
      var image = card[i].querySelector('.card-img');
      var title = card[i].querySelector('.nounderline-jnews .card-block');
      var footer = card[i].querySelector('.card-block-footer.footer-publication');
      var heightImage = 0;
      if (image != null) {
        heightImage = image.offsetHeight + paddingBottomTitle; 
      } 
      var heightTitle = title.offsetHeight;
      var heightFooter = footer.offsetHeight;
      var heightCard = card[i].offsetHeight;
      var gap = heightCard - heightImage - heightTitle - heightFooter;
      var abstractBox = card[i].querySelector('.add-abstract.abstract-publication');
      abstractBox.style.display = "block";
      var heightAbstract = abstractBox.offsetHeight;  
      abstractBox.style.display = "none";
      if (heightAbstract < gap ) {
        abstractBox.style.display = "block";
        title.classList.remove("title-publication");
        abstractBox.classList.remove("add-abstract");
      }      
    }
  }
  
  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------
  
  $(window).ready(function() {
    init();
  });
  
  $(document).on('jalios:refresh', function(event) {
    if (event.refresh.type == "after") {
      init();
	}
  });

}(window.jQuery);