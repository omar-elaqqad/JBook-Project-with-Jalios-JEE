<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
  String itValue = (String) request.getAttribute("itValue");
  String itLabel = (String) request.getAttribute("itLabel");
  String itShortKey = (String) request.getAttribute("itShortKey");
%>
<jalios:field name="propValue" label="<%= itLabel %>" value="<%= itValue %>">
  <jalios:control settings="<%= new PublicationSettings().superType(PortletQueryForeach.class) %>"/>
</jalios:field>
<input type='hidden' name='propName' value='<%= itShortKey %>'/>
