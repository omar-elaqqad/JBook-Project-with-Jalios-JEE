<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.wysiwyg.WysiwygManager" %><%
%><%@ page import="java.util.regex.*" %><%

  DBMailMessage msg = getDataParameter("id", DBMailMessage.class);
  if (msg == null || !msg.canBeReadBy(loggedMember)){
    return;
  }
  
  String contentHtml = msg.getContentHtml(userLang);
  if (Util.isEmpty(contentHtml)){
    return;
  }
  
  boolean sanitizeDisplay = channel.getBooleanProperty("security.DBMailMessage.sanitize-display", true);
  contentHtml = sanitizeDisplay ? WysiwygManager.cleanHtml(contentHtml, WysiwygManager.getCleanHtmlContextMap(msg, "contentHtml")) : contentHtml;
  boolean isHtmlPage = !WysiwygManager.isHtmlFragment(contentHtml);
  
if (!isHtmlPage) {
%><html>
  <head>
    <base href="<%= ServletUtil.getBaseUrl(request) %>" />
    <title>Mail Message Wrapper</title><%
    for (Iterator it = jcmsContext.getFinalCSSMap().entrySet().iterator() ; it.hasNext() ; ) { 
      Map.Entry itHeader = (Map.Entry) it.next();
      String css   = Util.getString(itHeader.getKey(),"");
      String media = Util.getString(itHeader.getValue(), "all");
      // FIXME: StartsWith CSSPacker
      String rel   = css.endsWith(".less") ? "stylesheet/less" : "stylesheet";
    %>
    <link rel="<%= rel %>" href="<%= HttpUtil.encodeForHTMLAttribute(css) %>" type="text/css" media="<%= media %>" /><% } %>
  </head>
  <body>
<%
}

%><%= contentHtml %><%

if (!isHtmlPage) {%>
  </body>
</html><%
}
%>