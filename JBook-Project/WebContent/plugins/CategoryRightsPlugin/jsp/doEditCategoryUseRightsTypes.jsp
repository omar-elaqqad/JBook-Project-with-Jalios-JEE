<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.categoryrights.*" %><%
%><%@ page import="com.jalios.jcms.handler.EditCatHandler" %><%final EditCatHandler formHandler  = (EditCatHandler) request.getAttribute("formHandler");
  if (formHandler == null) {
    return;
  }
  if (!isLogged || !loggedMember.checkAccess(CategoryRightsManager.CATEGORY_PROPAGATE_RIGHTS_ACL_RESOURCE, null)) {
    return;
  }
  
  final String defaultTypesStrValue = Util.getString(channel.getProperty(CategoryRightsManager.CATEGORY_EXTRA_DATA_PUBLISH_TYPES, null), "");
  
  final Map<String,String> availableExtraData = formHandler.getAvailableExtraDataMap();
  final String typesStrValue = availableExtraData != null ? availableExtraData.get(CategoryRightsManager.CATEGORY_EXTRA_DATA_PUBLISH_TYPES) : defaultTypesStrValue;%>
  <input type="hidden" name="extraKeys" value="<%=CategoryRightsManager.CATEGORY_EXTRA_DATA_PUBLISH_TYPES%>" />
	<jalios:field name="extraValues"  value="<%= typesStrValue %>"
                label="jcmsplugin.categoryrights.publish-types.title" 
                tooltip="jcmsplugin.categoryrights.publish-types.description">
    <jalios:control settings='<%= new TypeSettings().multiple().superType(Publication.class).acceptSuperType().uniqueValue(" ") %>' />
	</jalios:field>
