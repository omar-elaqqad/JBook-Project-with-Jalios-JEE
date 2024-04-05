<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
String css = getIncludeString("css", "");
boolean readable = Util.toBoolean(getIncludeObject("readable", true), true);
boolean displayDataIcon = Util.toBoolean(getIncludeObject("displayDataIcon", true), true);

String cssClasses = Util.notEmpty(css) ? css + " " : "";

%>
<jalios:dataListItem data="<%= data %>" css="<%= cssClasses %>" template="jmobile"/>