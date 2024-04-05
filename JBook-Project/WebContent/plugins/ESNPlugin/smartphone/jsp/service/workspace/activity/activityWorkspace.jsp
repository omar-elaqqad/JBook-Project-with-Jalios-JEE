<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%  
  request.setAttribute("jcms.plugin.smartphone.topbar.title",glp("jcmsplugin.smartphone.service.activity"));
  request.setAttribute("jcms.plugin.smartphone.workspace", workspace);
  
  SmartPhoneService service = new DefaultSmartPhoneWSService((Portlet) getDataParameter("portletId"), workspace);
  if (!service.isEnabled(jcmsContext)) {
    sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
    return;
  }
  
  request.setAttribute("jcms.plugin.smartphone.breadcrumb.service", service);
%>
<div id="service-workspace-activity" data-role="page" class="service-background-contrast service-activity-page" data-dom-cache="true">
  <smartphone:breadcrumb service="<%= service %>" workspace="<%= workspace %>" />
  <%@ include file='/plugins/SmartPhonePlugin/jsp/common/doServiceTopbarMenu.jspf' %>
  <div class="activity-container" data-role="content">
    <jalios:include jsp="plugins/ESNPlugin/smartphone/jsp/service/activity/doMicroBloggingForm.jsp"/>
    <jalios:include jsp="plugins/ESNPlugin/smartphone/jsp/service/workspace/activity/activityWorkspaceMore.jsp"/>
  </div>  
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>