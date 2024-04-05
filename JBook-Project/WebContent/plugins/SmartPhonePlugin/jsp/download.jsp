<%@ include file='/jcore/doInitPage.jspf' %><%
Browser browser = jcmsContext.getBrowser();

String redirectUrl = "";
if (browser.isAndroid()) {
  redirectUrl = channel.getProperty("jcmsplugin.smartphone.mobileapp.android.play-store");
} else if (browser.isIPhone()) {
  redirectUrl = Util.getString(channel.getProperty("jcmsplugin.smartphone.mobileapp.ios.app-store"), "plugins/SmartPhonePlugin/jsp/ios/download.jsp");
}

if (!Util.isEmpty(redirectUrl)) {
  JcmsContext.sendRedirect(redirectUrl, false, request, response);
  return;
}

%>
<jsp:include page="/plugins/SmartPhonePlugin/jsp/downloadPage.jsp" />
