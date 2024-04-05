<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import="com.jalios.jcms.tools.JCMSAppender" %>
<%@ page import="org.apache.log4j.spi.LoggingEvent" %> 
<%  
if (!isAdmin) {
  return;
}
request.setAttribute("jcms.plugin.smartphone.topbar.title",glp("jcmsplugin.smartphone.service.admin"));
%>
<div id="service-admin-logs" data-role="page">
  <div class="service-admin-logs-content" data-role="content">
    <ul data-role="listview" class="ui-listview-full ui-listview-full-abstract">
      <jalios:include jsp="plugins/SmartPhonePlugin/jsp/service/admin/adminLogsMore.jsp"/>
    </ul>
    <% if (Util.notEmpty(request.getAttribute("smartphone.service.admin.logs.empty"))) { %>
    <div class="alert alert-info"><%= request.getAttribute("smartphone.service.admin.logs.empty") %></div>
    <% } %>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>