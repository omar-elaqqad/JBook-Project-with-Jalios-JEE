<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
PortalElement portlet = (PortalElement) getIncludeObject("portlet", null);

if (!portlet.canBeReadBy(loggedMember)) {
  return;
}

request.setAttribute(SmartPhonePortalManager.PORTLET_REQUEST_ATTRIBUTE_NAME, portlet);
String skinPath = SmartPhonePortalManager.getInstance().getPortletSkinFilePath(portlet);
String templatePath = SmartPhonePortalManager.getInstance().getPortletTemplateFilePath(portlet);

boolean isSkinable = portlet instanceof AbstractPortletSkinable;

%><jalios:include jsp="<%= isSkinable ? skinPath : templatePath %>" />