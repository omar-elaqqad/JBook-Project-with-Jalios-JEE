<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.alert.*" %><%

if (!isLogged) {
  return;
}
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.MemberAlertSettingsHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='member' value='<%= loggedMember %>'/><%
%></jsp:useBean><%

BasicSettings readAutoInfoSettings = new EnumerateSettings().checkbox().enumValues("true").enumLabelPreprends("<span class=\"badge alert-level alert-level-" + Alert.Level.INFO.getKey() + "\">").enumLabels(Alert.Level.INFO.getLabel(userLang)).enumLabelAppends("</span>");
BasicSettings readAutoActionSettings = new EnumerateSettings().checkbox().enumValues("true").enumLabelPreprends("<span class=\"badge alert-level alert-level-" + Alert.Level.ACTION.getKey() + "\">").enumLabels(Alert.Level.ACTION.getLabel(userLang)).enumLabelAppends("</span>");
BasicSettings readAutoWarningSettings = new EnumerateSettings().checkbox().enumValues("true").enumLabelPreprends("<span class=\"badge alert-level alert-level-" + Alert.Level.WARNING.getKey() + "\">").enumLabels(Alert.Level.WARNING.getLabel(userLang)).enumLabelAppends("</span>");
// Event "settingsReadAuto" is listened by JS
readAutoInfoSettings.onChange("settingsReadAuto");
readAutoActionSettings.onChange("settingsReadAuto");
readAutoWarningSettings.onChange("settingsReadAuto");
// Specify the class to be toggle on Topbar menu when input change
readAutoInfoSettings.dataAttribute("jalios-menu-class", "is-auto-read-info");
readAutoActionSettings.dataAttribute("jalios-menu-class", "is-auto-read-action");
readAutoWarningSettings.dataAttribute("jalios-menu-class", "is-auto-read-warning");

readAutoInfoSettings.name(MemberAlertSettingsHandler.PARAM_TOPBAR_AUTO_READ_INFO);
readAutoInfoSettings.value(formHandler.getAvailableTopbarAutoReadInfo());
readAutoActionSettings.name(MemberAlertSettingsHandler.PARAM_TOPBAR_AUTO_READ_ACTION);
readAutoActionSettings.value(formHandler.getAvailableTopbarAutoReadAction());
readAutoWarningSettings.name(MemberAlertSettingsHandler.PARAM_TOPBAR_AUTO_READ_WARNING);
readAutoWarningSettings.value(formHandler.getAvailableTopbarAutoReadWarning());

formHandler.validate();
%>
<div class="member-alert-settings">
  <a tabindex="0" role="button" class="list-group-item back js-alert-back-from-settings" data-jalios-topbar-menu-action="backFromSettings">
    <jalios:icon src='menu-prev' />
    <%= glp("menu.back") %>
  </a>
  <form class="form-horizontal member-alert-settings-form" action="jcore/topbar/items/doTopbarAlertMenuSettings.jsp" method="post">
    <fieldset>
	    <legend>
	      <%= glp("member-alert-settings.topbar.auto-read") %>
	      <jalios:tooltip><%= glp("member-alert-settings.topbar.auto-read.h") %></jalios:tooltip>
	    </legend>
	    <jalios:field resource="field-vertical" css="topbar-auto-read">
	      <jalios:control settings='<%= readAutoInfoSettings %>' />
	      <jalios:control settings='<%= readAutoActionSettings %>' />
	      <jalios:control settings='<%= readAutoWarningSettings %>' />
	    </jalios:field>
    </fieldset>
    <label>
      <%= glp("ui.topbar.alert-menu.settings.customize") %>
    </label>
    <div class="field-vertical form-group alert-rules-editor">
      <%
      String alertRuleEditorLink = AlertAppHandler.getAppJsp() + "?" +AlertAppHandler.EDIT_ALERT_RULES_PARAM+"=true";
      %>
      <a href="<%= alertRuleEditorLink %>" class="alert-rules-editor-link"><%= glp("ui.topbar.alert-menu.settings.customize-link") %></a>
    </div>
  </form>
</div>