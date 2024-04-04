<%--
  @Summary: "Password Reset Request" form to ask for a new password, when the site is private
--%><%@ include file='/jcore/doInitPage.jspf' %><%
jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");

// Super kludge workaround for security behavior of doHeader.jspf which redirect without any *password* parameter : 
// when JSP is accessed directly, store the passwordResetToken param value in session, 
// wait for redirection to be performed by doHeader.jspf,
// then read back the value from session attribute (or param), remove from session
String passwordResetToken = null;
if (!jcmsContext.isInFrontOffice()) {
  session.setAttribute("passwordResetToken", getUntrustedStringParameter("passwordResetToken", ""));
} else {
  passwordResetToken = getUntrustedStringParameter("passwordResetToken", (String) session.getAttribute("passwordResetToken"));
  session.removeAttribute("passwordResetToken");
}

 // Keep doHeader.jsp before handler, it is required for proper redirection (prevent double submit)
%><%@ include file='/jcore/doHeader.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.ResetPasswordHandler"><%
  %><jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="passwordResetToken" value="<%= passwordResetToken %>"/><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

final String resetI18NPrefix = formHandler.isSelfResetRequest() ? "ui.fo.resetpass.reset." : "ui.fo.resetpass.reset-byadmin.";
request.setAttribute("mailSubAdminMenu", "true");
if (formHandler.isResetRequestFormDisplayed()) {
  request.setAttribute("title", glp("ui.fo.resetpass.request.title"));
} else if (formHandler.isResetFormDisplayed()) {
  request.setAttribute("title", glp(resetI18NPrefix+"title"));
}
String formAction = channel.getSecuredBaseUrl(request) + ServletUtil.getResourcePath(request);
%>
<div class="mail-password">

<%@ include file='/jcore/doMessageBox.jspf' %>

<%-- Password reset REQUEST --%>
<%
if (formHandler.isResetRequestFormDisplayed()) {
  String inputIdEmail = "ResetPasswordEmailInput";
  String inputWidgetEmailCustomAttribute = "id=\"" + inputIdEmail +   "\"";
  %>
  <form class="form-horizontal mail-password reset-request" action="<%= formAction %>" method="post" name="requestResetForm">
    <input type="hidden" name="portal" value="<%= getDataIdParameter("portal") %>" />
    <input type="hidden" name="jsp" value="<%= ResourceHelper.getMailPassword() %>" />
  
    <div class="login-panel panel panel-default responsive login">
  
      <div class="panel-body">
        <h1 class="form-title"><% /* %>Login<% */ %><%= glp("ui.fo.resetpass.request.title") %></h1>
        <p><%= glp("ui.fo.resetpass.request.txt") %></p>
  
        <jalios:field name='<%= "email" %>' label='<%= glp("ui.fo.resetpass.request.email.label") %>' value='<%= formHandler.getEmail() %>'>
          <jalios:control settings='<%= new EmailSettings().placeholder("ui.fo.resetpass.request.email.placeholder") %>' />
        </jalios:field>
  
        <div class="form-actions">
          <button type="submit" name="opRequestReset" class='btn btn-primary'  value="true"><%= glp("ui.fo.resetpass.request.btn.request") %></button>
        </div>
      </div>
  
     <% if (channel.getBooleanProperty("channel.sign-up", false)) { %>
      <div class="box-footer">
       <%= glp("ui.fo.login.txt.signup1") %></span>&nbsp;<span class='formInfo'><a href="<%= ResourceHelper.getSignUp() %>"><%=glp("ui.fo.login.txt.signup2")%></a></span>
      </div>
     <% } %>
    </div>
  </form>
<%
} // isResetRequestFormDisplayed
%>

<%-- Password RESET --%>
<%
if (formHandler.isResetFormDisplayed()) {

  String inputIdPassword1 = "ResetPasswordPwd1Input";
  String inputWidgetPassword1CustomAttribute = "id=\"" + inputIdPassword1 + "\" autocomplete=\"off\"";
  String inputWidgetPassword2CustomAttribute = "autocomplete=\"off\"";

%>
<form class="form-horizontal mail-password reset-form" action="<%= formAction %>" method="post" name="resetForm">
  <input type="hidden" name="portal" value="<%= getDataIdParameter("portal") %>" />
  <input type="hidden" name="jsp" value="<%= ResourceHelper.getMailPassword() %>" />
  <input type="hidden" name="passwordResetToken" value="<%= encodeForHTMLAttribute(formHandler.getPasswordResetToken()) %>" />
  <input type="hidden" name="selfResetRequest" value="<%= formHandler.isSelfResetRequest() %>" />

  <div class="login-panel panel panel-default responsive login">

    <div class="panel-body">
      <h1 class="form-title"><% /* %>Login<% */ %><%= glp(resetI18NPrefix+"title") %></h1>
      <p><%= glp(resetI18NPrefix+"txt", encodeForHTML(formHandler.getMember().getFriendlyName()), encodeForHTML(formHandler.getMember().getLogin())) %></p>

      <jalios:field name="password1" label='<%= resetI18NPrefix + "password1.label" %>'>
        <jalios:control settings='<%= new PasswordSettings().placeholder(resetI18NPrefix+"password1.placeholder") %>' />
      </jalios:field>
      <jalios:field name="password2">
        <jalios:control settings='<%= new PasswordSettings().placeholder(resetI18NPrefix+"password2.placeholder") %>' />
      </jalios:field>
      <div class="form-actions">
        <input type="submit" name="opReset" value="<%= glp(resetI18NPrefix+"btn.reset") %>" class='btn btn-primary' />
      </div>
    </div>

  </div>

</form>
<%
} // isResetFormDisplayed
%>

<% if (!formHandler.isResetRequestFormDisplayed() && !formHandler.isResetFormDisplayed()) { %>
  <form class="form-horizontal" action="<%= ResourceHelper.getLogin() %>" method="post" name="signInRedirectForm">
    <div class="form-actions">
      <jalios:login css=" btn btn-primary"  displayLinkText="true" loginIcon="topbar-login" />
    </div>
  </form>
<% } %>

</div>
<%@ include file='/jcore/doFooter.jspf' %>
