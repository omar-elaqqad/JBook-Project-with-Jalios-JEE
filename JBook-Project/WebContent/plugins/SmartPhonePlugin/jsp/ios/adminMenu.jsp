<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.smartphone.ios.*" %>
<% if (isLogged && loggedMember.checkAccess(IOSDownloadCodeConstants.ACL_CAN_MANAGE, null)) { %>
<a class="list-group-item admin-jdrive modal" href="plugins/SmartPhonePlugin/jsp/ios/addDownloadCode.jsp">
  <jalios:icon src="jcmsplugin-smartphone-ios" /> <%= glp("jcmsplugin.smartphone.ios.admin-menu") %>
</a>
<% } %>
