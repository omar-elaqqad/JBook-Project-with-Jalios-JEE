<%@ include file='/jcore/doInitPage.jspf' %>
<%
  String itValue = (String) request.getAttribute("itValue");
  String itLabel = (String) request.getAttribute("itLabel");
  String itShortKey = (String) request.getAttribute("itShortKey");
  String itDesc = (String) request.getAttribute("itDesc");
%>
<jalios:field name="propValue" label="<%= itLabel %>" value="<%= itValue %>" tooltip="<%= itDesc %>">
  <jalios:control settings="<%= new PublicationSettings().chooser().superType(PortletSearch.class) %>"/>
</jalios:field>
<input type='hidden' name='propName' value='<%= itShortKey %>'/>