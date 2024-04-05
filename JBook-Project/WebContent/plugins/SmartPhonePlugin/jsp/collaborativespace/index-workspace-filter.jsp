<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ page import="com.jalios.util.*" %><%
%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.selector.*" %><%

  DataSelector csAllowedSelector = new DataSelector() {
    public boolean isSelected(Data data) {
      Workspace ws = (Workspace) data;
      
      if (Util.isEmpty(ws)) {
        return false;
      }
      CollaborativeSpace cs = CSManager.getInstance().getCollaborativeSpace(ws);
      if (ws.isModel()) {
        return false;
      }

      if (ws.isClosed()) {
        return false;
      }

      if(cs == null) {
        return true; // Non collaborative workspace are not filtered out
      }

      if (loggedMember.isAdmin())
        return true;
 
      if (CSHelper.isPublic(cs)) {
        return true;
      }

      if (loggedMember.belongsToWorkspace(ws))
        return true;
   
      if (!CSHelper.isSecret(cs)) {
        return true;
      }

      
      return false;
      
    }
  };

if (GuestAccountManager.getInstance().isGuestAccount(loggedMember)) {
  DataSelector optionalGuestSelector = new com.jalios.jcmsplugin.collaborativespace.guest.selector.GuestAccountAccessibleWorkspaceSelector(loggedMember);
  csAllowedSelector = new AndDataSelector(optionalGuestSelector, csAllowedSelector);
}

SortedSet<Workspace> recentWorkspaceSortedSet = (SortedSet<Workspace>) request.getAttribute("smartphoneRecentWorkspaceSortedSet");
SortedSet<Workspace> otherWorkspaceSortedSet = (SortedSet<Workspace>) request.getAttribute("smartphoneOtherWorkspaceSortedSet"); 

if(recentWorkspaceSortedSet == null) {
  recentWorkspaceSortedSet = new TreeSet<Workspace>();
}
if(otherWorkspaceSortedSet == null) {
  otherWorkspaceSortedSet = new TreeSet<Workspace>();
}

JcmsUtil.applyDataSelector(recentWorkspaceSortedSet, csAllowedSelector);
JcmsUtil.applyDataSelector(otherWorkspaceSortedSet, csAllowedSelector);

request.setAttribute("smartphoneRecentWorkspaceSortedSet", recentWorkspaceSortedSet);
request.setAttribute("smartphoneOtherWorkspaceSortedSet", otherWorkspaceSortedSet);
%>