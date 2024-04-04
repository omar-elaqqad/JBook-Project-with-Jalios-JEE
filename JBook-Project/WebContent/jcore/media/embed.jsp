<%--
  @Summary: Display any supported media, for use inside an iframe

--%><%@page import="com.jalios.jcms.media.MediaManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  // Make sure we are in the proper zone
  request.setAttribute("zone", "InternalUI");

  // Retrieve and validate source security against regexp
  String validMediaPathRegex = channel.getProperty("channel.security.Validator.JCMSMediaPath", "");
  String source = getStringParameter("src", null, validMediaPathRegex);
  if (Util.isEmpty(source)) {
    return;
  }
  source = source.trim();
  // Validate that source is accepted using the MediaTag template mecanism
  String templatePath = MediaManager.getInstance().getMediaTemplatePath("default", source, null);
  if (templatePath == null) {
    return;
  }
  int maxWidth = getIntParameter("width", 320);
  int maxHeight = getIntParameter("height", 240);  
  
  boolean isImage = false;
  
  Data data = channel.getData(source);
  if(data instanceof FileDocument && ((FileDocument) data).isImage()) {
    isImage = true;
    source = ((FileDocument) data).getFilename();
  } else {
    isImage = JcmsUtil.isImage(source);
  }
  
  response.addHeader("X-Frame-Options", "SAMEORIGIN");
 
  boolean workaroundIEiframeCrash = channel.getBooleanProperty("workaround.ie-iframe-crash", true) && jcmsContext.getBrowser().isIE();
  if (workaroundIEiframeCrash) {
    request.setAttribute("css-at-bottom", Boolean.TRUE);
  }
boolean autoresize = getBooleanParameter("autoresize", false);
if (autoresize) {
  jcmsContext.addBodyAttributes("style", "height: auto;"); // override height:100% declared in admin.less
}
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
if (isImage) {
  %><img src="<%= source %>" <% if (autoresize) { %>style="width:100%;"<% } else { %>width="<%= maxWidth %>" height="<%= maxHeight %>"<% } %> alt="" /><%
} else if(data != null) { 
  %><jalios:media data="<%= data %>" maxWidth="<%= maxWidth %>" maxHeight="<%= maxHeight %>" /><%
} else {
  %><jalios:media path="<%= source %>" maxWidth="<%= maxWidth %>" maxHeight="<%= maxHeight %>" /><%
}

if (autoresize) {
%><jalios:javascript>
if (window.parent && window.frameElement) {
  var fitIframe = function() {
    var iframeElm = window.frameElement;
    if (iframeElm.style.height != window.document.body.offsetHeight) {
      iframeElm.style.height = window.document.body.offsetHeight + 'px';
    }
  }
  
  var fitIframePeriodically = function() {
    fitIframe();
    setTimeout(fitIframePeriodically, <%= channel.getIntegerProperty("media.embed.iframe-resize-period", 400) %>);
  }
  
  fitIframePeriodically();
}
</jalios:javascript><%
}

if (workaroundIEiframeCrash) {
  jcmsContext.getJavaScriptSet().remove("js/lib/elementQuery.js");
}

%><%@ include file='/jcore/doEmptyFooter.jspf' %>