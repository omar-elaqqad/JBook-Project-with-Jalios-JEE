<%--
  @Summary: Target for DBComment "Sign-up to comment" area
  @since: csp-6.4
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  return;
}
Publication commentedPub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
if (commentedPub == null) {
  return;
}
if (!CSManager.getInstance().showSignupToCommentForm(commentedPub, loggedMember)) {
  return;
}
String signupUrl = MessageFormat.format("{0}?{1}={2}",
    "plugins/CollaborativeSpacePlugin/jsp/signup.jsp",
    "wsId",
    commentedPub.getWorkspace().getId());
// If member has possibility to signup in this space, display a message + a Signup FORM
%><div class="comment-pane comment-pane-separator">
  <% if (isLogged) {%>
    <div class="comment-photo pull-left">
      <jalios:memberphoto member="<%= loggedMember %>" size="<%= PhotoSize.TINY %>" />
    </div><%-- EOF .comment-photo --%>   
  <% } %>

  <jalios:message css="comment-separator" title="" dismissable="">
    <p class="br">
      <%= glp("jcmsplugin.collaborativespace.lbl.signup-to-comment") %>
    </p>
    <jalios:buttonModal css="btn btn-primary" label="jcmsplugin.collaborativespace.lbl.signup-action" url="<%= signupUrl %>" />
  </jalios:message>
</div>