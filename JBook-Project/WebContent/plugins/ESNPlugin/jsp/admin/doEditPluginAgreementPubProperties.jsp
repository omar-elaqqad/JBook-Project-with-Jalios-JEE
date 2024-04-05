<%@ include file='/jcore/doInitPage.jspf' %>
<%
  String itValue = (String) request.getAttribute("itValue");
	String itLabel = (String) request.getAttribute("itLabel");
	String itShortKey = (String) request.getAttribute("itShortKey");
%>
<jalios:field name="propValue" label="<%= itLabel %>" value="<%= itValue %>">
  <jalios:control type="<%= ControlType.PUBLICATION %>"/>
</jalios:field>
<input type='hidden' name='propName' value='<%= itShortKey %>'/>
