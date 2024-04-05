<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%  
  request.setAttribute("jcms.plugin.smartphone.topbar.title",glp("jcmsplugin.smartphone.service.activity"));
  SmartPhoneService service = new DefaultSmartPhoneService("jcmsplugin.smartphone.service.activity");
  if (!service.isEnabled(jcmsContext)) {
    sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
    return;
  }
%>
<div id="service-activity" data-role="page" data-dom-cache="true" class="service-page service-background-contrast service-activity-page">
  <smartphone:breadcrumb icon="activity-app" service="<%= service %>" />
  <div class="activity-container" data-role="content">
    <jalios:include jsp="plugins/ESNPlugin/smartphone/jsp/service/activity/doMicroBloggingForm.jsp"/>
    <jalios:include jsp="plugins/ESNPlugin/smartphone/jsp/service/activity/activityMore.jsp"/>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>