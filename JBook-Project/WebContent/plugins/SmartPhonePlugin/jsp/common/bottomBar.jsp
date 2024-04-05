<%@page import="com.jalios.jcmsplugin.smartphone.ui.SmartPhoneBottomNavManager.BottomNavItem"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.ui.SmartPhoneBottomNavHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<nav class="bottom-nav">
  <% for (BottomNavItem item : formHandler.getItems()) { %>
    <a href="<%= item.getUrl() %>" class="bottom-nav-item bottom-nav-item-<%= item.getName() %> <%= formHandler.isActive(item) ? "active" : "" %>">
      <jalios:icon src="<%= item.getIcon() %>" />
      <%= item.getLabel(userLang) %>
    </a>
  <% } %>
</nav>