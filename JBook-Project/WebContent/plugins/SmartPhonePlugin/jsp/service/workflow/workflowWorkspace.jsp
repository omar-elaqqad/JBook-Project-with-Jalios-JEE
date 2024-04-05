<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><% 
  Workspace workflowWorkspace = getWorkspaceParameter("id");
%>
<div id="service-workflow-workspace" class="service-workflow-page service-workflow-workspace-page" data-role="page" data-dom-cache="true">
  <smartphone:breadcrumb service='<%= new DefaultSmartPhoneService("jcmsplugin.smartphone.service.workflow") %>' addedItems="<%= workflowWorkspace.getTitle(userLang) %>"/>
  <div class="service-workflow-content">
    <ul data-role="listview">
      <jalios:include jsp="/plugins/SmartPhonePlugin/jsp/service/workflow/doWorkflowReportList.jsp"/>
    </ul>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>