<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%
  Publication pub = jcmsContext.getPublication();
  DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
  
  if (!dbcommentMgr.isCommentable(pub)){
    return;
  }
  
  int commentCount = ( (loggedMember != null ) && ( loggedMember.equals(pub.getAuthor()) || isAdmin ) ) ?
      dbcommentMgr.getDBCommentCount(pub) :
      HibernateUtil.queryCount(AbstractDBComment.class, 
                               new String[] {"pstatus", "targetContentId"}, 
                               new Object[] {0, pub.getId()});
  if (commentCount > 0) {
%>
<jalios:link data="<%= pub %>" anchor="dbcomments"><%= glp("jcmsplugin.dbcomment.lbl.comment-count",commentCount) %></jalios:link>
<% } %>