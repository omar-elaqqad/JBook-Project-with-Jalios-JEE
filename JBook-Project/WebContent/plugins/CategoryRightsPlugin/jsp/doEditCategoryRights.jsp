<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.categoryrights.*" %><%
%><%@ page import="com.jalios.jcms.handler.EditCatHandler" %><%
  final EditCatHandler formHandler  = (EditCatHandler) request.getAttribute("formHandler");
  if (formHandler == null) {
    return;
  }
  if (!isLogged || !loggedMember.checkAccess(CategoryRightsManager.CATEGORY_PROPAGATE_RIGHTS_ACL_RESOURCE, null)) {
    if (!CategoryRightsUtils.isPropagateRightsEnabled(formHandler.getCategory())) {
      %><jalios:message msg="jcmsplugin.categoryrights.propagate-rights.disabled.msg" level="<%= MessageLevel.WARN %>"/><%    	
    }
    return;
  }
  
  Category parentCat = formHandler.getAvailableParent();
  boolean isParentCatControlled = CategoryRightsUtils.isPropagateRightsEnabled(parentCat);
  
  if (isParentCatControlled) { %>
    <jalios:field name="propagateRightInheritedValue" value='<%= "true" %>' disabled="true"
                  label="jcmsplugin.categoryrights.propagate-rights.title" 
                  tooltip="jcmsplugin.categoryrights.propagate-rights.description">
      <jalios:control settings='<%= new EnumerateSettings().select().emptyValueLabel(glp("jcmsplugin.categoryrights.propagate-rights.yes-inherited")) %>' />
    </jalios:field>
<% } else { 
    final String defaultPropagateStrValue = Util.getString(channel.getProperty(CategoryRightsManager.CATEGORY_EXTRA_DATA_PROPAGATE_RIGHTS, null), "");
    
    final Map<String,String> availableExtraData = formHandler.getAvailableExtraDataMap();
    final String propagateStrValue = availableExtraData != null ? availableExtraData.get(CategoryRightsManager.CATEGORY_EXTRA_DATA_PROPAGATE_RIGHTS) : defaultPropagateStrValue;%>
    <input type="hidden" name="extraKeys" value="<%=CategoryRightsManager.CATEGORY_EXTRA_DATA_PROPAGATE_RIGHTS%>" />
  	<jalios:field name="extraValues"  value="<%= propagateStrValue %>" 
                  label="jcmsplugin.categoryrights.propagate-rights.title" 
                  tooltip="jcmsplugin.categoryrights.propagate-rights.description">
  	  <jalios:control settings='<%= new EnumerateSettings().select().emptyValueLabel(glp("ui.com.lbl.false")).enumLabels("ui.com.lbl.true").enumValues("true") %>' />
  	</jalios:field>
<% } %>     
