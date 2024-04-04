<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
addOption(BasicSettings.PREPEND, getOption(BasicSettings.PREPEND, "@"));
request.setAttribute("prepend_html_attributes", "aria-hidden=\"true\"");
%><%
%><%@ include file="/jcore/field/control/doText.jspf" %>