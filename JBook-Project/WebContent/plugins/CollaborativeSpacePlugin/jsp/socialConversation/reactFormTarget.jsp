<%--
  @Summary: Target for SocialConversation "Answer/react FORM"
  @since: csp-6.4
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  return;
}
if (!workspace.isCollaborativeSpace()) {
  return;
}
CSManager csMgr = CSManager.getInstance();
CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace);
boolean showCSSignup = csMgr.showSignup(cs, loggedMember);

// If member has possibility to signup in this space, display a message + a Signup FORM
%>
<% if (csMgr.showSignup(cs, loggedMember)) { %>
  <%
  // Classes to reuse SCP css, and form stylind, padding, etc...
  String scpClasses = "conversation-answer-form answerForm";
  %>
  <div class='<%= scpClasses %>'>
    <jalios:message css="comment-separator" title="" dismissable="">
      <p class="br">
        <%= glp("jcmsplugin.collaborativespace.lbl.signup-to-react") %>
      </p>
      <jalios:buttonModal css="btn btn-primary" url="plugins/CollaborativeSpacePlugin/jsp/signup.jsp" label="jcmsplugin.collaborativespace.lbl.signup-action"/>
    </jalios:message>
  </div>
<% } %>