<%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%
%><%@page import="com.jalios.jcms.taglib.settings.ControlSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings.SelectorType"%><%
%><%
SelectorType selectorType = getOption(SelectorSettings.SELECTOR_TYPE, SelectorType.RADIO);

String body = getIncludeBody();

if(SelectorSettings.SelectorType.SELECT.equals(selectorType)) {
  %><%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSelect.jspf" %><%
} else if(SelectorSettings.SelectorType.CHECKBOX.equals(selectorType)) {
  %><%--@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doCheckbox.jspf" --%><%
} else if(SelectorSettings.SelectorType.RADIO.equals(selectorType)) {
  %><%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doRadio.jspf" %><%
} else if(SelectorSettings.SelectorType.CHOOSER.equals(selectorType)) {
%><%--@ include file="/jcore/field/control/doChooser.jspf" --%><%
} else if (Util.notEmpty(body)) { %><%= body %><% } %>
