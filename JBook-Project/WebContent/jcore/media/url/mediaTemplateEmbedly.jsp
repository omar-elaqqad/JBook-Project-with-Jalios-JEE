<%--
  @Summary: Template used to display a DailyMotion video
--%><%@ page import="java.util.regex.Matcher" %><%
%><%@ page import="java.util.regex.Pattern" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
  
  String embedlyKey = channel.getProperty("media.template.default.URL.zzzEmbedly.key", "");
  if (Util.isEmpty(embedlyKey)) {
    return;
  }

  if (Util.isEmpty(url)){
    return;
  }
  
  final String embedlyJS = channel.getProperty("media.template.default.URL.embedly.js-url", "//cdn.embed.ly/jquery.embedly-3.1.2.min.js?nopack");
  final String embedlyCSS = "css/jalios/media/embedly.css";
  final boolean isSmartPhone = Util.toBoolean(request.getAttribute("jcms.plugin.smartphone.smartphone-resource"), false);
  if (isSmartPhone) { 
    final String embedlyInitDoneAttrName = "media.template.embedly.smartphone-initialized";
    if (!Util.toBoolean(request.getAttribute(embedlyInitDoneAttrName), false)) {
      request.setAttribute(embedlyInitDoneAttrName, true); %>
    <link rel="stylesheet" href="<%= HttpUtil.encodeForHTMLAttribute(embedlyCSS) %>" property="stylesheet" />    
    <script async id="embedlyJS" src="<%= HttpUtil.encodeForHTMLAttribute(embedlyJS) %>"></script> <%
    }
  } else {
    jcmsContext.addJavaScript(embedlyJS);
    jcmsContext.addCSSHeader(embedlyCSS);    
  }
  
  String domId = ServletUtil.generateUniqueDOMId(request, "embedly");
  boolean autoresize = getBooleanParameter("autoresize", false);
  
%>
<a id="<%= domId %>"  class="embedly" style="display:none;" href="<%= url %>"><%= encodeForHTML(url) %></a>
<jalios:buffer name="initEmbedlyJSCode">
(function(){
 <% if (autoresize) { %>
  var fitIframe = function() {
    if (!window.parent || !window.frameElement || !window.parent.jQuery) {
      return;
    }
    var $iframElm = window.parent.jQuery(window.frameElement);
    $iframElm.css('height', '1px');
    $iframElm.css('height', window.document.body.scrollHeight + 'px');
  }        
 <% } %>
 
 <% if (isSmartPhone) { %>
  var embedlyScript = document.querySelector('#embedlyJS');
  embedlyScript.addEventListener('load', function() {
 
 <% } %>

  jQuery('#<%= domId %>').embedly( {
    key: '<%= embedlyKey %>', 
    className: 'embedly',
    progress: function(data) {
      if (data && (data.invalid || data.type === "error")) {
        jQuery('#<%= domId %>').show();
      }
    <% if (autoresize) { %>
        if (window.parent && window.frameElement && window.parent.jQuery) {
          fitIframe();
          window.setTimeout(fitIframe, 500);
          window.parent.jQuery(window.parent).on('resize', fitIframe); // and resize on parent resize
        }
    <% } %>
    }
  });
  <% if (isSmartPhone) { %>
    }); // EOF load event listener
  <% } %>
})();
</jalios:buffer>
<%
if (isSmartPhone) { 
  %><script><%= initEmbedlyJSCode %></script><%
} else {
  %><jalios:javascript><%= initEmbedlyJSCode %></jalios:javascript><%
}
%>