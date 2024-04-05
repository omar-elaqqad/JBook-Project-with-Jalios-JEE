<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Logout process page
  @Category: Authentication
--%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

%><%@page import="com.jalios.jcms.authentication.AuthenticationManager"%><%
%><%@page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler"%><%

  // Logout
  AuthenticationManager authMgr = channel.getAuthMgr();
  if (authMgr != null) {
    authMgr.logout(request, response, userLang, loggedMember);
  }
  sendRedirect("plugins/SmartPhonePlugin/jsp/core/login.jsp");
  return;
%>