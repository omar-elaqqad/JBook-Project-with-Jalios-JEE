<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

CSManager.getInstance().welcomeShown(workspace); 
CollaborativeSpace cs = CSManager.getInstance().getCollaborativeSpace(workspace); 
String lookUrl = portalCategory.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/settings.jsp&amp;settingsView=look";
String membersUrl = portalCategory.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/members.jsp&amp;memberView=members";
String invitationsUrl = portalCategory.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/members.jsp&amp;memberView=invitations";
String serviceUrl = portalCategory.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/services.jsp";

String welcomeCss = "cs-welcome-modal";
welcomeCss += CSHelper.isPublic(cs) ? " access-public" : (CSHelper.isPrivate(cs) ? " access-private" : (CSHelper.isSecret(cs) ? " access-secret" : ""));

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-welcome-modal.css");
%>

<jalios:modal title="jcmsplugin.collaborativespace.welcome.title" css='<%= welcomeCss %>'>
  <%= glp("jcmsplugin.collaborativespace.welcome.content", lookUrl, membersUrl, invitationsUrl, serviceUrl) %>
</jalios:modal>