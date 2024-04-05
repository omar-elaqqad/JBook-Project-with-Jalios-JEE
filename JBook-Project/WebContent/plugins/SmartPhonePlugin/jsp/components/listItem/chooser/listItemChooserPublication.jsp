<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
Publication pub = (Publication) data;

String css = getIncludeString("css", "");

String cssClasses = Util.notEmpty(css) ? css + " " : "";
cssClasses += "chooser-result chooser-result-publication";
boolean displayDataIcon = Util.toBoolean(getIncludeObject("displayDataIcon", true), true);

%>
<li class="<%= cssClasses %>" data-jalios-chooser-label="<%= data %>" data-jalios-chooser-dataid="<%= pub.getId() %>">
  <div class="media">
  <% if (Util.notEmpty(pub.getDataImage())) { %>
  <div class="media-left">
    <jalios:thumbnail css="" path="<%= pub.getDataImage() %>" width='100' height='100'><jalios:icon src="image" /></jalios:thumbnail>
  </div>
  <% } %>
  <div class="media-body">
    <h2><% if (displayDataIcon) { %><jalios:dataicon data="<%= data %>" /> <% } %> <%= pub.getTitle(userLang, true) %></h2>
    <p><span class="pub-meta-item"><%= JcmsUtil.getFriendlyDate(pub.getPdate(), DateFormat.SHORT, true, userLocale) %></span>
    <span class="pub-meta-item">&middot; <%= pub.getWorkspace() %></span>
    </p>
  </div>
  </div>
</li>