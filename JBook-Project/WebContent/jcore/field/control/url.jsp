<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
addOption(BasicSettings.PLACEHOLDER, getOption(BasicSettings.PLACEHOLDER, "ui.com.placeholder.url"));
addOption(BasicSettings.PREPEND, getOption(BasicSettings.PREPEND, JcmsUtil.getHtmlIcon("url")));
%><%
%><%@ include file="/jcore/field/control/doText.jspf" %>