<%--
  @Summary: Template used to display a DailyMotion video
--%><%@ page import="java.util.regex.Matcher" %><%
%><%@ page import="java.util.regex.Pattern" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
  
  if (Util.isEmpty(url)){
    return;
  }
  
  String vidRegex = channel.getProperty("media.template.default.URL.dailymotion.vid-regex", ".*(?:(?:dai.ly/)|(?:/video/))([a-zA-Z0-9]{6,11}).*");
  Pattern vidPattern = Pattern.compile(vidRegex, Pattern.CASE_INSENSITIVE);
  Matcher matcher = vidPattern.matcher(url);
  if (!matcher.matches()) {
    return;
  }

  String vid = matcher.group(1);
  if (Util.isEmpty(vid)){
    return;
  }
  
  String cssClass = encodeForHTMLAttribute(getUntrustedStringParameter("class", "embed-responsive-16by9"));
  String cssStyle = encodeForHTMLAttribute(getUntrustedStringParameter("style", ""));
  
  cssClass = cssClass != null ? "class=\"dailymotion embed-responsive "+cssClass+"\""   : "class=\"dailymotion embed-responsive embed-responsive-16by9\"";
  cssStyle = cssStyle != null ? "style=\""+cssStyle+"\"" : "";
  
%>
<div <%= cssClass %> <%= cssStyle %>>
 <iframe class="embed-responsive-item" title="<%= encodeForHTMLAttribute(glp("media.info.dailymotion")) %>"
    src="//www.dailymotion.com/embed/video/<%= vid %>"
    frameborder="0"
    allowfullscreen></iframe>
</div>