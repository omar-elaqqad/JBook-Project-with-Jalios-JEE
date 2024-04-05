<%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.HttpUtil"%><%
%><%@page import="com.jalios.jcms.JcmsUtil"%><%
%><%@page import="com.jalios.jcms.taglib.settings.BasicSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.AbstractChooserSettings"%><%
%><%

String acChooserName = getOption("chooserName", null);

String fieldValueDisplay = getIncludeString("fieldValueDisplay", resolveLabel(fieldValue, null, getOption(SelectorSettings.MULTIPLE, false)));
String placeholder = formatAttribute("placeholder=\"%s\"", getOption(BasicSettings.PLACEHOLDER, ""));
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String css = getOption(BasicSettings.CSS, "");
css = "control-group input-with-chooser" + (Util.notEmpty(css) ? " " + css : "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
String dataEvent = formatAttribute("data-jalios-event='%s'", getOption(BasicSettings.TRIGGER_EVENT, ""));
String dataAction = formatAttribute("data-jalios-action='%s'", getOption(BasicSettings.TRIGGER_ACTION, ""));
String dataChooserType = formatAttribute("data-chooser-type='%s'", acChooserName);

String dataChooserOptions = formatAttribute(" data-jalios-ac-options='%s'", getOption(ChooserConstants.AC_CHOOSER_OPTION, "")); // TODO will be used to filter if we want member, contacts, DBMembers, ...

%><%
%><div class="input-with-chooser-wrapper"><% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>
<div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset<%= Util.notEmpty(fieldValueDisplay) ? " ui-input-has-clear" : "" %>">
  <input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>ChooserDisplay"
      type="text"
      <%= placeholder %>
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(fieldValueDisplay) %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= dataChooserOptions %>
      <%= dataChooserType %>
      <%= htmlAttributes %>
      data-role="none"
    />
  <% if (Util.notEmpty(fieldValueDisplay)) { %>
    <a href="#" tabindex="-1" aria-hidden="true" class="ui-input-clear ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all" title="Clear text">Clear text</a>
  <% } %>
</div>
<input name="<%= encodeForHTMLAttribute(fieldName) %>"
      type="hidden"
      class="choosen-selected-id"
      value="<%= encodeForHTMLAttribute(smartPhoneResolveFieldValue(fieldValue)) %>"
      <%= dataEvent %>
      <%= dataAction %>
      <%= dataAttributes %> />

<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %><%
%><%= getIncludeString("CONTROL_APPEND", "") %><%
%>
</div>
