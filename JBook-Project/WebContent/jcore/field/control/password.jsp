<%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.HttpUtil"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
boolean showPasswordRevealDefaultValue = channel.getBooleanProperty(PasswordSettings.SHOW_PASSWORD_REVEAL_PROP, PasswordSettings.SHOW_PASSWORD_REVEAL_DEFAULT_VALUE);
boolean showPasswordReveal = Util.toBoolean(getOption(PasswordSettings.SHOW_PASSWORD_REVEAL,showPasswordRevealDefaultValue), showPasswordRevealDefaultValue);
String css = getOption(BasicSettings.CSS, "");
String title = Util.notEmpty(getOption(BasicSettings.TITLE, "")) ? " title=\"" + glp(getOption(BasicSettings.TITLE, "")) + "\" " : "";
css = "form-control form-control-password" + (Util.notEmpty(css) ? " " + css : "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);
String required = fieldRequired.booleanValue() ? "aria-required='true'" : "";
String disabled = Util.toBoolean(fieldDisabled, false) ? "disabled=\"disabled\"" : "";
String readonly = Util.toBoolean(fieldReadOnly, false) ? "readonly=\"readonly\"" : "";
String placeholder = formatAttribute("placeholder=\"%s\"", getOption(BasicSettings.PLACEHOLDER, ""));
Browser browser = jcmsContext.getBrowser();
String autocomplete = formatAttribute("autocomplete=\"%s\"", getOption(PasswordSettings.AUTOCOMPLETE, "on"));
%><%
%><% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>"
      type="password"
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(resolveFieldValue(fieldValue)) %>"
      <%= autocomplete %>
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= placeholder %>
      <%= title %>
      <%= disabled %>
      <%= readonly %>
      <%= required %>
      <%= dataAttributes %>
      <%= ariaAttributes %>
      <%= htmlAttributes %> />
<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>
<% if (showPasswordReveal) {%>
  <span class='input-group-btn'><button class='btn btn-default js-reveal-password' title="<%= encodeForHTMLAttribute(glp("widget.password.reveal-password.title")) %>" data-jalios-toggle-title="<%= encodeForHTMLAttribute(glp("widget.password.hide-password.title")) %>" type='button'><jalios:icon src="reveal-password" /><jalios:icon src="hide-password" /></button></span>
<% } %>