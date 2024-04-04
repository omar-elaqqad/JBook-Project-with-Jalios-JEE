<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.HttpUtil"%><%
%><%@page import="com.jalios.jcms.JcmsUtil"%><%
%><%@page import="com.jalios.jcms.taglib.settings.BasicSettings"%><%
%><%
String inputFieldName = fieldName;
String inputFieldValue = fieldValue;

boolean hiddenField = Util.toBoolean(getIncludeObject("hiddenField", false), false);

String disabled = Util.toBoolean(fieldDisabled, false) ? "disabled=\"disabled\"" : "";
String readonly = Util.toBoolean(fieldReadOnly, false) ? "readonly=\"readonly\"" : "";
String css = getOption(BasicSettings.CSS, "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);
String dataEvent = formatAttribute("data-jalios-event='%s'", getOption(BasicSettings.TRIGGER_EVENT, ""));
String dataAction = formatAttribute("data-jalios-action='%s'", getOption(BasicSettings.TRIGGER_ACTION, ""));
%>
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(inputFieldName) %>"
      type="hidden"
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(inputFieldValue) %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= disabled %>
      <%= dataEvent %>
      <%= dataAction %>
      <%= dataAttributes %>
      <%= ariaAttributes %>
      <%= htmlAttributes %> />
