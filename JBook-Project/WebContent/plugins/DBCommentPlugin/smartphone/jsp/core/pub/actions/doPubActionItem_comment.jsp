<%@page import="com.jalios.jcmsplugin.dbcomment.DBCommentManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/core/pub/actions/doInitPubActionItem.jspf" %><%

if (!DBCommentManager.getInstance().canComment(loggedMember, pub)) {
  return;
}

%>
<a class="action-item action-item-comment">
  <span class="action-item-icon-wrapper">
    <jalios:icon src="jcmsplugin-dbcomment-smartphone-comment" css="action-item-icon" />
  </span>
  <span class="action-item-text"><%= glp("jcmsplugin.dbcomment.edit.lbl.add-comment-verb") %></span>
</a>