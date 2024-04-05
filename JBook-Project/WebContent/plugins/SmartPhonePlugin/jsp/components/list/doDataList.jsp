<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
String css = getIncludeString("css", "");
String template = getIncludeString("template", "");
Collection collection = (Collection) getIncludeObject("collection", null);
%>

<jalios:list css="<%= css %>">
  <jalios:foreach name="itData" type="Data" collection="<%= collection %>">
    <jalios:dataListItem data="<%= itData %>" template="<%= template %>" />
  </jalios:foreach>
</jalios:list>