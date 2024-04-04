<%@ include file='/jcore/doInitPage.jspf' %>
<%
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");  return; // No links because there is no link's name
  }
  
  String yid = encodeForURL(getUntrustedStringParameter("yid",""));
  if (Util.isEmpty(yid)){
    return;
  }
  
  String youtubeParams = channel.getProperty("media.template.default.URL.youtube.params", "");
  
  String cssClass = encodeForHTMLAttribute(getUntrustedStringParameter("class", "embed-responsive-16by9"));
  String cssStyle = encodeForHTMLAttribute(getUntrustedStringParameter("style", ""));
  
  cssClass = cssClass != null ? "class=\"youtube embed-responsive "+cssClass+"\""   : "class=\"youtube embed-responsive embed-responsive-16by9\"";
  cssStyle = cssStyle != null ? "style=\""+cssStyle+"\"" : "";
  
%>
<div <%= cssClass %> <%= cssStyle %>>
 <iframe class="embed-responsive-item"
    src="//www.youtube.com/embed/<%= yid %>?hl=<%= userLang %><%= youtubeParams %>"
    frameborder="0"
    allowfullscreen></iframe>
</div>