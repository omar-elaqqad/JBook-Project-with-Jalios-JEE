<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
Group group = (Group) data;

String css = getIncludeString("css", "");

String cssClasses = Util.notEmpty(css) ? css + " " : "";
cssClasses += "chooser-result chooser-result-group";

%>
<li class="<%= cssClasses %>" data-jalios-chooser-label="<%= data %>" data-jalios-chooser-dataid="<%= group.getId() %>">
  <h2><%= group.getName(userLang) %></h2>
  <p>
    <% if (!group.isGlobalGroup()) { %><%= group.getWorkspace().getTitle(userLang) %> &middot; <% } %>
    <%= glp("ui.com.lbl.n-member", Util.getSize(group.getMemberSet())) %>
  </p>
</li>