<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@page import="com.jalios.jcmsplugin.smartphone.application.SmartPhoneApplicationManager"%>
<% 
Shortcut shortcut = (Shortcut) getPublicationParameter("id"); 
if (shortcut.isPublicationShortcut()) {
  sendRedirect(SmartPhoneManager.getInstance().getDataUrl(shortcut)); 
} else {
  String shortcutMobileUrl = shortcut.getExtraData(SmartPhoneApplicationManager.EXTRADATA_SHORTCUT_MOBILE_URL);
  if (shortcutMobileUrl != null) {
    sendRedirect(shortcutMobileUrl); 
  }
}
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>