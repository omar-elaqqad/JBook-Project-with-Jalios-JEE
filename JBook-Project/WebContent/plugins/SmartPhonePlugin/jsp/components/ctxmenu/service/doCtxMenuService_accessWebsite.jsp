<%@page import="com.jalios.jcmsplugin.smartphone.service.SmartPhoneService"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhonePortalPolicyFilter"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><% 
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf' %><%
SmartPhoneService service = (SmartPhoneService) request.getAttribute("jcms.plugin.smartphone.current-service");
if (Util.isEmpty(service.getDesktopUrl(userLocale))) {
  return;
}
%>
<li><a data-ajax="false" href="<%= service.getDesktopUrl(userLocale) %>" <%= SmartPhoneManager.getInstance().isMobileApp(request) ? "target=\"_blank\"" : "" %>><jalios:icon src="smartphone-access-website" /> <%= glp("jcmsplugin.smartphone.lbl.see-on-website") %></a></li>  