<%@page import="com.jalios.jcmsplugin.dbcomment.DBCommentManager"%>
<%@ include file='/plugins/ExplorerPlugin/jsp/app/sidebar/tabs/doInitExplorerAppSidebarTab.jspf' %><%

if (!isLogged) {
  return;
}

if (!(currentData instanceof Publication)) {
  return;
}

int dbCommentCount = DBCommentManager.getInstance().getDBCommentCount((Publication) currentData, loggedMember);

if (dbCommentCount > 0) {
  displayCounter = true;
  counterValue = dbCommentCount;
}

if (!DBCommentManager.getInstance().isCommentable((Publication) currentData)) {
  return;
}

if (dbCommentCount == 0 && !DBCommentManager.getInstance().canComment(loggedMember, (Publication) currentData)) {
  return;
} 

%>
<%@ include file='/plugins/ExplorerPlugin/jsp/app/sidebar/tabs/doExplorerAppSidebarTab.jspf' %>