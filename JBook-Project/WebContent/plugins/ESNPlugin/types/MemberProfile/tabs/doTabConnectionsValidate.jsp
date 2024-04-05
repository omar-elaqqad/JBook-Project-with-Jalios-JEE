<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%
// Asked by target (ESN-765)
if (showTabForTarget) {
  return;
}
boolean showTab = true;
Set<Member> suggestionSet = esnProfileDisplayHandler.getSuggestionSet();
List<MemberConnectionRequest> connectionRequestSentList = esnProfileDisplayHandler.getMemberConnectionRequestSentList();
List<MemberConnectionRequest> connectionRequestReceivedList = esnProfileDisplayHandler.getMemberConnectionRequestReceivedList();

SortedSet<Member> commonConnSet = esnMgr.getSortedCommonConnectionSet(member, loggedMember, true, true);

Set<Member> connectionSet = esnProfileDisplayHandler.getConnectionSet();
Set<Member> otherConnectionSet = esnProfileDisplayHandler.getOtherConnectionSet();

if (Util.isEmpty(suggestionSet) 
  && Util.isEmpty(connectionRequestSentList) 
  && Util.isEmpty(connectionRequestReceivedList)
  && Util.isEmpty(commonConnSet)
  && Util.isEmpty(connectionSet)
  && Util.isEmpty(otherConnectionSet)
  ) {
  showTab = false;
}

if (!showTab) {
  uiTab.disable(request);
  return;
}
%>
