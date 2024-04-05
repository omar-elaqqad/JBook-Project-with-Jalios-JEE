<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%  
  request.setAttribute("jcms.plugin.smartphone.topbar.title", glp("jcmsplugin.smartphone.service.recenthistory"));
  SmartPhoneService service = new RecentHistorySmartPhoneService("jcmsplugin.smartphone.service.recenthistory");
  if (!service.isEnabled(jcmsContext)) {
    sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
    return;
  }
%>
<div id="service-recenthistory" class="service-recenthistory-page" data-role="page">
  <smartphone:breadcrumb icon="recent-history-app" service='<%= service %>' />
  <div class="service-recenthistory-content">
    <ul data-role="listview">
      <jalios:include jsp="plugins/SmartPhonePlugin/jsp/service/recenthistory/recenthistoryMore.jsp"/>
    </ul>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>