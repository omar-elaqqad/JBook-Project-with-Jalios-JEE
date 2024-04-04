<%@page import="java.sql.ResultSetMetaData"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %>
<%
if (Util.notEmpty(fieldValue)) {
  DbRecordSettings settings = (DbRecordSettings) getIncludeObject(ControlTag.CONTROL_SETTINGS, null);
  Object obj = settings.getFirstValue(fieldValue);
  includeLocalObject("fieldValueDisplay", obj);
}
includeLocalObject("hiddenField", true);
%>
<%@ include file="/jcore/field/control/doText.jspf" %>