<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %>
<%  
SmartPhoneService service = new AdminSmartPhoneService("jcmsplugin.smartphone.service.admin");
if (!service.isEnabled(jcmsContext)) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return;
}
long freeMemory = Runtime.getRuntime().freeMemory();
long totalMemory = Runtime.getRuntime().totalMemory();
String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, userLocale); 
String totalMemoryStr = Util.formatFileSize(totalMemory, userLocale); 
int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);

request.setAttribute("jcms.plugin.smartphone.topbar.title",glp("jcmsplugin.smartphone.service.admin"));

%>
<div id="service-admin" class="service-admin-page" data-role="page">
  <smartphone:breadcrumb icon="admin-app" service='<%= service %>' />
  <div data-role="content">
    <div class="ui-corner-all custom-corners">
      <div class="ui-bar ui-bar-a">
        <h3><%= glp("ui.adm.ch-status.ch.jcms.title") %></h3>
      </div>
      <div class="ui-body ui-body-a">
        <% Date lastRestartDate = (Date)getServletConfig().getServletContext().getAttribute("channelLastRestart"); %> 
        <%= glp("ui.adm.ch-status.ch.jcms.last") %>
        <ul>
          <li><jalios:date date='<%= lastRestartDate %>'/> - <jalios:time date='<%= lastRestartDate %>'/></li>
          <li>(<jalios:duration begin='<%= lastRestartDate%>' end='<%= new Date() %>'/>)</li>
        </ul>
      </div>
    </div>
    <div class="ui-corner-all custom-corners">
      <div class="ui-bar ui-bar-a">
        <h3><%= glp("jcmsplugin.smartphone.lbl.admin.memory") %></h3>
      </div>
      <div class="ui-body ui-body-a">
      <ul>
        <li><span><%= percentMemory %>%</span> <%= glp("monitoring.chart.series.mem-used") %></li>
        <li><span><%= totalMemoryStr %></span> <%= glp("monitoring.chart.series.mem-total") %></li>
      </ul>
      </div>
    </div>    
    <div class="ui-corner-all custom-corners">
      <div class="ui-bar ui-bar-a">
        <h3><%= glp("jcmsplugin.smartphone.lbl.admin.members") %></h3>
      </div>
      <div class="ui-body ui-body-a">
      <ul>
        <li><span><%= JcmsSessionTracker.getLoggedMemberSet().size() %></span> <%= glp("ui.adm.ch-status.ch.st.logged") %></li>
        <li><span><%= JcmsSessionTracker.getAllSessionCount() %></span> <%= glp("ui.adm.ch-status.ch.st.sess") %></li>
      </ul>
      </div>
    </div>        
    <a data-role="button" class="ui-btn btn btn-default ui-btn-showmore" href="plugins/SmartPhonePlugin/jsp/service/admin/adminLogs.jsp"><%= glp("jcmsplugin.smartphone.lbl.admin.see-logs") %></a>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>