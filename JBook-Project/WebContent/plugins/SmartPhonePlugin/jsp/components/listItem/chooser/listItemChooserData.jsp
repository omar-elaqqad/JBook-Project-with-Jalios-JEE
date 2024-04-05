<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
String css = getIncludeString("css", "");

boolean readable = Util.toBoolean(getIncludeObject("readable", true), true);
boolean displayDataIcon = Util.toBoolean(getIncludeObject("displayDataIcon", true), true);

String cssClasses = Util.notEmpty(css) ? css + " " : "";
cssClasses += "chooser-result chooser-result-data";
%>
<li class="<%= cssClasses %>" data-jalios-chooser-label="<%= data %>" data-jalios-chooser-dataid="<%= data.getId() %>">
  <div class="chooser-result-label"><% if (displayDataIcon) { %><jalios:dataicon data="<%= data %>" /> <% } %><%= data.getDataName(userLang) %></div>
</li>