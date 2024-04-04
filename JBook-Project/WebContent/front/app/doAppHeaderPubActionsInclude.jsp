<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%--
--%><%@ include file="/jcore/doInitPage.jspf" %><%--
--%><% 

Publication pub = (Publication) request.getAttribute(AppConstants.HEADER_INCLUDE_PUB_ACTIONS_REQUEST_ATTR);
if (pub == null) {
  return;
}

request.setAttribute("publication", pub);
%>
<div class="app-publication-actions pub-action-toggler-<%= pub.getId() %> pub-pstatus-<%= pub.getPstatus() %>">
 <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
</div>