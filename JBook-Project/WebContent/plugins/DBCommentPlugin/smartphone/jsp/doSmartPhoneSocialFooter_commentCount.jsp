<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%  
Publication pub = (Publication) request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub");
if (pub == null) {
  pub = getPublicationParameter("pubId");
}
if (pub == null) {
  return;
}

if (!pub.canBeReadBy(loggedMember)) {
  return;
}

if (Util.toBoolean(request.getAttribute("jcms.plugin.dbcomment.smartphone.disable.comments"), false)) {
  return;
}

DBCommentManager dbcommentMgr = DBCommentManager.getInstance();

Set<AbstractDBComment> commentSet = dbcommentMgr.getDBCommentSet(pub, loggedMember, true, 0);  

if (Util.isEmpty(commentSet)) { 
  return;
}
%>
<div class="pub-comments">
	<%= glp("jcmsplugin.dbcomment.lbl.comment-count", Util.getSize(commentSet)) %>
</div>