<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
Publication pub = (Publication) data;
String css = getIncludeString("css", "");
boolean readable = Util.toBoolean(getIncludeObject("readable", true), true);
boolean displayAbstract = Util.toBoolean(getIncludeObject("displayAbstract", true), true);
boolean displayDataIcon = Util.toBoolean(getIncludeObject("displayDataIcon", true), true);

boolean hasBeenRead = pub.hasBeenReadBy(loggedMember);

String cssClasses = Util.notEmpty(css) ? css : "";
if (readable) {
  cssClasses += " readable list-item";
  if (hasBeenRead) {
    cssClasses += " list-item-read";
  } else {
    cssClasses += " list-item-unread";
  }
}

%>
<% if (displayAbstract && Util.notEmpty(pub.getAbstract())) { %>
  <jalios:dataListItem template="jmobile-dataabstract" data="<%= pub %>" css="<%= cssClasses %>"/>
<% } else { %>  
  <jalios:dataListItem template="jmobile" data="<%= pub %>" css="<%= cssClasses %>"/>
<% } %> 