<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String inputFieldValue = fieldValue;
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String required = fieldRequired.booleanValue() ? "aria-required='true'" : "";
String disabled = Util.isEmpty(fieldName) && Util.toBoolean(fieldDisabled, false) ? "disabled=\"disabled\"" : "";
String readonly = Util.toBoolean(fieldReadOnly, false) ? "readonly=\"readonly\"" : "";
String placeholder = formatAttribute("placeholder=\"%s\"", getOption(BasicSettings.PLACEHOLDER, glp("widget.search.input-placeholder")));
String css = getOption(BasicSettings.CSS, "");
css = "form-control" + (Util.notEmpty(css) ? " " + css : "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
if (Util.isEmpty(ariaAttributesMap)) {
  ariaAttributesMap = new HashMap<String, Object>();
}
ariaAttributesMap.put("label", fieldLabel);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);
String title = Util.notEmpty(getOption(BasicSettings.TITLE, "")) ? " title=\"" + glp(getOption(BasicSettings.TITLE, "")) + "\" " : "";

DataAttribute dataAttribute = (DataAttribute) getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null);
if (Util.isEmpty(dataAttribute)) {
  dataAttribute = new DataAttribute();
}
String dataAttributes = formatDataAttributes(dataAttribute.getDataAttributeMap());

DataAttribute buttonDataAttribute = (DataAttribute) getOption(SearchSettings.BUTTON_DATA_ATTRIBUTES, (DataAttribute) null);
if (Util.isEmpty(buttonDataAttribute)) {
  buttonDataAttribute = new DataAttribute();
}
String buttonDataAttributes = formatDataAttributes(buttonDataAttribute.getDataAttributeMap());
%>
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>"
      type="text"
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(inputFieldValue) %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= placeholder %>
      <%= disabled %>
      <%= readonly %>
      <%= required %>
      <%= title %>
      <%= dataAttributes %>
      <%= ariaAttributes %>
      <%= htmlAttributes %>/>
<div class="input-group-btn">
  <button type="submit" class="btn btn-default btn-submit-search" <%= buttonDataAttributes %>><jalios:icon src="search" alt="ui.com.btn.search"/></button>
  <% if (Util.notEmpty(inputFieldValue)) { %>
    <button type="button" class="btn btn-default btn-reset-search add-on" data-jalios-action="widget:clear" title='<%= glp("ui.com.btn.reset") %>'><jalios:icon src="remove" /></button>
  <% } %>
</div>
