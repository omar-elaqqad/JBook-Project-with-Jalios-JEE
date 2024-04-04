<%--
  @Summary: Login form for private channel
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

String redirect = Util.getString(getValidHttpUrl("redirect"), ServletUtil.getBaseUrl(request) + "index.jsp");
if (isLogged) {
  sendRedirect(redirect);
  return;
}

jcmsContext.setPageTitle(glp("ui.fo.login.title"));
jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");

String inputIdLogin    = "PrivateLoginInputLogin";
String inputIdPassword = "PrivateLoginInputPassword";
String inputIdMemorize = "PrivateLoginInputMemorize";
String inputWidgetLoginCustomAttribute = "id=\"" + inputIdLogin + "\"";
String inputWidgetPasswordCustomAttribute = "id=\"" + inputIdPassword + "\"";

boolean showLostPassword = channel.getBooleanProperty("channel.login.show-lost-password-link", true);
boolean showPersistentOption = channel.getAuthMgr().isShowingPersistentOption();
String formAction = channel.getSecuredBaseUrl(request) + ResourceHelper.getPrivateLogin();

String loginBackground = LoginUtil.getLoginWallpaper(jcmsContext);
String authenticationStyle = Util.notEmpty(loginBackground) ? " style=\"background-image: url('"+loginBackground+"')\"" : "";

String authenticationClasses = "";
boolean hasTargetContent = false;

%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<jalios:buffer name="customHeaderBuffer"><jalios:include target="PRIVATE_LOGIN_FORM_HEADER" targetContext="div" /></jalios:buffer>
<jalios:buffer name="customInnerHeaderBuffer"><jalios:include target="PRIVATE_LOGIN_FORM_INNER_HEADER" targetContext="div" /></jalios:buffer>
<jalios:buffer name="customInnerFooterBuffer"><jalios:include target="PRIVATE_LOGIN_FORM_INNER_FOOTER" targetContext="div" /></jalios:buffer>
<jalios:buffer name="customFooterBuffer"><jalios:include target="PRIVATE_LOGIN_FORM_FOOTER" targetContext="div" /></jalios:buffer>
<%
String customHeaderBufferStr = customHeaderBuffer.toString();
String customInnerHeaderBufferStr = customInnerHeaderBuffer.toString();
String customInnerFooterBufferStr = customInnerFooterBuffer.toString();
String customFooterBufferStr = customFooterBuffer.toString();
if (Util.notEmpty(customHeaderBufferStr)) { authenticationClasses += " has-custom-header"; }
if (Util.notEmpty(customInnerHeaderBufferStr)) { authenticationClasses += " has-custom-inner-header"; }
if (Util.notEmpty(customInnerFooterBufferStr)) { authenticationClasses += " has-custom-footer"; }
if (Util.notEmpty(customFooterBufferStr)) { customFooterBuffer += " has-custom-inner-footer"; }
if (Util.notEmpty(customHeaderBufferStr)
    || Util.notEmpty(customInnerHeaderBufferStr)
    || Util.notEmpty(customInnerFooterBufferStr)
    || Util.notEmpty(customFooterBufferStr)) {
  authenticationClasses += " has-target-content";
}
%>

<main role="main" class="authentication private-login<%= authenticationClasses %>"<%= authenticationStyle %>>
	<div class="login-panel well">
	  <% if (channel.isMultilingual()) { %>
	    <div class="lang-chooser">
	      <jalios:lang display="menu"/>
	    </div>
	  <% } %>
	
	  <%-- TARGET PRIVATE_LOGIN_FORM_HEADER --%>
	  <%= customHeaderBufferStr %>
	
	  <form class="form-horizontal login-form" action="<%= formAction %>" method="post">
	
	    <%-- TARGET PRIVATE_LOGIN_FORM_INNER_HEADER --%>
	    <%= customInnerHeaderBufferStr %>
	
	    <h1 class="form-title"><%= channel.getName() %></h1>
      <% request.setAttribute("message.titleTag", "h2"); %>
	    <%@ include file='/jcore/doMessageBox.jspf' %>
	    
	    <jalios:field css="br" resource="field-light" label="ui.fo.login.lbl.login" name='<%= channel.getAuthMgr().getLoginParameter() %>' value='<%= getUntrustedStringParameter(channel.getAuthMgr().getLoginParameter(),"") %>'>     
	      <jalios:control settings='<%= new TextFieldSettings().title("ui.fo.login.lbl.login").placeholder(glp("ui.fo.login.lbl.login")).autofocus().aria("label", glp("ui.fo.login.lbl.login")) %>' />
	    </jalios:field>
	
	    <jalios:field css="br" resource="field-light" label="ui.fo.login.lbl.passwd" name='<%= channel.getAuthMgr().getPasswordParameter() %>'>
	      <jalios:control settings='<%= new PasswordSettings().title("ui.fo.login.lbl.passwd").autocomplete("current-password").placeholder(glp("ui.fo.login.lbl.passwd")).aria("label", glp("ui.fo.login.lbl.passwd")) %>' />
	    </jalios:field>
	
	    <div class="form-actions">
	      <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(redirect) %>" class="Form" />
	      <% if (HttpUtil.isCSRFEnabled()) { %>
	        <input type="hidden" name="csrftoken" value="<%= encodeForHTMLAttribute(HttpUtil.getCSRFToken(request)) %>" />
	      <% } %>          
	      <% if (!showPersistentOption) { %>
	      <input type="hidden" name="<%= channel.getAuthMgr().getPersistentParameter() %>" value="<%= channel.getAuthMgr().getDefaultPersistentValue() %>" />
	      <% } %>
	      <div class="form-inline">
	        <% if (showPersistentOption) { %>
	        <div class="login-remember-me checkbox">
	          <label for="login-remember-me-input">
	            <input id="login-remember-me-input" name="<%= channel.getAuthMgr().getPersistentParameter() %>" type="checkbox" value="true" <%= channel.getAuthMgr().getDefaultPersistentValue() ? "checked=\"checked\"" : "" %>> <%= glp("ui.fo.login.lbl.remember") %>
	          </label>
	        </div>
	        <% } %>
	        <input type="submit" name="<%= channel.getAuthMgr().getOpLoginParameter() %>" value="<%= encodeForHTMLAttribute(glp("ui.fo.login.btn.login")) %>" class='btn login-btn btn-primary' />
	      </div>
	    </div>
	
	    <%-- TARGET PRIVATE_LOGIN_FORM_INNER_HEADER --%>
	    <%= customInnerFooterBufferStr %>
	  </form>
	  
	  <% if (showLostPassword || Util.notEmpty(customFooterBufferStr.trim())) { %>
	  <hr/>
	  <div class="box-footer">
	    <% if (showLostPassword) { %>
	      <a href="<%= ResourceHelper.getPrivateMailPassword() %>"><%= glp("ui.fo.login.txt.lost") %></a>
	    <% } %>
	    <%-- TARGET PRIVATE_LOGIN_FORM_FOOTER --%>
	    <%= customFooterBufferStr %>
	  </div>
	  <% } %>
	
	</div><%-- EOF .login-panel --%>
</main><%-- EOF .authentication.private-login --%>

<%@ include file='/jcore/doEmptyFooter.jspf' %>