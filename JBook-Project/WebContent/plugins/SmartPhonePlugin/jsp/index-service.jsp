<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.service.*" %>
<div data-role="content" class="service-drawer">
  <% if (getBooleanParameter("displayIndexMessage", false)) { %>
    <%@ include file='/plugins/SmartPhonePlugin/jsp/core/doMessageBox.jspf' %>
  <% } %>  
  <jalios:foreach collection="<%= SmartPhoneServiceManager.getInstance().getSortedServiceSet(userLang) %>" name="itService" type="SmartPhoneService">
  <% if (itService.isEnabled(jcmsContext)) { %>
    <a href="<%= itService.getUrl() %>">
    <div class="service-<%= itService.getName() %> service">
      <div class="service-inner">
        <%= SmartPhoneServiceManager.getInstance().getServiceIcon(itService) %>
      </div>
      <div class="service-title"><%= itService.getLabel(userLang) %></div>
    </div>
    </a>      
  <% } %>
  </jalios:foreach>
</div>