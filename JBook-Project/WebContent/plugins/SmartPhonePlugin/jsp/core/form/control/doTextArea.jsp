<%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%
Map<String, Object> dataMap = getOption(BasicSettings.DATA_ATTRIBUTES, new HashMap<String, Object>());
addOption(BasicSettings.DATA_ATTRIBUTES, dataMap); // Needed when the DATA_ATTRIBUTES option did not exist and has been initialized with a new HashMap()
dataMap.put("data-autogrow", false);
%><%@ include file="/jcore/field/control/doTextArea.jspf" %>