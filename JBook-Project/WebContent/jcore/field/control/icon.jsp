<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String inputFieldValue = fieldValue;

String propPrefix = getOption(IconSettings.ICON_PROP_PREFIX, "");
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String required = fieldRequired.booleanValue() ? "aria-required='true'" : "";
String disabled = Util.isEmpty(fieldName) && Util.toBoolean(fieldDisabled, false) ? "disabled=\"disabled\"" : "";
String readonly = Util.toBoolean(fieldReadOnly, false) ? "readonly=\"readonly\"" : "";
String placeholder = formatAttribute("placeholder=\"%s\"", getOption(BasicSettings.PLACEHOLDER, glp("widget.icon.input-placeholder")));
String css = getOption(BasicSettings.CSS, "");
css = "form-control" + (Util.notEmpty(css) ? " " + css : "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);
String title = Util.notEmpty(getOption(BasicSettings.TITLE, "")) ? " title=\"" + glp(getOption(BasicSettings.TITLE, "")) + "\" " : "";

Map<String, Object> chooserOptions = new HashMap<String, Object>();
chooserOptions.put(IconSettings.ICON_PROP_PREFIX, propPrefix);
DataAttribute dataAttribute = (DataAttribute) getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null);
if (Util.isEmpty(dataAttribute)) {
  dataAttribute = new DataAttribute();
}
dataAttribute.addData("data-jalios-icon-chooser-options", UIComponentsUtils.getJsonString(chooserOptions));
String dataAttributes = formatDataAttributes(dataAttribute.getDataAttributeMap());

jcmsContext.addJavaScript("js/jalios/core/components/form/jalios-form-icon.js");
request.setAttribute("iconPreviewValue", inputFieldValue);

%><% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>
<span class="input-group-addon"><jalios:include jsp="jcore/field/control/iconPreview.jsp" /></span>
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
    <button <%= dataAttributes %> class="btn btn-default open-choose-icon-modal" type="button"><%= glp("widget.icon.input-btn") %></button>
  </div>
<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>
<% request.removeAttribute("iconPreviewValue");%>