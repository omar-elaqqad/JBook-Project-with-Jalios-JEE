<%@page import="com.jalios.jcms.handler.*"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.util.Util"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %>

<%
String searchedWorkspaceTitle = getUntrustedStringParameter("q","");

//Exclude mismatches
SortedSet<Workspace> recentWorkspaceSortedSet = SmartPhoneManager.getInstance().getRecentWorkspaceSortedSet(loggedMember, userLang, searchedWorkspaceTitle);
SortedSet<Workspace> otherWorkspaceSortedSet = SmartPhoneManager.getInstance().getOtherWorkspaceSet(loggedMember, userLang, recentWorkspaceSortedSet, searchedWorkspaceTitle);

if(recentWorkspaceSortedSet == null) {
  recentWorkspaceSortedSet = new TreeSet<Workspace>();
}
if(otherWorkspaceSortedSet == null) {
  otherWorkspaceSortedSet = new TreeSet<Workspace>();
}


%>

<% if (Util.isEmpty(recentWorkspaceSortedSet) && Util.isEmpty(otherWorkspaceSortedSet)) { %>

  <li class="message-list-item"><jalios:message msg='<%= glp("jcmsplugin.smartphone.lbl.no-result") %>' title="" dismissable="false"/></li>

<% 
    return;
  } 
%>


<%@ include file='/plugins/SmartPhonePlugin/jsp/service/workspace/workspace-listview.jspf' %>
         
 
          