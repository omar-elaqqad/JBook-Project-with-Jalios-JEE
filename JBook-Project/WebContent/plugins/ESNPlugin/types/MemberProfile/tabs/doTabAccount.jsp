<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitEditTab.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doTabAccount.jsp: start render"); }
%>
<% if (isAccount) { %>
<div class="profile-body-block">
  <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_account.jspf' %>
  <%= esnEditProfileButtons %>
</div>
<% } %>

<%
if (logger.isTraceEnabled()) { logger.trace("doTabAccount.jsp: end render"); }
%>