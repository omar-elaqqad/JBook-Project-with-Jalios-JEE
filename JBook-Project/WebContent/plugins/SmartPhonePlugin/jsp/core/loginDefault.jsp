<%@ include file="/plugins/SmartPhonePlugin/jsp/mobileapp/skipWaffle.jspf" %><%
%><%@ page import="com.jalios.jcms.context.JcmsContext" %><%
%><%@ page import="com.jalios.jcms.HttpUtil" %><%
%><%@ page import="com.jalios.util.Util" %><%

  final String redirect = HttpUtil.getUntrustedStringParameter(request, "redirect", "plugins/SmartPhonePlugin/jsp/index.jsp");
  if (Util.notEmpty(request.getAttribute("loggedMember"))) {
    JcmsContext.sendRedirect(redirect,request,response);
    return;
  }

%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
  boolean showPersistentOption = channel.getAuthMgr().isShowingPersistentOption();
%>
<div id="login" data-role="page">
  <div data-role="content">
    <div class="login-form-header">
      <jalios:include target="LOGIN_FORM_HEADER" targetContext="div" usage="smartphone" />
    </div>
    <div class="login-form-wrapper">
      <span class="ui-input-btn ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all jmobile-disconnect hide"></span>
      <h2 class="login-title"><%= channel.getName() %></h2>
      <form method="post" data-ajax="false" action="<%= channel.getSecuredBaseUrl(request) %>plugins/SmartPhonePlugin/jsp/core/login.jsp">
        <div data-role="controlgroup">
          <input type="text" name="<%= channel.getAuthMgr().getLoginParameter() %>" value="<%= encodeForHTMLAttribute(getUntrustedStringParameter(channel.getAuthMgr().getLoginParameter(),"")) %>" autocapitalize="off" spellcheck="false" placeholder="<%= glp("ui.fo.login.lbl.login") %>">
          <input type="password" name="<%= channel.getAuthMgr().getPasswordParameter() %>"  value="" placeholder="<%= glp("ui.fo.login.lbl.passwd") %>">
        </div>
        <% if (showPersistentOption) { %>
          <label class="persistent-input">
            <%= glp("ui.fo.login.lbl.remember") %>
            <input name="<%= channel.getAuthMgr().getPersistentParameter() %>" type="checkbox" data-role="flipswitch" value="true" data-off-text="<%= glp("jcmsplugin.smartphone.lbl.no") %>" data-on-text="<%= glp("jcmsplugin.smartphone.lbl.yes") %>"<%= channel.getAuthMgr().getDefaultPersistentValue() ? " checked=\"checked\"" : "" %>>
          </label>
        <% } %>
        <input id="data-redirect" type="hidden" name="redirect"  value="<%= encodeForHTMLAttribute(redirect) %>">
        <button type="submit" name="<%= channel.getAuthMgr().getOpLoginParameter() %>" class="btn btn-primary ui-btn"><%= glp("ui.fo.login.btn.login") %></button>
        <input type="hidden" name="smartPhonePreventRedirection" value="true">
      </form>
    </div>
    <div class="login-form-footer">
      <form method="post" data-ajax="false" action="<%= channel.getSecuredBaseUrl(request) %><%= ResourceHelper.getPrivateMailPassword() %>">
        <button type="submit" class="btn ui-btn"><%= glp("ui.fo.login.txt.lost") %></button>
      </form>
      <jalios:include target="LOGIN_FORM_FOOTER" targetContext="div" usage="smartphone" />
    </div>
  </div>
</div>
</body>
</html>
