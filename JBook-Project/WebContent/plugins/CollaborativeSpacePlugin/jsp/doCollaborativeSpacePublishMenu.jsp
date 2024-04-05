<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %>
<% if (CSManager.getInstance().showCSCreationLink(loggedMember)) { %>
  <jalios:buttonModal icon="collaborative-space" label="jcmsplugin.collaborativespace.publish-menu.create" url="plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp" css="publish-menu-collaborative-space list-group-item publish-menu-item" />
<% } %>  
  
