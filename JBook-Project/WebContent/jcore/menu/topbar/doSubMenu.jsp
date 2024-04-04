<%@ include file='/jcore/doInitPage.jspf' %>
<% int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1); %>
<% if(depthLevel == 0) { // Root Sub Menu %>
  <li class="dropdown <%= getIncludeString("css", "") %>">
    <a href="<%= getIncludeString("link", "#") %>" class="dropdown-toggle" data-toggle="dropdown"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %><jalios:icon src="caret" /></a>
    <ul class="dropdown-menu dropdown">
      <%= getIncludeBody() %>
    </ul>
  </li>
<% } else { // Sub Menu %>
  <li class='dropdown-submenu <%= getIncludeString("css", "") %>'>
    <a href="<%= getIncludeString("link", "#") %>"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %></a>
    <ul class="dropdown-menu sub-menu"><%= getIncludeBody() %></ul>
  </li>
<% } %>