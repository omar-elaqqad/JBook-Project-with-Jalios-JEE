<%@ include file='/jcore/doInitPage.jspf' %>
<%
  String itValue = (String) request.getAttribute("itValue");
  String itLabel = (String) request.getAttribute("itLabel");
  String itShortKey = (String) request.getAttribute("itShortKey");
  String itDefault = (String) request.getAttribute("itDefault");
  String itDesc = (String) request.getAttribute("itDesc");
%>
<jalios:field name="propValue" label="<%= itLabel %>" value="<%= itValue %>" tooltip="<%= itDesc %>">
  <jalios:control type="<%= ControlType.CATEGORY %>"/>
  <% if (Util.notEmpty(itDefault)) { %>
  <jalios:buffer name="description"><%= glp("ui.adm.plugin.lbl.prop-default") %> : <code><%= itDefault %></code></jalios:buffer>
  <% } %>
</jalios:field>
<input type='hidden' name='propName' value='<%= itShortKey %>'/>