<%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%
  String previousOptions = getOption(BasicSettings.HTML_ATTRIBUTES, "");
  addOption(BasicSettings.HTML_ATTRIBUTES, "type='number'" + (Util.notEmpty(previousOptions) ? (" " + previousOptions) : ""));
%><%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doText.jspf" %>