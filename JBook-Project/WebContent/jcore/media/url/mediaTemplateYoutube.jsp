<%--
  @Summary: Template used to display a YouTube video
--%><%@ page import="java.util.regex.Matcher" %><%
%><%@ page import="java.util.regex.Pattern" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
  
  if (Util.isEmpty(url)){
    return;
  }
  
  String yidRegex = channel.getProperty("media.template.default.URL.youtube.yid-regex", ".*(?:(?:youtu.be/)|(?:/embed/)|(?:[\\?&]v=))([a-zA-Z0-9_-]{6,11}).*");
  Pattern yidPattern = Pattern.compile(yidRegex, Pattern.CASE_INSENSITIVE);
  Matcher matcher = yidPattern.matcher(url);
  if (!matcher.matches()) {
    return;
  }

  String yid = matcher.group(1);
  if (Util.isEmpty(yid)){
    return;
  }
  
  String youtubeParams = channel.getProperty("media.template.default.URL.youtube.params", "");
  // Iterate all parameters from the original URL, and if they are accepted by property declaration, 
  // add them as parameter in the Youtube embed URL 
  try {
    for (org.apache.http.NameValuePair param : org.apache.http.client.utils.URLEncodedUtils.parse(new URI(url), "UTF-8")) {
      String acceptedValueRegex = channel.getProperty("media.template.default.URL.youtube.params." + param.getName(), "");
      if (Util.notEmpty(acceptedValueRegex) && Util.getString(param.getValue(), "").matches(acceptedValueRegex)) {
        String paramName = channel.getProperty("media.template.default.URL.youtube.params-mapping." + param.getName(), param.getName());
        String paramValue = Util.getString(param.getValue(), "");
        youtubeParams += "&amp;" + encodeForURL(paramName) + "=" + encodeForURL(paramValue);
      }
    }
  } catch (URISyntaxException ex) {
    /* empty */
  }

  String cssClass = encodeForHTMLAttribute(getUntrustedStringParameter("class", "embed-responsive-16by9"));
  String cssStyle = encodeForHTMLAttribute(getUntrustedStringParameter("style", ""));
  
  cssClass = cssClass != null ? "class=\"youtube embed-responsive "+cssClass+"\""   : "class=\"youtube embed-responsive embed-responsive-16by9\"";
  cssStyle = cssStyle != null ? "style=\""+cssStyle+"\"" : "";
  
%>
<div <%= cssClass %> <%= cssStyle %>>
 <iframe class="embed-responsive-item" title="<%= encodeForHTMLAttribute(glp("media.info.youtube")) %>"
    src="//www.youtube.com/embed/<%= yid %>?hl=<%= userLang %><%= youtubeParams %>"
    frameborder="0"
    allowfullscreen></iframe>
</div>