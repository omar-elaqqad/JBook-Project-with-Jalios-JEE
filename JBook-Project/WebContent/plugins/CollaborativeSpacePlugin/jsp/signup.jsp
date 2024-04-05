<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%!
/**
 * Returns true if the given cs is not null, and has a compatible sign-up policy.
 */
static boolean hasAccess(Member loggedMember, CollaborativeSpace cs) {
  return cs != null && ! CSHelper.isAdminSignup(cs);
}
/**
 * Returns the text of the modal, depending on loggedMember and CS's states.
 */
static String getModalText(Member loggedMember, CollaborativeSpace cs, boolean hasAlreadySignup, String userLang) {
  boolean isRequestSignup     = CSHelper.isRequestSignup(cs);
  
  // Here, assuming signupPolicy is either REQUEST or FREE.
  if (isRequestSignup) {
    if (hasAlreadySignup) { 
      return JcmsUtil.glp(userLang, "jcmsplugin.collaborativespace.signup.info.already-signup", loggedMember.getFriendlyName());
    } else {
      return JcmsUtil.glp(userLang, "jcmsplugin.collaborativespace.signup.info.request");
    }
  }
  return JcmsUtil.glp(userLang, "jcmsplugin.collaborativespace.signup.info.free");
}
%><%
CSManager csMgr = CSManager.getInstance();

Workspace wsSignup = Util.notEmpty(getWorkspaceParameter("wsId")) ? getWorkspaceParameter("wsId") : workspace;

CollaborativeSpace cs = csMgr.getCollaborativeSpace(wsSignup);
if (!hasAccess(loggedMember, cs)) {
  sendForbidden(request, response);
  return;
}
boolean isRequestSignup   = CSHelper.isRequestSignup(cs);
boolean hasAlreadySignup  = csMgr.hasAlreadySignup(wsSignup, loggedMember); 
String modalText          = getModalText(loggedMember, cs, hasAlreadySignup, userLang);

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.SignupHandler'><%
%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%>  <jsp:setProperty name='formHandler' property='*' /><%
%>  <jsp:setProperty name='formHandler' property='ws' value="<%= wsSignup.getId() %>" /><%
%></jsp:useBean><%

if (formHandler.validate()) { 
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
%>

<jalios:modal title="jcmsplugin.collaborativespace.lbl.signup"
              url="plugins/CollaborativeSpacePlugin/jsp/signup.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg cs-signup"
              op="opSignup"
              button="jcmsplugin.collaborativespace.signup.btn.signup">
<p><%= modalText %></p>

<% if (isRequestSignup && hasAlreadySignup) { %>
  <jalios:buffer name="MODAL_BUTTONS">
  <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>
  </jalios:buffer>
<% } %>
<input type="hidden" name="wsId" value="<%= wsSignup.getId() %>"/>
</jalios:modal>
