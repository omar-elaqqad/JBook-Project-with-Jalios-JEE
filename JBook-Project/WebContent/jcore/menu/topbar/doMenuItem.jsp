<%@ include file='/jcore/doInitPage.jspf'%><%
int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1);
boolean active = Util.toBoolean(getIncludeString("active", ""), false);
String css = getIncludeString("css", "");
String link = getIncludeString("link", "#");
String icon = getIncludeString("icon", null);
String label = getIncludeString("label", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");

if (Util.notEmpty(link) && link.equals(channel.getProperty("shortcut.jcmsplugin.collaborativespace-hub.link", ""))) {
  css += " topbar-cshub-link";
}
%>
<li class="<%= css %><%= active ? " active" : "" %>"><a href="<%= link %>" <%= htmlAttributes %>><jalios:icon src='<%= icon %>' /> <%= label %></a></li>
