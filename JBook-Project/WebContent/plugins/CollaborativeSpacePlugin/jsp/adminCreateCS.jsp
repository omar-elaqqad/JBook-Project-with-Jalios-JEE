<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSHelper"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><% 
boolean canCreateCS = CSManager.getInstance().canCreateCS(loggedMember, false);
if (canCreateCS) { %> 
  <jalios:buttonModal 
    css="list-group-item"
    icon="collaborative-space"
    buttonType="<%= ButtonType.A %>"
    url="plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp"
    label="jcmsplugin.collaborativespace.create.lbl.create-cs"/>
<% } %>