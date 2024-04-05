<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><% 
if (!isLogged) {
  return;
}

boolean isDataWriteEnabled = channel.isDataWriteEnabled();
boolean canCreateContact = isDataWriteEnabled && ESNManager.getInstance().canCreateExternalContacts(loggedMember);

if (canCreateContact) { %>
  <a href="plugins/ESNPlugin/jsp/form/addContact.jsp" class="list-group-item publish-menu-item modal publish-menu-add-contact" onclick="return false;">
    <jalios:icon src="mbr-contact" /> <%= glp("jcmsplugin.esn.publish-menu.contact") %>
  </a>
<% } %>