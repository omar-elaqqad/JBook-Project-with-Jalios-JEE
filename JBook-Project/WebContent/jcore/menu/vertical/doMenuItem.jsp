<%@ include file='/jcore/doInitPage.jspf'%>
<% boolean active = Util.toBoolean(getIncludeString("active", ""), false); %>
<% 
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
%>
<a href="<%= getIncludeString("link", "#") %>" class='list-group-item menuitem<%= active ? " active" : "" %><%= (Util.notEmpty(css) ? " " + css : "") %>' data-parent='#<%= getIncludeString("parentId", "") %>' <%= htmlAttributes %>>
  <jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %>
</a>
