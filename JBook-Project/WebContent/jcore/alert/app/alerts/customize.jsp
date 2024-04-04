<%@page import="com.jalios.jcms.handler.EditMemberHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/alert/app/doInitAlertApp.jspf" %><%

EditMemberHandler memberFH = formHandler.getEditMemberHandler();
%>
<div class="customize-alerts">
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <h2><%= glp("ui.topbar.alert-menu.settings.customize-link") %></h2>
  
  <%@ include file='/jcore/alert/doAlertRuleEditor.jspf' %>

  <%-- BUTTONS ---------------------------------------------- --%>
  <div class="buttons">
    <input type="submit" class="btn btn-primary" data-jalios-action="ajax-refresh" name="opUpdateAlertRules" value="<%= glp("ui.com.btn.save") %>" <%= channel.isDataWriteEnabled() ? "" : "disabled='disabled'" %>/>
    <input type="submit" class="btn btn-default" data-jalios-action="ajax-refresh" name="opCancel" value="<%= glp("ui.com.btn.cancel") %>" />
    <input type="hidden" name="<%= AlertAppHandler.EDIT_ALERT_RULES_PARAM %>" value="false" />
  </div>
</div>
