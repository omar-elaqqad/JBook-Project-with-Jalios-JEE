<%--
  @Summary: Template used to display a Vimeo video
--%><%@ page import="java.util.regex.Matcher" %><%
%><%@ page import="java.util.regex.Pattern" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
  
  if (Util.isEmpty(url)){
    return;
  }
  
  String vidRegex = channel.getProperty("media.template.default.URL.vimeo.vid-regex", ".*/([0-9]+)(?:\\?.*)?");
  Pattern vidPattern = Pattern.compile(vidRegex, Pattern.CASE_INSENSITIVE);
  Matcher matcher = vidPattern.matcher(url);
  if (!matcher.matches()) {
    return;
  }

  String vid = matcher.group(1);
  if (Util.isEmpty(vid)){
    return;
  }
  
  String vimeoParams = channel.getProperty("media.template.default.URL.vimeo.params", "");
  // Iterate all parameters from the original URL, and if they are accepted by property declaration, 
  // add them as parameter in the Vimeo embed URL 
  try {
    for (org.apache.http.NameValuePair param : org.apache.http.client.utils.URLEncodedUtils.parse(new URI(url), "UTF-8")) {
      String acceptedValueRegex = channel.getProperty("media.template.default.URL.vimeo.params." + param.getName(), "");
      if (Util.notEmpty(acceptedValueRegex) && Util.getString(param.getValue(), "").matches(acceptedValueRegex)) {
        String paramName = channel.getProperty("media.template.default.URL.vimeo.params-mapping." + param.getName(), param.getName());
        String paramValue = Util.getString(param.getValue(), "");
        vimeoParams += "&amp;" + encodeForURL(paramName) + "=" + encodeForURL(paramValue);
      }
    }
  } catch (URISyntaxException ex) {
    /* empty */
  }
  
  String cssClass = encodeForHTMLAttribute(getUntrustedStringParameter("class", "embed-responsive-16by9"));
  String cssStyle = encodeForHTMLAttribute(getUntrustedStringParameter("style", ""));
  
  cssClass = cssClass != null ? "class=\"vimeo embed-responsive "+cssClass+"\""   : "class=\"vimeo embed-responsive embed-responsive-16by9\"";
  cssStyle = cssStyle != null ? "style=\""+cssStyle+"\"" : "";
  
%>
<div <%= cssClass %> <%= cssStyle %>>
 <iframe class="embed-responsive-item" title="<%= encodeForHTMLAttribute(glp("media.info.vimeo")) %>"
    src="//player.vimeo.com/video/<%= vid %>?<%= vimeoParams %>"
    frameborder="0"
    allowfullscreen></iframe>
</div>