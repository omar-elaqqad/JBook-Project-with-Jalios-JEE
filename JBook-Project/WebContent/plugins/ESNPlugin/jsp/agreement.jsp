<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/doHeader.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn.css");
ESNManager esnMgr = ESNManager.getInstance();
if (hasParameter("opAccept")) {
  esnMgr.acceptAgreement(loggedMember);
  sendRedirect(loggedMember);
  return;
}
String agreementTitle = esnMgr.getAgreementTitle(userLang);
String agreementText = esnMgr.getAgreementText(userLocale);
String agreeBtnLabel = glp("jcmsplugin.esn.agreement.btn.agree");
String declineBtnLabel = glp("jcmsplugin.esn.agreement.btn.disagree");
%>
<div id="esn-agreement" class="esn">
  <h1><%= agreementTitle %></h1>
  <div class="terms"><%= agreementText %></div>
  <form action="plugins/ESNPlugin/jsp/agreement.jsp" method="get">
    <input class="btn btn-primary" type="submit" name="opAccept" value="<%= encodeForHTMLAttribute(agreeBtnLabel) %>" />
    <input class="btn btn-danger" type="button" name="opDecline" value="<%= encodeForHTMLAttribute(declineBtnLabel) %>" onclick='document.location = "<%= contextPath %>";'/> 
  </form>
</div>