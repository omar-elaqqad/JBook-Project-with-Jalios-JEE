!function($) {
  tinymce.PluginManager.add('jimagehandler', function(editor, url) {

    var imgClass = 'jalios-uploaded-image'
    var templateRegExp = '<img' + '[^>]*' + imgClass + '[^>]*>';

    editor.jalios.plugins.jimagehandler = {
      uploadImages : function(blobInfo, success, failure, progress, editor) {
        var fail = function(msg) {
          var blobUri = blobInfo.blobUri();
          if (blobUri && editor) {
            jQuery(editor.getBody()).find("img[src='"+blobInfo.blobUri()+"']").remove();
          }
          return failure(msg);
        }
        var xhr, formData;
        
        var uploadUrl = editor.settings.images_upload_url || 'js/jalios/core/wysiwyg/plugins/jimagehandler/jsp/uploadImage.jsp';
        var settings = {
          url : $.jalios.Http.buildUrl(uploadUrl, { 'ws' : editor.jcms.getContext().getWorkspace() }),
          credentials : editor.settings.images_upload_credentials || true,
          basePath : editor.settings.images_upload_base_path || JcmsJsContext.getBaseUrl()
        };

        var pathJoin = function(path1, path2) {
          if (path1) {
            return path1.replace(/\/$/, '') + '/' + path2.replace(/^\//, '');
          }

          return path2;
        };

        xhr = new XMLHttpRequest();
        xhr.open('POST', settings.url);
        xhr.withCredentials = settings.credentials;

        xhr.upload.onprogress = function(e) {
          progress(e.loaded / e.total * 100);
        };

        xhr.onerror = function() {
          fail("Image upload failed due to a XHR Transport error. Code: " + xhr.status);
        };

        xhr.onload = function() {
          var json;

          if (xhr.status < 200 || xhr.status >= 300) {
            fail("HTTP Error: " + xhr.status);
            return;
          }
        
          json = JSON.parse(xhr.responseText);

          if (!json) {
            failure("Invalid JSON: " + xhr.responseText);
            return;
          }

          if (json.message) {
            fail(json.message);
            return;
          }
          
          success(pathJoin(settings.basePath, json.location));
        };

        formData = new window.FormData(); // TODO: Stick this in sand
        formData.append('file', blobInfo.blob(), blobInfo.filename());

        xhr.send(formData);
      }
    }

    // Paste or Drag & Drop an image in the editor
    editor.on('PastePreProcess', function(event) {
      var content = event.content;
      if (content.startsWith('<img')) {
        var $img = $(content);
        event.content = $img.addClass(imgClass).prop('outerHTML');
      }
    });

    // Upload an image from the image dialog
    editor.on('BeforeSetContent', function(event) {
      var content = event.content;
      if (content.startsWith('<img') && content.indexOf("?source=") >= 0) {
        var $img = $(content);
        event.content = $img.addClass(imgClass).prop('outerHTML');
      }
    });

    editor.on('PostProcess', function(event) {
      var regex = new RegExp(templateRegExp, 'gi');
      event.content = event.content.replace(regex, function($0) {
        var $elt = $($0);

        var imageUrl = $elt.attr('src');
        var params = $.jalios.Http.toQueryParams(imageUrl);

        var options = {
          source : params.source || imageUrl,
          width : $elt.attr('width'),
          height : $elt.attr('height'),
          title : $elt.attr('alt') || $elt.attr('title'),
          style : $elt.attr('style')
        };
        return editor.jalios.plugins.jmedia.createTag(options);
      });
    });

  });
}(window.jQuery);