<%@page import="com.jalios.jcms.JcmsUtil"%><%
%><%@page import="com.jalios.jcms.taglib.settings.BasicSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.DurationSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.DurationSettings.Resolution"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String required = fieldRequired.booleanValue() ? "aria-required='true'" : "";
String disabled = Util.isEmpty(fieldName) && Util.toBoolean(fieldDisabled, false) ? "disabled=\"disabled\"" : "";
String readonly = Util.toBoolean(fieldReadOnly, false) ? "readonly=\"readonly\"" : "";
String placeholder = formatAttribute("placeholder=\"%s\"", getOption(BasicSettings.PLACEHOLDER, ""));
String css = getOption(BasicSettings.CSS, "");
css = "form-control duration_user text-right" + (Util.notEmpty(css) ? " " + css : "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);
Resolution resolution = getOption(DurationSettings.RESOLUTION, Resolution.SECOND);
Resolution maxResolution = getOption(DurationSettings.MAX_RESOLUTION, Resolution.YEAR);
String title = Util.notEmpty(getOption(BasicSettings.TITLE, "")) ? " title=\"" + glp(getOption(BasicSettings.TITLE, "")) + "\" " : "";

Resolution bestResolution = resolution;
String durationUser = "";
if(Util.notEmpty(fieldValue)) {
  long duration = Util.toLong(fieldValue, -1);
  bestResolution = Resolution.findBestResolution(duration, resolution, maxResolution);
  durationUser = String.valueOf((duration * resolution.getUnit()) / bestResolution.getUnit());
}
%><%
%><% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>

<input type="hidden" class="duration" name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>" value="<%= resolveFieldValue(fieldValue) %>">
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>_user"
      type="text"
      class="<%= css %>"
      value="<%= durationUser %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= placeholder %>
      <%= disabled %>
      <%= readonly %>
      <%= title %>
      <%= required %>
      <%= dataAttributes %>
      <%= ariaAttributes %>
      <%= htmlAttributes %>/>

<div class="input-group-btn">
  <select style="min-width: 102px" aria-label="<%= encodeForHTMLAttribute(glp("widget.duration.unit-aria-label")) %>" class="form-control duration_unit" name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>_unit" <%= JcmsUtil.getLangAttributes(cptLang) %> <%= required %> <%= htmlAttributes %>>
  <% for(Resolution res : Resolution.values()) { %>
    <% if (res.ordinal() >= resolution.ordinal() && res.ordinal() <= maxResolution.ordinal()) { %>
    <option value="<%= res.getUnit() / resolution.getUnit() %>" <%= res.equals(bestResolution) ? "selected='selected'" : "" %>><%= glp(res.getLabel()) %></option><% } %>
  <% } %>
  </select>
</div>

<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>