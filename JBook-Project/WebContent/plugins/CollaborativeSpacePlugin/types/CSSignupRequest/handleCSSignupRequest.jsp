<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%--
  @Summary: CSSignupRequest landing page for CS leaders
  @since: csp-7.3
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/doHeader.jspf' %><%

CSSignupRequest signup = getDataParameter("pubId", CSSignupRequest.class);

CSManager csMgr = CSManager.getInstance();

if (signup != null) {
  // Redirect to the signup request full display
  sendRedirect(signup);
  return;
}

Member submitter = getDataParameter("submitterId", Member.class);
Workspace targetWorkspace = getWorkspaceParameter("wsId");
CollaborativeSpace cs = csMgr.getCollaborativeSpace(targetWorkspace);

// If signup no longer exist, but the target space does...
%>
<jalios:buffer name="message">
  <div class="handle-cssignuprequest-message">
    <strong><%= glp("jcmsplugin.collaborativespace.cssignup-notfound.msg-title") %></strong>
    <p class="cssignuprequest-notfound">
      <%= glp("jcmsplugin.collaborativespace.cssignup-notfound.msg-content") %>
    </p>
    <p class="cssignuprequest-submitter">
      <label><%= glp("ui.work.forms.lbl.submit-mbr") %></label>: <jalios:link data='<%= submitter %>' />
    </p>
  </div>
</jalios:buffer>

<%
if (cs != null) {
  // Put the message in session
  jcmsContext.addMsgSession(new JcmsMessage(JcmsMessage.Level.INFO, message.toString()));
  
  // ... then redirect to the signupList page in the target space context
  String landingUrl = cs.getDisplayUrl(userLocale);
  String membersJsp = "plugins/CollaborativeSpacePlugin/jsp/members.jsp";
  Map<String, String[]> paramsMap = new HashMap<String, String[]>();
  paramsMap.put("jsp", new String[] { membersJsp });
  paramsMap.put("memberView", new String[] { "signups" });
  landingUrl = URLUtils.buildUrl(landingUrl, paramsMap);
  sendRedirect(landingUrl);
  return;
}

// Else if target space no longer exists too...
%>
<div class="container">
  <div class="row">
    <div class="col-cs-12">
      <%= message.toString() %>
    </div>
  </div>
</div>

<%@ include file='/jcore/doFooter.jspf' %>