<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

// Asked by target
if (showTabForTarget) {
  return;
}

boolean showActivity = esnProfileDisplayHandler.validateActivity();
// logger.info("step 1: showActivity: " + showActivity);

boolean displayLastPubs = false;
if (isAccount) {
  Set pubSet = esnMgr.getMemberContentSet(member, loggedMember);
  displayLastPubs = Util.notEmpty(pubSet);
//   logger.info("displayLastPubs account: " + displayLastPubs);
}
// logger.info("step 2: displayLastPubs final: " + displayLastPubs);

boolean uiEnabled = showActivity || displayLastPubs;
// logger.info("step 3: uiEnabled: " + uiEnabled);

boolean hideTabHook = Util.toBoolean(request.getAttribute("esn.showActivityTab"), false);
// logger.info("step 4: hideTabHook: " + hideTabHook);
if (hideTabHook) {
  uiEnabled = false;
}
// logger.info("step 5: uiEnabled final: " + uiEnabled);

if (!uiEnabled) {
  uiTab.disable(request);
}
%>
