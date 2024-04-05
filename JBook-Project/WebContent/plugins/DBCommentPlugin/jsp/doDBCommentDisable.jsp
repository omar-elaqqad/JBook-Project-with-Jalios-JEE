<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%
  Publication pub = jcmsContext.getPublication();
  DBCommentManager dbCommentMgr = DBCommentManager.getInstance();
  
  boolean isDataWriteEnabled = channel.isDataWriteEnabled();
  boolean canMemberToggleCommentable = isLogged && dbCommentMgr.isEditCommentableEnabled() && loggedMember.canPublish(DBComment.class,workspace) &&  (workspace.isAdmin(loggedMember) || isAdmin || (loggedMember.canWorkOn(pub) && JcmsUtil.isSameId(pub.getAuthor(),loggedMember) ));
  
  if (!isDataWriteEnabled || !workspace.canPublish(DBComment.class) || !canMemberToggleCommentable || !dbCommentMgr.isCommentable(pub.getClass())){
    return;
  }

%>
<% if(canMemberToggleCommentable && dbCommentMgr.isCommentable(pub)){ %>
  <a class="modal list-group-item confirm pub-action-optional pub-action-disable-comment" href="plugins/DBCommentPlugin/jsp/toggleCommentable.jsp?pubId=<%= pub.getId() %>&amp;redirect=<%= pub.getDisplayUrl(userLocale) %>" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.dbcomment.commentable.desactivate-comment",pub.getTitle(userLang,true))) %>">
    <jalios:icon src="jcmsplugin-dbcomment-disable-comment"/> <span class="publication-action-label"><%= glp("jcmsplugin.dbcomment.edit.lbl.disable-comment") %></span>
  </a>
<%}else if(canMemberToggleCommentable){%>
  <a class="modal list-group-item confirm pub-action-optional pub-action-enable-comment" href="plugins/DBCommentPlugin/jsp/toggleCommentable.jsp?pubId=<%= pub.getId() %>&amp;redirect=<%= pub.getDisplayUrl(userLocale) %>" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.dbcomment.commentable.activate-comment",pub.getTitle(userLang,true))) %>">
    <jalios:icon src="jcmsplugin-dbcomment-enable-comment"/> <span class="publication-action-label"><%= glp("jcmsplugin.dbcomment.edit.lbl.enable-comment") %></span>
  </a>
<%}%>