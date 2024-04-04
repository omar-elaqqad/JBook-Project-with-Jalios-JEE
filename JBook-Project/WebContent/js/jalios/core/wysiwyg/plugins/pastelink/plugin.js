!function($) {
  tinymce.PluginManager.add('pastelink', function(editor, url) {   
    
    var replaceLocalUrlWithJlink = editor.getParam('pastelink_jlink', true); 
    var useMediaTitleInsteadOfURL = editor.getParam('pastelink_jlink_title', true); 

    var isLocalUrl = function(url) {
      return url && url.indexOf(JcmsJsContext.getBaseUrl()) == 0 && url.indexOf("?") == -1;
    }
    
    // A Jlink to the specified node, for the specified URL
    var setJLinkAttribute = function(node, url) {
      if (replaceLocalUrlWithJlink && isLocalUrl(url)) {
        var mediaInfos = editor.jcms.getMediaInfos(url);
        if (mediaInfos && mediaInfos.source && mediaInfos.url) { // data found
          node.setAttribute("data-jalios-link-id", mediaInfos.source);
          node.setAttribute("data-jalios-url", mediaInfos.url);
          node.href = mediaInfos.displayUrl || mediaInfos.url;
          if (useMediaTitleInsteadOfURL && mediaInfos.title) {
            node.textContent = mediaInfos.title;
          }
        }
      }
    }
    
    var newNodesFromText = function(input) {
      var urlRegex = /((?:https?:\/\/|ssh:\/\/|ftp:\/\/|file:\/|www\.|(?:mailto:)?[A-Z0-9._%+\-]+@)(?:[^\s,;!]+))(?=(?:[\s\),;:\.!?])|$)/g;
      var texts = input.split(urlRegex);
      if (!texts || texts.length <= 1) {
        return null;
      }
      var nodes = [];
      
      var pendingTxt = '';
      for (var i=0, l=texts.length; i<l; i++) { 
        var text = texts[i];
        var node;
        if (text.match(urlRegex)) {
          var url = text;
          var matches = url.match(/^(.+)([\s\),;:\.!?])$/);
          if (matches) {
            url = matches[1];
            pendingTxt = matches[2];
          }
          var label = url;
          if (url.indexOf("www") === 0) {
            url = "http://"+url;
          }          
          node = document.createElement('a');
          node.href = url;
          node.textContent = label;
          
          // If pasted URL is a link to a data of current site, without any param, 
          // try to resolve it and replace with corresponding jalios:link 
          setJLinkAttribute(node, url);
          
        } else {
          node = document.createTextNode(pendingTxt + text);
          pendingTxt = '';
        }
        nodes.push(node);
      }
      
      return nodes;
    }

    function findParent(node, rootNode, predicate) {
      while (node && node !== rootNode) {
        if (predicate(node)) {
          return node;
        }

        node = node.parentNode;
      }

      return null;
    }

    function hasParent(node, rootNode, predicate) {
      return findParent(node, rootNode, predicate) !== null;
    }

    function hasParentWithName(node, rootNode, name) {
      return hasParent(node, rootNode, function (node) {
        return node.nodeName === name;
      });
    }
    
    
    var pastePostProcess = function(event) {
       var rootNode = event.node;
       var node = event.node;
       var walker = new tinymce.dom.TreeWalker(node, rootNode);
       do {
           /* Replace A element whose text is exactly a local URL Text node and search for URL */
           if (node.nodeType == 1 && node.nodeName === 'A' && node.href === node.textContent) {
             setJLinkAttribute(node, node.href);
             continue;
           }
           
          /* Find Text node and search for URL */
          if (node.nodeType == 3) {
            // Skip any text already in a link
            if (hasParentWithName(node, rootNode, 'A')) {
              continue;
            }
            
            // Rewrite text
            var newNodes = newNodesFromText(node.textContent);
            if (newNodes && newNodes.length > 0) {
              for (var i=0, l=newNodes.length; i<l; i++) { 
                var newNode = newNodes[i];
                node.parentNode.insertBefore(newNode, node);
              }
              node.remove();
              // Update walker to continue from last inserted node
              walker = new tinymce.dom.TreeWalker(newNodes[newNodes.length-1], rootNode);
            }
          }
    
        } while ((node = walker.next()));


    }
    
    editor.on('PastePostProcess', pastePostProcess);
    
  });
}(window.jQuery);