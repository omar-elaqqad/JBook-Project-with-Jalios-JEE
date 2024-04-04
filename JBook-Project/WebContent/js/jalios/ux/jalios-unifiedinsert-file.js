!function ($) {

  if (!$.jalios) { $.jalios = {}; }
  if (!$.jalios.UnifiedInsert) { $.jalios.UnifiedInsert = {}; }
  $.jalios.UnifiedInsert.File = {
     
    /**
     * Callback invoked by DocUploadHandler on upload end.
     * cf work/unifiedinsert/items/file.jsp.
     * 
     * @param filesArray array of file informations [
     *    {
     *      id: "...",
     *      title: "...",
     *      filename: "...",
     *      displayUrl: "...",
     *      width: ..., // for image only
     *      height: ..., // for image only  
     *      mediaType: "image"|"video"|"audio"|"flash"|"other",
     *    }, 
     *    ...
     *  ]
     */  
    insertAndClose : function(filesArray) {
      for (var i = 0; i < filesArray.length; i++) {
        var file = filesArray[i];
        var closeAfter = (i+1 == filesArray.length);
        if (!file.mediaType || file.mediaType === "other") {
          $.jalios.UnifiedInsert.insertLink(file.id, closeAfter);
        } else {
          $.jalios.UnifiedInsert.insertMedia(file.id, closeAfter);          
        }
      }
      window.close();
    } 
  
  };
  
}(window.jQuery);
