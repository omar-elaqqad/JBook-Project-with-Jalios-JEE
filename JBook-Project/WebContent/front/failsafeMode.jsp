<%--
  @Summary: provide admin login and redirect to adminProperties, if failsafe mode is enabled
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (isAdmin) {
  sendRedirect("admin/adminProperties.jsp");
  return;
}

jcmsContext.setPageTitle(glp("ui.fo.login.title"));
jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");

String inputIdLogin    = "FailSafeLoginInputLogin";
String inputIdPassword = "FailSafeLoginInputPassword";
String inputIdMemorize = "FailSafeLoginInputMemorize";
String inputWidgetLoginCustomAttribute = "id=\"" + inputIdLogin + "\"";
String inputWidgetPasswordCustomAttribute = "id=\"" + inputIdPassword + "\"";

boolean showPersistentOption = channel.getAuthMgr().isShowingPersistentOption();
String formAction = channel.getSecuredBaseUrl(request) + "front/failsafeMode.jsp";
%>

<%@ include file='/jcore/doEmptyHeader.jspf' %>

<div class="authentication failsafe-mode">
  <div class="login-panel well">
    <h1 class="form-title"><%= channel.getName() %></h1>

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <% if (isAdmin) { %>
     <span class='formInfo'><a href="admin/adminProperties.jsp"><%= glp("ui.fo.login.txt.access-admin-properties") %></a></span>
    <% } else { %>
     <form class="form-horizontal login-form" action="<%= formAction %>" method="post" name="login">
        <jalios:field css="br" resource="field-light" label="ui.fo.login.lbl.login" name='<%= channel.getAuthMgr().getLoginParameter() %>' value='<%= getUntrustedStringParameter(channel.getAuthMgr().getLoginParameter(),"") %>'>
          <jalios:control settings='<%= new TextFieldSettings().placeholder(glp("ui.fo.login.lbl.login")).autofocus() %>' />
        </jalios:field>

        <jalios:field css="br" resource="field-light" label="ui.fo.login.lbl.passwd" name='<%= channel.getAuthMgr().getPasswordParameter() %>' value='<%= getUntrustedStringParameter(channel.getAuthMgr().getPasswordParameter(),"") %>'>
          <jalios:control settings='<%= new PasswordSettings().autocomplete("current-password").placeholder(glp("ui.fo.login.lbl.passwd")) %>' />
        </jalios:field>

        <div class="form-actions">
          <input type="hidden" name="redirect" value="admin/adminProperties.jsp" />
          <% if (!showPersistentOption) { %>
            <input type="hidden" name="<%= channel.getAuthMgr().getPersistentParameter() %>" value="<%= channel.getAuthMgr().getDefaultPersistentValue() %>" />
          <% } %>
          <div class="form-inline">
           <% if (showPersistentOption) { %>
            <div class="login-remember-me checkbox">
              <label>
                <input name="<%= channel.getAuthMgr().getPersistentParameter() %>" type="checkbox" value="true" <%= channel.getAuthMgr().getDefaultPersistentValue() ? "checked=\"checked\"" : "" %>> <%= glp("ui.fo.login.lbl.remember") %>
              </label>
            </div>
           <% } %>
           <input type="submit" name="<%= channel.getAuthMgr().getOpLoginParameter() %>" value="<%= glp("ui.fo.login.btn.login") %>" class='btn login-btn btn-primary' />
          </div>
        </div>
      </form>
    <% } //!isAdmin %>
  </div>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>