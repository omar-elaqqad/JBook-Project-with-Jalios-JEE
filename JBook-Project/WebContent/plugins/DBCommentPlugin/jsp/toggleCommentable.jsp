<%
request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%
DBCommentManager dbCommentMgr = DBCommentManager.getInstance();
String redirect = getValidHttpUrl("redirect");

String pubId = getDataIdParameter("pubId");

dbCommentMgr.toggleCommentable(pubId,loggedMember);

if (Util.notEmpty(redirect)) {
  sendRedirect(redirect);
}
%>
