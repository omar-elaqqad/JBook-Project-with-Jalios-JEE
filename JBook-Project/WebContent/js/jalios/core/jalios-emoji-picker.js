(function ( $ ) {

  // Emoji picker
  // see emoji.jsp
  
  // Update UI to display only emoji matching current text
  var refineEmojiPickerResultTimeout;
  var refineEmojiPickerResult = function() {
    var searchString = $('.emoji-search INPUT[name="search"]').val().toLowerCase();
    
    $('.emoji-category').each(function() {
      var $categoryDiv = $(this);      
      $categoryDiv.show();
      
      var emojiCategoryHasMatch = false;
      $categoryDiv.find('BUTTON').each(function() {
        var $emojiButton = $(this);
        var match = $emojiButton.attr('title').toLowerCase().indexOf(searchString) != -1 ||
        $emojiButton.attr('data-emoji-keywords').toLowerCase().indexOf(searchString) != -1;
        $emojiButton.toggle(match);
        if (match) {
          emojiCategoryHasMatch = true;
        }
      });
      
      $categoryDiv.toggle(emojiCategoryHasMatch);      
    });
  }
  
  var registerPickerEvents = function() {
    var $emojiSearchInput = $('.emoji-search INPUT[name="search"]'); 

    // Trigger initial search if search value was filled server side
    var searchString = $emojiSearchInput.val()
    if (searchString !== '') {
      refineEmojiPickerResult();
    }
    
    // Emoji Search
    $emojiSearchInput.on('keyup', function(event) {
      if (refineEmojiPickerResultTimeout) {
        clearTimeout(refineEmojiPickerResultTimeout);
      }
      refineEmojiPickerResultTimeout = setTimeout(function(){
        refineEmojiPickerResult();
        refineEmojiPickerResultTimeout = false;    
      }, 500)
    });
    $emojiSearchInput.keypress(function(event){
      if (event.keyCode === 10 || event.keyCode === 13) {
        event.preventDefault();
      }
    });
    
    // Click of a category
    $(document).on('click', 'A.category-link', function(event) {
      event.preventDefault();
      var $target = $(this.hash);
      var $container = $(".emoji-categories");
      $container.animate({
        scrollTop: $target.offset().top - $container.offset().top + $container.scrollTop()
      }, 500);
      return false;
    });    
    
    // Skin tone change 
    $(document).on('click', '.emoji-skin-tone INPUT', function(event) {
      event.stopImmediatePropagation();
      $(this).closest("form").submit();
      return false;
    });    
    
    // Selection of an emoji 
    $(document).on('click', '.emoji-category BUTTON', function(event) {
      var $emojiButton = $($(event.target).closest('BUTTON')[0]);
      var emoji = $emojiButton ? $emojiButton.attr('data-emoji-codepoints') : null;
      
      if (parent && parent.jQuery && frameElement) {
        var event = parent.jQuery.Event( "emoji-selected" );
        event.emoji = emoji;
        parent.jQuery(frameElement).trigger(event);
        
        event.stopImmediatePropagation();
        return false;
      }
    });
   
  }
  
  /**
   * Preload images in parallel, 4 at a time. 
   */
  var setImagesSrc = function() {
    var imageElementArray = [];  
    var imageSrcArray = [];  
    
    $('IMG.emoji').each(function() {
      var $img = $(this);
      var src = $img.attr('data-emoji-src');
      if (src && src !== '') {
        imageElementArray.push($img[0]);
        imageSrcArray.push(src);
      }
    })
    
    function preload(index) { 
      index = index || 0; 
      if (imageElementArray.length <= index) {
        return;
      }
      var img = new Image (); 
      img.onload = function() {
        imageElementArray[index].src = img.src;
        preload(index + 4);
      }
      img.src = imageSrcArray[index]; 
    } 
    
    preload(0);
    preload(1);
    preload(2);
    preload(3);
  }
  
  $(document).ready(function(){
    registerPickerEvents();
    setImagesSrc(); // Improve load performance by setting real src after document ready
  });
  

}( jQuery ));

