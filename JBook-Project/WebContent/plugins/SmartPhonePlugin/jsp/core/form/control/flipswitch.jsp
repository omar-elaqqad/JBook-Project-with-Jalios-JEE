<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="java.util.Collection"%><%
%><%@page import="java.util.Iterator"%><%
%><%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.HttpUtil"%><%
%><%@page import="com.jalios.jcms.JcmsUtil"%><%
%><%@page import="com.jalios.jcms.taglib.settings.BasicSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%

Object[] radioValues = (Object[]) getOption(SelectorSettings.ENUM_VALUES, null);
String[] radioLabels = (String[]) getOption(SelectorSettings.ENUM_LABELS, null);

if(radioValues != null) {
  radioValues = radioValues.clone();
}
if(radioLabels != null) {
  radioLabels = radioLabels.clone();
}

// jQM's Flipswitch widget must have false in first place. So reverse if necessary
if(Util.getSize(radioValues) == 2 && "true".equals(radioValues[0]) && "false".equals(radioValues[1])) {
  ArrayUtils.reverse(radioValues);
  ArrayUtils.reverse(radioLabels);
}

if(radioValues != null) {
  String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
  String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
  String disabled = fieldDisabled.booleanValue() ? "disabled=\"disabled\"" : "";
  String css = getOption(BasicSettings.CSS, "");
  css = Util.notEmpty(css) ? " " + css : "";
  String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
  String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
  String dataEvent = formatAttribute("data-jalios-event='%s'", getOption(BasicSettings.TRIGGER_EVENT, ""));
  String dataAction = formatAttribute("data-jalios-action='%s'", getOption(BasicSettings.TRIGGER_ACTION, ""));
  
  boolean inline  = getOption(SelectorSettings.INLINE, false);

  %>
  
<select name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>" data-role="flipswitch">

<%
  for (int i = 0; i < radioValues.length; i++) {
    String label   = radioLabels != null ? radioLabels[i] : null;
    String value   = resolveValue(radioValues[i]);
    String selected = value.equals(fieldValue) ? "selected='selected'" : "";
%>
    <option value="<%= HttpUtil.encodeForHTMLAttribute(value) %>"<%= selected %>><%= glp(label) %></option>
<% } %>

</select>

  <%= getIncludeString("CONTROL_APPEND", "") %><%
%><% } %>