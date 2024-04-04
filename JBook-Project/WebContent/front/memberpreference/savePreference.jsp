<%@page import="com.jalios.jcms.memberpreference.*"%>
<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ include file='/jcore/doInitPage.jspf' %>

<% 
String key = getStringParameter("key", null, "^[0-9a-zA-Z_\\-\\.]+$");
String value = getUntrustedStringParameter("value", null);
MemberPreferenceManager.getInstance().savePreference(loggedMember, key, value);
String redirect = getValidHttpUrl("redirect");
sendRedirect(redirect);
%>