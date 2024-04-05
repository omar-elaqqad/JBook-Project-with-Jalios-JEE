<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><% 
PortletQueryForeach pqf = (PortletQueryForeach) getPublicationParameter("portletId");

if (pqf == null) {
  return;
}

SmartPhoneService service = new NewsSmartPhoneService("jcmsplugin.smartphone.workspace-service.news", pqf);
if (workspace != null) {
  request.setAttribute("jcms.plugin.smartphone.workspace", workspace);
  request.setAttribute("jcms.plugin.smartphone.newsPqf.workspace", workspace);
}

if (!service.isEnabled(jcmsContext)) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return;
}
%>
<div id="service-news" class="service-news-page service-background-contrast" data-role="page" data-dom-cache="true">
  <smartphone:breadcrumb service="<%= service %>" workspace="<%= workspace %>"/>
  <div data-role="content" class="smartphone-news-wrapper">
    <jalios:include jsp="plugins/SmartPhonePlugin/jsp/action/showNews.jsp"/>
  </div>   
</div>
<%-- EOF #search --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>