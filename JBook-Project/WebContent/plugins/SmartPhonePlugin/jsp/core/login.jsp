<%@ include file='/jcore/doInitPage.jspf' %><%
  String loginPage = channel.getProperty("jcmsplugin.smartphone.mobileapp.info.loginPage", "plugins/SmartPhonePlugin/jsp/core/loginDefault.jsp");
%><jalios:include jsp="<%= loginPage %>" /><%

String redirect = (String) request.getAttribute("redirect");
if (redirect != null && !response.isCommitted()) {
  boolean checkUrlSecurity = !redirect.equals(Util.getString(request.getAttribute("redirect.UrlWithoutSecurityCheck"), ""));
  JcmsContext.sendRedirect(redirect,checkUrlSecurity,request,response);
  return;
}

%>