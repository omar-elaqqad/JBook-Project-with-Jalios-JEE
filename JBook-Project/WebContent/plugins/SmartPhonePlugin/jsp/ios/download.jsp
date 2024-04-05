<%@page import="com.jalios.jcmsplugin.smartphone.ios.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%
String downloadUrl = null;
boolean outOfDownloadCode = false;
boolean leaderDidNotRespond = false;
try {
  downloadUrl = IOSDownloadCodeManager.getInstance().getDownloadUrl();
}
catch(OutOfDownloadCodeException ex) {
  outOfDownloadCode = true;
}
catch(LeaderDidNotRespondException ex) {
  leaderDidNotRespond = true;
}

if (Util.notEmpty(downloadUrl)) {
  JcmsContext.sendRedirect(downloadUrl, false, request, response);
  return;
}
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<%
jcmsContext.addCSSHeader("plugins/SmartPhonePlugin/css/ios/download.css");
%>
<div class="smartphone-ios-download">
<% if (outOfDownloadCode) { %>
<jalios:message level="<%= MessageLevel.INFO %>" msg="jcmsplugin.smartphone.ios.download.msg.oodc" dismissable="false" />
<% } else if (leaderDidNotRespond) { %>
<jalios:message level="<%= MessageLevel.ERROR %>" msg="jcmsplugin.smartphone.ios.download.msg.ldnr" dismissable="false" />
<% } %>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
