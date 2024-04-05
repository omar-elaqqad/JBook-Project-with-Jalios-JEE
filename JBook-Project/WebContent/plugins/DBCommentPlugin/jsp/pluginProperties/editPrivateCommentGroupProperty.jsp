<%@ include file='/jcore/doInitPage.jspf' %>
<%
  String itValue = (String) request.getAttribute("itValue");
  String itLabel = (String) request.getAttribute("itLabel");
  String itDesc = (String) request.getAttribute("itDesc");
  String itShortKey = (String) request.getAttribute("itShortKey");
%>
<jalios:field name="propValue" tooltip="<%= itDesc %>" label="<%= itLabel %>" value="<%= itValue %>">
  <jalios:control type="<%= ControlType.GROUP %>"/>
</jalios:field>
<input type='hidden' name='propName' value='<%= itShortKey %>'/>